// Local-only viewer controls and real native tabs; restore all modified preferences.
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName()))) throw Error('Verification package required');
    Java.classFactory.loader = app.getClassLoader();
    const H = Java.use('app.morphe.extension.chmate.Haiagaru');
    const T = Java.use('app.morphe.extension.chmate.NativeToolTabs');
    const UI = Java.use('app.morphe.extension.chmate.HaiagaruUi');
    const Native = Java.use('app.morphe.extension.chmate.NativeThemeColors');
    const P = Java.use('app.morphe.extension.chmate.SettingsProfiles');
    const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    const keys = ['nativeToolTabs', 'nativeToolTabHeaderHeightDp', 'hissiViewerShowAdjust'];
    const saved = keys.map(k => ({k, has: prefs.contains(k), value: k.endsWith('Dp') ? prefs.getInt(k, 48) : prefs.getBoolean(k, true)}));
    let host, fragment, checks = 0, controller, web;
    function check(value, label) { if (!value) throw Error(label); checks++; console.log('PASS ' + label); }
    function restore() {
        const e = prefs.edit(); saved.forEach(s => { if (!s.has) e.remove(s.k); else if (s.k.endsWith('Dp')) e.putInt(s.k, s.value); else e.putBoolean(s.k, s.value); }); e.commit();
    }
    function run(fn) { Java.perform(() => Java.scheduleOnMainThread(() => { try { fn(); } catch (e) { restore(); console.log('FAIL ' + e.stack); } })); }
    run(() => {
        host = Java.retain(H.toolbarActivity(null));
        check(host && String(host.getClass().getName()) === 'jp.syoboi.a2chMate.activity.TabletHomeActivity', 'native tablet host');
        prefs.edit().remove('hissiViewerShowAdjust').remove('nativeToolTabHeaderHeightDp').commit();
        check(H.hissiViewerShowAdjust(), 'adjust default remains visible');
        check(T.headerHeightDp(host) === 48, 'header default 48dp');
        [-100, 32, 48, 64, 999].forEach(value => {
            prefs.edit().putInt('nativeToolTabHeaderHeightDp', value).commit();
            check(T.headerHeightDp(host) === Math.max(32, Math.min(64, value)), 'height clamp ' + value);
        });
        const palette = Native.colors(host), colors = UI.toolTabHeaderColors(host);
        check((colors[0] >>> 24) === 255, 'resolved header background is opaque');
        if ((palette[0] >>> 24) === 255) check(colors[0] === palette[0], 'opaque native window color retained');
        P.catalog(host);
        const payload = Java.use('org.json.JSONObject').$new('{"format":"haiagaru-settings","version":1,"settings":{"nativeToolTabHeaderHeightDp":36,"hissiViewerShowAdjust":false}}');
        check(P.validate(payload).size() === 2, 'both settings share/import validation');
        // Toolbar-only fixture: no navigation/render callbacks are exercised.
        controller = Java.retain(Java.use('app.morphe.extension.chmate.HissiMenuController').$new(host, Java.use('android.content.Intent').$new(), true, null, null));
        web = Java.retain(Java.use('android.webkit.WebView').$new(host));
        prefs.edit().putBoolean('hissiViewerShowAdjust', false).commit();
        controller.createViewerToolbar(web);
        check(controller.viewerAdjustButton.value.getVisibility() === 8, 'adjust hidden in actual viewer toolbar');
        prefs.edit().putBoolean('hissiViewerShowAdjust', true).commit();controller.resume();
        check(controller.viewerAdjustButton.value.getVisibility() === 0, 'adjust shown on viewer resume');
        prefs.edit().putBoolean('hissiViewerShowAdjust', false).commit();controller.resume();
        check(controller.viewerAdjustButton.value.getVisibility() === 8, 'adjust hidden again on resume');
        web.destroy();controller.close();
        prefs.edit().putBoolean('nativeToolTabs', true).putInt('nativeToolTabHeaderHeightDp', 36).commit();
        check(T.open(host, 'search'), 'real native search tab opened');
    });
    setTimeout(() => Java.perform(() => Java.choose('app.morphe.extension.chmate.NativeToolFragment', {
        onMatch(f) { const native = Java.cast(f, Java.use('androidx.fragment.app.Fragment')); if (native.isResumed()) fragment = Java.retain(f); },
        onComplete() { run(() => {
            check(!!fragment, 'real visible fragment found');
            const root = Java.cast(fragment.getView(), Java.use('android.view.ViewGroup'));
            const header = Java.cast(root.getChildAt(0), Java.use('android.view.ViewGroup'));
            const density = host.getResources().getDisplayMetrics().density.value;
            check(header.getLayoutParams().height.value === Math.round(36 * density), 'new tab uses selected header height');
            check(header.getChildAt(1).getBackground() === null, 'close remains transparent');
            check(root.getChildAt(1).getTop() >= header.getBottom(), 'no content overlap');
            [32, 48, 64].forEach(value => {
                prefs.edit().putInt('nativeToolTabHeaderHeightDp', value).commit();
                check(header.getLayoutParams().height.value === Math.round(value * density), 'open tab updates live ' + value);
            });
            check(Java.cast(header.getBackground(), Java.use('android.graphics.drawable.ColorDrawable')).getColor() === UI.toolTabHeaderColors(host)[0], 'actual bar background matches resolved theme');
            check(header.getChildAt(1).performClick(), 'actual close click');
            restore();console.log('TOOL_HEADER_SETTINGS_COMPLETE checks=' + checks + ' preferences restored');
        }); }
    })), 5000);
});
