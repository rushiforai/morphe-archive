package app.morphe.extension.chmate;

public final class BoardChallengeSessionTest {
    static int checks;
    static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
    static String page(String forms){return "<!doctype html><html><head><title>計算による投稿確認</title><script src='./datas/form-pow.js'></script></head><body>"+forms+"</body></html>";}
    static String form(String action){return "<form method='POST' action='"+action+"'><input type='hidden' name='MESSAGE' value='fixture only'><button type='button'>計算を開始</button><button>認証する</button></form>";}
    public static void main(String[] args){
        String board="https://board.example/a/",html=page(form("./bbs.cgi"));
        check(BoardChallengeSession.baseUrl(board,html).equals("https://board.example/test/bbs.cgi"),"relative native posting endpoint");
        for(String action:new String[]{"bbs.cgi","/test/bbs.cgi","https://board.example/test/bbs.cgi","https://board.example:443/test/bbs.cgi",""})
            check(!BoardChallengeSession.baseUrl(board,page(form(action))).isEmpty(),"original same-origin form: "+action);
        for(String action:new String[]{"http://board.example/test/bbs.cgi","https://evil.example/test/bbs.cgi","//evil.example/test/bbs.cgi","https://user:secret@board.example/test/bbs.cgi","javascript:alert(1)","/test/bbs.cgi#token","/test/datas/design.css","/other.cgi"})
            check(BoardChallengeSession.baseUrl(board,page(form(action))).isEmpty(),"reject unrelated action: "+action);
        check(BoardChallengeSession.baseUrl("http://board.example/a/",html).isEmpty(),"HTTPS origin required");
        check(BoardChallengeSession.baseUrl(board,"計算による投稿確認 Web Worker 計算を開始 認証する").isEmpty(),"flattened text cannot execute as a page");
        check(BoardChallengeSession.baseUrl(board,page(form("./bbs.cgi")).replace("<script src='./datas/form-pow.js'></script>","")).isEmpty(),"original script required");
        check(BoardChallengeSession.baseUrl(board,html.replace("計算による投稿確認","通常エラー")).isEmpty(),"ordinary error not executed");
        check(BoardChallengeSession.baseUrl(board,page("<base href='https://evil.example/'>"+form("./bbs.cgi"))).isEmpty(),"base cannot change form/script origin");
        check(BoardChallengeSession.baseUrl(board,page("<form method=post action=/test/bbs.cgi action=https://evil.example/test/bbs.cgi></form>")).isEmpty(),"ambiguous duplicate attributes rejected");
        check(!BoardChallengeSession.baseUrl(board,page("<FORM METHOD=POST ACTION=/test/bbs.cgi></FORM>")).isEmpty(),"unquoted uppercase attributes");
        check(BoardChallengeSession.baseUrl(board,page(form("./bbs.cgi")+form("https://evil.example/test/bbs.cgi"))).isEmpty(),"every POST form must match");
        check(BoardChallengeSession.baseUrl(board,page(form("./bbs.cgi").repeat(9))).isEmpty(),"bounded form count");
        check(BoardChallengeSession.baseUrl(board,html+"x".repeat(65536)).isEmpty(),"bounded original HTML");
        check(BoardChallengeSession.baseUrl(board,null).isEmpty(),"null HTML");
        long now=1000L;
        String token=BoardChallengeSession.remember(board,html,now);
        check(!token.isEmpty()&&!token.contains("MESSAGE"),"opaque memory token");
        BoardChallengeSession.Page stored=BoardChallengeSession.find(token,board,now);
        check(stored!=null&&stored.html==html&&stored.board.equals(board),"original page retained without rewriting fields/scripts");
        check(BoardChallengeSession.find(token,"https://board.example/b/",now)==null,"different posting target cannot consume page");
        check(BoardChallengeSession.find(token,board,now+300000000000L)==null,"five-minute expiration");
        token=BoardChallengeSession.remember(board,html,now);
        BoardChallengeSession.forget(token);check(BoardChallengeSession.find(token,board,now)==null,"finish discards original response");
        String first=BoardChallengeSession.remember(board,html,now);
        for(int n=0;n<4;n++)BoardChallengeSession.remember(board,html,now);
        check(BoardChallengeSession.find(first,board,now)==null,"bounded memory sessions");
        check(BoardChallengeSession.remember(board,"plain text",now).isEmpty(),"text-only observations cannot create sessions");
        String sjis=html.replace("<head>","<head><meta http-equiv='Content-Type' content='text/html;charset=Shift_JIS'>");
        String encoded=BoardChallengeSession.remember(board,sjis,now);
        BoardChallengeSession.Page shift=BoardChallengeSession.find(encoded,board,now);
        check(shift.encoding.equals("Shift_JIS"),"server's legacy document/form encoding retained");
        check(new String(shift.bytes(),java.nio.charset.Charset.forName("windows-31j")).equals(sjis),"Japanese original page survives round-trip");
        check(BoardChallengeSession.encoding("<meta charset='utf-8'>").equals("UTF-8"),"UTF-8 meta charset");
        check(BoardChallengeSession.encoding("<meta charset=windows-31j>").equals("Shift_JIS"),"Windows Japanese charset alias");
        String captcha=html.replace("計算による投稿確認","Captcha認証");
        check(!BoardChallengeSession.baseUrl(board,captcha).isEmpty(),"original CAPTCHA form uses the same user-operated browser flow");
        String captchaToken=BoardChallengeSession.remember(board,captcha,now);
        check(!BoardChallengeSession.find(captchaToken,board,now).calculation,"CAPTCHA receives matching instructions");
        check(BoardChallengeSession.baseUrl(board,captcha.replace("./bbs.cgi","https://evil.example/test/bbs.cgi")).isEmpty(),"CAPTCHA cannot redirect draft to another origin");
        check(BoardChallengeSession.find(captchaToken,board,now).captcha,"CAPTCHA uses the compact dialog");
        check(!shift.captcha,"calculation-only page retains its controls");
        String dual=html.replace("</form>","<div class='g-recaptcha'></div></form>");
        String dualToken=BoardChallengeSession.remember(board,dual,now);
        check(BoardChallengeSession.find(dualToken,board,now).captcha&&BoardChallengeSession.find(dualToken,board,now).calculation,"combined provider and calculation keeps both original form operations");
        System.out.println("PASS "+checks+" original posting-challenge policy/lifetime checks");
    }
}
