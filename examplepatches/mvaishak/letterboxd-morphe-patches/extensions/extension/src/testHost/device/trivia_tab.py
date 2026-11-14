"""Smoke test the signed Trivia patch on the sole USB Android device.

Run from the repository with an unlocked phone:
  python3 extensions/extension/src/testHost/device/trivia_tab.py build/trivia-tab primer
The results include app logs and screenshots; they do not clear app data.
"""
import argparse
import json
import re
import subprocess
import time
import xml.etree.ElementTree as ET
from pathlib import Path

PACKAGE = 'com.letterboxd.letterboxd'
REMOTE_XML = '/data/local/tmp/letterboxd-trivia-tab.xml'
FILMS = {
    'primer': 'tt0390384',
    'the-dark-knight': 'tt0468569',
    'the-matrix': 'tt0133093',
    'inception': 'tt1375666',
    'parasite-2019': 'tt6751668',
}


def adb(*args):
    return subprocess.check_output(['adb', '-d', *args], timeout=45)


def ui():
    adb('shell', 'uiautomator', 'dump', REMOTE_XML)
    return list(ET.fromstring(adb('exec-out', 'cat', REMOTE_XML)).iter('node'))


def bounds(node):
    return tuple(map(int, re.findall(r'\d+', node.get('bounds'))))


