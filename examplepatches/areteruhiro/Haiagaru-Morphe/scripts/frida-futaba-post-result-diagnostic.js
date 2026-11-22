// Offline Frida smoke test for Futaba HTTP 200 posting responses.
// Uses only synthetic HTML; it never opens a board URL or submits a post.
Java.perform(function () {
    const Protocol = Java.use('app.morphe.extension.chmate.SiteBoardProtocol');
    const Post = Java.use('app.morphe.extension.chmate.SitePostProtocol');
    const address = Protocol.address.overload('java.lang.String');
    const board = address.call(Protocol, 'https://img.2chan.net/b/res/123456.htm');
    const success = Post.success.overload(
        'app.morphe.extension.chmate.SiteBoardProtocol$Board',
        'java.lang.String', 'int', 'java.lang.String', 'java.lang.String');
    const rejection = Post.futabaRejection.overload('java.lang.String');
    let checks = 0;
    function check(value, label) {
        if (!value) throw new Error('FAIL ' + label);
        checks++;
        console.log('PASS ' + label);
    }

    // A real Futaba-style success page contains the regenerated index's form
    // and blockquotes. Its meta refresh is the success marker.
    const normalSuccess = '<html><head><meta http-equiv="refresh" content="1;URL=futaba.htm"></head>' +
        '<body><form action="futaba.php"><blockquote>existing reply</blockquote></form>' +
        '画面を切り替えます</body></html>';
    check(success.call(Post, board, '123456', 200, null, normalSuccess),
        'HTTP 200 index response with Futaba redirect counts as success');
    check(!success.call(Post, board, '123456', 200, null,
        '<html><body><form>ordinary page</form><blockquote>content</blockquote></body></html>'),
        'ordinary form page is not a success');
    check(!success.call(Post, board, '123456', 200, null,
        '<html><head><meta http-equiv="refresh" content="1;URL=https://evil.invalid/b/futaba.htm"></head>' +
        '<body>画面を切り替えます</body></html>'), 'cross-host redirect is rejected');
    check(!success.call(Post, board, '123456', 200, null,
        '<html><head><meta http-equiv="refresh" content="1;URL=other.htm"></head>' +
        '<body>画面を切り替えます</body></html>'), 'wrong local path is rejected');

    const serverError = '<html><body><center><font color=red size=5><b>' +
        '連続投稿はもうしばらく時間を置いてからお願い致します<br><a href=futaba.htm>リロード</a>' +
        '</b></font></center></body></html>';
    const detail = String(rejection.call(Post, serverError));
    check(detail.indexOf('連続投稿はもうしばらく時間を置いてからお願い致します') >= 0 &&
        detail.indexOf('リロード') < 0 && detail.indexOf('<') < 0,
        'HTTP 200 red-font rejection is surfaced as safe text');
    check(String(rejection.call(Post,
        '<html><body>cookieを有効にしてもう一度送信してください</body></html>')).indexOf('投稿されていません') >= 0,
        'known cookie rejection is definite and allows deliberate retry');

    send({type: 'futaba-post-result-diagnostic', checks: checks,
        testNetworkCalls: 0, publicPosts: 0});
});
