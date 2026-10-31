"""Apply shared release titles and notes after publication, without changing assets."""
import argparse
import json
import re
import subprocess
import tempfile
from pathlib import Path


APP_NAMES = {
    'ticktick': 'TickTick',
    'emby': 'Emby',
    'hbr': 'Harvard Business Review (HBR)',
    'mitreview': 'MIT Technology Review',
    'mit-review': 'MIT Technology Review',
    'mit-tech-review': 'MIT Technology Review',
    'peptalk': 'Pep Talk',
    'remoteatv': 'Remote for Android TV',
    'remote-atv': 'Remote for Android TV',
    'wanderlog': 'Wanderlog',
}
DISPLAY_NAMES = {
    'HBR': APP_NAMES['hbr'],
    'MIT Tech Review': APP_NAMES['mitreview'],
    'Remote ATV': APP_NAMES['remoteatv'],
}


def git(root, *args):
    return subprocess.check_output(['git', *args], cwd=root,
                                   text=True, encoding='utf-8').strip()


def catalog(root, tag):
    return {patch['name']: patch for patch in
            json.loads(git(root, 'show', tag + ':patches-list.json'))['patches']}


def release_apps(root, tag):
    match = re.fullmatch(r'v(\d+)\.(\d+)\.(\d+)(?:-[\w.-]+)?', tag)
    if not match:
        raise ValueError('Expected a version tag, e.g. v1.4.0 or v1.4.0-dev.1')
    version = tuple(map(int, match.groups()))
    stable = [t for t in git(root, 'tag').split()
              if re.fullmatch(r'v\d+\.\d+\.\d+', t)
              and tuple(map(int, t[1:].split('.'))) < version]
    previous_tag = max(stable, key=lambda t: tuple(map(int, t[1:].split('.')))) if stable else None
    previous = catalog(root, previous_tag) if previous_tag else {}
    apps = []
    for name, patch in catalog(root, tag).items():
        if previous.get(name) == patch:
            continue
        for package in patch.get('compatiblePackages') or []:
            app = package.get('name')
            if app:
                apps.append(DISPLAY_NAMES.get(app, app))
    # Source-only fixes can leave the generated patch catalog unchanged.
    paths = git(root, 'diff', '--name-only', previous_tag, tag) if previous_tag else ''
    for scope in re.findall(r'^patches/src/main/kotlin/app/badfella/patches/([^/]+)/', paths, re.M):
        if scope in APP_NAMES:
            apps.append(APP_NAMES[scope])
    return list(dict.fromkeys(apps))


def release_text(tag, apps, notes):
    title = tag + ' - ' + (', '.join(apps) or 'BadFella Patches')
    if '-' in tag:
        title += ' preview'
    # Retain historical details while replacing version and preview headings.
    notes = re.sub(r'\A#{1,2} (?:BadFella Patches\b[^\n]*|v?\d[^\n]*|Development preview|Pep Talk development preview)\n*',
                   '', notes.replace('\r\n', '\n')).strip()
    notes = re.sub(r'\*\*([^*]+):\*\*',
                   lambda m: '**' + APP_NAMES.get(m[1], m[1]) + ':**', notes)
    return title, f'## BadFella Patches {tag}\n\n{notes}\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('tag', help='published release tag, e.g. v1.4.0')
    parser.add_argument('--repo', default='XBadFellaX/BadFella-Patches')
    parser.add_argument('--dry-run', action='store_true')
    args = parser.parse_args()

    root = git(None, 'rev-parse', '--show-toplevel')
    release = json.loads(subprocess.check_output(
        ['gh', 'release', 'view', args.tag, '--repo', args.repo, '--json', 'body'],
        text=True, encoding='utf-8'))
    title, body = release_text(args.tag, release_apps(root, args.tag), release['body'])
    if args.dry_run:
        print(json.dumps({'tag': args.tag, 'title': title, 'body': body}, ensure_ascii=False))
        return
    with tempfile.TemporaryDirectory() as directory:
        notes_file = Path(directory) / 'notes.md'
        notes_file.write_text(body, encoding='utf-8')
        subprocess.run(['gh', 'release', 'edit', args.tag, '--repo', args.repo,
                        '--title', title, '--notes-file', str(notes_file)], check=True)
    print(args.tag + ': release title and notes updated')


if __name__ == '__main__':
    main()
