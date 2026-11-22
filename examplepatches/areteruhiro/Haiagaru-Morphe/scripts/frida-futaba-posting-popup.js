// On-device instrumented smoke test. Both posting forms are local fixtures.
Java.perform(function () {
    const prefix = 'app.morphe.extension.chmate.';
    const Gateway = Java.use(prefix + 'SiteBoardGateway');
    const Protocol = Java.use(prefix + 'SiteBoardProtocol');
    const Popup = Java.use(prefix + 'FutabaPostingPopup');
    const Image = Java.use(prefix + 'SitePostProtocol$Image');
    const Submit = Java.use(prefix + 'PostingIpWarning');
    const EditText = Java.use('android.widget.EditText');
    const LinearLayout = Java.use('android.widget.LinearLayout');
    const Dialog = Java.use('android.app.Dialog');
    const JString = Java.use('java.lang.String');
    const TextUtils = Java.use('android.text.TextUtils');
    let fakeUrl;
    const key = 'hffffffffffffffffffffffffffffffff';
    const target = key + ':123456';
    const draft = 'Haiagaru fixture >>2';
    let web, body, editor, gateway, board, host, old, popupDialog, installed = false;
    const Callback = Java.registerClass({
        name: 'app.haiagaru.tests.FutabaPopupCallback',
        implements: [Java.use('android.webkit.ValueCallback')],
        methods: { onReceiveValue(value) { pending(String(value)); } }
    });
    let pending;
    function evaluate(script, done) {
        pending = done;
        web.evaluateJavascript(script, Callback.$new());
    }
    function check(value, label) {
        if (!value) throw new Error(label);
        send({pass: label});
    }
    function ui(task, delay) {
        setTimeout(() => Java.scheduleOnMainThread(() => {
            try { task(); } catch (failure) { finish(String(failure)); }
        }), delay || 0);
    }
    function finish(error) {
        if (popupDialog) popupDialog.dismiss();
        if (editor) editor.dismiss();
        if (installed) {
            if (old) gateway.boards.value.put(key, old);
            else gateway.boards.value.remove(key);
        }
        send({type: 'futaba-popup-result', error: error || null, publicPosts: 0});
    }
    function run(index) {
        if (index === 2) { finish(); return; }
        const mirror = ['img', 'may'][index];
        host = mirror + '.2chan.net';
        board = Protocol.address('http://die-or.work/' + mirror + '/b/');
        check(String(board.host.value) === host && Popup.eligible(board), mirror + ' mirror routes to official host');
        gateway.boards.value.put(key, board);
        body.setText(JString.$new(draft), Java.use('android.widget.TextView$BufferType').EDITABLE.value);
        const bytes = Java.array('byte', [-1,-40,-1,0,0,0,0,0,0,0,0,0]);
        gateway.attachment(target, Image.$new(bytes, 'fixture.jpg'));
        web = null;
        check(Submit.intercept(activity), mirror + ' submit consumed by popup');
        check(Submit.intercept(activity), mirror + ' duplicate tap consumed');
        capturePopup('https://' + host + '/b/res/123456.htm');
        let retries = 0;
        function verifyForm() {
            check(web !== null, mirror + ' official origin matched local WebView fixture');
            evaluate("(()=>{const actions=document.querySelector('#haiagaru-post-actions');return ["
                + "document.querySelector('textarea')?.value==='Haiagaru fixture >>654321',"
                + "document.querySelector('input[type=file]')?.files[0]?.name==='fixture.jpg',"
                + "getComputedStyle(document.getElementById('outside')).display==='none',"
                + "actions?.querySelector('input').offsetHeight||0,"
                + "actions?getComputedStyle(actions).textAlign:''];})()", result => {
                const state = JSON.parse(result);
                const ready = state && state[0] && state[1] && (!Popup.openFromSettings
                    || state[2] && state[3] >= (Popup.adResource ? 64 : 44) && state[4] === 'center');
                if (!ready && ++retries < 16) { ui(verifyForm, 250); return; }
                ui(() => {
                    check(ready, mirror + ' draft, attachment and form layout ' + result);
                    if (Popup.openFromSettings) {
                        check(web.getHeight() < web.getResources().getDisplayMetrics().heightPixels.value,
                            mirror + ' form-only popup fits below full height with a centered submit button');
                    }
                    evaluate("document.querySelector('input[type=submit]').click()", () => {});
                    ui(() => {
                        check(TextUtils.equals(body.getText(), JString.$new(draft)), mirror + ' rejection keeps draft');
                        check(web.getParent() !== null, mirror + ' rejection keeps popup');
                        evaluate("window.acceptFixture=true;document.querySelector('input[type=submit]').click()", () => {});
                        ui(() => {
                            check(TextUtils.isEmpty(body.getText()), mirror + ' success clears submitted draft');
                            check(web.getParent() === null, mirror + ' success dismisses popup');
                            check(String(gateway.attachmentName(target)) === '', mirror + ' success clears attachment');
                            if (index === 0) createEditor(1);
                            else start(index + 1);
                        }, 600);
                    }, 500);
                });
            });
        }
        ui(verifyForm, 500);
    }
    function capturePopup(expectedUrl) {
        web = null;
        Java.choose(prefix + 'FutabaPostingPopup$Popup', {
            onMatch(instance) {
                if (instance.closed.value) return;
                const url = String(instance.binding.value.page.value);
                if (url !== expectedUrl) return;
                popupDialog = Java.retain(instance.dialog.value);
                instance.seeded.value = false;
                fixture(instance.web.value, url);
                return 'stop';
            },
            onComplete() {}
        });
        check(web !== null, 'official origin matched local WebView fixture');
    }
    let activity;
    function createEditor(index) {
        if (editor) editor.dismiss();
        editor = Dialog.$new(activity);
        const layout = LinearLayout.$new(activity);
        body = EditText.$new(activity);
        layout.addView(body);
        editor.setContentView(layout);
        editor.show();
        ui(() => start(index), 350);
    }
    function start(index) {
        if (index === 2) {
            if (Popup.openDirect) {
                check(Popup.openDirect(activity, fakeUrl), 'direct route opens without a native editor binding');
                capturePopup('https://may.2chan.net/b/res/123456.htm');
                ui(() => {
                    evaluate("document.querySelector('textarea')?.value===''&&document.querySelector('#haiagaru-post-actions')!==null", result => {
                        ui(() => {
                            check(result === 'true', 'direct route presents the blank official posting form');
                            finish();
                        });
                    });
                }, 900);
            } else finish();
            return;
        }
        const mirror = ['img', 'may'][index];
        gateway.boards.value.put(key, Protocol.address('http://die-or.work/' + mirror + '/b/'));
        Popup.bind(activity, activity, body, body, null, null, fakeUrl, false);
        check(body.isAttachedToWindow(), mirror + ' fixture editor attached');
        const map = Popup.class.getDeclaredField('EDITORS');
        map.setAccessible(true);
        check(Java.cast(map.get(null), Java.use('java.util.Map')).containsKey(activity), mirror + ' posting editor bound');
        run(index);
    }
    ui(() => {
        const auth = Java.use(prefix + 'ExternalBoardAuth');
        const resumed = auth.class.getDeclaredField('resumed');
        resumed.setAccessible(true);
        activity = Java.cast(resumed.get(null), Java.use('java.lang.ref.WeakReference')).get();
        check(activity !== null, 'ChMate activity available');
        activity = Java.cast(activity, Java.use('android.app.Activity'));
        if (Popup.adResource) {
            const Uri = Java.use('android.net.Uri');
            check(Popup.adResource(Uri.parse('https://dec.2chan.net/bin/sphead.htm?240605')), 'Futaba banner frame filtered');
            check(Popup.adResource(Uri.parse('https://j.microad.net/js/compass.js')), 'observed external ad script filtered');
            check(!Popup.adResource(Uri.parse('https://may.2chan.net/bin/base4esc.js?y')), 'official submit and handwriting script allowed');
            check(!Popup.adResource(Uri.parse('https://may.2chan.net/b/futaba.php?guid=on')), 'official submit destination allowed');
        }
        gateway = Gateway.get(activity);
        old = gateway.boards.value.get(key);
        installed = true;
        const enabled = Gateway.boardEnabled.overload('java.lang.String');
        enabled.implementation = function (k) { return String(k) === key || enabled.call(this, k); };
        const port = Gateway.class.getDeclaredField('port');
        port.setAccessible(true);
        fakeUrl = 'http://127.0.0.1:' + port.getInt(gateway) + '/test/read.cgi/' + key + '/123456/';
        createEditor(0);
    });
    function fixture(view, url) {
            web = Java.retain(view);
            view.loadDataWithBaseURL(url, `<meta charset=utf-8><div id=outside>Outside form</div>
                <form id=fm method=post action=/b/futaba.php>
                <input type=hidden name=mode value=regist><input type=hidden name=resto value=123456>
                <textarea name=com></textarea><input type=file name=upfile><input type=submit onclick="return ptfk()">
                <span id=retmestip></span></form>
                <div class=thre data-res=123456><table><tr><td class=rtd><span class=cno>No.654321</span></td></tr></table></div>
                <script>function ptfk(){document.getElementById('retmestip').textContent=window.acceptFixture?'完了':'拒否';return false}</script>`,
                'text/html', 'UTF-8', null);
    }
});
