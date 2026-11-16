#!/usr/bin/env python3
"""Lurk's third-party image cache (TwitchImageCache, issue 71) over a temporary directory and a test clock (no APK).

Pins what keeps third-party emotes loaded: only third-party image URLs are kept; a complete image body read
through the copy stream is stored and served again without a request, also after a restart; partial, failed,
non-image and oversized bodies are not stored; the directory and the in-memory part stay under their limits,
least recently used out first; files expire when unused for two weeks or older than a month.
"""
import sys
from pathlib import Path
sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'shared'))
from host_java import run

if __name__ == '__main__':
    run('TwitchImageCacheProbe', ['twitch/TwitchImageCache.java', 'twitch/TwitchContext.java'],
        Path(__file__).with_name('TwitchImageCacheProbe.java').read_text(),
        sys.argv[1:] or ['passthrough', 'store-hit', 'incomplete', 'disk-bound', 'restart-order', 'expiry', 'memory-bound'])
