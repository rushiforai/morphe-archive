#!/usr/bin/env python3
"""Source and lifecycle contract gate for v2.1.6-dev.3 (no device APK)."""
from pathlib import Path
import ast

HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
PREV = HERE.parent / "v2.1.6-dev.1"
stage = (HERE / "stage_candidate.py").read_text(encoding="utf-8")
ast.parse(stage)
assert 'VERSION = "2.1.6-dev.3"' in stage
assert "51a52358d568eb530075644e65ec7b3b2346c793bdf91a6ae3e93ba3fcfb700b" in stage
for hook in ("LayoutRepair216;->watch", "LayoutRepair216;->compatible",
             "SettingsDisplay216;->install", "PopupSwitch216;->left",
             "ScreenOffAudio216;->arm", "ScreenOffAudio216;->enabled"):
    assert hook in stage, hook
for owner in ("AppResume253.smali", "Dev119.smali", "RetainedPlayback137.smali",
              "Media3Diagnostics276$NetworkRetry.smali"):
    assert owner in stage, owner

settings = (HERE / "SettingsDisplay216.java").read_text(encoding="utf-8")
for key in ("videolist_tap", "intent_type", "quality_mode", "mobile_quality_mode",
            "default_playback_speed", "show_watch_progress", "startup_screen",
            "local_watch_history_limit", "comment_fps",
            "main_rotation", "player_rotation", "video_menu_options"):
    assert f'"{key}"' in settings, key
for required in ("nicoid_fullscreen_tap262", "nicoid_fullscreen_link262",
                 "nicoid_fullscreen262", "OnPreDrawListener",
                 "長押し・三角メニューの表示項目と順番を変更します"):
    assert required in settings, required
assert ".edit()" not in settings
assert "list.setValue(" not in settings
assert "setOnPreferenceChangeListener(" not in settings

layout = (HERE / "LayoutRepair216.java").read_text(encoding="utf-8")
for required in ("FrameLayout.LayoutParams", "LinearLayout.LayoutParams",
                 "RelativeLayout.LayoutParams", "Choreographer.FrameCallback",
                 "postFrameCallback", "isLayoutRequested()"):
    assert required in layout
assert "child.setLayoutParams(next)" in layout

media = (PREV / "Media3Diagnostics276.java").read_text(encoding="utf-8")
for required in ("UnknownHostException", "getCurrentMediaItem",
                 "getPlayWhenReady", "getPlaybackSuppressionReason", "NetworkRetry"):
    assert required in media

popup = (HERE.parent / "v2.1.6-dev.2" / "PopupSwitch216.java").read_text(encoding="utf-8")
assert "isInteractive()" in popup and "returnVideo" in popup

screen = (HERE / "ScreenOffAudio216.java").read_text(encoding="utf-8")
for required in ("nicoid_keep_audio_screen_off", "PowerManager",
                 "RetainedPlayback137", "capture", "isInteractive()"):
    assert required in screen
assert "startForegroundService" not in screen
assert "startService(" not in screen
assert "setMediaItem(" not in screen

assert "version = 2.1.6-dev.3" in (ROOT / "gradle.properties").read_text(encoding="utf-8")
print("PASS: v2.1.6-dev.3 fullscreen selection, UI descriptions, mini layout and screen-off policy")
