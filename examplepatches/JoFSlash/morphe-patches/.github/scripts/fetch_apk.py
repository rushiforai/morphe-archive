"""Downloads a version of an app and checks that the file is the app's own.

Where it downloads from depends on the app's "source" (see app_versions.py):
- apkmirror: it follows APKMirror's pages from the release in the feed to the file, with a pause
  between requests and a few tries, as one person would. It is meant to run once for each new
  version, not more. For a bundle (APKM) it takes the row APKMirror marks BUNDLE, preferring the
  CPU types in "bundle_cpus" when the release lists several bundles; for an app that ships as one
  APK it takes the release's download page.
- apkpure: APKPure's direct endpoint, which only hands out the newest version. The download is
  used only when its version is the one asked for.
- hand: there is nothing to download (the file is added to JoFSlash/morphe-apks by hand); only
  --verify-only works.

Before the file is used it checks that it (base.apk in a bundle) is the app's package at the asked
version, and that every APK in it is signed only with the app's certificates: the SHA-1 in
Constants.kt (and "more_signatures"). For an APKS added by hand, base.apk has to be signed with the
certificate whose SHA-256 is "cert_sha256".

Usage:
    python .github/scripts/fetch_apk.py <app> <version> <out> [--apksigner <path>] [--aapt2 <path>]
    python .github/scripts/fetch_apk.py <app> --verify-only <file> <version> [--apksigner ...] [--aapt2 ...]
<app> is the name of the app's file in .github/apps (without .json).

Exit codes: 0 done, 4 the site or the network turned the download away (for example Cloudflare, a
block or a timeout), 5 the site has no file of the version (APKPure: its latest isn't the asked
version; hand: nothing can be downloaded), 6 the file isn't the app's (wrong package, version or
signature), 7 apksigner or aapt2 couldn't run.
"""
import argparse
import base64
import hashlib
import http.client
import http.cookiejar
import pathlib
import re
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.parse
import urllib.request
import zipfile

from app_versions import APKMIRROR, App, USER_AGENT

PAUSE = 4  # seconds between requests
# A cookie jar carries APKMirror's session cookie through the pages to the file; download.php can
# answer 403 without it.
OPENER = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(http.cookiejar.CookieJar()))


class Blocked(Exception):
    """The site or the network turned a request away."""


class NotFound(Exception):
    """The site has no file of the version."""


# APKMirror

def get(url, referer=None, binary=False):
    headers = {
        "User-Agent": USER_AGENT,
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "en-US,en;q=0.9",
    }
    if referer:
        headers["Referer"] = referer
    last = None
    for attempt in range(3):
        if attempt:
            time.sleep(PAUSE * 4 * attempt)
        try:
            with OPENER.open(urllib.request.Request(url, headers=headers), timeout=60) as response:
                data = response.read()
                kind = response.headers.get("Content-Type", "")
        except urllib.error.HTTPError as ex:
            last = f"HTTP {ex.code}"
            if ex.code in (404, 410):
                raise NotFound(f"{url}: {last}")
            continue
        # URLError, timeouts and dropped connections, also while reading the body.
        except (OSError, http.client.HTTPException) as ex:
            last = f"{type(ex).__name__}: {ex}"
            continue
        time.sleep(PAUSE)
        if binary:
            if "html" in kind:
                raise Blocked(f"got a page instead of the file at {url}")
            return data
        text = data.decode("utf8", errors="replace")
        # Normal pages also load Cloudflare's script; only its challenge page has this title.
        if re.search(r"<title>Just a moment", text):
            last = "Cloudflare challenge"
            continue
        return text
    raise Blocked(f"{url}: {last}")


def release_page(app, version):
    feed = get(app.feed)
    for item in re.findall(r"<item>(.*?)</item>", feed, re.S):
        title = re.search(r"<title>([^<]*)</title>", item)
        link = re.search(r"<link>([^<]*)</link>", item)
        if title and link and re.search(rf"\b{re.escape(version)}\b", title.group(1)) \
                and not re.search(r"\b(beta|alpha)\b", title.group(1), re.I):
            return link.group(1).strip()
    return None


def first(pattern, text, what):
    match = re.search(pattern, text)
    if not match:
        raise Blocked(f"couldn't find {what}; APKMirror's page may have changed")
    return match.group(1).replace("&amp;", "&")


def bundle_variant(app, page):
    """The download page of the APK bundle (APKM) to patch. A release can also list plain APKs,
    which aren't what the patches take, and one bundle per set of CPU types; APKMirror marks bundle
    rows with a BUNDLE badge and names the CPU types in the row. The CPU types in "bundle_cpus" are
    taken first (The Crypto App: arm64-v8a with x86_64, which runs on phones and natively on the
    x86_64 emulator of the tests), then any bundle."""
    path = re.escape(app.apkmirror_path)
    links = list(dict.fromkeys(re.findall(rf'href="({path}[^"]*-android-apk-download/)"', page)))
    bundles = []
    for i, link in enumerate(links):
        start = page.find(f'href="{link}"')
        end = page.find(f'href="{links[i + 1]}"') if i + 1 < len(links) else start + 3000
        row = page[start:end if end > start else start + 3000]
        if re.search(r">\s*BUNDLE\s*<|apkm-badge", row):
            bundles.append((link, re.sub(r"<[^>]+>", " ", row)))
    for wanted in [*app.v.get("bundle_cpus", []), r""]:
        for link, text in bundles:
            if re.search(wanted, text):
                return link
    raise NotFound("no APK bundle (APKM) for this version on APKMirror")


