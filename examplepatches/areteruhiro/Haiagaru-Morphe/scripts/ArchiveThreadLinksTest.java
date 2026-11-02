package app.morphe.extension.chmate;
public final class ArchiveThreadLinksTest {
 public static void main(String[] args){int n=0;
  for(String host:new String[]{"egg.5ch.net","egg.5ch.io","anago.2ch.net"})for(String suffix:new String[]{"/","/1","/l50?x=%2F#post"}){
   String s="http://"+host+"/test/read.cgi/android/1793113633"+suffix;
   if(!ArchiveThreadLinks.is5chThread(s)||!ArchiveThreadLinks.secure(s).equals("https"+s.substring(4)))throw new AssertionError(s);n++;
  }
  for(String s:new String[]{"http://evil5ch.io/test/read.cgi/a/1234567890/","http://egg.5ch.io.evil.test/test/read.cgi/a/1234567890/","http://user:pass@egg.5ch.io/test/read.cgi/a/1234567890/","http://egg.5ch.io:8080/test/read.cgi/a/1234567890/","file:///test/read.cgi/a/1234567890/","http://bbs.eddibb.cc/test/read.cgi/liveedge/1234567890/","http://egg.5ch.io/android/subject.txt","http://egg.5ch.io/a.jpg"}){if(ArchiveThreadLinks.is5chThread(s)||!ArchiveThreadLinks.secure(s).equals(s))throw new AssertionError(s);n++;}
  if(!ArchiveThreadLinks.secure("http://egg.5ch.io:80/test/read.cgi/a/1234567890/1?x=%2F#p").equals("https://egg.5ch.io/test/read.cgi/a/1234567890/1?x=%2F#p"))throw new AssertionError("default port");
  System.out.println("PASS "+(++n)+" archive thread navigation checks");
 }
}