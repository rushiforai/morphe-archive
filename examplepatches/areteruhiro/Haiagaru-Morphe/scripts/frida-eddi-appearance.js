// Isolated model regression; no network, thread writes or data clearing.
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!String(app.getPackageName()).endsWith('.resumefix242')) throw Error('242 verification only');
    const Ui = Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi');
    const prefs = app.getSharedPreferences('haiagaru_eddi_search', 0);
    const keys = ['controlTextScale', 'resultTextScale', 'resultVerticalPadding', 'controlLayoutScale'];
    const saved = keys.map(k => ({k, had: prefs.contains(k), value: prefs.getInt(k, 100)}));
    const hadHide = prefs.contains('hideSearchForm'), oldHide = prefs.getBoolean('hideSearchForm', false);
    function field(o, key) { const f = o.getClass().getDeclaredField(key); f.setAccessible(true); return f.get(o); }
    let count = 0;
    function check(ok, label) { if (!ok) throw Error(label); console.log('PASS ' + label); count++; }
    Java.scheduleOnMainThread(function () {
        try {
            const activity = Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
            const Runnable = Java.registerClass({name:'app.morphe.extension.chmate.AppearanceTestClose',
                implements:[Java.use('java.lang.Runnable')], methods:{run:function(){}}});
            const state = Java.use('android.os.Bundle').$new();
            state.putString('haiagaru.eddi.search.state', JSON.stringify({query:'https://eddiarchive3rd.boy.jp/', threads:[], page:1, total:0}));
            const ui = Ui.embed(activity, Java.use('android.net.Uri').parse('https://eddiarchive3rd.boy.jp/'),
                null, state, Runnable.$new());
            const html = '<div id="threadContainer"><div class="thread"><a class="title" href="https://bbs.eddibb.cc/test/read.cgi/liveedge/1792587764/">表示検証用スレ</a><p class="date">2026-10-22</p></div></div>';
            ui.display(1, ui.parse(html));
            const rows = Java.cast(field(ui, 'results'), Java.use('android.widget.LinearLayout'));
            const row = rows.getChildAt(0), title = Java.cast(Java.cast(row, Java.use('android.widget.LinearLayout')).getChildAt(0), Java.use('android.widget.TextView'));
            check(rows.getChildCount() === 1, 'synthetic result rendered without network');
            ui.saveAppearance(70, 70, 0, 50, false);
            const compact = title.getTextSize();
            check(row.getPaddingTop() === 0 && row.getPaddingBottom() === 0, 'zero vertical padding');
            check(row.getMinimumHeight() > 0, 'compact row keeps touch minimum');
            check(prefs.getInt('controlLayoutScale', -1) === 50, 'compact control spacing saved');
            ui.saveAppearance(150, 150, 32, 100, true);
            check(title.getTextSize() > compact * 2, 'result text 70 to 150 percent changes actual size');
            check(row.getPaddingTop() > 0 && row.getPaddingTop() === row.getPaddingBottom(), 'large padding applied symmetrically');
            check(Number(Java.cast(row.getTag(0x48690c05), Java.use('java.lang.Integer')).intValue()) === 32, 'Compose receives spacing tag');
            check(prefs.getInt('resultVerticalPadding', -1) === 32, 'padding saved');
            const second = Ui.embed(activity, Java.use('android.net.Uri').parse('https://eddiarchive3rd.boy.jp/'), null, state, Runnable.$new());
            second.display(1, second.parse(html));
            const secondRows = Java.cast(field(second, 'results'), Java.use('android.widget.LinearLayout'));
            check(secondRows.getChildAt(0).getPaddingTop() === row.getPaddingTop(), 'reopened model restores spacing');
            const form = Java.cast(field(second, 'searchForm'), Java.use('android.widget.LinearLayout'));
            check(Java.use('android.widget.EditText').class.isInstance(form.getChildAt(0)), 'usage banner removed; keyword remains first');
            check(Ui.clampResultPadding(-1) === 0 && Ui.clampResultPadding(99) === 32, 'stored spacing bounds');
            check(Ui.clampControlLayout(-1) === 50 && Ui.clampControlLayout(999) === 100, 'control layout bounds');
            ui.dispose(); second.dispose();
            console.log('APPEARANCE_COMPLETE checks=' + count);
        } catch (e) { console.log('FAIL APPEARANCE ' + e.stack); }
        finally {
            const edit = prefs.edit();
            saved.forEach(s => { if(s.had) edit.putInt(s.k,s.value); else edit.remove(s.k); });
            if(hadHide) edit.putBoolean('hideSearchForm',oldHide); else edit.remove('hideSearchForm');
            edit.commit(); console.log('PREFERENCES_RESTORED');
        }
    });
});
