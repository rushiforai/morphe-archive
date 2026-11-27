"""Compare app versions and keep the monitoring issue's dashboard current."""
import argparse
from base64 import b64decode
from concurrent.futures import ThreadPoolExecutor
from email.message import EmailMessage
from email.utils import parsedate_to_datetime
from functools import partial
from html import unescape
import json
import os
from pathlib import Path
import re
import smtplib
import ssl
from threading import Lock
from time import monotonic, sleep
import urllib.error
from urllib.parse import quote, urlencode, urlsplit
import urllib.request
import uuid
import xml.etree.ElementTree as ET

MARKER = '<!-- badfella-app-update-dashboard -->'
EMAIL_PENDING = '<!-- badfella-app-update-email-pending -->'
USER_AGENT = 'BadFella-App-Updates/1.0'
PRIMARY_SOURCES = ('APKMirror', 'APKPure', 'Google Play')
SOURCES = (*PRIMARY_SOURCES, 'APKCube', 'Uptodown', 'APKCombo', 'Aptoide',
           'F-Droid', 'IzzyOnDroid', 'GitHub', 'GitLab')
SOURCE_ERRORS = (OSError, ValueError, KeyError, TypeError, IndexError, ET.ParseError)
PRERELEASE = re.compile(
    r'(?<![a-z])(?:alpha|beta|rc|release[ -]candidate|preview|canary|nightly|dev|snapshot|pre[ -]?release)(?![a-z])',
    re.I,
)
MIRROR_SEARCH_LOCK = Lock()
next_mirror_search = 0.0
FEEDS = {
    'com.linkedin.android': 'linkedin/linkedin-linkedin',
    'com.openai.chatgpt': 'openai/chatgpt',
    'com.mb.android': 'emby-media/emby-for-android',
    'com.ticktick.task': 'ticktick-limited/ticktick-to-do-list-with-reminder-day-planner',
    'com.mixapplications.ultimateusb': 'mixapplications/ultimate-usb-all-in-one-tool',
    'com.wellocution.androidapp': 'boldvoice/boldvoice-accent-training',
    'com.wanderlog.android': 'wanderlog/wanderlog-trip-planner-app',
    'tech.simha.androidtvremote': 'simha-software/remote-for-android-tv',
}


def request(url, data=None, headers=None, method=None, timeout=15):
    headers = {'User-Agent': USER_AGENT, **(headers or {})}
    if data is not None:
        headers['Content-Type'] = 'application/json'
        data = json.dumps(data).encode()
    with urllib.request.urlopen(urllib.request.Request(url, data=data, headers=headers, method=method), timeout=timeout) as response:
        return response.read()


def catalog_apps(catalog, catalog_name='Public', reviewed_versions=None):
    if reviewed_versions is None:
        reviewed_versions = {}
    if not isinstance(reviewed_versions, dict) or any(
            not isinstance(v, str) or not v.strip() for v in reviewed_versions.values()):
        raise ValueError('Reviewed versions must map packages to nonempty version strings')
    apps = {}
    for patch in catalog['patches']:
        for app in patch.get('compatiblePackages') or []:
            package = app['packageName']
            targets = [t['version'] for t in app['targets'] if t.get('version')]
            row = apps.setdefault(package, {'name': app['name'], 'catalog': catalog_name, 'target': None})
            declared = max(reversed(targets), key=version_key, default=None)
            if declared and (not row['target'] or version_key(declared) >= version_key(row['target'])):
                row['target'] = declared
    for package, row in apps.items():
        row['supported'] = row['target'] or reviewed_versions.get(package) or 'version not recorded'
    if not apps:
        raise ValueError('Catalog has no apps')
    return apps


