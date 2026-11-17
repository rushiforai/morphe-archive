"""Keep the menu's native action IDs and wrap playback before final ordering."""
from overlay_272 import apply as apply_dev12


def replace_once(source, old, new):
    if source.count(old) != 1:
        raise RuntimeError(f"Unexpected count for overlay anchor: {old!r}")
    return source.replace(old, new, 1)


def apply(work, disassembled, hooks):
    apply_dev12(work, disassembled, hooks)
    menu = hooks / "ListActions.smali"
    source = menu.read_text(encoding="utf-8")
    start = source.index(".method public static extra(")
    end = source.index(".end method", start)
    method = source[start:end]
    method = replace_once(method, "Le/e/a/FullscreenOptions265;->attach(",
                          "Le/e/a/FullscreenOptions262;->add(")
    method = replace_once(method,
        "    :cond_b7\n    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I\n\n"
        "    move-result v6\n",
        "    :cond_b7\n    invoke-static {v5}, Le/e/a/VideoMenu274;->nativeId(Landroid/view/MenuItem;)I\n\n"
        "    move-result v6\n")
    menu.write_text(source[:start] + method + source[end:], encoding="utf-8")
