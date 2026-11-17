"""Stage new fullscreen controls over the validated v2.0.5 comment/panel build.

Strict structural anchors prevent accidentally replacing an unrelated setting or
native playback path. Run after the stable helper overrides are assembled and
before hooks.dex is compiled.
"""
from pathlib import Path
import re


def replace_once(text, before, after, name):
    if text.count(before) != 1:
        raise RuntimeError(f"Fullscreen 262 hook drift: {name}: {text.count(before)}")
    return text.replace(before, after, 1)


def apply(work: Path, disassembled: Path, hooks: Path):
    settings = hooks / "SettingsTools.smali"
    src = settings.read_text()
    category = ("    invoke-static {p0}, Le/e/a/SettingsCategories241;"
                "->apply(Landroid/preference/PreferenceActivity;)V")
    addition = ("    invoke-static {p0}, Le/e/a/FullscreenOptions262;"
                "->settings(Landroid/preference/PreferenceActivity;)V\n\n")
    settings.write_text(replace_once(src, category, addition + category,
                                     "preserve settings groups and keys"))

    menu = hooks / "MenuOptions119.smali"
    src = menu.read_text()
    anchor = ("    invoke-static {p1, p2}, Le/e/a/MenuEditor120;"
              "->sort(Ljava/util/List;Landroid/content/Context;)V")
    action = ("    invoke-static {p0, p1, p2, p3}, "
              "Le/e/a/FullscreenOptions262;"
              "->add(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;"
              "Ljava/lang/Object;)V\n\n")
    menu.write_text(replace_once(src, anchor, action + anchor,
                                 "video menu action before sort"))

    # The editor's label map contains id 5 (play), id 6 (information), id 9
    # (popup). Inserting the new id after 6 keeps the desired default order;
    # a saved order is only extended, never overwritten.
    editor = disassembled / "e/e/a/MenuEditor120.smali"
    src = editor.read_text()
    anchor = ("    :goto_2e\n    sget-object p0, Le/e/a/MenuOptions119;"
              "->LABELS:Ljava/util/LinkedHashMap;")
    after = ("    :goto_2e\n"
             "    invoke-static {v0}, Le/e/a/FullscreenOptions262;"
             "->prepareEditorOrder(Ljava/util/ArrayList;)V\n\n"
             "    sget-object p0, Le/e/a/MenuOptions119;"
             "->LABELS:Ljava/util/LinkedHashMap;")
    (hooks / editor.name).write_text(
        replace_once(src, anchor, after, "editor saved order"))

    # Retained background -> normal VideoActivity: arm before Decoder transfer.
    # Existing Dev111 continues using native 'normal' (never an unknown enum).
    resume = disassembled / "e/e/a/Dev115.smali"
    src = resume.read_text()
    signature = ".method public static seamlessReturn(Ljava/lang/Object;)Z"
    start = src.find(signature)
    if start == -1:
        raise RuntimeError("Fullscreen 262 resume handoff signature unavailable")
    end = src.find(".end method", start)
    method = src[start:end]
    lines = list(re.finditer(r"(?m)^    \.line \d+$", method))
    if not lines:
        raise RuntimeError("Fullscreen 262 resume source location unavailable")
    loc = lines[0].end()
    insertion = ("\n\n    invoke-static {p0}, "
                 "Le/e/a/FullscreenOptions262;->armResume(Ljava/lang/Object;)V")
    patched = method[:loc] + insertion + method[loc:]
    (hooks / resume.name).write_text(src[:start] + patched + src[end:])

    # A missed frame interval of barely 0.5s previously cleared every active
    # scrolling comment. Retain comments across short frame stalls; genuine
    # backward seeks and forward jumps >2s still trigger the original reset.
    visuals = hooks / "CommentVisuals.smali"
    src = visuals.read_text()
    old = "    const/high16 v16, 0x42480000    # 50.0f"
    new = "    const/high16 v16, 0x43480000    # 200.0f"
    if src.count(old)==1:
        visuals.write_text(src.replace(old,new,1))
    else:
        # Different native revisions can implement this reset without the
        # literal 50-centisecond constant. Never rewrite an unverified branch.
        guards=re.findall(r"(?m)^\\s+const/high16 v1[56], 0x[0-9a-f]+.*$",src)
        print("INFO: native comment clock guard differs; preserving existing "
              "reset logic: "+repr(guards[:12]))

