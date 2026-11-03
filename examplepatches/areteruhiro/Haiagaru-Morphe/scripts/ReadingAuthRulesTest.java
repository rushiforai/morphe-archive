package app.morphe.extension.chmate;

public final class ReadingAuthRulesTest {
    static int checks;
    static void check(boolean ok){if(!ok)throw new AssertionError("check "+checks);checks++;}
    public static void main(String[] args){
        for(String path:new String[]{"/liveedge/subject.txt","/liveedge/subject-metadent.txt","/liveedge/dat/123.dat","/test/read.cgi/liveedge/123/"}){
            String url="https://bbs.eddibb.cc"+path;
            check(ViewingUserAgentRules.reading(url,"GET"));
            check(ViewingUserAgentRules.reading(url,"HEAD"));
            check(!ViewingUserAgentRules.reading(url,"POST"));
            check(ReadingAuthRules.page(url).equals("https://bbs.eddibb.cc/liveedge/"));
        }
        for(String url:new String[]{"https://other.invalid/liveedge/subject.txt","https://bbs.eddibb.cc.other.invalid/liveedge/subject.txt",
                "https://user@bbs.eddibb.cc/liveedge/subject.txt","http://bbs.eddibb.cc/liveedge/subject.txt",
                "https://bbs.eddibb.cc:8443/liveedge/subject.txt","https://bbs.eddibb.cc/test/bbs.cgi","bad url"}){
            check(ReadingAuthRules.page(url).equals(url));check(!ReadingAuthRules.isPage(url));
        }
        check(ReadingAuthRules.isPage("https://bbs.eddibb.cc/liveedge/"));
        check(ReadingAuthRules.isPage("https://bbs.eddibb.cc/liveedge/?test=1"));
        check(!ReadingAuthRules.isPage("https://bbs.eddibb.cc/liveedge/subject.txt"));
        check(ReadingAuthRules.page(null)==null);check(!ReadingAuthRules.isPage(null));
        for(String title:new String[]{"Just a moment...","Attention Required! | Cloudflare","確認が必要です","しばらくお待ちください","Access denied"})check(ReadingAuthRules.challengeTitle(title));
        check(!ReadingAuthRules.challengeTitle("エッヂ掲示板"));
        System.out.println("PASS ReadingAuthRules checks="+checks);
    }
}
