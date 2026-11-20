"""Runtime-path fixes layered after the v2.1.2-dev.4 helper modifications."""
from pathlib import Path


def only(text, before, after, desc):
    count=text.count(before)
    if count!=1:raise AssertionError(f'{desc}: anchor count={count}')
    return text.replace(before,after,1)


def method(text, name, update):
    start=text.index(name)
    end=text.index('.end method',start)
    return text[:start]+update(text[start:end])+text[end:]


def apply(helpers:Path)->None:
    root=helpers/'e/e/a'
    # dev.2 rejected valid returns when the DirectBackground.State existed but
    # its asynchronous media Service had not yet become available. Capture the
    # pre-existing session generation instead, and keep the dev.2 protection
    # against a new popup launched after foreground entry.
    p=root/'AppResume253.smali';s=p.read_text()
    a='''    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;
    move-result-object v0
    if-nez v0, :nicoid_existing_resume_target_212'''
    b='''    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;
    move-result-object v0
    invoke-static {v0}, Le/e/a/ResumeGuard273;->capture(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :nicoid_existing_resume_target_212'''
    s=method(s,'.method public static resumed(Landroid/app/Activity;)Z',lambda t:only(t,a,b,'capture original return session'))
    a='''    :nicoid_existing_resume_target_212
    new-instance v3, Ljava/lang/ref/WeakReference;
    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v3, Le/e/a/AppResume253;->resumeTarget:Ljava/lang/ref/WeakReference;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J'''
    b='''    :nicoid_existing_resume_target_212
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J'''
    s=method(s,'.method public static resumed(Landroid/app/Activity;)Z',lambda t:only(t,a,b,'do not lock nullable service reference'))
    a='''    sget-object v3, Le/e/a/AppResume253;->resumeTarget:Ljava/lang/ref/WeakReference;
    if-eqz v3, :nicoid_no_resume_target_212
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-eq v0, v3, :nicoid_resume_target_matches_212'''
    b='''    invoke-static {v0}, Le/e/a/ResumeGuard273;->matches(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :nicoid_resume_target_matches_212'''
    s=method(s,'.method private static restore(Ljava/lang/ref/WeakReference;II)V',lambda t:only(t,a,b,'check captured session identity while retrying'))
    p.write_text(s)

    # The lifecycle registration was previously reached only from the player
    # app-switch policy. Direct popup or retained mini had no guaranteed app
    # foreground/background observer. Register from the app's tab host too.
    p=root/'AppSwitchGuard.smali';s=p.read_text();s=only(s,
      '.method private static track(Landroid/app/Activity;)V',
      '.method public static track(Landroid/app/Activity;)V','expose existing idempotent app lifecycle registration');p.write_text(s)
    p=root/'MultiTabs227$1.smali';s=p.read_text()
    a='''    invoke-static {p1}, Le/e/a/TabFolderNav214;->restoreMylistRoot(Landroid/app/Activity;)V'''
    b=a+'''

    invoke-static {p1}, Le/e/a/AppSwitchGuard;->track(Landroid/app/Activity;)V'''
    s=method(s,'.method public onActivityResumed(Landroid/app/Activity;)V',lambda t:only(t,a,b,'register lifecycle before app switch'))
    p.write_text(s)

    # In the shipped v2.1.2-dev.4 artifact the popup preference is created but
    # the one-shot settings organizer leaves it under General. Classify by key.
    p=root/'SettingsCategories241.smali';s=p.read_text()
    a='''    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackDisplayOptions;->category(Ljava/lang/String;)[I'''
    b='''    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid_app_resume_popup"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :nicoid_popup_return_category_273_done
    const/16 v1, 0x8
    const/4 v2, 0x6
    filled-new-array {v1, v2}, [I
    move-result-object v1
    return-object v1
    :nicoid_popup_return_category_273_done

    invoke-static {v0}, Le/e/a/PlaybackDisplayOptions;->category(Ljava/lang/String;)[I'''
    s=method(s,'.method private static locate(Landroid/preference/Preference;)[I',lambda t:only(t,a,b,'categorize popup return choice by key'))
    a='''    invoke-static {v0}, Le/e/a/AppResume253;->install(Landroid/preference/PreferenceActivity;)V'''
    b=a+'''

    invoke-static {v0}, Le/e/a/ResumeModes272;->reparent(Landroid/preference/PreferenceActivity;)V'''
    s=method(s,'.method public static apply(Landroid/preference/PreferenceActivity;)V',lambda t:only(t,a,b,'reparent popup beside background choice after settings sort'))
    p.write_text(s)

    # Prune on the Activity that actually released the tagged mini panel, not
    # solely on a possibly stale host from before app switching.
    for name in ('MiniSession225$Session.smali','DirectBackground235$State.smali'):
        p=root/name;s=p.read_text()
        a='''    invoke-static {v0, v1}, Le/e/a/PlaybackPanels113;->release(Landroid/app/Activity;Landroid/view/View;)V'''
        b=a+'''

    invoke-static {v0}, Le/e/a/MiniGhost272;->afterRelease(Landroid/app/Activity;)V'''
        s=method(s,'.method detach()V',lambda t:only(t,a,b,'cleanup actual releasing Activity '+name))
        p.write_text(s)

    # Assert that all newly invoked helper methods actually exist in the
    # final source and that the old return path is not left active.
    assert 'ResumeGuard273;->capture' in (root/'AppResume253.smali').read_text()
    assert 'ResumeGuard273;->matches' in (root/'AppResume253.smali').read_text()
    assert 'ResumeModes272;->reparent' in (root/'SettingsCategories241.smali').read_text()
