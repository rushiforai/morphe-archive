Java.perform(function () {
  const app = Java.use('android.app.ActivityThread').currentApplication();
  if (String(app.getPackageName()) !== 'jp.co.airfront.android.a2chMate.haiagaru.reporter242')
    throw new Error('Use the isolated reporter242 package');
  const Count = Java.use('app.morphe.extension.chmate.HiddenNgUnread');
  const Set = Java.use('java.util.HashSet');
  const Integer = Java.use('java.lang.Integer');
  const hidden = Set.$new();
  [9, 11, 13, 15, 100].forEach(n => hidden.add(Integer.valueOf(n)));
  function check(condition, label) { if (!condition) throw new Error('FAIL ' + label); console.log('PASS ' + label); }
  check(Count.adjustNewArrivalCount(10, 14, hidden) === 2, 'subtract hidden IDs only inside newly fetched range');
  check(Count.adjustNewArrivalCount(10, 10, hidden) === 0, 'empty update remains zero');
  check(Count.adjustNewArrivalCount(10, 12, hidden) === 1, 'clamp to range and count one matching response');
  check(Count.adjustNewArrivalCount(10, 14, Set.$new()) === 4, 'no known hidden responses preserves native count');
  check(Count.adjustNewArrivalCount(10, 12, hidden) >= 0, 'adjusted count never becomes negative');
  console.log('RESULT PASS 5 arrival-count checks; no network or post actions');
});
