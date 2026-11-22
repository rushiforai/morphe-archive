#!/usr/bin/env python3
"""Source and lifecycle contract gate for v2.1.6-dev.2 (no device APK)."""
from pathlib import Path
import ast

HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
stage = (HERE / "stage_candidate.py").read_text(encoding="utf-8")
ast.parse(stage)
assert 'VERSION = "2.1.6-dev.2"' in stage
assert "51a52358d568eb530075644e65ec7b3b2346c793bdf91a6ae3e93ba3fcfb700b" in stage
for hook in ("LayoutRepair216;->sanitize", "LayoutRepair216;->compatible",
             "SettingsDisplay216;->install", "PopupSwitch216;->left"):
    assert hook in stage, hook
assert "AppResume253.smali" in stage
assert "Media3Diagnostics276$NetworkRetry.smali" in stage

previous = HERE.parent / "v2.1.6-dev.1"
setting = (previous / "SettingsDisplay216.java").read_text(encoding="utf-8")
for key in ("videolist_tap", "intent_type", "quality_mode", "mobile_quality_mode",
            "default_playback_speed", "show_watch_progress", "startup_screen",
            "local_watch_history_limit", "comment_fps"):
    assert f'"{key}"' in setting, key
assert "Background playback display" in setting
assert ".edit()" not in setting

media = (previous / "Media3Diagnostics276.java").read_text(encoding="utf-8")
for signal in ("UnknownHostException", "getCurrentMediaItem",
               "getPlayWhenReady", "getPlaybackSuppressionReason", "NetworkRetry"):
    assert signal in media

popup = (HERE / "PopupSwitch216.java").read_text(encoding="utf-8")
for signal in ('"app_switch_playback"', '"popup"', "isInteractive()",
               "Settings.canDrawOverlays(service)", "returnVideo",
               '"detach"', '"close"', "manager.addView(root, params)"):
    assert signal in popup, signal
assert 'api.getMethod("setMediaItem")' not in popup
assert 'setMediaItem(' not in popup
assert 'seekTo(' not in popup
assert 'startService(' not in popup
assert "removeViewImmediate(root)" in popup
assert "version = 2.1.6-dev.2" in (ROOT / "gradle.properties").read_text(encoding="utf-8")
print("PASS: v2.1.6-dev.2 source integrity, popup handoff and settings preservation")
