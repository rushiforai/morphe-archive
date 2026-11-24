"""Looks for a version of an app newer than the ones this bundle supports.

Where it looks depends on the app's "source" (see app_versions.py):
- apkmirror: the release versions in APKMirror's feed (where users get the file to patch); betas
  and alphas are left out. With "play_country" (Quora) also the version on Google Play, which is
  usually ahead: a newer version that only Google Play has is written as play_only, and the
  workflow says so in an issue.
- apkpure: the version APKPure's latest endpoint serves, read from its redirect without
  downloading. The endpoint only ever hands out the newest build, so this sees no history.
  (APKMirror's pages are a Cloudflare 403 to automation for some apps.)
- hand: the version on the app's Google Play page (the version Google Play installs now), and
  when Google Play can't be read, the version APKPure's page names. Both only say that a new
  version is out; the file itself is added to JoFSlash/morphe-apks by hand.
The versions found are compared with the ones listed in the app's Constants.kt.

Prints a short report. With --github-output <file> it also writes, for a GitHub workflow:
  new=<newest version not listed yet, or empty>
  supported=<listed versions, comma separated>
  play=, play_only=   (apkmirror with play_country) the Google Play version, and that version
                      again when only Google Play has it and it is newer, else empty
  source=             (hand) where the version was read: Google Play or APKPure

Usage: python .github/scripts/watch_version.py <app> [--github-output <file>]
Exits 0 when it could read the source, 2 when it couldn't.
"""
import argparse
import http.client
import re
import sys
import urllib.error
import urllib.parse
import urllib.request

from app_versions import App, USER_AGENT


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, "Accept-Language": "en"})
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read().decode("utf8", errors="replace")


def apkmirror_versions(app):
    """Release versions in the feed, newest first; betas and alphas are left out."""
    versions = []
    for title in re.findall(r"<title>([^<]*)</title>", fetch(app.feed)):
        if re.search(r"\b(beta|alpha)\b", title, re.I):
            continue
        version = app.find(title)
        if version and version not in versions:
            versions.append(version)
    return sorted(versions, key=app.order, reverse=True)


def apkpure_latest(app):
    """The version APKPure's latest endpoint serves, read from the redirect without downloading the
    APK. Both the Location URL and the Content-Disposition filename carry the version name."""
    class NoRedirect(urllib.request.HTTPRedirectHandler):
        def redirect_request(self, *args):
            return None

    opener = urllib.request.build_opener(NoRedirect)
    request = urllib.request.Request(app.apkpure_endpoint, headers={"User-Agent": USER_AGENT}, method="HEAD")
    try:
        opener.open(request, timeout=60)
        raise RuntimeError("the endpoint didn't redirect to a file")
    except urllib.error.HTTPError as ex:
        if ex.code not in (301, 302, 303, 307, 308):
            raise
        where = urllib.parse.unquote(ex.headers.get("Location", "") + " " + ex.headers.get("Content-Disposition", ""))
    # The longest dotted number is the versionName (e.g. 9.3.7.109370600), not a short date.
    candidates = sorted(set(re.findall(r"\d+(?:\.\d+){2,}", where)), key=lambda v: len(v), reverse=True)
    if not candidates:
        raise RuntimeError(f"couldn't read the version from {where[:300]}")
    return candidates[0]


def play_version(app):
    """The version in the data of the Google Play page. It sits in a nested list of its own,
    [[["9.25.1"]], ...], which nothing else on the page looks like."""
    found = re.findall(r'\[\[\["(\d+(?:\.\d+){2,})"\]\]', fetch(app.play_page(app.v["play_country"])))
    found = [v for v in found if app.valid(v)]
    return max(found, key=app.order) if found else None


def apkpure_page_version(app):
    """The version in the description of APKPure's page ("Listonic 9.25.1 APK download").
    Other version numbers on the page are APKPure's own app's."""
    found = re.findall(r'<meta name="description" content="[^"]*?(\d+(?:\.\d+){2,}) APK download', fetch(app.v["apkpure"]))
    return found[0] if found else None


def watch_apkmirror(app, newest):
    try:
        mirror = apkmirror_versions(app)
    except Exception as ex:  # The workflow then reports that the check itself failed.
        print(f"Could not read APKMirror: {ex}")
        sys.exit(2)
    new = [v for v in mirror if app.order(v) > newest]
    print(f"APKMirror: {', '.join(mirror[:5]) or 'none found'}")
    outputs = {"new": new[0] if new else ""}
    if app.v.get("play_country"):
        try:
            play = play_version(app)
        except Exception as ex:
            print(f"Could not read Google Play: {ex}")
            play = None
        print(f"Google Play: {play or 'unknown'}")
        # A newer version that only Google Play has. The workflow says so in an issue; it is tried
        # once APKMirror has it, or by hand once its file is uploaded to morphe-apks.
        play_only = play if play and app.order(play) > newest and play not in mirror else ""
        outputs.update(play=play or "", play_only=play_only)
        if not new and play_only:
            print(f"Google Play has {play}; APKMirror doesn't have it yet.")
    if new:
        print(f"New on APKMirror: {new[0]}")
    elif not outputs.get("play_only"):
        print("Nothing newer than the supported versions.")
    return outputs


def watch_apkpure(app, newest):
    try:
        latest = apkpure_latest(app)
    except (urllib.error.URLError, OSError, http.client.HTTPException, RuntimeError) as ex:
        print(f"Could not read APKPure: {ex}")
        sys.exit(2)
    is_new = app.order(latest) > newest
    print(f"APKPure latest: {latest}")
    print(f"New on APKPure: {latest}" if is_new else "Nothing newer than the supported versions.")
    return {"new": latest if is_new else ""}


def watch_hand(app, newest):
    version, source = None, None
    for name, read in (("Google Play", play_version), ("APKPure", apkpure_page_version)):
        try:
            version = read(app)
        except Exception as ex:  # Try the next source; the workflow reports when none works.
            print(f"Could not read {name}: {ex}")
            continue
        if version:
            source = name
            break
        print(f"No version found on {name}.")
    if not version:
        sys.exit(2)
    new = version if app.order(version) > newest else ""
    print(f"{source}: {version}")
    print(f"New: {new}" if new else "Nothing newer than the supported versions.")
    return {"new": new, "source": source}


WATCH = {"apkmirror": watch_apkmirror, "apkpure": watch_apkpure, "hand": watch_hand}


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("app", help="The name of the app's file in .github/apps (without .json)")
    parser.add_argument("--github-output", help="File to append workflow outputs to")
    args = parser.parse_args()

    app = App(args.app)
    supported = app.listed()
    newest = max((app.order(v) for v in supported), default=(0,))
    print(f"Supported: {', '.join(supported) or 'none'}")
    outputs = WATCH[app.source](app, newest)
    outputs["supported"] = ", ".join(supported)

    if args.github_output:
        with open(args.github_output, "a", encoding="utf8") as out:
            for name in ("new", "supported", "play", "play_only", "source"):
                if name in outputs:
                    out.write(f"{name}={outputs[name]}\n")


if __name__ == "__main__":
    main()
