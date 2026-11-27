package dev.rikunode.futatabi.bridge;

import android.content.Context;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;

/** No account or live network. Exercise authenticated vs public catalogue routing. */
public final class MebukiCatalogContractTest {
    static final String COOKIE="fixture_session=only";
    static int auth,trial,session;
    static boolean fail;
    static final String DATA="{\"threads\":[{\"slug\":\"older1234\",\"name\":\"older\",\"messageCount\":3,\"createdAt\":D\"2026-11-25T10:00:00Z\",\"lastMessageAt\":D\"2026-11-25T10:30:00Z\"},{\"slug\":\"fresh1234\",\"name\":\"fresh zero replies\",\"messageCount\":0,\"createdAt\":D\"2026-11-26T07:45:37Z\",\"lastMessageAt\":null,\"mainImage\":{\"fileType\":\"image/png\",\"filePath\":\"https://storage.mebuki.moe/uploads/attachments/fixture.png\",\"createdAt\":D\"2026-11-26T07:45:37Z\",\"spoiler\":false,\"nsfw\":false,\"gore\":false,\"other\":false}},{\"slug\":\"hidden123\",\"name\":\"hidden\",\"messageCount\":0,\"createdAt\":D\"2026-11-26T07:46:00Z\",\"isHidden\":true}]}";
    static String catalogData=DATA;
    static void check(boolean b,String label){if(!b)throw new AssertionError(label);}
    public static void main(String[] args)throws Exception{
        URL.setURLStreamHandlerFactory(protocol->new URLStreamHandler(){
            protected URLConnection openConnection(URL url){
                check("https".equals(protocol)&&"mebuki.moe".equals(url.getHost()),"only official fixture host");
                return new HttpURLConnection(url){
                    boolean counted;
                    public void connect(){}
                    public void disconnect(){}
                    public boolean usingProxy(){return false;}
                    public int getResponseCode(){
                        String path=url.getFile();
                        check("GET".equals(getRequestMethod()),"read only");
                        check(!getInstanceFollowRedirects(),"no redirects");
                        if(path.equals("/api/auth/get-session")||path.equals("/api/catalog")){
                            check(COOKIE.equals(getRequestProperty("Cookie")),"authorized cookie");
                            if(!counted){if(path.endsWith("catalog"))auth++;else session++;counted=true;}
                            return fail&&path.endsWith("catalog")?302:200;
                        }
                        check(path.equals("/api/trial/trending")&&getRequestProperty("Cookie")==null,"public fallback without cookie");
                        if(!counted){trial++;counted=true;}
                        return 200;
                    }
                    public InputStream getInputStream(){
                        String path=url.getFile();
                        String s=path.endsWith("get-session")?"{\"user\":{},\"session\":{}}":path.endsWith("catalog")?catalogData:
                                "{\"threads\":[{\"slug\":\"public123\",\"name\":\"public trial\",\"messageCount\":1}]}";
                        return new ByteArrayInputStream(s.getBytes(StandardCharsets.UTF_8));
                    }
                };
            }
        });
        Context c=new Context();
        c.getSharedPreferences(MebukiSession.STORE,0).edit().putString(MebukiSession.KEY,COOKIE).commit();
        MebukiAdapter adapter=new MebukiAdapter(c);
        String external=new String(adapter.route("/mebuki/futaba.php?mode=cat",false).bytes,java.nio.charset.Charset.forName("Shift_JIS"));
        check(external.contains("public trial")&&!external.contains("fresh zero replies")&&auth==0&&session==0&&trial==1,"external peers never access authenticated catalog");
        JSONObject catalog=adapter.threadsJson();
        JSONArray rows=catalog.getJSONArray("threads");
        JSONObject first=rows.getJSONObject(0);
        String id=first.getString("id");
        check(!catalog.getBoolean("trial")&&!catalog.getBoolean("delayed")&&rows.length()==2,"authenticated rows only");
        check("fresh zero replies".equals(first.getString("title"))&&first.getInt("replies")==0&&first.has("imageId"),"new zero reply first with image");
        check("fresh1234".equals(new MebukiAdapter(c).slugForThreadId(id)),"shared native thread lookup");
        check(c.getSharedPreferences("futatabi_mebuki_index",0).getString("thread."+id,null)==null,"private slug not persisted");
        check(c.getSharedPreferences("futatabi_mebuki_index",0).getString("img."+first.getString("imageId"),null)==null,"private image not persisted");
        String html=new String(adapter.route("/mebuki/futaba.php?mode=cat",true).bytes,java.nio.charset.Charset.forName("Shift_JIS"));
        check(html.contains("fresh zero replies")&&html.contains("認証済み")&&!html.contains("hidden"),"native authenticated catalog");
        fail=true;
        JSONObject fallback=adapter.threadsJson();
        check(fallback.getBoolean("trial")&&fallback.getBoolean("delayed")&&"public trial".equals(fallback.getJSONArray("threads").getJSONObject(0).getString("title")),"explicit fallback on auth redirect");
        c.getSharedPreferences(MebukiSession.STORE,0).edit().remove(MebukiSession.KEY).commit();
        check(new MebukiAdapter(c).slugForThreadId(id)==null,"logout invalidates private mappings");
        System.out.println("PASS authenticated catalog sorting, zero replies, private scope, image, fallback, logout. No live network.");
        if(args.length==1){
            String actual=java.nio.file.Files.readString(java.nio.file.Path.of(args[0]));
            Object decoded=MebukiTurboStream.decode(actual);
            java.util.List<?> entries=(java.util.List<?>)((java.util.Map<?,?>)decoded).get("threads");
            check(!entries.isEmpty(),"official public catalog decode");
            System.out.println("PASS actual public trial catalog turbo decode: "+entries.size()+" rows");
            fail=false;
            catalogData=actual;
            c.getSharedPreferences(MebukiSession.STORE,0).edit().putString(MebukiSession.KEY,COOKIE).commit();
            JSONObject actualShape=adapter.threadsJson();
            check(!actualShape.getBoolean("trial")&&actualShape.getJSONArray("threads").length()==45,"actual public schema maps to latest 45");
            System.out.println("PASS actual public catalog schema maps through synthetic authenticated route: 45 rows");
        }
    }
}
