package app.morphe.extension.chmate;

import java.util.Arrays;

public class VerifyViewingUserAgent {
    static int count;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);count++;System.out.println("PASS "+label);}
    public static void main(String[] args){
        for(String path:new String[]{"/android/subject.txt","/android/SETTING.TXT","/android/dat/1792102288.dat",
                "/news4ssnip/kako/1464/14644/1464424549.dat","/test/read.cgi/android/1792102288/",
                "/bbs/read.cgi/test/123/1234/","/bbsmenu.html"})
            check(ViewingUserAgentRules.reading("https://bbs.example.invalid"+path,"GET"),"read endpoint "+path);
        check(ViewingUserAgentRules.reading("https://bbs.example.invalid/android/subject.txt","HEAD"),"HEAD read allowed");
        check(!ViewingUserAgentRules.reading("https://bbs.example.invalid/android/subject.txt","POST"),"POST unchanged even on read path");
        for(String path:new String[]{"/test/bbs.cgi","/bbs/write.cgi/test/123/","/auth-code","/captcha","/3/image","/3/upload","/signin","/"})
            for(String method:new String[]{"GET","POST"})
                check(!ViewingUserAgentRules.reading("https://bbs.example.invalid"+path,method),"excluded "+method+" "+path);
        for(String url:new String[]{"file:///android/subject.txt","https://user:password@bbs.example.invalid/android/subject.txt","bad url",null})
            check(!ViewingUserAgentRules.reading(url,"GET"),"invalid/nonHTTP URI unchanged");
        check(ViewingUserAgentRules.valid("Test Agent/1.0"),"valid header");
        for(String value:new String[]{"",null,"Agent\r\nCookie: bad","Agent\u0000","日本語"})
            check(!ViewingUserAgentRules.valid(value),"invalid header rejected");
        String[] original={"User-Agent","native","Cookie","dummy","user-agent","duplicate","X-Test","keep"};
        String[] changed=ViewingUserAgentRules.headers(original,"Viewing-Test");
        check(Arrays.equals(changed,new String[]{"Cookie","dummy","X-Test","keep","User-Agent","Viewing-Test"}),"only UA replaced and duplicates removed");
        check(original.length==8&&original[1].equals("native"),"original headers not mutated");
        check(ViewingUserAgentRules.headers(original,"bad\nheader")==original,"invalid UA preserves original headers");
        check(ViewingUserAgentRules.headers(new String[]{"invalid"},"Agent").length==1,"malformed native headers left alone");
        System.out.println("COMPLETE checks="+count);
    }
}