def tap(node):
    x1, y1, x2, y2 = bounds(node)
    adb('shell', 'input', 'tap', str((x1+x2)//2), str((y1+y2)//2))


def swipe(width, height, dy):
    x = width // 2
    y = height * 3 // 5
    coords = (x, y, x, y + dy)
    adb('shell', 'input', 'swipe', *map(str, coords), '400')


def is_spoiler(n):
    return n.get('clickable') == 'true' and 'Spoiler: Tap to reveal' in (
        n.get('text'), n.get('content-desc'))


def find(nodes, text):
    return next((n for n in nodes if n.get('text') == text), None)


def seek(predicate, size, step=-0.34, tries=9):
    for _ in range(tries):
        nodes = ui()
        for n in nodes:
            if predicate(n):
                return n, nodes
        swipe(*size, int(step * size[1]))
    raise AssertionError('expected UI not found')


def seek_trivia(size, from_below=False):
    for _ in range(10):
        nodes = ui()
        bar = next((n for n in nodes if n.get('resource-id', '').endswith(':id/extra_details_tabs')), None)
        if bar is None:
            swipe(*size, int(size[1] * (0.29 if from_below else -0.35)))
            continue
        x1, y1, x2, y2 = bounds(bar)
        y = (y1 + y2) // 2
        if y < size[1] * 0.16 or y > size[1] * 0.65:
            swipe(*size, int(size[1] * (0.20 if y < size[1] * 0.16 else -0.20)))
            continue
        trivia = find(nodes, 'Trivia')
        if trivia is None:
            adb('shell', 'input', 'swipe', str(x2 - 80), str(y), str(x1 + 80), str(y), '350')
            nodes = ui()
            trivia = find(nodes, 'Trivia')
        if trivia is not None:
            return trivia, nodes
        raise AssertionError('Trivia absent after scrolling the native tab bar')
    raise AssertionError('film detail tabs were not found')


def logs():
    return [s for s in adb('logcat', '-d', '-s', 'IMDbTrivia:I').decode().splitlines()
            if 'IMDbTrivia:' in s]


def mark_logs():
    return frozenset(logs())


def logs_after(marker):
    # Logcat can evict lines during a run, so a line-count offset isn't stable.
    return [line for line in logs() if line not in marker]


def wait_log(offset, predicate, seconds=42):
    deadline = time.monotonic() + seconds
    while time.monotonic() < deadline:
        for line in logs_after(offset):
            message = line.split('IMDbTrivia: ', 1)[1]
            if predicate(message):
                return message
        time.sleep(0.4)
    raise AssertionError('expected trivia log not found: ' + repr(logs_after(offset)))


def frame(offset, imdb_id, cached):
    message = wait_log(offset, lambda s: s.startswith(f'first_frame id={imdb_id} cache={str(cached).lower()} '))
    return {key: int(value) for key, value in re.findall(r'(elapsedMs|frameWaitMs)=(\d+)', message)}


def pss():
    output = adb('shell', 'dumpsys', 'meminfo', PACKAGE).decode()
    match = re.search(r'TOTAL PSS:\s+(\d+)', output)
    return int(match[1]) if match else None


def screenshot(directory, name):
    (directory / f'{name}.png').write_bytes(adb('exec-out', 'screencap', '-p'))


def check(slug, out, size, detail, warm_runs, preload=False):
    imdb_id = FILMS[slug]
    start = mark_logs()
    adb('shell', 'am', 'start', '-S', '-W', '-a', 'android.intent.action.VIEW', '-d',
        f'https://letterboxd.com/film/{slug}/', '-n', f'{PACKAGE}/.MainActivity')
    ready = wait_log(start, lambda line: line.startswith(f'film_ready id={imdb_id} '))
    film_ready_ms = int(ready.rsplit('=', 1)[1])
    preload_preview = None
    if preload:
        preview = wait_log(start, lambda line: line.startswith(f'preload_preview id={imdb_id} '))
        preload_preview = {key: int(value) for key, value in re.findall(r'(entries|elapsedMs)=(\d+)', preview)}
        assert 0 < preload_preview['entries'] <= 3
    before_pss = pss()
    trivia, nodes = seek_trivia(size)
    assert find(nodes, 'Releases') is not None
    if not preload:
        assert not any('webview_started' in line for line in logs_after(start))
    cold_offset = mark_logs()
    tap(trivia)
    cold = frame(cold_offset, imdb_id, False)
    during_pss = pss()
    done = json.loads(wait_log(start, lambda line: line.startswith('{') and imdb_id in line
                               and '"status":"observed"' in line))
    assert sum(done['groups'].values()) >= done['items'] >= 3
    trace = [line.split('IMDbTrivia: ', 1)[1] for line in logs_after(start)]
    starts = [line for line in trace if line.startswith(f'webview_started id={imdb_id} ')]
    if preload:
        assert starts[0].endswith('preload=true')
        idle = [json.loads(line) for line in trace if line.startswith('{') and '"status":"preloaded"' in line]
        assert all(row.get('pagesRequested', 0) == 0 for row in idle)
    else:
        assert starts == [f'webview_started id={imdb_id} preload=false']
    record = {'film': slug, 'preload': preload, 'cold': cold, 'retrieval': done,
              'filmViewReadyMs': film_ready_ms, 'preloadPreview': preload_preview,
              'webViewStarts': starts, 'appPssKbBefore': before_pss, 'appPssKbAtFirstEntry': during_pss}
    with (out / 'cold-observations.jsonl').open('a') as evidence:
        print(json.dumps(record), file=evidence)
    if warm_runs == 0 and not detail:
        return record
    nodes = ui()
    assert find(nodes, 'Trivia') is not None
    if detail:
        screenshot(out, slug + '-trivia-tab')
        if slug == 'primer':
            for _ in range(3):
                more, _ = seek(lambda n: n.get('text') == 'Load more', size, step=-0.23, tries=5)
                tap(more)
            _, nodes = seek(is_spoiler, size, step=-0.15)
            if sum(is_spoiler(n) for n in nodes) < 2:
                swipe(*size, -int(size[1] * 0.24))
                nodes = ui()
            hidden = [node for node in nodes if is_spoiler(node)]
            assert len(hidden) == 2, 'both hidden entries should be in view before the reveal'
            screenshot(out, 'primer-spoilers-hidden')
            tap(hidden[0])
            assert sum(is_spoiler(n) for n in ui()) == 1
        elif slug == 'the-dark-knight':
            cameo, _ = seek(lambda n: n.get('text') == 'Cameo', size, tries=3)
            tap(cameo)
            _, _ = seek(lambda n: n.get('text') == '3 entries', size, tries=3)
            screenshot(out, 'the-dark-knight-cameo')
    _, nodes = seek_trivia(size, from_below=detail and slug == 'primer')
    tap(find(nodes, 'Releases'))
    nodes = ui()
    assert not any(n.get('text') == 'Load more' for n in nodes)
    trivia = find(nodes, 'Trivia')
    assert trivia is not None
    warm = []
    warm_offset = mark_logs()
    for _ in range(warm_runs):
        offset = mark_logs()
        tap(trivia)
        warm.append(frame(offset, imdb_id, True))
        nodes = ui()
        assert find(nodes, 'IMDb') is not None
        releases = find(nodes, 'Releases')
        assert releases is not None
        tap(releases)
        trivia = find(ui(), 'Trivia')
        assert trivia is not None
    assert not any(s.split('IMDbTrivia: ',1)[1].startswith('{') for s in logs_after(warm_offset))
    return dict(record, warm=warm)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('output', type=Path)
    parser.add_argument('films', nargs='+', choices=FILMS)
    parser.add_argument('--preload', action='store_true', help='Expect automatic preload in the installed build')
    parser.add_argument('--detail', action='store_true')
    parser.add_argument('--warm-runs', type=int, default=3)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    size = tuple(map(int, re.findall(r'(\d+)x(\d+)', adb('shell', 'wm', 'size').decode())[-1]))
    for slug in args.films:
        print(json.dumps(check(slug, args.output, size, args.detail, args.warm_runs, args.preload)), flush=True)


if __name__ == '__main__':
    main()
