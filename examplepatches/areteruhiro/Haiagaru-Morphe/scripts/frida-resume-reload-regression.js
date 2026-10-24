// Run only in isolated emulator test packages. Restore the preference after the fixture.
Java.perform(function () {
  Java.scheduleOnMainThread(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    const pkg = String(app.getPackageName());
    if (!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.(full191|settingsfix191|resumefix226|resumefix242)$/.test(pkg))
        throw Error('Isolated resume regression package required');
    let checks = 0;
    function check(value, message) { if (!value) throw Error(message); checks++; console.log('PASS ' + message); }
    const Fragment = Java.use(pkg.endsWith('191') ? 'o.pa' : 'jp.syoboi.a2chMate.ui.reslist.ResListFragment');
    const instance = Fragment.$new();
    check(instance !== null, 'native thread Fragment constructor verifies (old 191 threw VerifyError)');
    check(Fragment.class.getDeclaredMethods().toString().indexOf('haiagaruResumeReload') >= 0,
        'safe resume wrapper is present in installed APK');
    const Policy = Java.use('app.morphe.extension.chmate.NativeUpdatePolicy');
    const Activity = Java.use('android.app.Activity');
    const tablet = Java.retain(Java.cast(Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity').$new(), Activity));
    const home = Java.retain(Java.cast(Java.use('jp.syoboi.a2chMate.activity.HomeActivity').$new(), Activity));
    const Stub = Java.registerClass({name: 'app.morphe.test.ResumeFragment' + Date.now(),
        fields: {host: 'java.lang.Object'},
        methods: {getActivity: {returnType: 'java.lang.Object', argumentTypes: [],
            implementation: function () { return this.host.value; }}}});
    const stub = Stub.$new();
    stub.host.value = tablet;
    const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    const key = 'suppressTabletThreadResumeReload';
    const present = prefs.contains(key), previous = prefs.getBoolean(key, true);
    try {
        prefs.edit().putBoolean(key, true).commit();
        check(!Policy.shouldSkipTabletResumeReload(null), 'null Fragment preserves native behavior');
        Policy.tabletActivityResume(tablet);
        check(!Policy.shouldSkipTabletResumeReload(stub), 'first thread resume keeps native reload');
        check(Policy.shouldSkipTabletResumeReload(stub), 'return to same tab suppresses automatic reload');
        Policy.tabletActivityResume(tablet);
        check(!Policy.shouldSkipTabletResumeReload(stub), 'real activity resume restores automatic reload');
        check(Policy.shouldSkipTabletResumeReload(stub), 'next in-activity tab return is suppressed');
        prefs.edit().putBoolean(key, false).commit();
        check(!Policy.shouldSkipTabletResumeReload(stub), 'disabled setting preserves native reload');
        prefs.edit().putBoolean(key, true).commit();
        stub.host.value = home;
        check(!Policy.shouldSkipTabletResumeReload(stub), 'phone activity preserves native reload');
        console.log('PASS ' + checks + ' resume regression checks: ' + pkg);
    } finally {
        const edit = prefs.edit(); if (present) edit.putBoolean(key, previous); else edit.remove(key); edit.commit();
    }
  });
});
