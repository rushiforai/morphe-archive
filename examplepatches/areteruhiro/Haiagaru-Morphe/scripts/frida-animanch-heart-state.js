// Uses a private, temporary preferences file and an in-process fixture transport.
Java.perform(() => {
    const p = 'app.morphe.extension.chmate.';
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!String(app.getPackageName()).endsWith('.haiagaru.reporter242'))
        throw Error('Use the isolated 242 reporter package');
    const Gateway = Java.use(p + 'SiteBoardGateway');
    const Transport = Java.use(p + 'SiteBoardGateway$Transport');
    const Response = Java.use(p + 'SiteBoardGateway$Response');
    const Action = Java.use(p + 'SiteBoardGateway$AnimanchAction');
    const Board = Java.use(p + 'SiteBoardProtocol');
    const JString = Java.use('java.lang.String');
    const source = 'https://bbs.animanch.com/board/123/';
    const fixture = count => "<title>fixture</title><ul id=resList><li id=res1><div class=resheader>"
        + "<button class='vote good' data='responce-123-1-1'><span class=vcount>" + count
        + "</span></button></div><div class=resbody>fixture</div></li></ul>";
    const bytes = text => JString.$new(text).getBytes('UTF-8');
    let posts = 0, checks = 0, receipt = '{"good":true}';
    const Fixture = Java.registerClass({
        name: 'app.haiagaru.tests.AnimanchHeartFixture',
        implements: [Java.use('java.lang.reflect.InvocationHandler')],
        methods: {
            invoke(proxy, method, args) {
                switch (String(method.getName())) {
                    case 'get': return Response.$new(200, bytes(fixture(9)), 'text/html; charset=UTF-8', null);
                    case 'post': posts++; return Response.$new(200, bytes(receipt), 'application/json; charset=UTF-8', null);
                    default: throw Error('Unexpected transport call ' + method.getName());
                }
            }
        }
    });
    const prefs = app.getSharedPreferences('haiagaru.test.animanch-heart.' + Date.now(), 0);
    const transport = Java.cast(Java.use('java.lang.reflect.Proxy').newProxyInstance(
        app.getClassLoader(), Java.array('java.lang.Class', [Transport.class]), Fixture.$new()), Transport);
    function check(ok, label) {
        if (!ok) throw Error(label);
        checks++;
        send('PASS ' + label);
    }
    function read(gateway, count) {
        gateway.thread(Board.address(source), '123', fixture(count));
        const actions = gateway.animanchActions('123');
        return Java.cast(actions.get(Java.use('java.lang.Integer').valueOf(1)), Action);
    }
    try {
        prefs.edit().putBoolean('bbs.haiagaru_site_animanch.enable', true).commit();
        const gateway = Gateway.$new(prefs, transport);
        const first = read(gateway, 9);
        check(String(first.heartLabel()) === '♡ 9', 'existing server count');
        try { gateway.runAnimanchAction('123', 1, false, first); throw Error('accepted malformed receipt'); }
        catch (error) { if (String(error).includes('accepted malformed receipt')) throw error; }
        check(String(first.heartLabel()) === '♡ 9', 'failed vote leaves the original label');
        receipt = '{"good":"10"}';
        gateway.runAnimanchAction('123', 1, false, first);
        check(String(first.heartLabel()) === '❤ 10', 'successful vote immediately updates mark and count');
        gateway.runAnimanchAction('123', 1, false, first);
        check(posts === 2, 'saved vote avoids duplicate request');
        const reopened = Gateway.$new(prefs, transport);
        check(String(Java.cast(reopened.animanchActions('123').get(
            Java.use('java.lang.Integer').valueOf(1)), Action).heartLabel()) === '❤ 10',
            'cached thread can display saved count and mark without a fetch');
        check(String(read(reopened, 14).heartLabel()) === '❤ 14', 'saved mark survives reconstruction and count refreshes');
        send({stage:'animanch-heart-state', checks, publicPosts:0});
    } finally {
        prefs.edit().clear().commit();
    }
});
