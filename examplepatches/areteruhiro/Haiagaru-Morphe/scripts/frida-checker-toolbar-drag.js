// Local HTML only. Creates one test tab, restores preferences, then closes it.
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (String(app.getPackageName()) !== 'jp.co.airfront.android.a2chMate.haiagaru.resumefix242') throw Error('242 verification app required');
    const H = Java.use('app.morphe.extension.chmate.Haiagaru');
    const T = Java.use('app.morphe.extension.chmate.NativeToolTabs');
    const F = Java.use('androidx.fragment.app.Fragment');
    const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    const keys = ['nativeToolTabs', 'nativeToolTabHissi', 'dedicatedViewerEnabled', 'hissiViewerToolbarHeightDp', 'hissiCheckerMode'];
    const saved = keys.map(k => ({ k, had: prefs.contains(k), value: k.startsWith('hissi') ? prefs.getInt(k, 0) : prefs.getBoolean(k, false) }));
    const load = Java.use('android.webkit.WebView').loadUrl.overload('java.lang.String');
    const testUrl = 'http://hissi.org/read.php/android/20000101/dGVzdA.html';
    load.implementation = function (url) {
        if (String(url) === testUrl) {
            this.loadDataWithBaseURL(testUrl, '<html><meta charset="utf-8"><body><h2>操作バー表示確認</h2><p>ローカル表示。投稿検索・走査は実行していません。</p></body></html>', 'text/html', 'UTF-8', null);
            return;
        }
        return load.call(this, url);
    };
    let host, fragment, last;
    function main(fn) { Java.scheduleOnMainThread(() => { try { fn(); } catch (e) { console.log('FAIL ' + e.stack); } }); }
    main(() => {
        host = Java.retain(H.toolbarActivity(null));
        prefs.edit().putBoolean('nativeToolTabs', true).putBoolean('nativeToolTabHissi', true).putBoolean('dedicatedViewerEnabled', true)
            .putInt('hissiCheckerMode', 1).putInt('hissiViewerToolbarHeightDp', 32).commit();
        const intent = Java.use('android.content.Intent').$new().setData(Java.use('android.net.Uri').parse(testUrl));
        if (!T.open(host, 'hissi', intent)) throw Error('Hissi tab not opened');
    });
    setTimeout(() => Java.perform(() => Java.choose('app.morphe.extension.chmate.NativeToolFragment', {
        onMatch(f) {
            const native = Java.cast(f, F), args = native.getArguments();
            if (native.isResumed() && args && String(args.getString('_data')).startsWith('haiagaru-tool://hissi')) fragment = Java.retain(native);
        }, onComplete() { main(() => {
            if (!fragment) throw Error('Hissi native tab missing');
            const root = Java.cast(fragment.getView(), Java.use('android.view.ViewGroup'));
            if (root.getChildAt(0).getVisibility() !== 8) throw Error('Duplicate header remains');
            console.log('READY: duplicate header hidden; real Compose toolbar available for drag');
        }); }
    })), 3500);
    const timer = setInterval(() => Java.perform(() => {
        const value = prefs.getInt('hissiViewerToolbarHeightDp', -1);
        if (value !== last) { last = value; console.log('SAVED_TOOLBAR_HEIGHT=' + value); }
    }), 1000);
    setTimeout(() => Java.perform(() => main(() => {
        try { if (host && fragment) T.closeCurrentTab(host, fragment); }
        finally {
            clearInterval(timer); const editor = prefs.edit();
            saved.forEach(s => { if (!s.had) editor.remove(s.k); else if (s.k.startsWith('hissi')) editor.putInt(s.k, s.value); else editor.putBoolean(s.k, s.value); });
            editor.commit(); load.implementation = null; console.log('TEST_TAB_CLOSED_PREFERENCES_RESTORED');
        }
    })), 50000);
});
