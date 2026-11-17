"""Remove the obsolete legacy summary call after applying the dev.11 overlay."""
from overlay_270 import apply as apply_dev11

LEGACY_SUMMARY = (
    "    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenOptions265;"
    "->resumeSummary(Landroid/preference/PreferenceActivity;)V\n"
)


def apply(work, disassembled, hooks):
    apply_dev11(work, disassembled, hooks)
    dev = hooks / "Dev111.smali"
    source = dev.read_text(encoding="utf-8")
    signature = ".method private static updateSummaries(Landroid/preference/PreferenceActivity;)V"
    begin = source.index(signature)
    end = source.index(".end method", begin)
    method = source[begin:end]
    refresh = "Le/e/a/AppResume253;->refresh(Landroid/preference/PreferenceActivity;)V"
    if method.count(LEGACY_SUMMARY) != 1 or method.count(refresh) != 1:
        raise RuntimeError("Unexpected legacy and replacement settings calls in Dev111.updateSummaries")
    method = method.replace(LEGACY_SUMMARY, "", 1)
    dev.write_text(source[:begin] + method + source[end:], encoding="utf-8")
