#!/usr/bin/env python3
"""Add newly released app versions to the patches' supported versions.

For each tracked app, read its release source (an APKMirror feed, Uptodown's
versions page, or the project's GitHub releases). If the newest stable
version is newer than every version listed in that app's Compatibility block
in Constants.kt, add it as a supported AppTarget. Morphe Manager then shows
"App update available" for the patched app once the next release is published.

Writes `changed=true|false` and `message=<commit subject>` to $GITHUB_OUTPUT.
Exits non-zero if a feed can't be read, so a broken check fails loudly.
"""
import os
import re
import sys
import json
import urllib.error
import urllib.parse
import urllib.request

CONSTANTS = os.environ.get(
    "CONSTANTS_PATH", "patches/src/main/kotlin/app/sircoderin/patches/shared/Constants.kt")

APPS = [
    {
        "name": "Twilight",
        "scope": "twilight",
        "constant": "COMPATIBILITY_TWILIGHT",
        "source": "apkmirror",
        "feed": "https://www.apkmirror.com/apk/urbandroid-team/twilight/feed/",
        "title_prefix": "Twilight: Blue light filter ",
    },
    {
        "name": "Kvaesitso",
        "scope": "kvaesitso",
        "constant": "COMPATIBILITY_KVAESITSO",
        "source": "github",
        "repo": "MM2-0/Kvaesitso",
    },
    {
        # APKMirror's Spotify pages answer scripts with a Cloudflare challenge (403), and its list mixes in
        # unlabeled test builds. Uptodown lists only regular releases, but from the first day of a staged rollout.
        # So: read versions from Uptodown, and add one only once Morphe Manager's download button for it leads to
        # APKMirror (where the APK is signature-checked).
        "name": "Spotify",
        "scope": "spotify",
        "constant": "COMPATIBILITY_SPOTIFY",
        "source": "uptodown",
        "page": "https://spotify.en.uptodown.com/android/versions",
        "package": "com.spotify.music",
        "require_apkmirror": True,
    },
]

VERSION_RE = re.compile(r"^\d+(?:\.\d+)+$")


def vkey(v):
    return tuple(int(p) for p in v.split("."))


def latest_github_version(app):
    headers = {"Accept": "application/vnd.github+json", "User-Agent": "bump-app-versions"}
    token = os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    url = f"https://api.github.com/repos/{app['repo']}/releases?per_page=20"
    with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=30) as r:
        releases = json.load(r)
    versions = []
    for rel in releases:
        if rel.get("draft") or rel.get("prerelease"):
            continue
        v = rel["tag_name"].lstrip("v")
        if VERSION_RE.match(v):
            versions.append(v)
    if not versions:
        raise RuntimeError(f"{app['name']}: no stable releases found in {app['repo']}")
    return max(versions, key=vkey)


MORPHE_SEARCH_URL = "https://api.morphe.software/v2/web-search/"


class _NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, *args, **kwargs):
        return None


def manager_download_url(package, version):
    """Where Morphe Manager's download button leads for this version.

    Asks the same Morphe API that Manager asks and follows its redirects until they leave api.morphe.software
    (the page itself is never fetched)."""
    opener = urllib.request.build_opener(_NoRedirect)
    url = MORPHE_SEARCH_URL + urllib.parse.quote(f"{package}~{version}~arm64-v8a")
    for _ in range(5):
        req = urllib.request.Request(url, headers={"User-Agent": "bump-app-versions"})
        try:
            opener.open(req, timeout=30).close()
            return url
        except urllib.error.HTTPError as e:
            if e.code not in (301, 302, 303, 307, 308) or not e.headers.get("Location"):
                raise
            url = urllib.parse.urljoin(url, e.headers["Location"])
        if urllib.parse.urlparse(url).hostname != "api.morphe.software":
            return url
    raise RuntimeError(f"Morphe API kept redirecting for {package} {version}")


