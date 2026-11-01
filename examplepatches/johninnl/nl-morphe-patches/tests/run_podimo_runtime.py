"""Collect redacted on-device evidence that the patched Podimo plays premium episodes.

Flow (run after tests/validate_podimo.py):

1. With the ORIGINAL app installed, open the play deep link of a Premium episode:
   the app must show the subscription screen (negative control, already recorded in
   the supplied analysis).
2. Install the patched combined APK. A fresh signature means the app is installed
   anew, so the app starts without any stored account and registers a fresh guest
   session at startup.
3. Open the same play deep link: the app must start playback of the full episode.
4. Repeat with the free control episode.
5. Capture `dumpsys media_session` state (duration, playback state) and filtered
   logcat lines as evidence. Screenshots are optional.

Nothing here captures tokens or signed URLs: logcat evidence is filtered to player
state lines, and any URL query strings are redacted before saving.
"""
import argparse
import json
import re
from pathlib import Path
import subprocess
import time

ADB = Path.home() / "Library/Android/sdk/platform-tools/adb"
EPISODES = {
    'premium-64': '00938995-fbae-4d28-ac16-37e6ea95073b',
    'premium-57': '4a37970d-4f7e-4f9f-ae95-f00e407e1576',
    'free-control-1': '5320c043-239f-4750-bd10-82540e300a82',
}
SAFE_LINE = re.compile(r'(ExoPlayer|MediaSession|MediaController|MediaPreparer|playback'
                       r'|Playback|AudioTrack|HlsMediaSource|BaseMediaChunk|state)'
                       r'|podimo', re.I)
SECRET = re.compile(r'([?&](u|Signature|KeyName|Policy|Key-Pair-Id|token)=[^&\s"]+)'
                    r'|(ey[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{5,}\.[A-Za-z0-9_-]{5,})'
                    r'|([A-Za-z0-9+/_-]{32,})')


def redact(line: str) -> str:
    return SECRET.sub(lambda m: m.group(0).split('=')[0] + '=[REDACTED]' if '=' in m.group(0) else '[REDACTED]', line)


def run(command, **kwargs):
    result = subprocess.run([str(x) for x in command], capture_output=True, text=True, **kwargs)
    return result.stdout


def adb(*arguments, serial):
    return run([ADB, '-s', serial, *arguments])


def visible_texts(serial):
    dump = adb('shell', 'uiautomator', 'dump', '/dev/tty', serial=serial)
    texts = re.findall(r'text="([^"]+)"|content-desc="([^"]+)"', dump)
    return [value.strip() for pair in texts for value in pair if value.strip()]


def deep_link(serial, episode: str) -> None:
    adb('shell', 'am', 'start', '-a', 'android.intent.action.VIEW',
        '-d', f'podimo://play/episode/{episode}', serial=serial)


def stop(serial):
    adb('shell', 'am', 'force-stop', 'com.podimo', serial=serial)


def uninstall(serial):
    subprocess.run([str(ADB), '-s', serial, 'uninstall', 'com.podimo'], capture_output=True, text=True)


def install(serial, apk: Path):
    result = subprocess.run([str(ADB), '-s', serial, 'install', '-r', str(apk)],
                            capture_output=True, text=True)
    assert 'Success' in result.stdout or 'Success' in result.stderr, f'{result.stdout}{result.stderr}'


def media_state(serial):
    return adb('shell', 'dumpsys', 'media_session', serial=serial)


def playback_evidence(serial, episode: str, label: str, evidence: dict, wait=25):
    stop(serial)
    adb('shell', 'logcat', '-c', serial=serial)
    deep_link(serial, episode)
    time.sleep(wait)
    dump = media_state(serial)
    active = re.search(r'(?:package|name)=com\.podimo.*?\n(.*?)(?:\n\S* package|\Z)', dump, re.S)
    state = {}
    if active:
        block = active.group(1)
        for field in ('state=PlaybackState', 'duration', 'position', 'metadata'):
            for line in block.splitlines():
                if field in line:
                    state.setdefault(field, []).append(line.strip())
    evidence[label] = {
        'episode-id': episode,
        'dumpsys-media-session-excerpt': redact(json.dumps(state, indent=1)),
        'ui-texts': visible_texts(serial)[:40],
    }
    return state


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', default='3B164A01H1Z00000')
    parser.add_argument('--apk', type=Path, help='Patched combined APK; skips install when omitted')
    parser.add_argument('--out', type=Path, default=Path('build/validation/podimo/runtime-evidence.json'))
    parser.add_argument('--screenshot', type=Path)
    parser.add_argument('--episode-wait', type=int, default=25)
    args = parser.parse_args()
    serial = args.serial
    evidence = {}

    if args.apk is not None:
        print('Uninstalling the original so the patched build starts without stored account data...')
        uninstall(serial)
        install(serial, args.apk)
        time.sleep(3)

    # Fresh startup registers the guest session before anything else.
    adb('shell', 'logcat', '-c', serial=serial)
    stop(serial)
    adb('shell', 'monkey', '-p', 'com.podimo', '-c', 'android.intent.category.LAUNCHER', '1', serial=serial)
    time.sleep(20)
    evidence['startup-ui'] = visible_texts(serial)[:40]

    playback_evidence(serial, EPISODES['premium-64'], 'premium-episode-64', evidence, args.episode_wait)
    playback_evidence(serial, EPISODES['premium-57'], 'premium-episode-57', evidence, args.episode_wait)
    playback_evidence(serial, EPISODES['free-control-1'], 'free-control-episode-1', evidence, args.episode_wait)

    if args.screenshot:
        args.screenshot.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run([str(ADB), '-s', serial, 'exec-out', 'screencap', '-p'],
                       stdout=args.screenshot.open('wb'))

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(evidence, indent=1))
    print(f'Wrote {args.out}')
    for label, data in evidence.items():
        if label.startswith('premium'):
            print(f"{label}: {data['episode-id']} -> dumpsys {data['dumpsys-media-session-excerpt'][:200]}")


if __name__ == '__main__':
    main()
