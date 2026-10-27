package app.morphe.extension.chmate;
public final class VerifyBoardAuthRules {
    private static int checks;
    private static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
    private static void invalid(String value){try{BoardAuthRules.validate(value);throw new AssertionError("accepted unsafe URL");}catch(IllegalArgumentException expected){checks++;}}
    public static void main(String[] args){
        check(BoardAuthRules.origin("https://BBS.EDDIBB.CC:443/liveedge/").equals("https://bbs.eddibb.cc"),"origin normalization");
        check(BoardAuthRules.origin("https://board.example:8443/a/").equals("https://board.example:8443"),"port isolation");
        check(BoardAuthRules.preset("https://bbs.eddibb.cc/liveedge").equals("https://bbs.eddibb.cc/auth-code"),"Edge preset");
        check(BoardAuthRules.preset("https://bbs.eddibb.cc.evil.example/").isEmpty(),"no suffix confusion");
        check(BoardAuthRules.preset("https://other.example/").isEmpty(),"no guessed path for unknown boards");
        invalid("http://board.example/auth");invalid("javascript:alert(1)");invalid("file:///data/data/auth");
        invalid("https://user:password@board.example/auth");invalid("https://board.example/auth#secret");invalid(null);
        check(BoardAuthRules.required("認証が必要です"),"Japanese error");
        check(BoardAuthRules.required("認証コードを入力してください"),"code error");
        check(BoardAuthRules.required("Authentication Required"),"English error");
        check(BoardAuthRules.identityCookie("countsession"),"ex0ch session protected");
        check(BoardAuthRules.identityCookie("securitykey"),"session signature protected");
        check(!BoardAuthRules.identityCookie("cf_clearance"),"clearance is not identity");
        check(!BoardAuthRules.identityCookie("countsession_other"),"identity exact name only");
        check(BoardAuthRules.required("CAPTCHAが必要です"),"CAPTCHA required");
        check(BoardAuthRules.required("reCAPTCHA verification failed"),"reCAPTCHA error");
        check(BoardAuthRules.required("画像認証を完了してください"),"image challenge");
        check(BoardAuthRules.required("人間であることを確認してください"),"human verification");
        check(BoardAuthRules.suggested("https://board.example/a/", "CAPTCHA: https://board.example/challenge?token=abc").equals("https://board.example/challenge?token=abc"),"same-origin CAPTCHA URL");
        check(BoardAuthRules.suggested("https://board.example/a/", "CAPTCHA: https://evil.example/challenge").isEmpty(),"no cross-origin automatic challenge suggestion");
        check(!BoardAuthRules.required("書き込みに成功しました"),"success ignored");
        String browserError="計算による投稿確認 専用ブラウザからは投稿出来ません。通常のブラウザを使ってください。";
        check(BoardAuthRules.required(browserError),"proof-of-work error detected");
        check(BoardAuthRules.browserRequired(browserError),"explicit browser-only route");
        check(BoardAuthRules.browserRequired(browserError.replace("計算による投稿確認","Captcha認証")),"browser-only CAPTCHA route");
        check(!BoardAuthRules.browserRequired("計算による投稿確認"),"no browser prohibition inferred");
        check(!BoardAuthRules.browserRequired(null),"null browser requirement");
        check(!BoardAuthRules.browserRequired(browserError+"x".repeat(65536)),"bounded browser scan");
        check(BoardAuthRules.browserPage("https://043044.xyz/krsw/?token=private#post").equals("https://043044.xyz/krsw/"),"strip query and fragment from browser destination");
        check(BoardAuthRules.browserPage("https://043044.xyz/test/bbs.cgi?draft=private").equals("https://043044.xyz/"),"never navigate to submission endpoint");
        check(BoardAuthRules.browserPage("javascript:alert(1)").isEmpty(),"reject script browser destination");
        check(BoardAuthRules.browserPage("https://name:secret@043044.xyz/krsw/").isEmpty(),"reject embedded browser credentials");
        check(!BoardAuthRules.required(null),"null ignored");
        check(!BoardAuthRules.required("x".repeat(65537)+"認証コード"),"bounded scan");
        check(BoardAuthRules.suggested("https://bbs.eddibb.cc/liveedge/","認証が必要です").endsWith("/auth-code"),"known board fallback");
        check(BoardAuthRules.suggested("https://other.example/a/","認証が必要です").isEmpty(),"unknown board requires configuration");
        check(BoardAuthRules.suggested("https://board.example/a/","認証コード: https://board.example/check?x=1&amp;y=2").equals("https://board.example/check?x=1&y=2"),"same origin link");
        check(BoardAuthRules.suggested("https://board.example/a/","認証コード: https://evil.example/check").isEmpty(),"cross site suggestion rejected");
        check(BoardAuthRules.suggested("https://board.example/a/","認証コード: /auth-code").equals("https://board.example/auth-code"),"relative auth link");
        check(BoardAuthRules.suggested("https://board.example/a/","https://board.example/check").isEmpty(),"ordinary link ignored");
        String cssError="<link rel='stylesheet' href='https://043044.xyz/test/datas/design.css'>認証が必要です <a href='https://043044.xyz/check'>認証</a>";
        check(BoardAuthRules.suggested("https://043044.xyz/krsw/",cssError).equals("https://043044.xyz/check"),"stylesheet preceding real authentication link excluded");
        check(BoardAuthRules.suggested("https://043044.xyz/krsw/","CAPTCHA https://043044.xyz/test/datas/design.css").isEmpty(),"CSS-only error cannot become authentication page");
        for(String resource:new String[]{"style.css?x=1","script.JS","logo.png","font.woff2","style%2ecss","test/bbs.cgi?x=1","write.cgi","subbbs.cgi"}) {
            boolean rejected=false;try{BoardAuthRules.validateAuthPage("https://board.example/"+resource);}catch(IllegalArgumentException expected){rejected=true;}
            check(rejected,"resource/submission URL rejected "+resource);
        }
        check(BoardAuthRules.validateAuthPage("https://board.example/auth.php?token=abc").endsWith("auth.php?token=abc"),"real auth query preserved");
        check(BoardAuthRules.configuredPage("https://043044.xyz/krsw/","https://043044.xyz/test/datas/design.css","").isEmpty(),"bad stored CSS requires reconfiguration, no guessed auth path");
        check(BoardAuthRules.configuredPage("https://043044.xyz/krsw/","https://043044.xyz/test/datas/design.css","https://043044.xyz/check").equals("https://043044.xyz/check"),"valid suggestion replaces bad stored CSS");
        check(BoardAuthRules.configuredPage("https://bbs.eddibb.cc/liveedge/","https://bbs.eddibb.cc/style.css","").equals("https://bbs.eddibb.cc/auth-code"),"known board preset replaces bad stored CSS");
        check(BoardAuthRules.configuredPage("https://board.example/a/","https://board.example/verify","https://board.example/other").equals("https://board.example/verify"),"valid saved authentication URL retained");
        check(BoardAuthRules.validate("https://board.example/auth?x=1").equals("https://board.example/auth?x=1"),"explicit configurable URL");
        check(BoardAuthRules.code("認証コード: AbC12-34_xyz\n認証してください").equals("AbC12-34_xyz"),"exact code preserved");
        check(BoardAuthRules.code("認証コード：「123456」").equals("123456"),"quoted Japanese code");
        check(BoardAuthRules.code("Auth code = ABC123").equals("ABC123"),"English code");
        check(BoardAuthRules.code("認証コード'123456'を用いて、以下のURLから認証を行ってください").equals("123456"),"board error quoted code without colon");
        check(BoardAuthRules.code("認証コード「ABC123」を入力").equals("ABC123"),"Japanese quotes without colon");
        check(BoardAuthRules.code("認証コード: https://board.example/auth-code").isEmpty(),"auth URL is not a code");
        check(BoardAuthRules.code("認証コードを入力してください").isEmpty(),"instructions are not a code");
        check(BoardAuthRules.code("認証コード: "+"a".repeat(256)).isEmpty(),"no truncated code");
        check(BoardAuthRules.code("認証コード: "+"a".repeat(65536)).isEmpty(),"bounded code scan");
        check(BoardAuthRules.code(null).isEmpty(),"null code");
        check(BoardAuthRules.code("認証コード: ab").isEmpty(),"ambiguous short code uses full-error fallback");
        System.out.println("PASS "+checks+" external-board auth policy checks");
    }
}
