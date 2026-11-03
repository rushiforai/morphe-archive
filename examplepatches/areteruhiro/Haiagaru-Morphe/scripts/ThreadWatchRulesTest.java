package app.morphe.extension.chmate;

public final class ThreadWatchRulesTest {
    private static int checks;
    private static void check(boolean value){checks++;if(!value)throw new AssertionError("Check "+checks);}
    public static void main(String[] args){
        ThreadWatchRules.Target edge=ThreadWatchRules.target("http://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/123");
        check(edge!=null&&edge.url.equals("https://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/"));
        check(edge.subject.equals("https://bbs.eddibb.cc/liveedge/subject.txt"));
        check(ThreadWatchRules.target("https://egg.5ch.io/test/read.cgi/android/1793113633/l50")!=null);
        check(ThreadWatchRules.target("https://mercury.bbspink.com/test/read.cgi/test/1793113633/")!=null);
        for(String invalid:new String[]{"javascript:alert(1)","https://user@host/test/read.cgi/a/1793113633/","https://host:123/test/read.cgi/a/1793113633/","https://host/test/bbs.cgi","https://host/test/read.cgi/../1793113633/","https://host/test/read.cgi/a/notanid/",null})check(ThreadWatchRules.target(invalid)==null);
        java.util.Map<String,Integer> counts=ThreadWatchRules.counts("1793457978.dat<>title (with brackets) (83)\r\n1793113633.dat<>test (1000)\n1793113634.dat<>bad (abc)\n");
        check(counts.size()==2&&counts.get("1793457978")==83&&counts.get("1793113633")==1000);
        for(String invalid:new String[]{"<!doctype html><html>challenge</html>","<html>\n1793457978.dat<>fake (123)\n</html>","unavailable",null})check(ThreadWatchRules.counts(invalid).isEmpty());
        check(ThreadWatchRules.increase(-1,10)==0);
        check(ThreadWatchRules.increase(10,10)==0);
        check(ThreadWatchRules.increase(10,5)==0);
        check(ThreadWatchRules.increase(10,15)==5);
        check(edge.dat.equals("https://bbs.eddibb.cc/liveedge/dat/1793457978.dat"));
        check(ThreadWatchRules.titles("1793113633.dat<>Title (part 2) &amp; test (12)\n").get("1793113633").equals("Title (part 2) &amp; test"));
        check(ThreadWatchRules.titles("<html>\n1793113633.dat<>fake (12)\n").isEmpty());
        String dat="name<>mail<>date<>old<>title\nname<><>date<>new &amp; <b>bold</b><>\nname<><>date<>second<br>line<>\n";
        check(ThreadWatchRules.bodies(dat,1,3).size()==2);
        check(ThreadWatchRules.bodies(dat,1,3).get(2).equals("new &amp; <b>bold</b>"));
        check(ThreadWatchRules.bodies(dat,3,3).isEmpty());
        check(ThreadWatchRules.bodies("<html>challenge",1,3).isEmpty());
        check(ThreadWatchRules.bodies(dat,-1,3).isEmpty());
        check(ThreadWatchRules.bodies("broken\n",0,1).isEmpty());
        check(ThreadWatchRules.bodies("<b>name</b><>mail<>date<>body<>title\n",0,1).get(1).equals("body"));
        check(ThreadWatchRules.bodies("<>mail<>date<>anonymous body<>title\n",0,1).get(1).equals("anonymous body"));
        check(ThreadWatchRules.bodies(dat+dat,0,6).keySet().equals(new java.util.LinkedHashSet<>(java.util.Arrays.asList(4,5,6))));
        System.out.println("ThreadWatchRules: "+checks+" passed");
    }
}