def published_dev_catalog(stable_version):
    """Use the tagged catalog for the preview currently offered by the Manager source."""
    def read_manifest(path):
        return json.loads(b64decode(api(path)['content'], validate=False))

    try:
        manifest = read_manifest('/contents/patches-bundle.json?ref=dev')
        version = manifest['version']
        if not re.fullmatch(r'\d+\.\d+\.\d+-dev\.\d+', version):
            return None
        if version_key(version.split('-')[0]) <= version_key(stable_version):
            return None
        tag = 'v' + version
        release = api(f'/releases/tags/{tag}')
        asset_url = f"https://github.com/{os.environ['GITHUB_REPOSITORY']}/releases/download/{tag}/patches-{version}.mpp"
        if (release['tag_name'] != tag or release['draft'] or not release['prerelease']
                or manifest['download_url'] != asset_url
                or not any(asset['state'] == 'uploaded' and asset['browser_download_url'] == asset_url
                           for asset in release['assets'])):
            return None
        catalog = read_manifest(f'/contents/patches-list.json?ref={tag}')
        return catalog if catalog['version'] == version else None
    except urllib.error.HTTPError as error:
        if error.code == 404:
            return None
        raise


def mirror_latest(data, path):
    releases = []
    excluded = False
    for item in ET.fromstring(data).findall('./channel/item'):
        url = item.findtext('link', '')
        if not re.fullmatch(r'https://www\.apkmirror\.com/apk/' + re.escape(path) + r'/[\w-]+/', url):
            continue
        title = item.findtext('title', '')
        if PRERELEASE.search(title.rsplit(' by ', 1)[0]):
            excluded = True
            continue
        version = re.search(r'\s([0-9]+(?:\.[0-9]+)*)\s+by\s+', title, re.I)
        released = parsedate_to_datetime(item.findtext('pubDate'))
        releases.append((version_key(version[1]) if version else (), released,
                         {'version': version[1] if version else None, 'url': url}))
    if not releases:
        if excluded:
            return {'status': 'No stable version in feed'}
        raise ValueError('APKMirror feed has no matching releases')
    return max(releases, key=lambda release: (bool(release[0]), release[0], release[1]))[2]


def stable_listing(version, url):
    if not isinstance(version, str) or not version.strip() or version == 'Varies with device':
        return {'status': 'Version unavailable'}
    if PRERELEASE.search(version):
        return {'status': 'Prerelease excluded'}
    return {'version': version, 'url': url}


def pure_latest(packages):
    device = uuid.uuid4().hex[:16]
    header = {'device_info': {'abis': ['arm64-v8a'], 'android_id': device, 'os_ver': '35',
                            'os_ver_name': '15', 'platform': 1, 'screen_height': 2400, 'screen_width': 1080}}
    payload = {'app_info_for_update': [{'package_name': p, 'version_code': 0, 'is_system': False,
                                       'version_id': '', 'cached_size': -1} for p in packages],
               'android_id': device, 'application_id': 'com.apkpure.aegon', 'cached_size': -1}
    data = json.loads(request('https://tapi.pureapk.com/v3/get_app_update?hl=en-US', payload,
                             {'ual-access-businessid': 'projecta', 'ual-access-projecta': json.dumps(header)}))
    if data.get('retcode') != 0:
        raise ValueError('APKPure refused the update request')
    return {app['package_name']: stable_listing(app['version_name'], 'https://apkpure.com/p/' + app['package_name'])
            for app in data['app_update_response'] if app['package_name'] in packages}


def play_latest(data, package):
    html = data.decode('utf-8')
    match = re.search(r"key:\s*['\"]ds:5['\"].*?data:\s*", html, re.S)
    if not match:
        raise ValueError('Google Play app metadata missing')
    # shortcut: public ds:5 layout from google-play-scraper; review its mapping if Play changes the page.
    details = json.JSONDecoder().raw_decode(html[match.end():])[0]
    try:
        version = details[1][2][140][0][0][0]
    except (IndexError, TypeError):
        version = None
    return stable_listing(version, 'https://play.google.com/store/apps/details?id=' + package)


def play_listing(package):
    try:
        return play_latest(request(f'https://play.google.com/store/apps/details?id={package}&hl=en_US&gl=US'), package)
    except urllib.error.HTTPError as error:
        if error.code == 404:
            return {'status': 'No listing'}
        raise


