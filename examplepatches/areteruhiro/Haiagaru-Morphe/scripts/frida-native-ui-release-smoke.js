// Only isolated verification packages. Existing pages and preferences are preserved.
Java.perform(function () {
  const app = Java.use('android.app.ActivityThread').currentApplication();
  const pkg = String(app.getPackageName());
  if (!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg)) throw Error('Verification package required');
  const Tools = Java.use('app.morphe.extension.chmate.NativeToolTabs');
  const Palette = Java.use('app.morphe.extension.chmate.NativeThemeColors');
  const Fragment = Java.use('androidx.fragment.app.Fragment');
  const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
  const had = prefs.contains('nativeToolTabs'), old = prefs.getBoolean('nativeToolTabs', false);
  let host, added, checks = 0;
  function check(value, label) { if (!value) throw Error(label); console.log('PASS ' + (++checks) + ' ' + label); }
  function restore() { const e = prefs.edit(); if (had) e.putBoolean('nativeToolTabs', old); else e.remove('nativeToolTabs'); e.commit(); }
  function run(fn) { Java.perform(() => Java.scheduleOnMainThread(() => { try { fn(); } catch (e) { console.log('FAIL ' + e.stack); restore(); } })); }
  function find(view) {
    if (String(view.getContentDescription()) === 'このタブを閉じる') return view;
    const Group = Java.use('android.view.ViewGroup');
    if (Group.class.isInstance(view)) { const g = Java.cast(view, Group); for (let i = 0; i < g.getChildCount(); i++) { const found = find(g.getChildAt(i)); if (found) return found; } }
    return null;
  }
  run(() => {
    check(Tools.supported(), 'native tool bridge enabled');
    const colors = Palette.colors(app); check(colors !== null && colors.length === 7, 'native application palette ART execution');
    console.log('PALETTE ' + Array.from(colors).map(c => (c >>> 0).toString(16)).join(','));
    const Tablet = Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity');
    app.startActivity(Java.use('android.content.Intent').$new(app, Tablet.class).addFlags(0x10000000));
  });
  setTimeout(() => Java.perform(() => Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity', {
    onMatch(a) { if (!host && a.getWindow().getDecorView().isShown()) host = Java.retain(a); },
    onComplete() { run(() => {
      check(!!host, 'tablet host foreground');
      const colors = Palette.colors(host); check(colors !== null && colors.length === 7, 'native Activity palette ART execution');
      prefs.edit().putBoolean('nativeToolTabs', false).commit(); check(!Tools.open(host, 'settings'), 'OFF preserves standalone routing');
      prefs.edit().putBoolean('nativeToolTabs', true).commit(); check(Tools.open(host, 'settings'), 'open added settings page');
    }); }
  })), 5000);
  setTimeout(() => Java.perform(() => Java.choose('app.morphe.extension.chmate.NativeToolFragment', {
    onMatch(f) { const base = Java.cast(f, Fragment), args = base.getArguments(); if (!added && args && String(args.getString('_data')) === 'haiagaru-tool://settings' && base.getView() && base.isResumed()) added = Java.retain(base); },
    onComplete() { run(() => {
      check(!!added, 'settings native Fragment attached and resumed');
      const close = find(added.getView()); check(!!close && close.isShown(), 'visible close button');
      check(close.performClick(), 'actual close button click dispatched');
    }); }
  })), 12000);
  setTimeout(() => run(() => {
    try { check(!!added && (!added.isAdded() || added.getView() === null), 'clicked page removed through native close'); check(!host.isFinishing(), 'tablet host and remaining panes retained'); console.log('NATIVE_UI_SMOKE_COMPLETE checks=' + checks); }
    finally { restore(); console.log('PREFERENCES_RESTORED'); }
  }), 18000);
});
