"""Looks for Quora versions newer than the ones this bundle supports.

Reads the newest version on APKMirror (where users get the APKM to patch) and on Google Play
(which is usually ahead), and compares them with the versions listed in Constants.kt.

Prints a short report. With --github-output <file> it also writes, for a GitHub workflow:
  new=<newest APKMirror version not listed yet, or empty>
  play=<newest Google Play version, or empty>
  supported=<listed versions, comma separated>

Usage: python .github/scripts/watch_quora_version.py [--github-output <file>]
Exits 0 when it could read APKMirror, 2 when it couldn't.
"""
import argparse
import pathlib
import re
import sys
import urllib.request

ROOT = pathlib.Path(__file__).resolve().parents[2]
CONSTANTS = ROOT / "patches/src/main/kotlin/app/jofslash/patches/quora/shared/Constants.kt"
APKMIRROR_FEED = "https://www.apkmirror.com/apk/quora-inc/quora/feed/"
PLAY_PAGE = "https://play.google.com/store/apps/details?id=com.quora.android&hl=en&gl=US"
USER_AGENT = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"


def key(version):
    return tuple(int(part) for part in version.split("."))


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read().decode("utf8", errors="replace")


def apkmirror_versions():
    """Release versions in the feed; betas and alphas are left out."""
    feed = fetch(APKMIRROR_FEED)
    titles = re.findall(r"<title>([^<]*)</title>", feed)
    versions = []
    for title in titles:
        if re.search(r"\b(beta|alpha)\b", title, re.I):
            continue
        match = re.search(r"\b(\d+\.\d+\.\d+)\b", title)
        if match and match.group(1) not in versions:
            versions.append(match.group(1))
    return sorted(versions, key=key, reverse=True)


def play_version():
    page = fetch(PLAY_PAGE)
    match = re.search(r'\[\[\["(\d+\.\d+\.\d+)"\]\]', page)
    return match.group(1) if match else None


def listed_versions():
    return re.findall(r'AppTarget\(version = "([^"]+)"', CONSTANTS.read_text(encoding="utf8"))


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--github-output", help="File to append workflow outputs to")
    args = parser.parse_args()

    supported = listed_versions()
    newest_supported = max(supported, key=key) if supported else "0.0.0"
    try:
        mirror = apkmirror_versions()
    except Exception as ex:  # The workflow then reports that the check itself failed.
        print(f"Could not read APKMirror: {ex}")
        sys.exit(2)
    try:
        play = play_version()
    except Exception as ex:
        print(f"Could not read Google Play: {ex}")
        play = None

    new = [v for v in mirror if key(v) > key(newest_supported)]
    # A newer version that only Google Play has. The workflow says so in an issue; it is tried
    # once APKMirror has it, or by hand once its APKM is uploaded to morphe-apks.
    play_only = play if play and key(play) > key(newest_supported) and play not in mirror else ""
    print(f"Supported: {', '.join(supported) or 'none'}")
    print(f"APKMirror: {', '.join(mirror[:5]) or 'none found'}")
    print(f"Google Play: {play or 'unknown'}")
    if new:
        print(f"New on APKMirror: {new[0]}")
    elif play and key(play) > key(newest_supported):
        print(f"Google Play has {play}; APKMirror doesn't have it yet.")
    else:
        print("Nothing newer than the supported versions.")

    if args.github_output:
        with open(args.github_output, "a", encoding="utf8") as out:
            out.write(f"new={new[0] if new else ''}\n")
            out.write(f"play={play or ''}\n")
            out.write(f"play_only={play_only}\n")
            out.write(f"supported={', '.join(supported)}\n")


if __name__ == "__main__":
    main()