def download_apkmirror(app, version, out):
    release = release_page(app, version)
    if not release:
        raise NotFound(f"{app.name} {version} isn't in APKMirror's feed")
    page = get(release)
    if app.file == "apkm":
        variant = APKMIRROR + bundle_variant(app, page)
    else:
        path = re.escape(app.apkmirror_path)
        variant = APKMIRROR + first(rf'href="({path}[^"]*-android-apk-download/)"', page, "the download page")
    page = get(variant, release)
    keyed = APKMIRROR + first(r'href="(/apk/[^"]*/download/\?key=[^"]+)"', page, "the download button")
    page = get(keyed, variant)
    file_url = APKMIRROR + first(r'href="(/wp-content/themes/APKMirror/download\.php\?[^"]+)"', page, "the file link")
    data = get(file_url, keyed, binary=True)
    out.write_bytes(data)
    print(f"Downloaded {len(data)} bytes to {out}.")


# APKPure

APKPURE_HEADERS = {
    "User-Agent": USER_AGENT,
    "Accept": "application/vnd.android.package-archive,application/octet-stream,*/*",
    "Accept-Language": "en-US,en;q=0.9",
}


def open_endpoint(endpoint):
    """Opens the APKPure endpoint, following its redirect to the file. Returns (response, filename)."""
    last = None
    for attempt in range(3):
        if attempt:
            time.sleep(PAUSE * 4 * attempt)
        try:
            response = urllib.request.urlopen(urllib.request.Request(endpoint, headers=APKPURE_HEADERS), timeout=120)
        except urllib.error.HTTPError as ex:
            last = f"HTTP {ex.code}"
            if ex.code in (404, 410):
                raise NotFound(f"{endpoint}: {last}")
            continue
        except (OSError, http.client.HTTPException) as ex:
            last = f"{type(ex).__name__}: {ex}"
            continue
        kind = response.headers.get("Content-Type", "")
        if "html" in kind:
            last = "got a page instead of the file"
            response.close()
            continue
        disposition = response.headers.get("Content-Disposition", "")
        return response, urllib.parse.unquote(disposition) + " " + response.geturl()
    raise Blocked(f"{endpoint}: {last}")


def endpoint_version(endpoint):
    """The version APKPure's latest endpoint would serve, read from the redirect without downloading."""
    class NoRedirect(urllib.request.HTTPRedirectHandler):
        def redirect_request(self, *args):
            return None

    opener = urllib.request.build_opener(NoRedirect)
    request = urllib.request.Request(endpoint, headers=APKPURE_HEADERS, method="HEAD")
    try:
        opener.open(request, timeout=60)
        return None
    except urllib.error.HTTPError as ex:
        if ex.code in (301, 302, 303, 307, 308):
            where = urllib.parse.unquote(ex.headers.get("Location", "") + " " + ex.headers.get("Content-Disposition", ""))
            match = re.search(r"(\d+(?:\.\d+){2,})", where)
            return match.group(1) if match else None
        raise Blocked(f"{endpoint}: HTTP {ex.code}")
    except (OSError, http.client.HTTPException) as ex:
        raise Blocked(f"{endpoint}: {type(ex).__name__}: {ex}")


def download_apkpure(app, version, out):
    endpoint = app.apkpure_endpoint
    latest = None
    try:
        latest = endpoint_version(endpoint)
    except Blocked:
        pass  # fall through to the full download, which also carries the version
    if latest and latest != version:
        raise NotFound(f"APKPure's latest {app.name} is {latest}, not {version}")
    response, where = open_endpoint(endpoint)
    match = re.search(r"(\d+(?:\.\d+){2,})", where)
    served = match.group(1) if match else None
    if served and served != version:
        response.close()
        raise NotFound(f"APKPure's latest {app.name} is {served}, not {version}")
    with response:
        data = response.read()
    if len(data) < 1_000_000 or data[:2] != b"PK":
        raise Blocked(f"the download wasn't an APK ({len(data)} bytes)")
    out.write_bytes(data)
    print(f"Downloaded {len(data)} bytes to {out}.")


def download_hand(app, version, out):
    raise NotFound(f"{app.name} isn't on APKMirror; its file is added to JoFSlash/morphe-apks by hand")


DOWNLOAD = {"apkmirror": download_apkmirror, "apkpure": download_apkpure, "hand": download_hand}


# Checking the file

def run_tool(command):
    """Runs apksigner or aapt2. Exits with 7 when the tool itself can't run, so a missing tool
    isn't mistaken for a file that isn't the app's."""
    try:
        return subprocess.run(command, capture_output=True, text=True)
    except OSError as ex:
        print(f"Couldn't run {command[0]}: {ex}")
        sys.exit(7)


