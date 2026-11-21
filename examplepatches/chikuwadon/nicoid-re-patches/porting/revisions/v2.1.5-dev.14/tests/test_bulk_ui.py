#!/usr/bin/env python3
"""Selection-only source contracts for v2.1.5-dev.14.

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
        and "if(!hasMoveAction(f))" in source
        and "if(hasMoveAction(owner))" in source,
        "Mylist/Watch Later must use the native Move predicate without excluding account history")
require("footer.addView(register,Math.min(1,footer.getChildCount())" in source,
        "History Add must be between Delete and the flexible spacer")
require("new android.widget.TextView(a)" in source,
        "History Add must match existing text-style Move, not be a filled Button")
require("register.setText(tr(a,\"登録\"" in source,
        "History Add label must remain 登録")
require("cacheSortRoot(a)" in source and '"R","y"' in source,
        "Cache tab must prefer its visible sort bar")
require("return root.isShown()?(Spinner)root:null;" in source,
        "Hidden spinners must not capture the quick-selection button")
require("playlistDeleteMessage" in source and "onSelectionChanged" in source,
        "Existing deletion copy and selection lifecycle hooks missing")
require("add_bulk_ui_hooks(smali)" in stage,
        "Actual patched MPP must include selection hooks")
require('"v2.1.5-dev.11"' in stage and "compile_fps_summary" in stage,
        "Preserve dev.11 direct text renderer and FPS setting")
print("PASS: icon sizing, Mylist exclusion, history button styling, cache sort targeting and staging")
