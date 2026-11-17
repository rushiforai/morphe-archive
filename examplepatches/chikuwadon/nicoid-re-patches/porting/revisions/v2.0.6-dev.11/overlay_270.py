"""Install playback-options reconciliation on both native settings pathways.

The asynchronous SettingsTools search snapshot and the synchronous Dev111
general-settings installer may run in either order; both must be covered.
"""
import re

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
    source = replace_once(source, installed, GENERAL_HOOK,
                          "after native general/resume settings")
    # Replace only Dev111's resume summary/enable block, leaving the other
    # settings handled by the original updater.
    method = ".method private static updateSummaries(Landroid/preference/PreferenceActivity;)V"
    begin = source.index(method)
    end = source.index(".end method", begin)
    update = source[begin:end]
    update, count = re.subn(
        r'    const-string v1, "nicoid_app_resume_playback"\n.*?'
        r'(?=    const-string v1, "startup_screen")',
        "    invoke-static {p0}, Le/e/a/AppResume253;"
        "->refresh(Landroid/preference/PreferenceActivity;)V\n\n",
        update, flags=re.DOTALL,
    )
    if count != 1:
        raise RuntimeError("Legacy resume summary block moved")
    dev.write_text(source[:begin] + update + source[end:], encoding="utf-8")

    # The legacy global arm affected manual returns as well. Give only the
    # Intent created for the chosen retained Service the fullscreen flags.
    legacy = hooks / "Dev115.smali"
    source = legacy.read_text(encoding="utf-8")
    arm = ("    invoke-static {p0}, Le/e/a/FullscreenOptions262;"
           "->armResume(Ljava/lang/Object;)V\n")
    if source.count(arm) != 1:
        raise RuntimeError("Legacy fullscreen arm moved")
    legacy.write_text(source.replace(arm, "", 1), encoding="utf-8")
    popup = hooks / "PopupReturn244.smali"
    source = popup.read_text(encoding="utf-8")
    prepare = ("    invoke-static {v5}, Le/e/a/PopupFullscreen204;"
               "->prepare(Landroid/content/Intent;)V")
    app_return = ("    invoke-static {p0, v5}, Le/e/a/AppResume253;"
                  "->prepareReturn(Landroid/app/Service;Landroid/content/Intent;)V")
    popup.write_text(replace_once(source, prepare, app_return, "retained popup Intent"),
                     encoding="utf-8")