def signer_certificates(output):
    """The signer certificates (DER) in `apksigner verify --print-certs-pem` output.

    apksigner versions differ: older ones print "Signer #1 certificate DN: ..." to stdout, newer
    ones "V3.0 Signer: certificate DN: ..." to stderr, so the caller passes both streams and the
    digests are computed from the PEM blocks. The source stamp certificate (Google's, added by
    Play) is left out; every other signer certificate counts."""
    certificates, label, pem = [], "", None
    for line in output.splitlines():
        line = line.strip()
        match = re.match(r"(.+?):? certificate DN:", line)
        if match:
            label = match.group(1)
        elif line == "-----BEGIN CERTIFICATE-----":
            pem = []
        elif line == "-----END CERTIFICATE-----" and pem is not None:
            if "Signer" in label and not label.startswith("Source Stamp"):
                certificates.append(base64.b64decode("".join(pem)))
            pem = None
        elif pem is not None:
            pem.append(line)
    return certificates


def package_and_version(aapt2, apk):
    badging = run_tool([aapt2, "dump", "badging", apk]).stdout
    match = re.search(r"package: name='([^']+)' versionCode='\d+' versionName='([^']+)'", badging)
    return match.groups() if match else ("?", "?")


def verify(app, path, version, apksigner, aapt2):
    """Exits with 6 unless the file is the app at this version, signed with the app's certificates
    and no others. In a bundle base.apk has the package and version, and every APK (the splits too:
    they can carry code) is checked, except in an APKS added by hand, where base.apk is."""
    hand = app.file == "apks"
    if hand:
        expected = {app.v["cert_sha256"].lower()}
        digest = lambda der: hashlib.sha256(der).hexdigest()
    else:
        expected = app.signatures()
        digest = lambda der: hashlib.sha1(der).hexdigest()
    problems = []
    with tempfile.TemporaryDirectory() as work:
        if app.file == "apk":
            apks, base = [str(path)], str(path)
        else:
            try:
                with zipfile.ZipFile(path) as archive:
                    apks = [n for n in archive.namelist() if n.endswith(".apk")]
                    if "base.apk" not in apks:
                        raise KeyError("base.apk")
                    for name in apks:
                        archive.extract(name, work)
            except (zipfile.BadZipFile, KeyError, OSError) as ex:
                print(f"Not an {app.file.upper()} with a base.apk: {ex}")
                sys.exit(6)
            apks = [str(pathlib.Path(work) / name) for name in (["base.apk"] if hand else apks)]
            base = str(pathlib.Path(work) / "base.apk")
        found_package, found_version = package_and_version(aapt2, base)
        if found_package != app.package:
            problems.append(f"package is {found_package}")
        if found_version != version:
            problems.append(f"version is {found_version}, not {version}")
        for apk in apks:
            name = pathlib.Path(apk).name
            certs = run_tool([apksigner, "verify", "--print-certs-pem", apk])
            digests = [digest(der) for der in signer_certificates(certs.stdout + "\n" + certs.stderr)]
            if certs.returncode != 0:
                problems.append(f"{name}: signature doesn't verify: " + (certs.stderr or certs.stdout).strip()[:200])
            elif not digests or not set(digests) <= expected:
                problems.append(f"{name} is signed by {digests}, not {app.signer}")
                print(f"{apksigner} output for {name} (exit {certs.returncode}):\n"
                      f"{certs.stdout.strip()[:1500]}\n{certs.stderr.strip()[:1500]}")
    if problems:
        print(f"This isn't {app.name}'s {app.file.upper()}: " + "; ".join(problems))
        sys.exit(6)
    print(f"Checked: {app.package} {version}, {len(apks)} APK(s) signed by {app.signer} ({', '.join(sorted(expected))}).")


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("app", help="The name of the app's file in .github/apps (without .json)")
    parser.add_argument("first")
    parser.add_argument("second")
    parser.add_argument("--verify-only", action="store_true", help="Only check a file you already have")
    parser.add_argument("--apksigner", default="apksigner")
    parser.add_argument("--aapt2", default="aapt2")
    args = parser.parse_args()
    app = App(args.app)
    if args.verify_only:
        verify(app, pathlib.Path(args.first), args.second, args.apksigner, args.aapt2)
        return
    version, out = args.first, pathlib.Path(args.second)
    if not app.valid(version):
        sys.exit(f"The version looks like {app.example}.")
    where = {"apkmirror": "APKMirror", "apkpure": "APKPure", "hand": "APKMirror"}[app.source]
    try:
        DOWNLOAD[app.source](app, version, out)
    except NotFound as ex:
        print(f"Not on {where}: {ex}")
        sys.exit(5)
    except Blocked as ex:
        print(f"{where} or the network turned the download away: {ex}")
        sys.exit(4)
    verify(app, out, version, args.apksigner, args.aapt2)


if __name__ == "__main__":
    main()