def mirror_listing(package, feed):
    global next_mirror_search
    origin = 'https://www.apkmirror.com'
    if not feed:
        # shortcut: public APKMirror package search markup; update the matcher if the site changes.
        with MIRROR_SEARCH_LOCK:
            delay = next_mirror_search - monotonic()
            if delay > 0:
                sleep(delay)
            next_mirror_search = monotonic() + 2
            search = request(f'{origin}/?post_type=app_release&searchtype=app&s={quote(package)}').decode()
        paths = dict.fromkeys(re.findall(r'href="/apk/([\w-]+/[\w-]+)/"', search))
        matches = []
        for path in paths:
            page = request(f'{origin}/apk/{path}/').decode()
            if f'https://play.google.com/store/apps/details?id={package}"' in page:
                matches.append(path)
        if len(matches) != 1:
            return {'status': 'Ambiguous listing' if matches else 'No listing found'}
        feed = matches[0]
    return mirror_latest(request(f'{origin}/apk/{feed}/feed/'), feed)


def cube_listing(package):
    card = ET.fromstring(request(f'https://apkcube.com/embed/card/{package}'))
    for node in card.findall('.//{*}text'):
        match = re.search(r'·\s+v(.+)$', node.text or '')
        if match:
            return stable_listing(match[1].strip(), f'https://apkcube.com/apk-downloader?url={package}')
    return {'status': 'Version unavailable'}


def aptoide_listing(package):
    url = f'https://ws75.aptoide.com/api/7/app/get/not_apk_tags=alpha,beta/package_name={package}'
    app = json.loads(request(url))['nodes']['meta']['data']
    if app['package'] != package:
        raise ValueError('Aptoide returned a different package')
    file = app['file']
    if file.get('malware', {}).get('rank') != 'TRUSTED':
        return {'status': 'Unverified upload'}
    page = app['urls']['w']
    parts = urlsplit(page)
    if parts.scheme != 'https' or not (parts.hostname or '').endswith('.aptoide.com'):
        raise ValueError('Aptoide returned an unexpected listing')
    return stable_listing(file['vername'], page)


def fdroid_listing(package, api_base, listing_base):
    index = json.loads(request(f'{api_base}/api/v1/packages/{package}'))
    if index['packageName'] != package:
        raise ValueError('Repository returned a different package')
    suggested = index.get('suggestedVersionCode')
    candidate = next((item for item in index['packages'] if str(item['versionCode']) == str(suggested)), None)
    return stable_listing(candidate['versionName'] if candidate else None, f'{listing_base}/{package}/')


def uptodown_listing(package):
    # shortcut: use the public website and verify each result's package field.
    search = request('https://en.uptodown.com/android/search?' + urlencode({'query': package})).decode()
    found = re.findall(r"(https://[a-z0-9-]+\.en\.uptodown\.com/android)';addEventAnalytics\('search'", search)
    for url in list(dict.fromkeys(found))[:3]:
        html = request(url).decode()
        if not re.search(r'<td>\s*' + re.escape(package) + r'\s*</td>', html):
            continue
        version = re.search(r'"softwareVersion"\s*:\s*"([^"]+)"', html)
        return stable_listing(unescape(version[1]) if version else None, url)
    return {'status': 'No listing found'}


def combo_listing(package):
    # shortcut: accept candidates from APKCombo only when their URL carries the exact package.
    origin = 'https://apkcombo.com'
    html = request(f'{origin}/search/{package}').decode()
    match = re.search(r'href="(' + re.escape(origin) + r'/[\w-]+/' + re.escape(package) + r'/)"', html)
    if not match:
        return {'status': 'No listing found'}
    url = match[1]
    html = request(url).decode()
    version = re.search(r'<dt>Version</dt>\s*<dd[^>]*>\s*<bdi[^>]*>([^<]+)', html)
    return stable_listing(unescape(version[1]) if version else None, url)


def repository_listing(source, project):
    if not project:
        return {'status': 'No official repository mapped'}
    asset_pattern = re.compile(r'\.(apk|apks|xapk|apkm)$', re.I)
    if source == 'GitHub':
        releases = json.loads(request(f'https://api.github.com/repos/{project}/releases?per_page=10'))
        candidates = [(release['tag_name'], release['html_url']) for release in releases
                      if not release['draft'] and not release['prerelease']
                      and any(asset['state'] == 'uploaded' and asset_pattern.search(asset['name'])
                              for asset in release['assets'])]
    else:
        releases = json.loads(request(f'https://gitlab.com/api/v4/projects/{quote(project, safe="")}/releases?per_page=10'))
        candidates = [(release['tag_name'], f'https://gitlab.com/{project}/-/releases/{quote(release["tag_name"], safe="")}')
                      for release in releases if not release.get('upcoming_release')
                      and any(asset_pattern.search(urlsplit(asset['url']).path) or asset_pattern.search(asset['name'])
                              for asset in release['assets']['links'])]
    listings = [stable_listing(tag.removeprefix('v'), url) for tag, url in candidates]
    return max((item for item in listings if item.get('version')), key=lambda item: version_key(item['version']),
               default={'status': 'No stable APK release found'})


