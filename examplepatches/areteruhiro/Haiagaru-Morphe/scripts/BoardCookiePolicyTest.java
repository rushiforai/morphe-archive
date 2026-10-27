package app.morphe.extension.chmate;
public final class BoardCookiePolicyTest {
 static int n;
 static void eq(Object a,Object b){if(!java.util.Objects.equals(a,b))throw new AssertionError(a+" != "+b);n++;}
 public static void main(String[] args){
  eq(BoardCookiePolicy.board("https://egg.5ch.io/test/read.cgi/android/123/",null),"https://egg.5ch.io/android/");
  eq(BoardCookiePolicy.board("http://egg.5ch.io/android/subject.txt",null),"https://egg.5ch.io/android/");
  eq(BoardCookiePolicy.board("https://egg.5ch.io/test/bbs.cgi","android"),"https://egg.5ch.io/android/");
  eq(BoardCookiePolicy.board("https://egg.5ch.io/test/bbs.cgi",null),null);
  eq(BoardCookiePolicy.board("https://user@egg.5ch.io/android/",null),null);
  eq(BoardCookiePolicy.board("file:///android/",null),null);
  eq(BoardCookiePolicy.board("https://example.org/test/bbs.cgi","../other"),null);
  eq(BoardCookiePolicy.formBoard("a=1&bbs=android&b=2"),"android");
  eq(BoardCookiePolicy.formBoard("bbs=android&board=other"),null);
  eq(BoardCookiePolicy.formBoard("%62bs=android&bbs=android"),"android");
  eq(BoardCookiePolicy.formBoard("bbs=%2Fandroid"),null);
  eq(BoardCookiePolicy.formBoard("bbs=%GG"),null);
  eq(BoardCookiePolicy.sameServer("https://egg.5ch.io/android/","http://egg.5ch.io/test/bbs.cgi"),true);
  eq(BoardCookiePolicy.sameServer("https://egg.5ch.io/android/","https://other.5ch.io/test/bbs.cgi"),false);
  eq(BoardCookiePolicy.sameServer("https://egg.5ch.io/android/","https://egg.5ch.io:8443/"),false);
  eq(BoardCookiePolicy.sameServer("https://egg.5ch.io/android/","https://user@egg.5ch.io/"),false);
  eq(BoardCookiePolicy.cookieKey("sid=a; Path=/; Domain=EXAMPLE.ORG"),BoardCookiePolicy.cookieKey("sid=b; domain=example.org; path=/"));
  eq(BoardCookiePolicy.cookieKey("sid=a; Path=/a").equals(BoardCookiePolicy.cookieKey("sid=a; Path=/b")),false);
  eq(BoardCookiePolicy.matches("a=1; Path=/test; secure","https://egg.5ch.io/test/bbs.cgi"),true);
  eq(BoardCookiePolicy.matches("a=1; Path=/test; secure","http://egg.5ch.io/test/bbs.cgi"),false);
  eq(BoardCookiePolicy.matches("a=1; Path=/test","https://egg.5ch.io/testing"),false);
  eq(BoardCookiePolicy.matches("a=1; Path=/test","https://egg.5ch.io/test"),true);
  eq(BoardCookiePolicy.matches("a=1; Domain=.5ch.io; Path=/","https://egg.5ch.io/test"),true);
  eq(BoardCookiePolicy.matches("a=1; Domain=evil5ch.io; Path=/","https://egg.5ch.io/test"),false);
  System.out.println("BoardCookiePolicy: "+n+" passed");
 }
}
