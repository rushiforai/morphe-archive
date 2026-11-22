'use strict';

Java.perform(() => {
    const prefix = 'app.morphe.extension.chmate.';
    const thread = Java.use('android.app.ActivityThread').currentActivityThread();
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!/\.haiagaru\.reporter(191|226|242)$/.test(String(app.getPackageName())))
        throw new Error('Isolated reporter package required');

    const Controller = Java.use(prefix + 'HissiMenuController');
    const CheckerBarOptions = Java.use(prefix + 'CheckerBarOptions');
    const Filters = Java.use(prefix + 'ExtraQuickFilters');
    const Bar = Java.use(prefix + 'ExtraQuickFilters$Bar');
    const View = Java.use('android.view.View');
    const WebView = Java.use('android.webkit.WebView');
    const LayoutParams = Java.use('android.widget.FrameLayout$LayoutParams');
    const ViewGroup = Java.use('android.view.ViewGroup');
    const Intent = Java.use('android.content.Intent');
    const ColorDrawable = Java.use('android.graphics.drawable.ColorDrawable');
    const prefs = Java.use(prefix + 'SettingsProfiles').prefs(app);
    const paletteKey = 'kyodemoToolbarPalette';
    const enhancedKey = 'kyodemoEnhancedViewer';
    const savedPalette = prefs.contains(paletteKey) ? prefs.getInt(paletteKey, 0) : null;
    const savedEnhanced = prefs.contains(enhancedKey) ? prefs.getBoolean(enhancedKey, false) : null;

    function field(owner, name) {
        const value = owner.class.getDeclaredField(name);
        value.setAccessible(true);
        return value;
    }
    let checks = 0;
    const check = (condition, message) => {
        if (!condition) throw new Error(message);
        checks++;
    };

    let web, controller, tabs;
    function finish(error) {
        try {
            if (web) {
                const parent = web.getParent();
                if (parent) Java.cast(parent, ViewGroup).removeView(web);
                web.destroy();
            }
            const editor = prefs.edit();
            if (savedPalette === null) editor.remove(paletteKey); else editor.putInt(paletteKey, savedPalette);
            if (savedEnhanced === null) editor.remove(enhancedKey); else editor.putBoolean(enhancedKey, savedEnhanced);
            editor.commit();
        } finally {
            send(error ? {result:'FAIL', error:error.stack, checks} : {result:'PASS', checks});
        }
    }

    Java.scheduleOnMainThread(() => {
        try {
            const records = thread.mActivities.value.values().toArray();
            const recordClass = Java.use('android.app.ActivityThread$ActivityClientRecord');
            const activity = records.map(r => Java.cast(r, recordClass).activity.value)
                .find(a => a && !a.isFinishing());
            check(activity !== undefined, 'running reporter Activity');
            prefs.edit().putBoolean(enhancedKey, false).putInt(paletteKey, 0).commit();
            const edge = 'https://www.kyodemo.net/sdemo/b/e_e_liveedge/?bs=hi&k=fixture';
            check(Controller.isEdgeKyodemoResults(edge), 'Edge result route');
            check(!Controller.isEdgeKyodemoResults('https://www.kyodemo.net/sdemo/b/e_e_liveedge/'), 'board index excluded');
            check(!Controller.isEdgeKyodemoResults('https://www.kyodemo.net/sdemo/r/e_e_liveedge/1234567890/'), 'thread result route excluded');
            check(!Controller.isEdgeKyodemoResults('https://other.invalid/sdemo/b/e_e_liveedge/'), 'foreign site excluded');
            controller = Java.retain(Controller.$new(activity, Intent.$new(), false, null, null));
            web = Java.retain(WebView.$new(activity));
            activity.addContentView(web, LayoutParams.$new(1, 1));
            web.getSettings().setJavaScriptEnabled(true);
            const toolbar = controller.createViewerToolbar(web);
            field(Controller, 'viewerToolbar').set(controller, toolbar);
            controller.applyToolbarPalette(true, 3);
            const button = Java.cast(field(Controller, 'paletteButton').get(controller), Java.use('android.widget.Button'));
            check(button.getVisibility() === 0, 'palette action visible on Kyodemo');
            check(Java.cast(toolbar.getBackground(), ColorDrawable).getColor() === -1, 'follow light content theme');
            button.performClick();
            check(CheckerBarOptions.palette(activity) === 1 &&
                Java.cast(toolbar.getBackground(), ColorDrawable).getColor() !== -1, 'set independent dark toolbar');
            controller.applyToolbarPalette(false, 3);
            check(button.getVisibility() === 8, 'palette action hidden on Hissi');

            const bar = Bar.$new(View.$new(activity));
            bar.scheduleUpdate();
            const handler = Java.cast(field(Filters, 'MAIN').get(null), Java.use('android.os.Handler'));
            const pending = Java.cast(field(Bar,'updateWhenAttached').get(bar), Java.use('java.lang.Runnable'));
            check(!handler.hasCallbacks(pending), 'detached bar does not accumulate callbacks');
            const queue = Java.cast(field(Filters,'NATIVE_ROWS_QUEUED').get(null), Java.use('java.util.concurrent.atomic.AtomicBoolean'));
            for (let i = 0; i < 100; i++) Filters.nativeRowsReady();
            check(queue.get(), 'burst schedules one pending native update');

            tabs = Java.retain(controller.createHissiTabs(web));
            tabs.setVisibility(8);
            field(Controller, 'hissiTabs').set(controller, tabs);
            const post = n => '<div class="post"><div class="r-head"><strong>' + n +
                '</strong>: 名無し 2026/11/21</div><div class="clmess">fixture ' + n + '</div></div>';
            const page = '<html><body><div id="blist"><div class="box content"><h2>A</h2>' +
                post(1) + post(11) + '</div></div></body></html>';
            const JString = Java.use('java.lang.String');
            const Bytes = Java.use('java.io.ByteArrayInputStream');
            const Response = Java.use('android.webkit.WebResourceResponse');
            const Client = Java.registerClass({
                name: 'app.haiagaru.fixture.KyodemoClient' + Date.now(),
                superClass: Java.use('android.webkit.WebViewClient'),
                methods: {
                    shouldInterceptRequest: [{
                        returnType: 'android.webkit.WebResourceResponse',
                        argumentTypes: ['android.webkit.WebView', 'android.webkit.WebResourceRequest'],
                        implementation: function (view, request) {
                            const data = String(request.getUrl()) === edge ? page : '';
                            return Response.$new('text/html', 'UTF-8', Bytes.$new(JString.$new(data).getBytes('UTF-8')));
                        }
                    }]
                }
            });
            web.setWebViewClient(Client.$new());
            web.loadUrl(edge);
            setTimeout(() => Java.perform(() => Java.scheduleOnMainThread(() => {
                try {
                    check(!queue.get(), 'queued filter update drains');
                    check(Controller.isEdgeKyodemoResults(web.getUrl()), 'synthetic WebView has a valid Edge result URL: ' + web.getUrl());
                    controller.configureHissiTabs.overload('android.webkit.WebView').call(controller, web);
                    setTimeout(() => Java.perform(() => Java.scheduleOnMainThread(() => {
                        try {
                            check(tabs.getVisibility() === 0, 'Edge tabs available with enhanced viewer off. Current URL: ' + web.getUrl());
                            check(tabs.getChildAt(1).getVisibility() === 8 && tabs.getChildAt(2).getVisibility() === 8 &&
                                tabs.getChildAt(3).getVisibility() === 0, 'standard viewer exposes only responses and created threads');
                            tabs.getChildAt(3).performClick();
                            check(tabs.getChildAt(3).isSelected(), 'created-threads tab can be selected');
                            finish();
                        } catch (e) { finish(e); }
                    })), 1000);
                } catch (e) { finish(e); }
            })), 1000);
        } catch (e) { finish(e); }
    });
});