def collect(apps, feeds, github_repos=None, gitlab_repos=None):
    packages = sorted(apps)
    try:
        pure = pure_latest(packages)
    except SOURCE_ERRORS as error:
        print(f'APKPure check failed ({type(error).__name__})')
        pure = dict.fromkeys(packages, {'status': 'Check failed'})

    probes = {
        'Google Play': play_listing,
        'APKCube': cube_listing,
        'Uptodown': uptodown_listing,
        'APKCombo': combo_listing,
        'Aptoide': aptoide_listing,
        'F-Droid': partial(fdroid_listing, api_base='https://f-droid.org', listing_base='https://f-droid.org/packages'),
        'IzzyOnDroid': partial(fdroid_listing, api_base='https://apt.izzysoft.de/fdroid', listing_base='https://apt.izzysoft.de/packages'),
        'GitHub': lambda package: repository_listing('GitHub', (github_repos or {}).get(package)),
        'GitLab': lambda package: repository_listing('GitLab', (gitlab_repos or {}).get(package)),
        'APKMirror': lambda package: mirror_listing(package, feeds.get(package)),
    }

    def check(source, package):
        try:
            return probes[source](package)
        except urllib.error.HTTPError as error:
            if error.code == 404:
                return {'status': 'No listing found'}
            print(f'{source} check failed for {package} (HTTP {error.code})')
            return {'status': 'Rate limited' if error.code == 429 else 'Check failed'}
        except SOURCE_ERRORS as error:
            print(f'{source} check failed for {package} ({type(error).__name__})')
            return {'status': 'Check failed'}

    listings = {package: {'APKPure': pure.get(package, {'status': 'No listing found'})} for package in packages}
    with ThreadPoolExecutor(max_workers=10) as pool:
        checked = {(package, source): pool.submit(check, source, package) for package in packages for source in probes}
        for (package, source), future in checked.items():
            listings[package][source] = future.result()
    return listings


def version_key(version):
    match = re.fullmatch(r'v?(\d+(?:\.\d+)*)(?:\s*(alpha|beta|rc)\s*(\d*))?', version, re.I)
    if not match:
        return ()
    numbers = tuple(map(int, match[1].split('.')))
    while len(numbers) > 1 and numbers[-1] == 0:
        numbers = numbers[:-1]
    stage = match[2].lower() if match[2] else None
    return numbers, ('alpha', 'beta', 'rc', None).index(stage), int(match[3] or 0)


def compare(package, listings, worked_on):
    available = [(source, listings[source]) for source in SOURCES if listings.get(source, {}).get('version')]
    if not available:
        return None, [], 'No version available', 2
    versions = {listing['version'] for _, listing in available}
    ranked = [(source, version_key(listing['version'])) for source, listing in available]
    by_source = dict(ranked)
    pure = by_source.get('APKPure')
    reference = by_source.get('APKMirror') or by_source.get('Google Play') or version_key(worked_on)
    if package == 'com.linkedin.android' and pure and reference and pure[0][0] != reference[0][0]:
        return None, [], 'Needs review · APKPure version line differs', 1
    if len(versions) > 1 and any(not key for _, key in ranked):
        return None, [], 'Needs review · version formats differ', 1
    highest = max(key for _, key in ranked)
    winners = [source for source, key in ranked if key == highest]
    baseline = version_key(worked_on)
    if highest and baseline and highest > baseline:
        return winners[0], winners, 'Newer than worked on', 0
    if versions == {worked_on} or highest and highest == baseline:
        return winners[0], winners, 'Matches worked on', 2
    if highest and baseline:
        return winners[0], winners, 'Older than worked on', 2
    return winners[0], winners, 'Compare with worked-on version', 1


