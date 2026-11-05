#!/usr/bin/env python3
"""7TV badges: event parsing into the badge pipeline, and the WebSocket client against a local server (no APK)."""
import sys
from pathlib import Path
sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'shared'))
sys.path.insert(0, str(Path(__file__).resolve().parent))
from host_java import run, PACKAGE
from json_double import JSON_DOUBLE
from test_providers import PLATFORM

if __name__ == '__main__':
    run('TwitchSevenTvBadgesProbe', ['twitch/TwitchEmotes.java', 'twitch/TwitchThirdParty.java',
        'twitch/TwitchBadges.java', 'twitch/TwitchPronouns.java', 'twitch/TwitchSevenTvBadges.java'],
        Path(__file__).with_name('TwitchSevenTvBadgesProbe.java').read_text(),
        sys.argv[1:] or ['events', 'socket', 'off'], extra=PLATFORM | JSON_DOUBLE)
