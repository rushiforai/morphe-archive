"""Install playback-options reconciliation on both native settings pathways.

The asynchronous SettingsTools search snapshot and the synchronous Dev111
general-settings installer may run in either order; both must be covered.
"""
from pathlib import Path

SETTINGS_HOOK=(
    "    invoke-static {p0}, Le/e/a/FullscreenSettings270;"
    "->reconcile(Landroid/preference/PreferenceActivity;)V"
)
GENERAL_HOOK=(
    "    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenSettings270;"
    "->reconcile(Landroid/preference/PreferenceActivity;)V"
)

def replace_once(source,anchor,after,label):
    if source.count(anchor)!=1:
        raise RuntimeError(f"Settings order hook drift: {label} found {source.count(anchor)}")
    return source.replace(anchor,anchor+"\n\n"+after,1)

def apply(work,disassembled,hooks):
    file=hooks/"SettingsTools.smali"
    source=file.read_text(encoding="utf-8")
    category=(
        "    invoke-static {p0}, Le/e/a/SettingsCategories241;"
        "->apply(Landroid/preference/PreferenceActivity;)V"
    )
    file.write_text(replace_once(source,category,SETTINGS_HOOK,
                                 "after category install, before search snapshot"),
                    encoding="utf-8")
    dev=hooks/"Dev111.smali"
    source=dev.read_text(encoding="utf-8")
    installed=(
        "    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenOptions265;"
        "->settings(Landroid/preference/PreferenceActivity;)V"
    )
    dev.write_text(replace_once(source,installed,GENERAL_HOOK,
                                "after native general/resume settings"),
                   encoding="utf-8")
