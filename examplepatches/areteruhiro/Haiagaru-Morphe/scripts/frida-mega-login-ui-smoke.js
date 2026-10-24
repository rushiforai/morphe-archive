// Display/validation only. Does not enter credentials or make a login request.
Java.perform(function () {
  const app = Java.use('android.app.ActivityThread').currentApplication();
  if (!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(String(app.getPackageName()))) throw Error('Verification package required');
  let dialog;
  function field(o, key) { const f = o.getClass().getDeclaredField(key); f.setAccessible(true); return f.get(o); }
  Java.scheduleOnMainThread(function () {
    try {
      const a = Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
      const Done = Java.registerClass({name:'org.haiagaru.test.MegaNoCredentials',implements:[Java.use('java.lang.Runnable')],methods:{run(){}}});
      Java.use('app.morphe.extension.chmate.HaiagaruMegaSync').showLoginDialog(a, Done.$new());
      Java.choose('app.morphe.extension.chmate.HaiagaruDialog', {onMatch(d) {
        if (d.isShowing() && String(field(field(d, 'spec'), 'title')) === 'MEGAにログイン') dialog = Java.retain(d);
      }, onComplete() {
        if (!dialog) throw Error('MEGA login dialog not shown');
        const layout = Java.cast(field(field(dialog, 'spec'), 'view'), Java.use('android.view.ViewGroup'));
        let inputs = [];
        for(let i=0;i<layout.getChildCount();i++) { const v=layout.getChildAt(i); if(Java.use('android.widget.EditText').class.isInstance(v))inputs.push(Java.cast(v,Java.use('android.widget.EditText'))); }
        const hint=String(inputs[0].getHint().toString()), textLength=Java.cast(inputs[0].getText(),Java.use('java.lang.CharSequence')).length();
        console.log('LOGIN_INPUTS=' + inputs.length + ' emailTextLength=' + textLength);
        if(inputs.length !== 3 || textLength !== 0 || hint !== '\u30e1\u30fc\u30eb\u30a2\u30c9\u30ec\u30b9\u3092\u5165\u529b') throw Error('Login input labels/hints not separated');
        console.log('PASS MEGA three empty inputs; email hint separate from description');
        console.log('MEGA_LOGIN_UI_READY');
      }});
    } catch(e) { console.log('FAIL ' + e.stack); }
  });
  setTimeout(() => Java.perform(() => Java.scheduleOnMainThread(() => { if(dialog)dialog.dismiss(); console.log('MEGA_LOGIN_UI_CLOSED_NO_CREDENTIALS'); })), 12000);
});
