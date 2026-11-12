package app.morphe.extension.chmate;
import java.io.*;import java.net.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.atomic.*;import org.jsoup.Jsoup;
public final class SiteBoardCatalogTest {
 static int checks;static void ok(boolean value,String text){if(!value)throw new AssertionError(text);checks++;}
 static String get(String address)throws Exception{URL url=new URL(address);try(Socket socket=new Socket("127.0.0.1",url.getPort())){socket.setSoTimeout(30000);socket.getOutputStream().write(("GET "+url.getPath()+" HTTP/1.1\r\nHost: 127.0.0.1:"+url.getPort()+"\r\n\r\n").getBytes("US-ASCII"));return new String(socket.getInputStream().readAllBytes(),"windows-31j");}}
 public static void main(String[] args)throws Exception{
  Path dir=Path.of(args[0]);AtomicInteger requests=new AtomicInteger();AtomicBoolean fail=new AtomicBoolean();
  SiteBoardGateway.Transport transport=new SiteBoardGateway.Transport(){public SiteBoardGateway.Response get(String url)throws IOException{requests.incrementAndGet();String file;String type="application/json; charset=UTF-8";
   if(url.equals(SiteBoardMenuProtocol.source("futaba",0))){file="futabaMenu.raw";type="text/html; charset=Shift_JIS";}
   else if(url.equals(SiteBoardMenuProtocol.source("animanch",0)))file="animanchMenu.json";
   else{String region=null;for(int n=0;n<15;n++)if(url.equals(SiteBoardMenuProtocol.source("bakusai",n)))region=SiteBoardMenuProtocol.REGIONS[n];if(region==null)throw new AssertionError("unapproved external request "+url);if(fail.get()&&region.equals("kansai"))throw new IOException("fixture failed region");file="bakusaiMenu-"+region+".json";}
   return new SiteBoardGateway.Response(200,Files.readAllBytes(dir.resolve(file)),type,null);
  }public SiteBoardGateway.Response post(SitePostProtocol.Plan p,String u){throw new AssertionError("public POST forbidden");}};
  var prefs=SiteBoardEnableTest.memory();var gateway=new SiteBoardGateway(prefs,transport);
  try{
   for(String kind:SiteBoardMenuProtocol.KINDS)ok(!gateway.siteEnabled(kind),"three sites initially OFF");
   String custom=gateway.register("https://dat.2chan.net/t/","自分の料理板");String stable=gateway.registrationUrl(custom);ok(!gateway.boardEnabled(custom),"manual registration cannot silently enable site");
   prefs.edit().putBoolean(SiteBoardGateway.siteFlag("futaba"),true).commit();ok(gateway.enabled()&&gateway.siteEnabled("futaba"),"native site ON starts listener");String result=get(gateway.siteMenuUrl("futaba"));ok(result.startsWith("HTTP/1.1 200"),"Futaba root menu");var doc=Jsoup.parse(result.substring(result.indexOf("\r\n\r\n")+4));ok(doc.select("a[href]").size()==97,"97 native board links from the saved Futaba menu");ok(!doc.select("b").isEmpty(),"Futaba category folders");ok(gateway.registrationUrl(custom).equals(stable)&&gateway.names.get(custom).equals("自分の料理板"),"manual alias and name preserved during whole-site import");
   for(var row:gateway.boards.entrySet())ok(row.getKey().matches(SiteBoardGateway.KEY_PATTERN),"stable valid native alias");
   prefs.edit().putBoolean(SiteBoardGateway.siteFlag("bakusai"),true).commit();String bakusai=get(gateway.siteMenuUrl("bakusai"));ok(bakusai.startsWith("HTTP/1.1 200"),"Bakusai root menu");var bk=Jsoup.parse(bakusai.substring(bakusai.indexOf("\r\n\r\n")+4));ok(bk.select("a[href]").size()>7000,"all fifteen region menus imported");ok(bk.select("b").stream().anyMatch(e->e.text().contains("北海道／ニュース")),"region/category native folders");int before=gateway.boards.size();String again=get(gateway.siteMenuUrl("bakusai"));ok(again.startsWith("HTTP/1.1 200")&&gateway.boards.size()==before,"repeat import never duplicates native aliases");
   prefs.edit().putBoolean(SiteBoardGateway.siteFlag("animanch"),true).commit();String animanch=get(gateway.siteMenuUrl("animanch"));var an=Jsoup.parse(animanch.substring(animanch.indexOf("\r\n\r\n")+4));ok(an.select("a[href]").size()==32,"missing category32 is restored to Animanch menu");ok(an.select("b").stream().anyMatch(e->e.text().equals("単発スレ")),"Animanch category folders");
   var games=SiteBoardProtocol.address("https://bbs.animanch.com/category32/");var fate=SiteBoardProtocol.address("https://bbs.animanch.com/category9/");
   ok(gateway.boards.values().stream().anyMatch(b->b.url.equals(games.url)),"games board is registered");
   ok(an.select("a[href]").stream().anyMatch(e->e.text().equals("家庭用ゲーム")),"games board has correct menu label");
   ok(!SiteBoardCatalog.key(games).equals(SiteBoardCatalog.key(fate)),"games and Fate remain separate boards");
   String gamesKey=gateway.register(games.url,"");
   ok(gateway.names.get(gamesKey).equals("家庭用ゲーム"),"manual games registration defaults to its category title");
   var legacy=SiteBoardEnableTest.memory();
   legacy.edit().putString("boards",new org.json.JSONArray().put(new org.json.JSONObject()
       .put("key",gamesKey).put("url",games.url).put("name",games.host)).toString()).commit();
   ok(new SiteBoardGateway(legacy,transport).names.get(gamesKey).equals("家庭用ゲーム"),"saved host placeholder is repaired");
   gateway.register(games.url,"カスタム板名");
   ok(gateway.names.get(gamesKey).equals("カスタム板名"),"explicit games board name is preserved");
   var newer=SiteBoardMenuProtocol.parse("animanch","{\"menu_list\":[{\"category_content\":[{\"board_name\":\"家庭用ゲーム・新名称\",\"url\":\"https://bbs.animanch.com/category32/\",\"category_name\":\"新カテゴリ\"}]}]}");
   ok(newer.size()==1&&newer.get(0).name.equals("家庭用ゲーム・新名称")&&newer.get(0).group.equals("新カテゴリ"),"updated upstream metadata overrides fallback");
   prefs.edit().putBoolean(SiteBoardGateway.siteFlag("futaba"),false).commit();ok(gateway.enabled()&&!gateway.boardEnabled(custom),"OFF Futaba cannot read while other site ON");String saved=prefs.getString("boards","");fail.set(true);ok(get(gateway.siteMenuUrl("bakusai")).startsWith("HTTP/1.1 503"),"failed region rejects partial catalogue");ok(saved.equals(prefs.getString("boards","")),"failure preserves saved catalogue");fail.set(false);
   for(String kind:SiteBoardMenuProtocol.KINDS){var pattern=gateway.sitePattern(kind);int count=0;for(var row:gateway.boards.entrySet()){boolean matches=pattern.matcher(gateway.registrationUrl(row.getKey())).find();ok(matches==row.getValue().kind.equals(kind),"native site pattern classifies exact board source");if(matches)count++;}ok(count>0,"each native root has imported boards");}
   for(String kind:SiteBoardMenuProtocol.KINDS)prefs.edit().putBoolean(SiteBoardGateway.siteFlag(kind),false).commit();ok(!gateway.enabled(),"last native site OFF stops listener");
   System.out.println("PASS "+checks+" whole-site catalogue/native folder/activation checks; total boards="+gateway.boards.size()+", isolated source reads="+requests+", public requests=0");
  }finally{gateway.stop();}
 }
}
