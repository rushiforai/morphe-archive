// Checks the patched catalogue and export boundaries with a private fixture gateway.
Java.perform(() => {
    const prefix = 'app.morphe.extension.chmate.';
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!/\.haiagaru\.reporter(191|226|242)$/.test(String(app.getPackageName())))
        throw Error('Use an isolated reporter package');
    const Gateway = Java.use(prefix + 'SiteBoardGateway');
    const Catalogue = Java.use(prefix + 'FutabaCatalogue');
    const Protocol = Java.use(prefix + 'SiteBoardProtocol');
    const ClipData = Java.use('android.content.ClipData');
    const Intent = Java.use('android.content.Intent');
    const Uri = Java.use('android.net.Uri');
    const ViewAction = 'android.intent.action.VIEW';
    const Helpers = Java.use(prefix + 'HissiMenuCompatibility');
    const NativeBoards = Java.use(prefix + 'SiteNativeBoards');
    const JString = Java.use('java.lang.String');
    const prefs = app.getSharedPreferences('haiagaru.test.futaba-list.' + Date.now(), 0);
    const cell = (id, replies) => '<td><a href="res/' + id + '.htm">image</a><font>' + replies + '</font></td>';
    const table = (...cells) => '<table id=cattable><tr>' + cells.join('') + '</tr></table>';
    const normal = table(cell('1449000100', 24), cell('1449000200', 18));
    const popular = table(cell('1449000300', 412), cell('1449000100', 29));
    const index = ['1449000100','1449000200','1449000300'].map(id =>
        '<div class="thre" data-res="' + id + '"><blockquote>Opening ' + id + '</blockquote></div>').join('');
    const Fetch = Java.use(prefix + 'FutabaCatalogue$Fetch');
    const Topic = Java.use(prefix + 'SiteBoardProtocol$Topic');
    const requests = [];
    let checks = 0, failPopular = false;
    function check(ok, label) {
        if (!ok) throw Error(label);
        checks++;
        send('PASS ' + label);
    }
    const Handler = Java.registerClass({
        name: 'app.haiagaru.tests.FutabaListFixture',
        implements: [Java.use('java.lang.reflect.InvocationHandler')],
        methods: {
            invoke(proxy, method, args) {
                if (String(method.getName()) !== 'get') throw Error('Unexpected fixture method');
                const url = String(args[0]);
                requests.push(url);
                if (url.endsWith('&sort=3')) {
                    if (failPopular) throw Java.use('java.io.IOException').$new('fixture outage');
                    return JString.$new(popular);
                }
                if (url.endsWith('/futaba.htm')) return JString.$new(index);
                throw Error('Unexpected fixture URL ' + url);
            }
        }
    });
    const fetch = Java.cast(Java.use('java.lang.reflect.Proxy').newProxyInstance(app.getClassLoader(),
        Java.array('java.lang.Class', [Fetch.class]), Handler.$new()), Fetch);
    const instance = Gateway.class.getDeclaredField('instance');
    instance.setAccessible(true);
    const previous = instance.get(null);
    try {
        const pairs = ['img', 'may'].map((site, i) => ({
            key: 'hf' + String(i + 1).repeat(32),
            url: 'https://' + site + '.2chan.net/b/',
            legacy: 'http://die-or.work/' + site + '/b/',
            site
        }));
        prefs.edit().putString('boards', JSON.stringify(pairs.map(({key, url, site}) =>
            ({key, url, name:site})))).putInt('port', 47327).commit();
        instance.set(null, Gateway.$new(prefs, null));
        for (const entry of pairs) {
            const {site, key, url, legacy} = entry;
            const board = Protocol.address(url);
            const topics = Catalogue.topics(board, normal, fetch, 3);
            const rows = Array.from({length:topics.size()}, (_, i) => Java.cast(topics.get(i), Topic));
            check(rows.length === 3 && rows.some(row => row.count.value === 413) &&
                rows.some(row => row.count.value === 30), site + ' combines active and 400+ replies with updated deduplicated count');
            check(rows.every(row => String(row.title.value).startsWith('Opening ')), site + ' uses full OP titles');
            check(requests.includes(url + 'futaba.php?mode=cat&sort=3'), site + ' uses the official count-sorted catalogue');
            failPopular = true;
            check(Catalogue.topics(board, normal, fetch, 2).size() === 2, site + ' keeps normal listing if supplementary request fails');
            failPopular = false;
            const source = url + 'res/1449000300.htm';
            const loopback = 'http://127.0.0.1:47327/test/read.cgi/' + key + '/1449000300/';
            const compatible = url.replace('/b/', '/test/read.cgi/b/10689000300/');
            const text = 'スレ名\n' + loopback;
            const clip = NativeBoards.exportedClip(ClipData.newPlainText('URL', text));
            check(String(clip.getItemAt(0).getText()) === 'スレ名\n' + source, site + ' clipboard exports official thread URL');
            check(String(NativeBoards.copiedText(legacy)) === url, site + ' saved mirror board exports official URL');
            for (const address of [loopback, compatible, legacy.replace('://' + 'die-or.work/' + site + '/b/',
                '://die-or.work/test/read.cgi/' + site + '/b/1449000300/')]) {
                const open = Intent.$new(ViewAction, Uri.parse(address));
                Helpers.prepareExternalIntent(open);
                check(String(open.getDataString()) === source, site + ' browser exports ' + address.split('/')[2]);
            }
            const browserTarget = Intent.$new(ViewAction, Uri.parse(loopback));
            NativeBoards.prepareBrowserChooser(browserTarget);
            const chooser = Intent.createChooser(browserTarget, null);
            const target = Java.cast(chooser.getParcelableExtra('android.intent.extra.INTENT'), Intent);
            check(String(target.getDataString()) === source, site + ' other-app chooser exports official thread URL');
            const webView = Intent.$new(ViewAction, Uri.parse(loopback))
                .setClassName(app.getPackageName(), 'jp.syoboi.a2chMate.activity.WebViewActivity');
            Helpers.prepareExternalIntent(webView);
            check(String(webView.getDataString()) === source, site + ' built-in browser exports official thread URL');
            const internal = Intent.$new(ViewAction, Uri.parse(loopback)).setPackage(app.getPackageName());
            Helpers.prepareExternalIntent(internal);
            check(String(internal.getDataString()) === loopback, site + ' internal reader retains gateway route');
        }
        check(String(NativeBoards.copiedText('https://example.org/test/read.cgi/b/1449000300/')) ===
            'https://example.org/test/read.cgi/b/1449000300/', 'ordinary URLs are preserved');
        send({stage:'futaba-list-export',checks,publicPosts:0});
    } finally {
        instance.set(null, previous);
        prefs.edit().clear().commit();
    }
});
