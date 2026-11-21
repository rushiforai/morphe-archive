Java.perform(function () {
  const app = Java.use('android.app.ActivityThread').currentApplication();
  const reporterPackage = String(app.getPackageName());
  if (!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.reporter(191|226|242)$/.test(reporterPackage))
    throw new Error('Use an isolated reporter191, reporter226, or reporter242 package');
  const Count = Java.use('app.morphe.extension.chmate.HiddenNgUnread');
  const Set = Java.use('java.util.HashSet');
  const Integer = Java.use('java.lang.Integer');
  const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
  const option = 'excludeHiddenNgNewArrivals';
  const hadOption = prefs.contains(option), oldOption = prefs.getBoolean(option, false);
  const hidden = Set.$new();
  [9, 11, 13, 15, 100].forEach(n => hidden.add(Integer.valueOf(n)));
  function check(condition, label) { if (!condition) throw new Error('FAIL ' + label); console.log('PASS ' + label); }
  try {
    check(Count.adjustNewArrivalCount(10, 14, hidden) === 2, 'subtract hidden IDs only inside newly fetched range');
    check(Count.adjustNewArrivalCount(10, 10, hidden) === 0, 'empty update remains zero');
    check(Count.adjustNewArrivalCount(10, 12, hidden) === 1, 'clamp to range and count one matching response');
    check(Count.adjustNewArrivalCount(10, 14, Set.$new()) === 4, 'no known hidden responses preserves native count');
    check(Count.adjustNewArrivalCount(10, 12, hidden) >= 0, 'adjusted count never becomes negative');
    prefs.edit().putBoolean(option, false).commit();
    check(Count.newArrivalCount(10, 14) === 4, 'formatter helper returns the newly fetched delta when the option is off');
  } finally {
    const editor = prefs.edit();
    if (hadOption) editor.putBoolean(option, oldOption); else editor.remove(option);
    editor.commit();
  }
  console.log('RESULT PASS 6 arrival-count checks on ' + reporterPackage + '; preference restored; no network or post actions');
});
