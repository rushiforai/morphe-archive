"""Daily check that the animated art's Apple scrape still works, the same way the app does it
(features/AppleCanvas.java), and that the scrape code it follows hasn't changed upstream
(BitChord's AppleMusicCanvas.kt; the extension's copy is plain upstream now and not watched).
Exits 1 with a report when something is wrong; the GitHub Action then opens an
issue. Standard library only.

    python watcher/apple_token_watch.py            # check
    python watcher/apple_token_watch.py --accept   # after reviewing an upstream change: record it as seen
"""
import base64
import json
import os
import re
import sys
import time
import urllib.parse
import urllib.request
from pathlib import Path

UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
AMP = "https://amp-api.music.apple.com/v1/catalog/us/"
# A song whose album has had motion art for years; if Apple ever drops it, pick another.
PROBE_TERM = "Taylor Swift Anti-Hero"
PROBE_ALBUM = "Midnights"
MOTION_KEYS = ["motionDetailSquare", "motionSquareVideo1x1", "motionDetailRaw", "motionDetailTall", "motionTallVideo3x4"]
UPSTREAM = Path(__file__).with_name("upstream.json")
UPSTREAM_FILES = [
    ("ayhamo/BitChord", "app/src/main/java/com/music/bitchord/data/canvas/AppleMusicCanvas.kt"),
]
# vivimusic-automix's src/apple-canvas.js is plain upstream code since 2026-11-18 (the fork's token
# handling moved into src/plus/bg-plus.js with its other features); ours follows BitChord's file above.


def get(url, bearer=None):
    h = {"User-Agent": UA}
    if bearer:
        h.update({"Authorization": "Bearer " + bearer, "Origin": "https://music.apple.com", "Referer": "https://music.apple.com/"})
    elif url.startswith("https://api.github.com/") and os.environ.get("GITHUB_TOKEN"):
        # Unauthenticated, the API allows 60 calls an hour per IP, shared by all of GitHub's runners.
        h["Authorization"] = "Bearer " + os.environ["GITHUB_TOKEN"]
    with urllib.request.urlopen(urllib.request.Request(url, headers=h), timeout=20) as r:
        return r.read().decode("utf-8")


def b64(s):
    return base64.urlsafe_b64decode(s + "=" * (-len(s) % 4)).decode("utf-8")


def scrape_token():
    """AppleCanvas.token(): the web player's JWT from its index script."""
    html = get("https://music.apple.com/us/browse")
    scripts = re.findall(r"/assets/index(?:-legacy)?[~-][A-Za-z0-9_-]+\.js", html)
    if not scripts:
        raise RuntimeError("no /assets/index-*.js script on music.apple.com/us/browse (page layout changed)")
    now = time.time()
    # the labelled token from any script wins: an unlabelled one is only used once all are read
    fallback = None
    for path in scripts:
        js = get("https://music.apple.com" + path)
        for jwt in re.findall(r"ey[A-Za-z0-9_-]+\.ey[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+", js):
            try:
                head, payload = b64(jwt.split(".")[0]), b64(jwt.split(".")[1])
            except Exception:
                continue
            m = re.search(r'"exp"\s*:\s*(\d+)', payload)
            if not m or int(m.group(1)) <= now:
                continue
            if "WebPlayKid" in head or "AMPWebPlay" in payload:
                return jwt, int(m.group(1)), "web player token"
            fallback = fallback or (jwt, int(m.group(1)), "fallback token (not labelled WebPlayKid/AMPWebPlay)")
    if fallback:
        return fallback
    raise RuntimeError(f"no unexpired token in {len(scripts)} index script(s)")


def motion(ev):
    for k in MOTION_KEYS:
        a = (ev or {}).get(k) or {}
        for f in ("video", "videoUrl", "hlsUrl", "url"):
            if a.get(f):
                return k, a[f]
    return None


