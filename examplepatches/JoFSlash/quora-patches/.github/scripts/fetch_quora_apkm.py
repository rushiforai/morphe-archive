"""Downloads a Quora APKM from APKMirror and checks that it is Quora's own.

It follows APKMirror's pages from the release in the feed to the file, with a pause between
requests and a few tries, as one person would. It is meant to run once for each new Quora
version, not more. Before the file is used it checks that base.apk is com.quora.android at the
asked version, and that every APK in the bundle is signed with Quora's certificate (the SHA-1 in
Constants.kt).

Usage:
    python .github/scripts/fetch_quora_apkm.py <version> <out.apkm> [--apksigner <path>] [--aapt2 <path>]
    python .github/scripts/fetch_quora_apkm.py --verify-only <file.apkm> <version> [--apksigner ...] [--aapt2 ...]

Exit codes: 0 done, 4 APKMirror or the network turned the download away (for example Cloudflare
or a timeout), 5 there is no APK bundle of the version on APKMirror, 6 the file isn't Quora's
(wrong package, version or signature), 7 apksigner or aapt2 couldn't run.
"""
import argparse
import base64
import hashlib
import http.client
import pathlib
import re
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.request
import zipfile

ROOT = pathlib.Path(__file__).resolve().parents[2]
CONSTANTS = ROOT / "patches/src/main/kotlin/app/jofslash/patches/quora/shared/Constants.kt"
BASE = "https://www.apkmirror.com"
FEED = BASE + "/apk/quora-inc/quora/feed/"
PACKAGE = "com.quora.android"
HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.9",
}
PAUSE = 4  # seconds between requests


class Blocked(Exception):
    """APKMirror or the network turned a request away."""


class NotFound(Exception):
    """APKMirror has no APK bundle of the version."""


def get(url, referer=None, binary=False):
    headers = dict(HEADERS)
    if referer:
        headers["Referer"] = referer
    last = None
    for attempt in range(3):
        if attempt:
            time.sleep(PAUSE * 4 * attempt)
        try:
            with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=60) as response:
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


def release_page(version):
    feed = get(FEED)
    for item in re.findall(r"<item>(.*?)</item>", feed, re.S):
        title = re.search(r"<title>([^<]*)</title>", item)
        link = re.search(r"<link>([^<]*)</link>", item)
        if title and link and re.search(rf"\b{re.escape(version)}\b", title.group(1)) \
                and not re.search(r"\b(beta|alpha)\b", title.group(1), re.I):
            return link.group(1).strip()
    return None


def bundle_variant(page):
    """The download page of the APK bundle (APKM). A release can also list plain APKs, which aren't
    what the patches take; APKMirror marks the bundle row with a BUNDLE badge."""
    links = list(dict.fromkeys(re.findall(r'href="(/apk/quora-inc/quora/[^"]*-android-apk-download/)"', page)))
    for i, link in enumerate(links):
        start = page.find(f'href="{link}"')
        end = page.find(f'href="{links[i + 1]}"') if i + 1 < len(links) else start + 3000
        if re.search(r">\s*BUNDLE\s*<|apkm-badge", page[start:end if end > start else start + 3000]):
            return link
    raise NotFound("no APK bundle (APKM) for this version on APKMirror")


def first(pattern, text, what):
    match = re.search(pattern, text)
    if not match:
        raise Blocked(f"couldn't find {what}; APKMirror's page may have changed")
    return match.group(1).replace("&amp;", "&")


def download(version, out):
    release = release_page(version)
    if not release:
        raise NotFound(f"Quora {version} isn't in APKMirror's feed")
    page = get(release)
    variant = BASE + bundle_variant(page)
    page = get(variant, release)
    keyed = BASE + first(r'href="(/apk/[^"]*/download/\?key=[^"]+)"', page, "the download button")
    page = get(keyed, variant)
    file_url = BASE + first(r'href="(/wp-content/themes/APKMirror/download\.php\?[^"]+)"', page, "the file link")
    data = get(file_url, keyed, binary=True)
    out.write_bytes(data)
    print(f"Downloaded {len(data)} bytes to {out}.")


def quora_signature():
    match = re.search(r'QUORA_SIGNATURE = "([0-9a-f]{40})"', CONSTANTS.read_text(encoding="utf8"))
    return match.group(1)