def text(value):
    return (str(value).replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')
            .replace('|', '\\|').replace('[', '\\[').replace(']', '\\]')
            .replace('\n', ' ').replace('\r', ' ').replace('`', '').replace('@', '@\u200b'))


def dashboard(apps, listings_by_package, catalog_name, dev_catalog=None):
    sections = ('Newer builds to review', 'Needs review', 'Other source comparisons')
    rows = [[], [], []]
    dev_apps = catalog_apps(dev_catalog, catalog_name) if dev_catalog else {}
    coverage = []
    for package, app in sorted(apps.items(), key=lambda pair: pair[1]['name'].casefold()):
        listings = listings_by_package[package]
        selected, winners, status, section = compare(package, listings, app['supported'])
        stable_target = app.get('target')
        dev_target = dev_apps.get(package, {}).get('target')
        stable_label = stable_target or ('Unpinned · reviewed ' + app['supported']
                                         if app['supported'] != 'version not recorded' else 'Unpinned')
        dev_label = '—'
        if dev_apps and package not in dev_apps:
            dev_label = 'Not listed'
        elif package in dev_apps and dev_target != stable_target:
            dev_label = dev_target or 'Unpinned'
        cells = [f"**{text(app['name'])}**", text(stable_label), text(dev_label)]
        shown_sources = []
        unavailable = []
        for source in SOURCES:
            item = listings.get(source, {})
            if item.get('version'):
                result = f"[{source} {text(item['version'])}]({item['url']})"
                shown_sources.append(f'**{result}**' if source in winners else result)
            elif item.get('status') and item['status'] != 'No official repository mapped':
                unavailable.append(f"{source} · {text(item['status'])}")
        if selected:
            item = listings[selected]
            label = f"{selected} · {text(item['version'])}"
            tie = f' · {len(winners)} tied' if len(winners) > 1 else ''
            partial_check = ' · partial check' if any(item.get('status') in {'Check failed', 'Rate limited'}
                                                      for item in listings.values()) else ''
            cells.append(f"**[{label}]({item['url']})**{tie}{partial_check}")
        else:
            cells.append(status.removeprefix('Needs review · '))
        cells.append('<br>'.join(shown_sources) or '—')
        rows[section].append('| ' + ' | '.join(cells) + ' |')
        if unavailable:
            coverage.append(f"| {text(app['name'])} | " + '<br>'.join(unavailable) + ' |')

    lines = [MARKER, f'## App update watch · {catalog_name}', '',
             'Upstream comparisons use stable app listings. A dev target is shown when the published preview differs from stable.', '']
    for heading, group in zip(sections, rows):
        if group:
            lines.extend((f'### {heading}', '',
                          '| App | Stable target | Dev target | Latest stable source | Source versions |',
                          '| --- | --- | --- | --- | --- |', *group, ''))
    lines.extend(('Dev targets belong to published previews and may still be under testing.',
                  'Labeled prereleases are excluded. Availability varies by device, region and rollout. Google Play uses its US listing.',
                  'Ties prefer APKMirror, APKPure and Google Play, followed by the other sources in the order listed below.', '',
                  'Sources · ' + ', '.join(SOURCES) + '. GitHub and GitLab require a verified publisher repository.', ''))
    if coverage:
        lines.extend(('<details>', '<summary>Unavailable results and source coverage</summary>', '',
                      '| App | Other source results |', '| --- | --- |', *coverage, '', '</details>', ''))
    return '\n'.join(lines)


def api(path, data=None, method=None):
    return json.loads(request('https://api.github.com/repos/' + os.environ['GITHUB_REPOSITORY'] + path, data,
                              {'Authorization': 'Bearer ' + os.environ['GH_TOKEN'],
                               'Accept': 'application/vnd.github+json'}, method))


def send_email(config, issue_url, catalog_name):
    message = EmailMessage()
    message['Subject'] = f'BadFella {catalog_name.lower()} app update watch changed'
    message['From'] = config.get('from') or config['username']
    message['To'] = config['to']
    message.set_content(f'The app update dashboard has changed.\n\n{issue_url}\n')
    context = ssl.create_default_context()
    port = int(config.get('port', 587))
    if port == 465:
        connection = smtplib.SMTP_SSL(config['host'], port, timeout=30, context=context)
    else:
        connection = smtplib.SMTP(config['host'], port, timeout=30)
    with connection as smtp:
        if port != 465:
            smtp.starttls(context=context)
        smtp.login(config['username'], config['password'])
        smtp.send_message(message)


