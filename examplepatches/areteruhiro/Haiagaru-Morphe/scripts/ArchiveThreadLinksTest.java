package app.morphe.extension.chmate;
public final class ArchiveThreadLinksTest {
 public static void main(String[] args){int n=0;
  for(String host:new String[]{"egg.5ch.net","egg.5ch.io","anago.2ch.net"})for(String suffix:new String[]{"/","/1","/l50?x=%2F#post"}){
   String s="http://"+host+"/test/read.cgi/android/1793113633"+suffix;
   if(!ArchiveThreadLinks.is5chThread(s)||!ArchiveThreadLinks.secure(s).equals("https"+s.substring(4)))throw new AssertionError(s);n++;
  }
  for(String s:new String[]{"http://evil5ch.io/test/read.cgi/a/1234567890/","http://egg.5ch.io.evil.test/test/read.cgi/a/1234567890/","http://user:pass@egg.5ch.io/test/read.cgi/a/1234567890/","http://egg.5ch.io:8080/test/read.cgi/a/1234567890/","file:///test/read.cgi/a/1234567890/","http://bbs.eddibb.cc/test/read.cgi/liveedge/1234567890/","http://egg.5ch.io/android/subject.txt","http://egg.5ch.io/a.jpg"}){if(ArchiveThreadLinks.is5chThread(s)||!ArchiveThreadLinks.secure(s).equals(s))throw new AssertionError(s);n++;}
  if(!ArchiveThreadLinks.secure("http://egg.5ch.io:80/test/read.cgi/a/1234567890/1?x=%2F#p").equals("https://egg.5ch.io/test/read.cgi/a/1234567890/1?x=%2F#p"))throw new AssertionError("default port");
  String reported="https://egg.5ch.io/test/read.cgi/android/1784210927/";
  if(!ArchiveThreadLinks.secure(reported).equals(reported)||ArchiveThreadLinks.requiresLegacyServerRecovery(java.net.URI.create(reported).getHost()))throw new AssertionError("old live-server URL must open without navigation import");n++;
  for(String host:new String[]{"egg.5ch.io","egg.5ch.net","EＧG.invalid","EGG.5CH.IO","lavender.5ch.io","itest.5ch.io","bbs.eddibb.cc","anago.5ch.io.evil.test","evil5ch.io","2ch.net.evil.test"}){
   if(ArchiveThreadLinks.requiresLegacyServerRecovery(host))throw new AssertionError("unexpected navigation import: "+host);n++;
  }
  for(String server:new String[]{"ai","anago","awabi","daily","fox","hayabusa","hayabusa2","hayabusa3","hayabusa5","hayabusa6","hello","hope","kanae","maguro","mastiff","peace","potato","raptor","wktk"})for(String domain:new String[]{"5ch.net","5ch.io","2ch.net"}){
   if(!ArchiveThreadLinks.requiresLegacyServerRecovery(server+"."+domain))throw new AssertionError("lost obsolete-server recovery");n++;
  }
  if(ArchiveThreadLinks.requiresLegacyServerRecovery(null))throw new AssertionError("null host");n++;
  System.out.println("PASS "+(++n)+" archive thread navigation checks");
 }
}
