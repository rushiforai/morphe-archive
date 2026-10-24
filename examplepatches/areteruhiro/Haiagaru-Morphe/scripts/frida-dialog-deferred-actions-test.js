// No network or preference writes. Runs only in the existing 242 verification app.
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!String(app.getPackageName()).endsWith('.resumefix242')) throw Error('Verification package only');
    const Handler = Java.use('android.os.Handler'), Looper = Java.use('android.os.Looper');
    const handler = Handler.$new(Looper.getMainLooper());
    const Builder = Java.use('app.morphe.extension.chmate.HaiagaruDialog$Builder');
    const StringClass = Java.use('java.lang.String');
    let dialog, callbacks = 0, checks = 0;
    function check(value, label) { if (!value) throw Error(label); checks++; console.log('PASS ' + label); }
    function main(action) { Java.scheduleOnMainThread(() => { try { action(); } catch (e) { console.log('FAIL ' + e.stack); if (dialog) dialog.dismiss(); } }); }
    const pending=[];
    const QueueTask=Java.registerClass({name:'org.haiagaru.test.DialogQueueAssertion',implements:[Java.use('java.lang.Runnable')],
        methods:{run(){try{pending.shift()();}catch(e){console.log('FAIL '+e.stack);if(dialog)dialog.dismiss();}}}});
    function after(action){pending.push(action);handler.post(QueueTask.$new());}
    const Listener = Java.registerClass({
        name: 'org.haiagaru.test.DeferredDialogClick',
        implements: [Java.use('android.content.DialogInterface$OnClickListener')],
        methods: { onClick(d, which) { callbacks++; check(dialog.isShowing(), 'standard callback precedes dismiss'); } }
    });
    const Navigation = Java.registerClass({
        name: 'org.haiagaru.test.DeferredDialogNavigation', implements: [Java.use('java.lang.Runnable')],
        methods: { run() { callbacks++; check(!dialog.isShowing(), 'navigation follows dismiss'); check(!dialog.getWindow().getDecorView().isAttachedToWindow(), 'navigation leaves no modal decor'); } }
    });
    main(() => {
        const activity = Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
        const builder = Builder.$new(activity);
        builder.setTitle.overload('java.lang.CharSequence').call(builder, StringClass.$new('ダイアログ動作確認'));
        builder.setPositiveButton.overload('java.lang.CharSequence', 'android.content.DialogInterface$OnClickListener')
            .call(builder, StringClass.$new('確認'), Listener.$new());
        dialog = Java.retain(builder.create()); dialog.show();
        dialog.getButton(-1).performClick(); dialog.getButton(-1).performClick();
        check(callbacks === 0, 'button callbacks leave input dispatch first');
        after(() => {
        check(callbacks === 1, 'double click dispatches once');
        check(!dialog.isShowing(), 'button closes dialog on next loop');
        check(!dialog.getWindow().getDecorView().isAttachedToWindow(), 'button detaches window');
        dialog.show(); dialog.dismiss(); dialog.show();
        after(() => {
        check(dialog.isShowing(), 'stale dismiss cannot close reopened dialog');
        dialog.dismissForNavigation(Navigation.$new());
        check(callbacks === 1 && dialog.isShowing(), 'navigation is deferred with dismiss');
        after(() => {
        check(callbacks === 2 && !dialog.isShowing(), 'navigation runs once');
        const flags = dialog.getWindow().getAttributes().flags.value;
        check((flags & 0x18) === 0x18 && (flags & 2) === 0, 'closed dialog cannot trap input or dim');
        console.log('DEFERRED_DIALOG_COMPLETE checks=' + checks);
        }); }); });
    });
});
