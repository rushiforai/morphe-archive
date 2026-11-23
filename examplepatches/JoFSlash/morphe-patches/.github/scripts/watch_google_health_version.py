"""Looks for Google Health versions newer than the ones this bundle supports.

Reads the release versions in APKMirror's feed (where users get the APKM to patch) and compares
them with the versions listed in Constants.kt. Google Health's version names look like
"5.13.health-mobile-1104148438-1023845615"; the number after "health-mobile-" is the version
code, which only goes up, so versions are compared by it.

Prints a short report. With --github-output <file> it also writes, for a GitHub workflow:
  new=<newest APKMirror version not listed yet, or empty>
  supported=<listed versions, comma separated>

Usage: python .github/scripts/watch_google_health_version.py [--github-output <file>]
Exits 0 when it could read APKMirror, 2 when it couldn't.
"""
import argparse
import pathlib
import re
import sys
import urllib.request

ROOT = pathlib.Path(__file__).resolve().parents[2]
CONSTANTS = ROOT / "patches/src/main/kotlin/app/jofslash/patches/googlehealth/shared/Constants.kt"
APKMIRROR_FEED = "https://www.apkmirror.com/apk/google-inc/google-health-fitbit/feed/"
USER_AGENT = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"
VERSION = re.compile(r"\b(\d+(?:\.\d+)+\.health-mobile-(\d+)-\d+)\b")


def key(version):
    match = VERSION.fullmatch(version)
    return int(match.group(2)) if match else 0


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read().decode("utf8", errors="replace")


def apkmirror_versions():
    """Release versions in the feed, newest first; betas and alphas are left out."""
    feed = fetch(APKMIRROR_FEED)
    versions = []
    for title in re.findall(r"<title>([^<]*)</title>", feed):
        if re.search(r"\b(beta|alpha)\b", title, re.I):
            continue
        match = VERSION.search(title)
        if match and match.group(1) not in versions:
            versions.append(match.group(1))
    return sorted(versions, key=key, reverse=True)


def listed_versions():
    return re.findall(r'AppTarget\(version = "([^"]+)"', CONSTANTS.read_text(encoding="utf8"))


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--github-output", help="File to append workflow outputs to")
    args = parser.parse_args()

    supported = listed_versions()
    newest_supported = max((key(v) for v in supported), default=0)
    try:
        mirror = apkmirror_versions()
    except Exception as ex:  # The workflow then reports that the check itself failed.
        print(f"Could not read APKMirror: {ex}")
        sys.exit(2)

    new = [v for v in mirror if key(v) > newest_supported]
    print(f"Supported: {', '.join(supported) or 'none'}")
    print(f"APKMirror: {', '.join(mirror[:5]) or 'none found'}")
    print(f"New on APKMirror: {new[0]}" if new else "Nothing newer than the supported versions.")

    if args.github_output:
        with open(args.github_output, "a", encoding="utf8") as out:
            out.write(f"new={new[0] if new else ''}\n")
            out.write(f"supported={', '.join(supported)}\n")


if __name__ == "__main__":
    main()
