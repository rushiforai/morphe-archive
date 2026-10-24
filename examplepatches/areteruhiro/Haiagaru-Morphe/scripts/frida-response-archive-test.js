/* Synthetic native responses, isolated emulator packages only. No network or real DAT modification. */
'use strict';
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    const pkg = String(app.getPackageName());
    if (!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.responsearchive(191|226|242)$/.test(pkg))
        throw Error('Isolated response archive app required');
    const version = pkg.slice(-3), H = Java.use('app.morphe.extension.chmate.Haiagaru');
    H.shouldHideAds(app);
    const A = Java.use('app.morphe.extension.chmate.ResponseArchive');
    const E = Java.use('app.morphe.extension.chmate.ResponseArchiveEntry');
    let checks = 0;
    function check(ok, label) { if (!ok) throw Error(label); checks++; console.log('PASS ' + label); }
    const Board = Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo');
    const board = Board.$new.overload('java.lang.String', 'java.lang.String', 'java.lang.Long', 'int', 'java.lang.Integer', 'java.lang.String')
        .call(Board, 'example.invalid', 'archivefixture', Java.use('java.lang.Long').valueOf(1234567890), 0, null, null);
    const types = {'191':'o.processAdDisplayErrorPostbackForUserError', '226':'o.BouncyCastleSocketAdapterCompanion', '242':'o.KeJ11'};
    const Response = Java.use(types[version]);
    const body = '<b>保存確認</b><br>line2 &amp; + /';
    const date = '2026/10/17 ID:abc+/';
    const response = version === '242'
        ? Response.$new.overload('int','java.lang.String','java.lang.String','java.lang.String','java.lang.String','java.lang.String','short','[I','int')
            .call(Response,42,'名前','sage',date,body,'',0,Java.array('int',[]),0)
        : Response.$new.overload('int','java.lang.String','java.lang.String','java.lang.String','java.lang.String')
            .call(Response,42,'名前','sage',date,body);
    const entry = E.snapshot(response, board, 'レス保存検証 ' + version);
    const url = String(entry.url.value);
    check(url.indexOf('example.invalid') >= 0 && /(?:\/42|number=42)$/.test(url), 'native response URL');
    check(Number(entry.number.value) === 42, 'native number is selected response');
    check(String(entry.body.value) === body && String(entry.date.value) === date, 'native body/date exact');
    const file = A.file(app, url);
    if (file.exists() && String(A.read(file).body.value) === body)
        Java.use('android.util.AtomicFile').$new(file).delete();
    check(!file.exists(), 'fixture URL not previously saved');
    A.save(app, entry);
    const restored = A.read(file);
    check(String(restored.body.value) === body && String(restored.name.value) === '名前', 'atomic save/read raw HTML');
    A.save(app, entry);
    const list = file.getParentFile().listFiles();
    check(Array.from(list).filter(f => String(f.getName()) === String(file.getName())).length === 1, 'repeat save does not duplicate');
    const Atomic = Java.use('android.util.AtomicFile');
    // Simulate an interrupted write: backup exists without the base file.
    const backup = Java.use('java.io.File').$new(String(file.getPath()) + '.bak');
    check(file.renameTo(backup), 'interrupted-write fixture');
    check(String(A.read(file).body.value) === body && file.exists(), 'atomic backup recovery');
    const records = Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().iterator();
    let activity;
    while (records.hasNext()) {
        const r = Java.cast(records.next(), Java.use('android.app.ActivityThread$ActivityClientRecord'));
        if (!r.paused.value) activity = Java.retain(r.activity.value);
    }
    if (!activity) throw Error('No resumed activity');
    function dialog(fn, attempt) {
        attempt = attempt || 0;
        let matched = false;
        function own(v) {
            const Text = Java.use('android.widget.TextView'), Group = Java.use('android.view.ViewGroup');
            if (Text.class.isInstance(v) && /レスのアーカイブ|レス保存検証|レス 42 を保存|保存先のスレ|保存用スレ/.test(String(Java.cast(v,Text).getText()))) return true;
            if (Group.class.isInstance(v)) {
                const g = Java.cast(v,Group); for(let i=0;i<g.getChildCount();i++) if(own(g.getChildAt(i))) return true;
            }
            return false;
        }
        Java.choose('android.app.AlertDialog', {
            onMatch: d => {
                if (matched || !d.isShowing() || !own(d.getWindow().getDecorView())) return;
                matched = true; const retained = Java.retain(d);
                Java.scheduleOnMainThread(() => fn(retained));
            }, onComplete: () => {
                if (matched) check(true, 'archive dialog shown');
                else if (attempt < 8) setTimeout(() => Java.perform(() => dialog(fn, attempt + 1)), 1000);
                else check(false, 'archive dialog shown');
            }
        });
    }
    // Keep a snapshot for UI checks; remove exactly this synthetic fixture on completion.
    Java.scheduleOnMainThread(function () {
        A.showLegacyList(Java.cast(activity, Java.use('android.app.Activity')), 0);
    });
    setTimeout(function () { Java.perform(function () {
        dialog(function (d) {
            const list = d.getListView();
            check(list !== null && list.getAdapter().getCount() === 1, 'saved response list has one entry');
            check(String(list.getAdapter().getItem(0)).indexOf('レス 42') >= 0, 'list shows original number');
            list.performItemClick(list.getChildAt(0),0,0);
            setTimeout(function () { Java.perform(function () {
                dialog(function (detail) {
                    const Group = Java.use('android.view.ViewGroup'), Text = Java.use('android.widget.TextView');
                    let texts = [];
                    function walk(v) {
                        if (Text.class.isInstance(v)) texts.push(String(Java.cast(v,Text).getText()));
                        if (Group.class.isInstance(v)) {
                            const g = Java.cast(v,Group); for(let i=0;i<g.getChildCount();i++) walk(g.getChildAt(i));
                        }
                    }
                    walk(detail.getWindow().getDecorView());
                    check(texts.some(t => t.indexOf('保存確認\nline2 & + /') >= 0), 'offline detail decodes HTML and keeps line breaks');
                    detail.dismiss();
                    Atomic.$new(file).delete();
                    check(!file.exists() && !backup.exists(), 'only synthetic fixture removed');
                    const collection = A.createCollection(app, 'レス保存検証 ' + version + ' ' + Date.now());
                    const other = A.createCollection(app, 'レス保存検証 other ' + Date.now());
                    const File = Java.use('java.io.File');
                    const root = File.$new(app.getFilesDir(), 'haiagaru-response-archive/threads');
                    const dir = File.$new(root, String(collection.id.value));
                    const otherDir = File.$new(root, String(other.id.value));
                    const groupedFile = File.$new(dir, String(file.getName()));
                    A.saveToCollection(app, String(other.id.value), entry);
                    check(File.$new(otherDir, String(file.getName())).exists(), 'independent archive thread saves response');
                    const a = Java.cast(activity, Java.use('android.app.Activity'));
                    const popup = Java.use('android.widget.PopupMenu').$new(a, a.getWindow().getDecorView());
                    A.append(null, popup.getMenu(), response, board);
                    const menuItem = popup.getMenu().findItem(0x7e484a01);
                    check(menuItem !== null, 'native Menu action appended');
                    const browseItem = popup.getMenu().findItem(0x7e484a03);
                    check(browseItem !== null && String(browseItem.getTitle()) === '保存済みレスを見る', 'archive browse action appended');
                    A.append(null, popup.getMenu(), response, board);
                    check(popup.getMenu().size() === 2, 'save and browse actions do not duplicate');
                    const nativeItem = popup.getMenu().add.overload('int','int','int','java.lang.CharSequence')
                        .call(popup.getMenu(),0,12345,0,Java.use('java.lang.String').$new('native fixture'));
                    check(!A.handle(nativeItem), 'native action not consumed');
                    check(A.handle(menuItem), 'custom popup dispatch consumes only archive action');
                    dialog(function (chooser) {
                        const choices = chooser.getListView();
                        let target = -1;
                        for (let i = 0; i < choices.getAdapter().getCount(); i++)
                            if (String(choices.getAdapter().getItem(i)) === String(collection.title.value)) target = i;
                        check(target >= 0, 'save destination listed');
                        choices.performItemClick(choices.getChildAt(target), target, 0);
                        dialog(function (confirm) {
                        check(!file.exists(), 'confirmation does not save before acceptance');
                        confirm.getButton(-1).performClick();
                        setTimeout(function () { Java.perform(function () {
                            check(groupedFile.exists() && String(A.read(groupedFile).body.value) === body, 'confirmation saves selected body to chosen thread');
                            check(!file.exists(), 'group save does not modify legacy archive');
                            A.saveToCollection(app, String(collection.id.value), entry);
                            check(Array.from(dir.listFiles()).filter(f => String(f.getName()) === String(file.getName())).length === 1, 'grouped response deduplicates');
                            Java.scheduleOnMainThread(function () {
                                check(A.handle(browseItem), 'archive browse dispatch consumed');
                                dialog(function (browse) {
                                    check(!file.exists(), 'browse does not create an archive');
                                    const choices = browse.getListView();
                                    let target = -1;
                                    for (let i = 0; i < choices.getAdapter().getCount(); i++)
                                        if (String(choices.getAdapter().getItem(i)) === String(collection.title.value)) target = i;
                                    check(target >= 0, 'saved thread listed for viewing');
                                    choices.performItemClick(choices.getChildAt(target),target,0);
                                    dialog(function (viewer) {
                                    let texts = [];
                                    function inspect(v) {
                                        if (Text.class.isInstance(v)) texts.push(String(Java.cast(v,Text).getText()));
                                        if (Group.class.isInstance(v)) {
                                            const group = Java.cast(v,Group);
                                            for(let i=0;i<group.getChildCount();i++)inspect(group.getChildAt(i));
                                        }
                                    }
                                    inspect(viewer.getWindow().getDecorView());
                                    check(texts.some(t=>t.indexOf('保存確認\nline2 & + /')>=0), 'saved-thread viewer displays decoded body');
                                    check(texts.some(t=>t.indexOf('1レス')>=0), 'saved-thread viewer shows response count');
                                    viewer.dismiss();
                                    for (const group of [dir, otherDir]) {
                                        for (const child of Array.from(group.listFiles())) check(child.delete(), 'remove isolated collection fixture file');
                                        check(group.delete(), 'remove isolated collection fixture directory');
                                    }
                                    console.log('COMPLETE ' + version + ' response archive ' + checks + ' checks');
                                    });
                                });
                            });
                        }); },1500);
                        });
                    });
                });
            }); },600);
        });
    }); },1000);
});
