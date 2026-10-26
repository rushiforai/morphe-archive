// Detached Android View fixtures; restores the advertisement preference afterwards.
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (String(app.getPackageName()) !== 'jp.co.airfront.android.a2chMate.haiagaru.resumefix242') throw Error('Verification package required');
    Java.classFactory.loader = app.getClassLoader();
    const H = Java.use('app.morphe.extension.chmate.Haiagaru');
    const F = Java.use('android.widget.FrameLayout');
    const LP = Java.use('android.widget.FrameLayout$LayoutParams');
    const G = Java.use('app.morphe.extension.chmate.Haiagaru$AdVisibilityWatch');
    const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    const had = prefs.contains('hideAd'), old = prefs.getBoolean('hideAd', true);
    let count = 0;
    function check(value, label) { if (!value) throw Error(label); console.log('PASS ' + label); count++; }
    Java.scheduleOnMainThread(function () {
        try {
            prefs.edit().putBoolean('hideAd', true).commit();
            const root = F.$new(app), wrapper = F.$new(app), ad = F.$new(app);
            root.setId(0x01020002); root.setLayoutParams(LP.$new(300, 600));
            wrapper.setLayoutParams(LP.$new(300, 120)); ad.setLayoutParams(LP.$new(300, 120));
            root.addView(wrapper); wrapper.addView(ad);
            root.layout(0, 0, 300, 600); wrapper.layout(0, 0, 300, 120); ad.layout(0, 0, 300, 120);
            H.hideAdView(ad);
            const guard = Java.cast(ad.getTag(0x48690b28), G);
            check(ad.getVisibility() === 8 && wrapper.getVisibility() === 8, 'identified ad and empty wrapper collapsed');
            ad.setVisibility(0); ad.setLayoutParams(LP.$new(300, 120)); wrapper.setVisibility(0); wrapper.setLayoutParams(LP.$new(300, 120));
            check(!guard.onPreDraw(), 'restored ad cancels stale frame');
            check(ad.getVisibility() === 8 && ad.getLayoutParams().height.value === 0, 'restored ad hidden before draw');
            check(wrapper.getVisibility() === 8 && wrapper.getLayoutParams().height.value === 0, 'restored black wrapper removed');
            check(guard.onPreDraw(), 'stable hidden slot permits next frame');
            wrapper.setVisibility(0); wrapper.setLayoutParams(LP.$new(300, 120));
            check(!guard.onPreDraw() && wrapper.getVisibility() === 8, 'wrapper-only restoration caught');
            check(root.getVisibility() === 0 && root.getLayoutParams().height.value === 600, 'screen host survives parent walk');
            H.hideAdView(root);
            check(root.getTag(0x48690b28) === null && root.getVisibility() === 0, 'screen host never gets a blocking watcher');
            prefs.edit().putBoolean('hideAd', false).commit(); ad.setVisibility(0);
            check(guard.onPreDraw() && ad.getVisibility() === 0, 'disabled ad removal leaves view alone');
            console.log('AD_RESUME_GUARD_COMPLETE ' + count);
        } catch (error) { console.log('FAIL ' + error.stack); }
        finally { const e = prefs.edit(); if (had) e.putBoolean('hideAd', old); else e.remove('hideAd'); e.commit(); }
    });
});
