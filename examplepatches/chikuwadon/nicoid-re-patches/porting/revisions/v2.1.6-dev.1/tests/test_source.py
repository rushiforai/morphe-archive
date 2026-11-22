#!/usr/bin/env python3
"""Source-only regression gate for the next private Morphe patch candidate."""
from pathlib import Path
import ast

HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
stage = (HERE / "stage_candidate.py").read_text(encoding="utf-8")
ast.parse(stage)
assert "2.1.6-dev.1" in stage
assert "51a52358d568eb530075644e65ec7b3b2346c793bdf91a6ae3e93ba3fcfb700b" in stage
assert "DirectBackground235$State.smali" in stage
assert "LayoutRepair216;->sanitize" in stage
assert "LayoutRepair216;->compatible" in stage
assert "SettingsDisplay216;->install" in stage
assert "Media3Diagnostics276$NetworkRetry.smali" in stage

display = (HERE / "SettingsDisplay216.java").read_text(encoding="utf-8")
for key in ("videolist_tap", "intent_type", "quality_mode", "mobile_quality_mode",
            "default_playback_speed", "show_watch_progress", "startup_screen",
            "local_watch_history_limit", "comment_fps"):
    assert '"' + key + '"' in display, key
for label in ("バックグラウンド再生の表示", "Background playback display",
              "背景播放"):
    assert label in display, label
assert 'registerOnSharedPreferenceChangeListener(listener)' in display
assert 'previous.onPreferenceChange(changed, selection)' in display
assert 'saved.getAll().get(key)' in display
assert 'setEntryValues(' not in display and '.edit()' not in display

layout = (HERE / "LayoutRepair216.java").read_text(encoding="utf-8")
for type_name in ("FrameLayout.LayoutParams", "LinearLayout.LayoutParams",
                  "RelativeLayout.LayoutParams"):
    assert type_name in layout
assert 'child.setLayoutParams(corrected)' in layout

media = (HERE / "Media3Diagnostics276.java").read_text(encoding="utf-8")
for string in ("UnknownHostException", "SocketTimeoutException",
               "ConnectException", "NoRouteToHostException",
               "getCurrentMediaItem", "getPlaybackState", "getPlayWhenReady",
               "getPlaybackSuppressionReason", "Network recovery attempt"):
    assert string in media
assert '"stop").invoke(currentPlayer)' not in media
assert 'DELAYS_MS = {3000L, 7000L, 15000L, 30000L}' in media
version = (ROOT / "gradle.properties").read_text(encoding="utf-8")
assert "version = 2.1.6-dev.1" in version
print("PASS: source-only layout, settings, and bounded Media3 retry contracts")
