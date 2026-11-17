"""Complete the dev.5 fullscreen hooks without replacing stable source classes.

Each hook is anchored to the compiled Java smali actually used at runtime:
ListActions.extra creates the two video menus, and Dev111.settings installs
the "return to app" ListPreference after SettingsTools has run.
"""
from pathlib import Path
import re


def method(source, signature, modify, label):
    start = source.find(signature)
    if start < 0 or source.count(signature) != 1:
        raise RuntimeError("Missing hook method: " + label)
    end = source.find(".end method", start)
    if end < 0:
        raise RuntimeError("Unterminated hook method: " + label)
    body = source[start:end]
    patched = modify(body)
    if patched == body:
        raise RuntimeError("Hook not applied: " + label)
    return source[:start] + patched + source[end:]


def stage(disassembled: Path, hooks: Path, name: str):
    file = hooks / name
    if not file.exists():
        file = disassembled / "e/e/a" / name
    if not file.is_file():
        raise RuntimeError("Missing compiled helper: " + name)
    return file.read_text(encoding="utf-8")


def attach_menu(body: str):
    anchor = "    sget-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;"
    if body.count(anchor) != 1:
        raise RuntimeError("The video menu storage instruction changed")
    call = ("    invoke-static {v11, v14, v3, v2}, "
            "Le/e/a/FullscreenOptions265;"
            "->attach(Landroid/view/Menu;Ljava/util/List;"
            "Landroid/app/Activity;Ljava/lang/Object;)V\n\n")
    return body.replace(anchor, call + anchor, 1)


def append_setting(body: str):
    end = body.rfind("    return-void")
    if end < 0:
        raise RuntimeError("Missing settings method return")
    return (body[:end] +
            "    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenOptions265;"
            "->settings(Landroid/preference/PreferenceActivity;)V\n\n" +
            body[end:])


def append_summary(body: str):
    end = body.rfind("    return-void")
    if end < 0:
        raise RuntimeError("Missing summary method return")
    return (body[:end] +
            "    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenOptions265;"
            "->resumeSummary(Landroid/preference/PreferenceActivity;)V\n\n" +
            body[end:])


def apply(work: Path, disassembled: Path, hooks: Path):
    menu = stage(disassembled, hooks, "ListActions.smali")
    menu = method(menu,
        ".method public static extra(Ljava/lang/Object;Ljava/lang/Object;)V",
        attach_menu, "real long-press and triangle menu producer")
    (hooks / "ListActions.smali").write_text(menu, encoding="utf-8")

    settings = stage(disassembled, hooks, "Dev111.smali")
    settings = method(settings,
        ".method public static settings(Landroid/preference/PreferenceActivity;)V",
        append_setting, "resume preference installed after native Dev111")
    settings = method(settings,
        ".method private static updateSummaries(Landroid/preference/PreferenceActivity;)V",
        append_summary, "resume fullscreen selection summary")
    (hooks / "Dev111.smali").write_text(settings, encoding="utf-8")

    # Comment time jumps greater than two video seconds or backward seeks
    # genuinely reset active comments. A short UI/frame stall should not.
    # Never alter speed/duration or a different constant without recognizing
    # the exact native reset guard.
    visuals = stage(disassembled, hooks, "CommentVisuals.smali")
    signature = (".method public static scrolling(Ljava/lang/Object;"
                 "Landroid/graphics/Canvas;Ljava/util/ArrayList;)"
                 "Ljava/util/ArrayList;")
    start = visuals.find(signature)
    end = visuals.find(".end method", start)
    if start < 0 or end <= start:
        raise RuntimeError("Missing comment scrolling method")
    section = visuals[start:end]
    guard = re.compile(
        r"(?m)^(\s*const/high16 v16, )0x42480000(\s+# 50\.0f)$"
    )
    changed, count = guard.subn(r"\g<1>0x43480000\g<2>", section)
    if count == 1:
        visuals = visuals[:start] + changed + visuals[end:]
        (hooks / "CommentVisuals.smali").write_text(visuals, encoding="utf-8")
    elif count == 0:
        print("INFO: comment clock guard is not the legacy 50cs form; preserving it")
    else:
        raise RuntimeError("Ambiguous native comment reset guards")
