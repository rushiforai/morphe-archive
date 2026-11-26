rpc.exports.test = () => new Promise(resolve => Java.perform(() => {
  let step = 'start';
  try {
    step = 'application';
    const app = Java.use('android.app.ActivityThread').currentApplication();
    const pkg = String(app.getPackageName());
    if (!/\.haiagaru\.reporter242$/.test(pkg)) throw new Error('Use isolated reporter242');
    step = 'traffic stats';
    const Traffic = Java.use('android.net.TrafficStats');
    const Process = Java.use('android.os.Process');
    const uid = Process.myUid();
    step = 'preferences';
    const data = app.getSharedPreferences('haiagaru.traffic-usage', 0);
    const settings = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    step = 'uid counters';
    const rx = Traffic.getUidRxBytes(uid), tx = Traffic.getUidTxBytes(uid);
    step = 'boot count';
    const boot = Java.use('android.provider.Settings$Global').getInt(app.getContentResolver(), 'boot_count', -1);
    step = 'report';
    const report = Java.use('app.morphe.extension.chmate.AppTrafficUsage').report(app);
    step = 'result';
    resolve({ package: pkg, uid: Number(uid), enabledSettingExists: !!settings.contains('recordAppTraffic'), enabled: !!settings.getBoolean('recordAppTraffic', false),
      uidRx: Number(rx), uidTx: Number(tx), bootCount: Number(boot),
      savedRx: Number(data.getLong('rx', -1)), savedTx: Number(data.getLong('tx', -1)),
      savedBoot: Number(data.getInt('boot', -2)), savedElapsed: Number(data.getLong('elapsed', -1)),
      days: String(data.getString('days', '{}')), report: String(report) });
  } catch (error) { resolve({ step, error: String(error) }); }
}));
