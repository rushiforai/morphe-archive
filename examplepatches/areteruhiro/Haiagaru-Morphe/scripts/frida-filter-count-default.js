// Restore the original preference after checking unset / explicit true / explicit false.
Java.perform(function () {
  const app = Java.use('android.app.ActivityThread').currentApplication();
  if (!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName()))) throw Error('Verification packages only');
  Java.scheduleOnMainThread(function () {
    const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    const key = 'quickFilterCounts', had = prefs.contains(key), old = prefs.getBoolean(key, false);
    const Options = Java.use('app.morphe.extension.chmate.QuickFilterOptions');
    function check(ok, label) { if (!ok) throw Error(label); console.log('PASS ' + label); }
    try {
      const activity = Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
      check(!!activity, 'foreground Activity');
      for (const value of [null, true, false]) {
        const edit = prefs.edit(); if (value === null) edit.remove(key); else edit.putBoolean(key, value); edit.commit();
        check(Options.counts() === (value === true), 'effective count preference=' + value);
        const panel = Java.use('android.widget.LinearLayout').$new(activity);
        Options.addSettings(panel, activity);
        check(Java.cast(panel.getChildAt(0), Java.use('android.widget.Switch')).isChecked() === (value === true), 'settings switch preference=' + value);
      }
      console.log('FILTER_COUNT_DEFAULT_COMPLETE');
    } catch (error) { console.log('FAIL ' + error.stack); }
    finally { const e = prefs.edit(); if (had) e.putBoolean(key, old); else e.remove(key); e.commit(); console.log('PREFERENCE_RESTORED'); }
  });
});
