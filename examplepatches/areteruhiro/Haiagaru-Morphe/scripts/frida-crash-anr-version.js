Java.perform(function () {
  const app=Java.use('android.app.ActivityThread').currentApplication();
  if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.reporter242')throw new Error('Isolated reporter242 required');
  const Haiagaru=Java.use('app.morphe.extension.chmate.Haiagaru');
  const method=Haiagaru.class.getDeclaredMethod('logVersionLines',Java.array('java.lang.Class',[Java.use('android.content.Context').class]));
  method.setAccessible(true);
  const lines=String(method.invoke(null,Java.array('java.lang.Object',[app])));
  const nativeVersion=String(app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName.value);
  const config=Java.use('app.morphe.extension.chmate.BuildConfig');
  const field=config.class.getField('HAIAGARU_VERSION');
  const patchVersion=String(field.get(null));
  if(lines.indexOf('ChMate version: '+nativeVersion+'\n')<0)throw new Error('ChMate version missing from log fields');
  if(lines.indexOf('Haiagaru version: '+patchVersion+'\n')<0)throw new Error('Haiagaru version missing from log fields: '+JSON.stringify({patchVersion,lines}));
  console.log('PASS crash and ANR shared version fields: '+nativeVersion+' / '+patchVersion);
});
