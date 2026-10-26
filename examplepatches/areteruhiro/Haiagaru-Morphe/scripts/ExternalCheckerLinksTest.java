package app.morphe.extension.chmate;
public final class ExternalCheckerLinksTest {
 public static void main(String[] args){int n=0;
 for(String scheme:new String[]{"http","https"})for(String host:new String[]{"bbs.eddibb.cc","v1ch.cc"})for(String suffix:new String[]{"/","/348","/1-50?x=a%2Bb#r3"}){
 String u=scheme+"://"+host+"/liveedge/1792587764"+suffix;
 if(!ExternalCheckerLinks.normalizeEdge(u).equals(scheme+"://"+host+"/test/read.cgi/liveedge/1792587764"+suffix))throw new AssertionError(u);n++;
 }
 for(String u:new String[]{"https://bbs.eddibb.cc/test/read.cgi/liveedge/1792587764/348","http://hissi.org/read.php/android/20261025/abc.html","https://example.org/liveedge/1792587764/","https://bbs.eddibb.cc.evil.test/liveedge/1792587764/","https://user@bbs.eddibb.cc/liveedge/1792587764/","https://bbs.eddibb.cc:8443/liveedge/1792587764/","https://bbs.eddibb.cc/liveedge/","invalid"}){if(!ExternalCheckerLinks.normalizeEdge(u).equals(u))throw new AssertionError(u);n++;}
 System.out.println("PASS "+n+" external checker URL cases");
 }
}
