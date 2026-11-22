// Offline Frida smoke test for Animanch action failure classification.
// It never opens a board URL and never submits a heart/delete request.
Java.perform(function () {
    const Gateway = Java.use('app.morphe.extension.chmate.SiteBoardGateway');
    const Protocol = Java.use('app.morphe.extension.chmate.AnimanchProtocol');
    const IOException = Java.use('java.io.IOException');
    const RuntimeException = Java.use('java.lang.RuntimeException');
    const SocketTimeoutException = Java.use('java.net.SocketTimeoutException');
    let checks = 0;
    function check(value, label) {
        if (!value) throw new Error('FAIL ' + label);
        checks++;
        console.log('PASS ' + label);
    }

    const failure = Gateway.animanchActionFailure.overload('java.lang.Throwable');
    const timeout = String(failure.call(Gateway, SocketTimeoutException.$new('fixture')));
    check(timeout.indexOf('タイムアウト') >= 0, 'timeout has distinct guidance');

    const missingCookie = 'あにまんの認証Cookieが操作先にありません。設定から認証をやり直し、「認証情報を利用」を押してください';
    const cookieError = String(failure.call(Gateway, IOException.$new(missingCookie)));
    check(cookieError === missingCookie, 'missing auth cookie is reported directly');

    const safeFallback = String(failure.call(Gateway, RuntimeException.$new('fixture-secret')));
    check(safeFallback.indexOf('fixture-secret') < 0 && safeFallback.indexOf('認証状態') >= 0,
        'unexpected exceptions do not expose raw details');

    const challenge = Protocol.cloudflareChallenge.overload('java.lang.String');
    check(challenge.call(Protocol,
        "<title>Just a moment...</title><script src='https://challenges.cloudflare.com/turnstile/v0/api.js'></script>"),
        'Cloudflare challenge is identified');
    check(!challenge.call(Protocol, '<title>thread</title><p>ordinary page</p>'),
        'ordinary page is not classified as authentication challenge');

    const responseError = Gateway.animanchActionResponseError.overload('int', 'java.lang.String');
    const forbidden = String(responseError.call(Gateway, 403, '<title>Forbidden</title>'));
    check(forbidden.indexOf('HTTP 403') >= 0 && forbidden.indexOf('認証') >= 0,
        'HTTP 403 explains authentication rejection');
    const challenged = String(responseError.call(Gateway, 403,
        "<title>Just a moment...</title><script src='https://challenges.cloudflare.com/turnstile/v0/api.js'></script>"));
    check(challenged.indexOf('Cloudflare') >= 0 && challenged.indexOf('認証') >= 0,
        'Cloudflare response explains reauthentication');
    const serverMessage = String(responseError.call(Gateway, 200,
        '{"error":"認証を確認してください"}'));
    check(serverMessage.indexOf('認証を確認してください') >= 0,
        'explicit server rejection remains visible');

    const thread = Protocol.thread.overload('java.lang.String', 'java.lang.String');
    const html = "<title>fixture｜あにまん掲示板</title>" +
        "<link rel='canonical' href='https://bbs.animanch.com/board/123/'>" +
        "<ul id='resList'>" +
        "<li id='res1'><div class='resheader'><button class='delete' data='del:op'></button></div><span class='resname'>n</span><span class='resposted'>d</span><div class='resbody'>op</div></li>" +
        "<li id='res2'><div class='resheader'><button class='vote good' data='responce-123-2-1'></button><button class='delete' data='del:abc'></button></div><span class='resname'>n</span><span class='resposted'>d</span><div class='resbody'>reply</div></li>" +
        "<li id='res3'><div class='resheader'><button class='vote good' data='responce-124-3-1'></button></div><span class='resname'>n</span><span class='resposted'>d</span><div class='resbody'>mismatch</div></li>" +
        "</ul>";
    const page = thread.call(Protocol, html, 'https://bbs.animanch.com/board/123/');
    const replies = page.replies.value;
    const Reply = Java.use('app.morphe.extension.chmate.AnimanchProtocol$Reply');
    check(replies.size() === 3, 'synthetic action page parses without network');
    const reply2 = Java.cast(replies.get(1), Reply);
    const reply3 = Java.cast(replies.get(2), Reply);
    const reply1 = Java.cast(replies.get(0), Reply);
    check(reply2.heart.value && reply2.own.value,
        'matching heart and self-delete tokens are recognized');
    check(!reply3.heart.value && !reply1.own.value,
        'wrong-thread heart and opening-post delete are rejected');

    send({type:'animanch-action-diagnostic',checks:checks,testNetworkCalls:0,heartDeletePosts:0});
});