def update_issue(path, previous, body, catalog_name, email_config):
    previous_body = previous['body'].rstrip()
    pending = previous_body.endswith(EMAIL_PENDING)
    if body.rstrip() != previous_body.removesuffix(EMAIL_PENDING).rstrip():
        api(path, {'body': body + '\n' + EMAIL_PENDING}, 'PATCH')
        pending = True
        print('Updated the dashboard in the issue description')
    if not pending:
        print('No dashboard changes')
        return
    if not email_config:
        print('Email pending: APP_UPDATE_SMTP_CONFIG is not configured')
        return
    try:
        send_email(json.loads(email_config), previous['html_url'], catalog_name)
    except (OSError, ValueError, KeyError, TypeError) as error:
        raise SystemExit(f'Email delivery failed ({type(error).__name__}); will retry') from None
    api(path, {'body': body}, 'PATCH')
    print('Email accepted by the SMTP relay')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dry-run', action='store_true', help='Print the dashboard without editing the issue')
    parser.add_argument('--catalog', type=Path, default=Path('patches-list.json'))
    parser.add_argument('--catalog-name', choices=['Public', 'Private'], default='Public')
    parser.add_argument('--reviewed-versions', type=Path)
    parser.add_argument('--mirror-feed', action='append', default=[], metavar='PACKAGE=DEVELOPER/APP')
    parser.add_argument('--github-repo', action='append', default=[], metavar='PACKAGE=OWNER/REPO')
    parser.add_argument('--gitlab-repo', action='append', default=[], metavar='PACKAGE=NAMESPACE/REPO')
    parser.add_argument('--dev-catalog', type=Path, help='Tagged preview catalog for local dry runs')
    args = parser.parse_args()
    reviewed = json.loads(args.reviewed_versions.read_text(encoding='utf-8')) if args.reviewed_versions else {}
    catalog = json.loads(args.catalog.read_text(encoding='utf-8'))
    apps = catalog_apps(catalog, args.catalog_name, reviewed)
    feeds = FEEDS | dict(entry.split('=', 1) for entry in args.mirror_feed)
    if any(not re.fullmatch(r'[\w-]+/[\w-]+', feed) for feed in feeds.values()):
        raise ValueError('Invalid APKMirror feed path')
    github = dict(entry.split('=', 1) for entry in args.github_repo)
    gitlab = dict(entry.split('=', 1) for entry in args.gitlab_repo)
    namespace = r'[\w-][\w.-]*'
    if (any(not re.fullmatch(f'{namespace}/{namespace}', project) for project in github.values())
            or any(not re.fullmatch(f'{namespace}(?:/{namespace})+', project) for project in gitlab.values())):
        raise ValueError('Invalid release repository path')
    if args.dev_catalog and not args.dry_run:
        raise ValueError('--dev-catalog is only available with --dry-run')
    issue = os.environ.get('APP_UPDATE_ISSUE', '')
    if not args.dry_run and not issue.isdecimal():
        raise ValueError('APP_UPDATE_ISSUE must identify the monitoring issue')
    if not args.dry_run and api('')['private'] != (args.catalog_name == 'Private'):
        raise ValueError('The catalog and monitoring repository visibility must match')
    path = f'/issues/{issue}'
    previous = {} if args.dry_run else api(path)
    if previous and ('pull_request' in previous or previous['title'] != 'Daily upstream app version alerts'):
        raise ValueError('APP_UPDATE_ISSUE points to a different issue')
    if args.dry_run:
        dev_catalog = json.loads(args.dev_catalog.read_text(encoding='utf-8')) if args.dev_catalog else None
    else:
        dev_catalog = published_dev_catalog(catalog['version'])
    listings = collect(apps, feeds, github, gitlab)
    body = dashboard(apps, listings, args.catalog_name, dev_catalog)
    if args.dry_run:
        print(body)
    else:
        update_issue(path, previous, body, args.catalog_name, os.environ.get('APP_UPDATE_SMTP_CONFIG'))


if __name__ == '__main__':
    main()
