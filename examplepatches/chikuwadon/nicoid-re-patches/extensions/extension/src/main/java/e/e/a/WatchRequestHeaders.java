package e.e.a;

import java.net.HttpURLConnection;

final class WatchRequestHeaders {
 static void apply(HttpURLConnection connection,String url) {
  boolean watch=url.startsWith("https://www.nicovideo.jp/watch/")
      ||url.startsWith("https://www.nicovideo.jp/api/watch/");
  connection.setRequestProperty("Accept",watch?"*/*":"application/json");
  if(watch) {
   connection.setRequestProperty("User-Agent","Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36");
   connection.setRequestProperty("Referer","https://www.nicovideo.jp/");
  }
 }
}
