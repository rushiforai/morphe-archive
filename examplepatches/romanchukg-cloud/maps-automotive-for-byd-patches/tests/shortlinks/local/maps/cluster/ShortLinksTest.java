// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;
import android.content.*;import android.net.Uri;import com.sun.net.httpserver.HttpServer;import java.net.InetSocketAddress;import java.util.concurrent.TimeUnit;
/** Host checks for 55B ShortLinks: link recognition, Google Maps-only redirects, redelivery with extras. */
public class ShortLinksTest{
 static int pass,fail;static void check(boolean ok,String w){if(ok)pass++;else{fail++;System.out.println("FAIL "+w);}}
 public static void main(String[] a)throws Exception{
  check(ShortLinks.isShortLink(Uri.parse("https://maps.app.goo.gl/HZH1tAkK7hZGfnre8")),"short link");
  check(ShortLinks.isShortLink(Uri.parse("https://MAPS.APP.GOO.GL/abc")),"case-insensitive host");
  check(!ShortLinks.isShortLink(Uri.parse("http://maps.app.goo.gl/abc")),"http rejected");
  check(!ShortLinks.isShortLink(Uri.parse("https://maps.app.goo.gl/")),"empty id rejected");
  check(!ShortLinks.isShortLink(Uri.parse("https://goo.gl/maps/abc")),"other host not intercepted");
  check(!ShortLinks.isShortLink(Uri.parse("https://www.google.com/maps/dir/x")),"long URL not intercepted");
  check(!ShortLinks.isShortLink(null),"null");
  for(String ok:new String[]{"https://www.google.com/maps/dir/A/B","https://google.de/maps/place/x","https://www.google.co.uk/maps","https://maps.google.com/?q=x","https://www.google.com.ua/maps/@1,2,3z"})check(ShortLinks.isMapsUrl(ok),"maps url "+ok);
  for(String bad:new String[]{"http://www.google.com/maps/dir/x","https://evil.com/maps/x","https://www.google.com.evil.com/maps/x","https://www.google.com/search?q=x","https://google.evil/maps","https://www.google.com/mapsfoo","javascript:alert(1)","https://www.google.com@evil.com/maps"})check(!ShortLinks.isMapsUrl(bad),"rejected "+bad);
  ShortLinks.RETRY_DELAYS_MS=new long[]{10,20,40};
  int[] hits={0},closeHeaders={0},flaky={0},fresh={0},gone={0};
  HttpServer s=HttpServer.create(new InetSocketAddress("127.0.0.1",0),0);
  s.createContext("/good",x->{hits[0]++;if("close".equalsIgnoreCase(x.getRequestHeaders().getFirst("Connection")))closeHeaders[0]++;x.getResponseHeaders().add("Location","https://www.google.com/maps/dir/A/B");x.sendResponseHeaders(302,-1);x.close();});
  s.createContext("/evil",x->{x.getResponseHeaders().add("Location","https://evil.com/maps/x");x.sendResponseHeaders(302,-1);x.close();});
  s.createContext("/flaky",x->{if(flaky[0]-->0){x.close();return;}x.getResponseHeaders().add("Location","https://www.google.com/maps/dir/A/B");x.sendResponseHeaders(302,-1);x.close();});
  s.createContext("/fresh",x->{if(fresh[0]-->0){x.sendResponseHeaders(404,-1);x.close();return;}x.getResponseHeaders().add("Location","https://www.google.com/maps/dir/A/B");x.sendResponseHeaders(302,-1);x.close();});
  s.createContext("/gone",x->{gone[0]++;x.sendResponseHeaders(404,-1);x.close();});
  s.createContext("/ok",x->{x.sendResponseHeaders(200,-1);x.close();});
  s.start();String base="http://127.0.0.1:"+s.getAddress().getPort();
  check("https://www.google.com/maps/dir/A/B".equals(ShortLinks.resolve(base+"/good")[0])&&ShortLinks.resolve(base+"/good")[1]==null,"302 to Maps resolved");
  check(ShortLinks.resolve(base+"/evil")[0]==null&&"redirect to a non-Maps URL".equals(ShortLinks.resolve(base+"/evil")[1]),"302 to other host ignored");
  check(ShortLinks.resolve(base+"/ok")[0]==null&&"HTTP 200".equals(ShortLinks.resolve(base+"/ok")[1]),"200 ignored with code");
  check(hits[0]>0&&closeHeaders[0]==hits[0],"every request asks for a fresh connection "+closeHeaders[0]+"/"+hits[0]);
  flaky[0]=1;check("https://www.google.com/maps/dir/A/B".equals(ShortLinks.resolve(base+"/flaky")[0]),"one failed attempt retried");
  fresh[0]=2;String[] fr=ShortLinks.resolve(base+"/fresh");check("https://www.google.com/maps/dir/A/B".equals(fr[0])&&fr[1]==null,"404 twice then redirect resolved");
  String[] gn=ShortLinks.resolve(base+"/gone");check(gn[0]==null&&gone[0]==4&&"HTTP 404 then HTTP 404 then HTTP 404 then HTTP 404".equals(gn[1]),"404 retried 3 times then given up "+gone[0]+" "+gn[1]);
  int okHits=hits[0];String[] ok200=ShortLinks.resolve(base+"/ok");check("HTTP 200".equals(ok200[1]),"200 not retried");
  String[] dead=ShortLinks.resolve("http://127.0.0.1:1/x");check(dead[0]==null&&"ConnectException then ConnectException then ConnectException then ConnectException".equals(dead[1]),"connection error retried 3 times "+dead[1]);
  s.stop(0);
  // intercept + delivery
  Context c=new Context();MicrogProvider.ctx=c;
  Intent plain=new Intent();plain.setData(Uri.parse("https://www.google.com/maps/dir/A/B"));
  check(!ShortLinks.intercept(plain),"long URL passes through");
  Intent done=new Intent();done.setData(Uri.parse("https://maps.app.goo.gl/abc"));done.putExtra(ShortLinks.RESOLVED,true);
  check(!ShortLinks.intercept(done),"already resolved passes through");
  MicrogProvider.ctx=null;Intent noctx=new Intent();noctx.setData(Uri.parse("https://maps.app.goo.gl/abc"));
  check(!ShortLinks.intercept(noctx),"no context passes through");MicrogProvider.ctx=c;
  check(!ShortLinks.intercept(null),"null intent");
  Intent sent=new Intent();sent.setData(Uri.parse("https://maps.app.goo.gl/abc"));sent.putExtra("SEND_TO_CAR_INTENT","FIRST_SHOW_ACTIVITY_IN_FOREGROUND");sent.putExtra("SEND_TO_CAR_AUTH_TOKEN_EXTRA","t");
  check(ShortLinks.intercept(sent),"short link handled");
  Runnable r=android.os.Handler.posted.poll(10,TimeUnit.SECONDS);check(r!=null,"delivery posted to main");
  if(r!=null)r.run();
  check(c.started.size()==1,"one delivery");
  if(c.started.size()==1){Intent d=c.started.get(0);
   check(d.getBooleanExtra(ShortLinks.RESOLVED,false),"marked resolved");
   check("FIRST_SHOW_ACTIVITY_IN_FOREGROUND".equals(d.extra("SEND_TO_CAR_INTENT"))&&"t".equals(d.extra("SEND_TO_CAR_AUTH_TOKEN_EXTRA")),"send-to-car extras kept");
   check(d.getComponent()!=null&&ShortLinks.ACTIVITY.equals(d.getComponent().cls),"explicit MapsActivity");
   check((d.flags&Intent.FLAG_ACTIVITY_NEW_TASK)!=0,"new task flag");
   check(sent.extra(ShortLinks.RESOLVED)==null,"original intent untouched");}
  Intent fb=new Intent();ShortLinks.deliver(c,fb,null,"HTTP 500");
  check(android.util.Log.lines.stream().anyMatch(l->l.contains("not expanded (HTTP 500)")),"failure reason logged");
  check(c.started.size()==2&&c.started.get(1).getData()==null&&c.started.get(1).getBooleanExtra(ShortLinks.RESOLVED,false),"fallback keeps data, marks resolved");
  Intent ok=new Intent();ok.setData(Uri.parse("https://maps.app.goo.gl/abc"));ShortLinks.deliver(c,ok,"https://www.google.com/maps/dir/A/B");
  check("https://www.google.com/maps/dir/A/B".equals(c.started.get(2).getData().toString()),"expanded URL delivered");
  check(android.util.Log.lines.stream().noneMatch(l->l.contains("google.com/maps")||l.contains("goo.gl")),"no URL in log "+android.util.Log.lines);
  System.out.println((fail==0?"PASS":"FAIL")+" shortlinks: "+pass+" passed, "+fail+" failed");System.exit(fail==0?0:1);
 }
}
