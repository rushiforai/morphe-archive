package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONArray;
import org.json.JSONObject;
import java.net.*;
import java.io.*;
import java.nio.charset.StandardCharsets;

/** Host-side restored preference/adapter contract. No live network or account. */
public final class ImportCatalogContractTest {
    private static final String PREFIX="VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu!";
    private static final String KEY="flutter.itaList";
    private static int requests;
    private static void check(boolean b,String what){if(!b)throw new AssertionError(what);}
    public static void main(String[] args)throws Exception {
        URL.setURLStreamHandlerFactory(protocol->new URLStreamHandler(){
            protected URLConnection openConnection(URL u){
                check("https".equals(protocol),"upstream HTTPS unchanged");
                return new HttpURLConnection(u){
                    public void connect(){}
                    public void disconnect(){}
                    public boolean usingProxy(){return false;}
                    public int getResponseCode(){check("GET".equals(getRequestMethod()),"read-only");return 200;}
                    public InputStream getInputStream(){
                        requests++;
                        String body;
                        if(u.getHost().equals("api.nijiurachan.net")&&u.getPath().equals("/client-policy"))
                            body="{\"boardKey\":\"aimg\"}";
                        else if(u.getHost().equals("api.nijiurachan.net")&&u.getFile().equals("/catalog/aimg?sort=bump&limit=100&page=1"))
                            body="{\"threads\":[{\"id\":\"12345678-1234-1234-1234-123456789012\",\"replyCount\":3,\"opPost\":{\"body\":\"aimoge fixture\"}}],\"pagination\":{\"page\":1,\"limit\":100,\"hasNextPage\":false}}";
                        else if(u.getHost().equals("mebuki.moe")&&u.getPath().equals("/api/trial/trending"))
                            body="{\"threads\":[{\"slug\":\"fixture123\",\"name\":\"mebuki fixture\",\"messageCount\":4}]}";
                        else if(u.getHost().equals("bbs.animanch.com")&&u.getPath().equals("/"))
                            body="<a href='/board/1234567/' class='card'><div class='card-body'>animanch fixture</div><p class='threadCount'>5</p></a>";
                        else throw new AssertionError("unexpected fixture URL: "+u);
                        return new ByteArrayInputStream(body.getBytes(StandardCharsets.UTF_8));
                    }
                    public java.util.Map<String,java.util.List<String>> getHeaderFields(){return java.util.Collections.emptyMap();}
                };
            }
        });
        Context c=new Context();
        SharedPreferences p=c.getSharedPreferences("FlutterSharedPreferences",0);
        FutatabiProvider.registerBoards(c);
        check(!p.contains("flutter.useHttps"),"fresh default absent");
        String fresh=p.getString(KEY,"");
        checkCatalogs(c,fresh,"fresh");
        JSONArray defaults=new JSONArray(fresh.substring(PREFIX.length()));
        JSONArray stock=new JSONArray();
        for(int i=0;i<defaults.length();i++){
            String entry=defaults.getString(i);
            if(new JSONObject(entry).getString("url").contains("2chan.net"))stock.put(entry);
        }
        String raw=PREFIX+stock.toString();
        for(boolean https:new boolean[]{false,true}){
            p.edit().clear().putString(KEY,raw).putBoolean("flutter.useHttps",https).putString("flutter.unrelated","keep").commit();
            FutatabiProvider.registerBoards(c);
            check(p.getBoolean("flutter.useHttps",!https)==https,"preserve restored HTTPS");
            check("keep".equals(p.getString("flutter.unrelated","")),"other preference retained");
            check(fresh.equals(p.getString(KEY,"")),"B restored boards");
            checkCatalogs(c,p.getString(KEY,""),"stock import useHttps="+https);
            FutatabiProvider.registerBoards(c);
            check(fresh.equals(p.getString(KEY,"")),"B idempotent");
        }
        check(requests==12,"expected 4 fixture GETs per scenario");
        System.out.println("PASS fresh and restored false/true: 3 boards x 3 scenarios, 9 catalog HTML responses; HTTPS preference retained");
    }
    private static void checkCatalogs(Context c,String raw,String scenario)throws Exception{
        JSONArray list=new JSONArray(raw.substring(PREFIX.length()));
        check(list.length()==6,"six boards");
        AimogeAdapter a=new AimogeAdapter(c);MebukiAdapter m=new MebukiAdapter(c);AnimanchAdapter n=new AnimanchAdapter(c);
        int count=0;
        for(int i=0;i<list.length();i++){
            String url=new JSONObject(list.getString(i)).getString("url");
            if(!url.startsWith("http://127.0.0.1:18765/"))continue;
            String path=new URI(url).getPath()+"futaba.php?mode=cat";
            BridgeServer.BridgeResponse r;
            String expected;
            if(path.startsWith("/aimoge/")){r=a.route(path);expected="aimoge fixture";}
            else if(path.startsWith("/mebuki/")){r=m.route(path,true);expected="mebuki fixture";}
            else if(path.startsWith("/animanch/")){r=n.route(path);expected="animanch fixture";}
            else throw new AssertionError("unexpected board");
            String html=new String(r.bytes,java.nio.charset.Charset.forName("Shift_JIS"));
            check(r.status==200&&html.contains("cattable")&&html.contains(expected),scenario+" "+path+" status="+r.status);
            count++;
        }
        check(count==3,"all external boards");
    }
}