def latest_uptodown_version(app, newest_listed):
    """Newest version on Uptodown's versions page; with require_apkmirror, the newest one that Morphe Manager
    would download from APKMirror. Returns None when there is nothing newer than newest_listed to add."""
    req = urllib.request.Request(app["page"], headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=30) as r:
        html = r.read().decode("utf-8", "replace")
    # Each entry looks like <... class="version">9.2.4.2644</...>.
    versions = {v.strip() for v in re.findall(r'class="version"[^>]*>([^<]*)<', html)}
    versions = sorted((v for v in versions if VERSION_RE.match(v)), key=vkey, reverse=True)
    if not versions:
        raise RuntimeError(f"{app['name']}: no versions found on {app['page']}")
    for v in versions:
        if newest_listed and vkey(v) <= vkey(newest_listed):
            break
        if not app.get("require_apkmirror"):
            return v
        host = urllib.parse.urlparse(manager_download_url(app["package"], v)).hostname or ""
        if host == "apkmirror.com" or host.endswith(".apkmirror.com"):
            return v
        print(f"{app['name']}: {v} is out, but Morphe Manager would download it from {host}; waiting for APKMirror")
    return None


def latest_version(app, newest_listed):
    if app["source"] == "github":
        return latest_github_version(app)
    if app["source"] == "uptodown":
        return latest_uptodown_version(app, newest_listed)
    return latest_feed_version(app)


def latest_feed_version(app):
    req = urllib.request.Request(app["feed"], headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=30) as r:
        xml = r.read().decode("utf-8", "replace")
    versions = []
    for title in re.findall(r"<title>([^<]*)</title>", xml):
        if not title.startswith(app["title_prefix"]):
            continue
        # "Twilight: Blue light filter 14.32 by Petr Nálevka (Urbandroid)"
        v = title[len(app["title_prefix"]):].split(" by ")[0].strip()
        if VERSION_RE.match(v):  # skips "14.33 beta", "14.33-alpha", etc.
            versions.append(v)
    if not versions:
        raise RuntimeError(f"{app['name']}: no stable versions found in {app['feed']}")
    return max(versions, key=vkey)


def main():
    src = open(CONSTANTS, encoding="utf-8").read()
    added = []
    for app in APPS:
        start = src.index(f"val {app['constant']} = Compatibility(")
        end = src.index("\n    )", start)
        block = src[start:end]
        listed = re.findall(r'AppTarget\(version = "([^"]+)"', block)
        newest_listed = max(listed, key=vkey) if listed else None
        latest = latest_version(app, newest_listed)
        if latest is None:
            print(f"{app['name']}: nothing to add, newest supported {newest_listed}")
            continue
        print(f"{app['name']}: feed {latest}, newest supported {newest_listed}")
        if newest_listed and vkey(latest) <= vkey(newest_listed):
            continue
        # Insert as the first entry of `targets = listOf(`, above any existing comments.
        anchor = re.search(r"targets = listOf\(\n(\s*)", block)
        if anchor is None:
            raise RuntimeError(f"{app['name']}: no `targets = listOf(` in {app['constant']}")
        indent = anchor.group(1)
        line = (f"// Added automatically when a new release appeared (not hand-tested).\n"
                f'{indent}AppTarget(version = "{latest}"),\n{indent}')
        block = block[:anchor.end()] + line + block[anchor.end():]
        src = src[:start] + block + src[end:]
        added.append((app, latest))

    if added:
        open(CONSTANTS, "w", encoding="utf-8").write(src)
    msg = ""
    if added:
        scope = ",".join(a["scope"] for a, _ in added)
        msg = f"bump({scope}): support " + ", ".join(f"{a['name']} {v}" for a, v in added)
        print(msg)
    out = os.environ.get("GITHUB_OUTPUT")
    if out:
        with open(out, "a") as f:
            f.write(f"changed={'true' if added else 'false'}\n")
            f.write(f"message={msg}\n")


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print(f"error: {e}", file=sys.stderr)
        sys.exit(1)
