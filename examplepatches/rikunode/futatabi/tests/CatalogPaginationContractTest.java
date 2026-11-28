package dev.rikunode.futatabi.bridge;
import android.content.Context;
import org.json.*;
import java.net.*;
import java.io.*;
import java.nio.charset.*;
import java.nio.file.*;
import java.util.*;
import java.util.regex.*;

public final class CatalogPaginationContractTest {
    private static final Charset SJIS=Charset.forName("Shift_JIS");
    private static AimogeAdapter aimoge;
    private static int total=206, requests, duplicateAt=-1;
    private static String animanch, authenticated, trial, lastSort="";
    private static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
    private static String uuid(int n){return String.format("00000000-0000-0000-0000-%012d",n);}
    private static String aimogePage(URL u)throws Exception{
        String[] params=u.getQuery().split("&");String sort=params[0].substring(5);
        int page=Integer.parseInt(params[2].substring(5));
        check(params[1].equals("limit=100"),"page size");
        requests++;lastSort=sort;
        // Fixture only: skip the production inter-request rate delay.
        java.lang.reflect.Field f=AimogeAdapter.class.getDeclaredField("lastApiFetch");
        f.setAccessible(true);f.setLong(aimoge,0);
        JSONArray rows=new JSONArray();
        for(int pos=(page-1)*100;pos<Math.min(total,page*100);pos++){
            int n=sort.equals("old")||sort.equals("replies")||sort.equals("momentum")||sort.equals("soudane")?total-pos:pos+1;
            if(pos==duplicateAt)n=100;
            rows.put(new JSONObject().put("id",uuid(n)).put("replyCount",n)
                .put("createdAt","2026-11-25T10:00:00Z").put("bumpedAt","2026-11-25T10:30:00Z")
                .put("opPost",new JSONObject().put("body","aimoge-"+n).put("attachment",new JSONObject()
                  .put("id",uuid(10000+n)).put("originalUrl","https://storage.nijiurachan.net/original/"+n)
                  .put("thumbnailUrl","https://storage.nijiurachan.net/thumb/"+n))));
        }
        return new JSONObject().put("threads",rows).put("sort",sort).put("pagination",new JSONObject()
                .put("page",page).put("limit",100).put("hasNextPage",page*100<total)).toString();
    }
    private static List<String> cells(BridgeServer.BridgeResponse r){
        check(r.status==200,"catalog response "+r.status);
        List<String> ids=new ArrayList<>();
        Matcher m=Pattern.compile("<td><a href='res/([0-9]{13})\\.htm'>").matcher(new String(r.bytes,SJIS));
        while(m.find())ids.add(m.group(1));
        check(ids.size()==new HashSet<>(ids).size(),"no duplicate cells");
        return ids;
    }
    private static List<String> titles(BridgeServer.BridgeResponse r){
        List<String> titles=new ArrayList<>();
        Matcher m=Pattern.compile("<small>([^<]*)</small><font size=2>").matcher(new String(r.bytes,SJIS));
        while(m.find())titles.add(m.group(1));
        return titles;
    }
    private static String cards(int n){
        StringBuilder b=new StringBuilder();
        for(int i=1;i<=n;i++)b.append("<a href='/board/").append(i).append("/' class='card'><div class='card-body'>animanch-").append(i).append("</div><p class='threadCount'>").append(n-i).append("</p></a>");
        return b.toString();
    }
    private static String mebuki(int n){
        StringBuilder b=new StringBuilder("{\"threads\":[");
        for(int i=1;i<=n;i++){
            if(i>1)b.append(',');
            b.append(String.format("{\"slug\":\"fixture%06d\",\"name\":\"mebuki-%d\",\"messageCount\":%d,\"createdAt\":D\"2026-11-25T10:00:00Z\",\"lastMessageAt\":D\"2026-11-25T10:30:00Z\",\"mainImage\":{\"fileType\":\"image/png\",\"filePath\":\"https://storage.mebuki.moe/uploads/attachments/fixture%d.png\",\"createdAt\":D\"2026-11-25T10:00:00Z\",\"spoiler\":false,\"nsfw\":false,\"gore\":false,\"other\":false}}",i,i,n-i,i));
        }
        return b.append("]}").toString();
    }
    public static void main(String[] args)throws Exception{
        URL.setURLStreamHandlerFactory(protocol->new URLStreamHandler(){
            protected URLConnection openConnection(URL u){
                return new HttpURLConnection(u){
                    public void connect(){} public void disconnect(){} public boolean usingProxy(){return false;}
                    public int getResponseCode(){check("GET".equals(getRequestMethod()),"read only");return 200;}
                    public InputStream getInputStream()throws IOException{
                        try{
                            String body;
                            if(u.getHost().equals("api.nijiurachan.net")&&u.getPath().equals("/client-policy"))body="{\"boardKey\":\"aimg\"}";
                            else if(u.getHost().equals("api.nijiurachan.net")&&u.getPath().equals("/catalog/aimg"))body=aimogePage(u);
                            else if(u.getHost().equals("bbs.animanch.com")&&u.getPath().equals("/"))body=animanch;
                            else if(u.getPath().equals("/api/auth/get-session"))body="{\"user\":{},\"session\":{}}";
                            else if(u.getPath().equals("/api/catalog")){check("fixture_session=only".equals(getRequestProperty("Cookie")),"auth scope");body=authenticated;}
                            else if(u.getPath().equals("/api/trial/trending")){check(getRequestProperty("Cookie")==null,"trial isolation");body=trial;}
                            else throw new AssertionError(u.toString());
                            return new ByteArrayInputStream(body.getBytes(StandardCharsets.UTF_8));
                        }catch(Exception e){throw new IOException(e);}
                    }
                };
            }
        });
        Context c=new Context();aimoge=new AimogeAdapter(c);
        String a="/aimoge/futaba.php?mode=cat";
        List<String> base=cells(aimoge.route(a));
        check(base.size()==206&&requests==3,"full 3 pages");
        check(aimoge.threadsJson().getJSONArray("threads").length()==206&&requests==3,"shared snapshot");
        check(aimoge.stockThreadUuid(base.get(205)).equals(uuid(206)),"last thread mapping");
        for(int sort:new int[]{1,2,3,4,6,8}){
            BridgeServer.BridgeResponse response=aimoge.route(a+"&sort="+sort);
            List<String> ids=cells(response);
            check(ids.size()==206&&new HashSet<>(ids).equals(new HashSet<>(base)),"all sorted cells "+sort);
            String expectedSort=sort==1?"new":sort==2?"old":sort==3?"replies":sort==4?"bump":sort==6?"momentum":"soudane";
            check(lastSort.equals(expectedSort),"upstream sort "+sort);
            List<String> t=titles(response);
            check(t.get(0).equals("aimoge-"+(sort==1||sort==4?1:206)),"order first "+sort);
            check(t.get(205).equals("aimoge-"+(sort==1||sort==4?206:1)),"order last "+sort);
        }
        total=1100;aimoge=new AimogeAdapter(new Context());requests=0;
        check(cells(aimoge.route(a)).size()==1000&&requests==10,"page cap");
        total=206;duplicateAt=100;aimoge=new AimogeAdapter(new Context());requests=0;
        check(cells(aimoge.route(a)).size()==205&&requests==3,"cross-page duplicate");
        System.out.println("PASS Aimoge 206 rows, all 6 sort values, 3-page cache, last ID, duplicate handling, 1000/10-page cap");

        String n="/animanch/futaba.php?mode=cat";
        animanch=Files.readString(Path.of(args[0]));
        Matcher actual=Pattern.compile("<a\\s+[^>]*href=['\"](?:https://bbs\\.animanch\\.com)?/board/(\\d+)/['\"][^>]*class=['\"]card['\"][^>]*>",Pattern.CASE_INSENSITIVE).matcher(animanch);
        Set<String> upstream=new HashSet<>();int cards=0;
        while(actual.find()){cards++;upstream.add(actual.group(1));}
        AnimanchAdapter anim=new AnimanchAdapter(new Context());
        check(cells(anim.route(n)).size()==Math.min(upstream.size(),1000),"actual HTML unique count");
        System.out.println("PASS Animanch actual HTML: "+cards+" cards, "+upstream.size()+" unique");
        animanch=cards(1001);anim=new AnimanchAdapter(new Context());
        List<String> normal=cells(anim.route(n));check(normal.size()==1000,"Animanch cap");
        check(cells(anim.route(n+"&sort=3")).equals(normal),"descending replies");
        List<String> low=new ArrayList<>(normal);Collections.reverse(low);
        check(cells(anim.route(n+"&sort=4")).equals(low),"ascending replies");
        for(int sort:new int[]{1,2,6,8})check(cells(anim.route(n+"&sort="+sort)).equals(normal),"unsupported default "+sort);
        System.out.println("PASS Animanch cap, replies sorts and explicit unsupported defaults");

        Context mctx=new Context();mctx.getSharedPreferences(MebukiSession.STORE,0).edit().putString(MebukiSession.KEY,"fixture_session=only").commit();
        MebukiAdapter meb=new MebukiAdapter(mctx);String m="/mebuki/futaba.php?mode=cat";
        trial=Files.readString(Path.of(args[1]));authenticated=Files.readString(Path.of(args[2]));
        int expectedTrial=new JSONObject(trial).getJSONArray("threads").length();
        check(cells(meb.route(m,false)).size()==expectedTrial,"actual trial response");
        Object decoded=MebukiTurboStream.decode(authenticated);
        List<?> entries=(List<?>)((Map<?,?>)decoded).get("threads");
        Set<Object> visible=new HashSet<>();
        for(Object o:entries){Map<?,?> row=(Map<?,?>)o;if(!Boolean.TRUE.equals(row.get("isHidden")))visible.add(row.get("slug"));}
        List<String> mapped=cells(meb.route(m,true));
        check(mapped.size()==Math.min(visible.size(),2048),"actual public schema synthetic auth");
        for(String id:mapped)check(meb.slugForThreadId(id)!=null,"all visible private IDs");
        System.out.println("PASS Mebuki actual trial "+expectedTrial+", public catalog schema "+entries.size()+" rows / "+mapped.size()+" visible");
        authenticated="{\"threads\":[{\"slug\":\"fixtureA1\",\"name\":\"A\",\"messageCount\":10,\"createdAt\":D\"2026-11-24T00:00:00Z\",\"lastMessageAt\":D\"2026-11-27T00:00:00Z\"},{\"slug\":\"fixtureB2\",\"name\":\"B\",\"messageCount\":50,\"createdAt\":D\"2026-11-26T00:00:00Z\",\"lastMessageAt\":D\"2026-11-26T01:00:00Z\"},{\"slug\":\"fixtureC3\",\"name\":\"C\",\"messageCount\":3,\"createdAt\":D\"2026-11-25T00:00:00Z\",\"lastMessageAt\":D\"2026-11-27T01:00:00Z\"}]}";
        String[][] expected={{"C","A","B"},{"B","C","A"},{"A","C","B"},{"B","A","C"},{"C","A","B"},{"B","A","C"},{"C","A","B"}};
        int[] sorts={0,1,2,3,4,6,8};
        for(int i=0;i<sorts.length;i++){
            BridgeServer.BridgeResponse response=meb.route(m+"&sort="+sorts[i],true);
            check(cells(response).size()==3&&titles(response).equals(Arrays.asList(expected[i])),"Mebuki exact expected order "+sorts[i]);
        }
        trial="{\"threads\":[{\"slug\":\"trialA123\",\"name\":\"A\",\"messageCount\":10},{\"slug\":\"trialB123\",\"name\":\"B\",\"messageCount\":50},{\"slug\":\"trialC123\",\"name\":\"C\",\"messageCount\":3}]}";
        for(int sort:sorts){
            List<String> want=sort==3?Arrays.asList("B","A","C"):sort==4?Arrays.asList("C","A","B"):Arrays.asList("A","B","C");
            check(titles(meb.route(m+"&sort="+sort,false)).equals(want),"trial exact order "+sort);
        }
        System.out.println("PASS Mebuki exact authenticated and trial expected HTML order for default + six sort values");
        authenticated=mebuki(2049);
        List<String> def=cells(meb.route(m,true));check(def.size()==2048,"Mebuki cap");
        for(String id:def)check(meb.slugForThreadId(id)!=null,"private mapping survives complete catalog");
        for(int sort:new int[]{1,2,3,4,6,8}){
            List<String> ids=cells(meb.route(m+"&sort="+sort,true));check(ids.size()==2048,"auth sorted cap "+sort);
            for(String id:ids)check(meb.slugForThreadId(id)!=null,"private mapping after sorting");
        }
        System.out.println("PASS Mebuki 2048 cap and six sort requests, private mapping survival");
    }
}
