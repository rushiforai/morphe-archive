#!/usr/bin/env python3
"""Selection-only source contracts for v2.1.5-dev.17.

These assertions protect the user-tested UI requirements while the independent
Android/Morphe runtime verification is performed separately.
"""
from pathlib import Path

here = Path(__file__).resolve().parents[1]
source = (here / "BulkVideoActions215.java").read_text(encoding="utf-8")
stage = (here / "stage_candidate.py").read_text(encoding="utf-8")


def require(test, message):
    if not test:
        raise AssertionError(message)


require(source.count("new SelectionIcon(") == 2,
        "Both normal and selected-state icons must be updated")
require(source.count("dp(a,30)") == 2,
        "Checklist icon must be 30dp in both states")
require("dp(a,48),dp(a,48)" in source,
        "Accessible 48dp quick-selection touch target changed")
require("hasMoveAction(Object f)" in source
        and "return kind(f)==5 && type(f)!=4;" in source
        and "if(!history(owner))" in source,
        "Mylist/Watch Later must not gain a duplicate Register button")
require("params.leftMargin=dp(a,20);" in source
        and "footer.addView(register,Math.min(1,footer.getChildCount()),params)" in source,
        "History Add must align with the existing Move spacing")
require("new android.widget.TextView(a)" in source,
        "History Add must match existing text-style Move, not be a filled Button")
require("register.setText(tr(a,\"登録\"" in source,
        "History Add label must remain 登録")
require("drawCacheTabBadge(Canvas canvas,Paint paint,Rect bounds)" in source,
        "Cache tab must have a glyph aligned with existing tab icons")
require("return root.isShown()?(Spinner)root:null;" in source,
        "Hidden spinners must not capture the quick-selection button")
require("playlistDeleteMessage" in source and "onSelectionChanged" in source,
        "Existing deletion copy and selection lifecycle hooks missing")
require("patch_cache_tab_badge(smali)" in stage
        and '"MultiTabs227.smali"' in stage
        and '"MultiTabs227$TabBadge.smali"' in stage,
        "Cache badge must be added to the bottom tab strip")
require("if(discovery(kind(owner),type(owner)))" in source
        and "primary.setText(tr(a,\"登録\"" in source,
        "Discovery lists must use their original Add-only footer without Delete")
require("history(Object f)" in source and "if(!history(owner))" in source,
        "Only device/account watch histories get both Delete and Add")
require("add_bulk_ui_hooks(smali)" in stage,
        "Actual patched MPP must include selection hooks")
require('"v2.1.5-dev.11"' in stage and "compile_fps_summary" in stage,
        "Preserve dev.11 direct text renderer and FPS setting")
print("PASS: icon sizing, Mylist exclusion, history button styling, cache sort targeting and staging")