def run_tool(command):
    """Runs apksigner or aapt2. Exits with 7 when the tool itself can't run, so a missing tool
    isn't mistaken for a file that isn't Quora's."""
    try:
        return subprocess.run(command, capture_output=True, text=True)
    except OSError as ex:
        print(f"Couldn't run {command[0]}: {ex}")
        sys.exit(7)


def signer_digests(output):
    """SHA-1 digests of the signer certificates in `apksigner verify --print-certs-pem` output.

    apksigner versions differ: older ones print "Signer #1 certificate DN: ..." to stdout, newer
    ones "V3.0 Signer: certificate DN: ..." to stderr, so the caller passes both streams and the
    digests are computed from the PEM blocks. The source stamp certificate (Google's, added by
    Play) is left out; every other signer certificate counts."""
    digests, label, pem = [], "", None
    for line in output.splitlines():
        line = line.strip()
        match = re.match(r"(.+?):? certificate DN:", line)
        if match:
            label = match.group(1)
        elif line == "-----BEGIN CERTIFICATE-----":
            pem = []
        elif line == "-----END CERTIFICATE-----" and pem is not None:
            if "Signer" in label and not label.startswith("Source Stamp"):
                digests.append(hashlib.sha1(base64.b64decode("".join(pem))).hexdigest())
            pem = None
        elif pem is not None:
            pem.append(line)
    return digests


def verify(apkm, version, apksigner, aapt2):
    """Exits with 6 unless base.apk is Quora at this version and every APK in the bundle (the
    splits too: they can carry code) is signed with Quora's certificate."""
    expected = quora_signature()
    problems = []
    with tempfile.TemporaryDirectory() as work:
        try:
            with zipfile.ZipFile(apkm) as archive:
                apks = [n for n in archive.namelist() if n.endswith(".apk")]
                if "base.apk" not in apks:
                    raise KeyError("base.apk")
                for name in apks:
                    archive.extract(name, work)
        except (zipfile.BadZipFile, KeyError, OSError) as ex:
            print(f"Not an APKM with a base.apk: {ex}")
            sys.exit(6)
        base = str(pathlib.Path(work) / "base.apk")
        badging = run_tool([aapt2, "dump", "badging", base]).stdout
        match = re.search(r"package: name='([^']+)' versionCode='\d+' versionName='([^']+)'", badging)
        found_package, found_version = match.groups() if match else ("?", "?")
        if found_package != PACKAGE:
            problems.append(f"package is {found_package}")
        if found_version != version:
            problems.append(f"version is {found_version}, not {version}")
        for name in apks:
            certs = run_tool([apksigner, "verify", "--print-certs-pem", str(pathlib.Path(work) / name)])
            digests = signer_digests(certs.stdout + "\n" + certs.stderr)
            if certs.returncode != 0:
                problems.append(f"{name}: signature doesn't verify: " + (certs.stderr or certs.stdout).strip()[:200])
            elif not digests or set(digests) != {expected}:
                problems.append(f"{name} is signed by {digests}, not Quora")
                print(f"{apksigner} output for {name} (exit {certs.returncode}):\n"
                      f"{certs.stdout.strip()[:1500]}\n{certs.stderr.strip()[:1500]}")
    if problems:
        print("This isn't Quora's APK: " + "; ".join(problems))
        sys.exit(6)
    print(f"Checked: {PACKAGE} {version}, all {len(apks)} APKs signed by Quora ({expected}).")


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("first")
    parser.add_argument("second")
    parser.add_argument("--verify-only", action="store_true", help="Only check an APKM you already have")
    parser.add_argument("--apksigner", default="apksigner")
    parser.add_argument("--aapt2", default="aapt2")
    args = parser.parse_args()
    if args.verify_only:
        verify(pathlib.Path(args.first), args.second, args.apksigner, args.aapt2)
        return
    version, out = args.first, pathlib.Path(args.second)
    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        sys.exit("The version looks like 3.2.47.")
    try:
        download(version, out)
    except NotFound as ex:
        print(f"Not on APKMirror: {ex}")
        sys.exit(5)
    except Blocked as ex:
        print(f"APKMirror or the network turned the download away: {ex}")
        sys.exit(4)
    verify(out, version, args.apksigner, args.aapt2)


if __name__ == "__main__":
    main()
