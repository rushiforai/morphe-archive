package e.e.a;

import java.net.HttpURLConnection;
import java.net.URL;

public final class WatchRequestHeadersTest {
 static final class Connection extends HttpURLConnection {
  Connection(String url)throws Exception {super(new URL(url));}
  public void connect(){}
  public void disconnect(){}
  public boolean usingProxy(){return false;}
 }
 public static void main(String[] args)throws Exception {
  for(String path:new String[]{"watch/1789360795?responseType=json","api/watch/v3/1789360795","api/watch/v3_guest/1790838914"}) {
   String url="https://www.nicovideo.jp/"+path;
   Connection c=new Connection(url);
   WatchRequestHeaders.apply(c,url);
   require("*/*".equals(c.getRequestProperty("Accept")));
   require(c.getRequestProperty("User-Agent").contains("Chrome/120.0"));
   require("https://www.nicovideo.jp/".equals(c.getRequestProperty("Referer")));
  }
  Connection other=new Connection("https://nvapi.nicovideo.jp/v1/users/me");
  WatchRequestHeaders.apply(other,other.getURL().toString());
  require("application/json".equals(other.getRequestProperty("Accept")));
  require(other.getRequestProperty("User-Agent")==null);
  require(other.getRequestProperty("Referer")==null);
  System.out.println("Watch request headers passed");
 }
 static void require(boolean value){if(!value)throw new AssertionError();}
}