def check_scrape(report):
    token, exp, kind = scrape_token()
    report.append(f"token: {kind}, expires {time.strftime('%Y-%m-%d', time.gmtime(exp))}")
    root = json.loads(get(AMP + "search?types=songs&limit=10&extend=editorialVideo&include=albums&term="
                          + urllib.parse.quote(PROBE_TERM), token))
    hits = (((root.get("results") or {}).get("songs") or {}).get("data")) or []
    if not hits:
        raise RuntimeError(f"search for '{PROBE_TERM}' returned no songs")
    song = next((h for h in hits if PROBE_ALBUM.lower() in h["attributes"].get("albumName", "").lower()), hits[0])
    report.append(f"search: {len(hits)} songs, using '{song['attributes']['name']}' on '{song['attributes'].get('albumName')}'")
    found = motion(song["attributes"].get("editorialVideo"))
    if not found:
        album_id = ((((song.get("relationships") or {}).get("albums") or {}).get("data")) or [{}])[0].get("id")
        if not album_id:  # as the app does: the album id from the song's url
            m = re.search(r"/album/[^?]*/(\d+)", song["attributes"].get("url", ""))
            album_id = m and m.group(1)
        if not album_id:
            raise RuntimeError("song has no album relationship (response shape changed)")
        album = json.loads(get(AMP + f"albums/{album_id}?extend=editorialVideo", token))["data"][0]["attributes"]
        found = motion(album.get("editorialVideo"))
        if not found:
            raise RuntimeError(f"album '{album.get('name')}' has no motion art in any of {MOTION_KEYS} "
                               f"(editorialVideo keys: {sorted((album.get('editorialVideo') or {}).keys())})")
    key, url = found
    if ".m3u8" not in url:
        raise RuntimeError(f"motion art {key} is not an HLS playlist any more: {url[:120]}")
    playlist = get(url)
    if "#EXTM3U" not in playlist:
        raise RuntimeError(f"motion art playlist did not load as HLS: {url[:120]}")
    report.append(f"motion art: {key}, HLS playlist ok")


def latest_commits():
    out = {}
    for repo, path in UPSTREAM_FILES:
        commits = json.loads(get(f"https://api.github.com/repos/{repo}/commits?per_page=1&path=" + urllib.parse.quote(path)))
        out[f"{repo}/{path}"] = {"sha": commits[0]["sha"], "date": commits[0]["commit"]["committer"]["date"],
                                 "message": commits[0]["commit"]["message"].splitlines()[0]} if commits else None
    return out


def main():
    report, problems = [], []
    try:
        check_scrape(report)
    except Exception as e:
        problems.append(f"Apple scrape broken: {e}")

    try:
        now = latest_commits()
        if "--accept" in sys.argv:
            UPSTREAM.write_text(json.dumps(now, indent=2) + "\n", encoding="utf-8", newline="\n")
            report.append("upstream: recorded as seen")
        else:
            seen = json.loads(UPSTREAM.read_text(encoding="utf-8")) if UPSTREAM.exists() else {}
            for name, c in now.items():
                if c is None:
                    # No commit touches the path any more: the file was moved or renamed upstream.
                    problems.append(f"upstream scrape code not found: {name} (moved or renamed?). "
                                    "Find it again, then update UPSTREAM_FILES and run with --accept.")
                elif (seen.get(name) or {}).get("sha") != c["sha"]:
                    problems.append(f"upstream scrape code changed: {name} ({c['date']}: {c['message']}). "
                                    "Compare with features/AppleCanvas.java, then run with --accept and commit upstream.json.")
            report.append(f"upstream: {len(now)} files checked")
    except Exception as e:
        code = getattr(e, "code", None)
        if "--accept" in sys.argv:
            # nothing was recorded: saying "all good" would leave upstream.json stale
            problems.append(f"upstream: could not record ({e})")
        elif code == 404:
            # the repository or file can't be read (renamed, made private): the watch would be blind
            problems.append(f"upstream scrape code unreadable ({e}): check UPSTREAM_FILES and the repository's access.")
        else:
            report.append(f"upstream: could not check ({e})")  # GitHub hiccup (rate limit): not a scrape failure

    print("\n".join(report))
    if problems:
        print("\nPROBLEMS:\n- " + "\n- ".join(problems))
        sys.exit(1)
    print("\nall good")


if __name__ == "__main__":
    main()
