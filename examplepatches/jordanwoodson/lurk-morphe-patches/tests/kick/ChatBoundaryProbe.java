import android.content.Context;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import android.util.Base64;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.ZipFile;
import org.json.JSONObject;

/** Actual APK KickHttp -> KickChat -> evaluateJavascript; WebView and transport are boundaries. */
public final class ChatBoundaryProbe {
    static final String CHAT="io.github.jordanwoodson.extension.shared.kick.KickChat";
    static final String HTTP="io.github.jordanwoodson.extension.shared.kick.KickHttp";
    public static final class Capture extends WebView {
        String source, url;
        public Capture(Context c){super(c);}
        @Override public void evaluateJavascript(String js,ValueCallback<String> callback){source=js;}
        @Override public String getUrl(){return url;}
    }
    static Class<?> c(String s)throws Exception{return Class.forName(s);}
    static Object call(Object target,String name,Class<?>[] types,Object...args)throws Exception {
        Method m=(target instanceof Class?(Class<?>)target:target.getClass()).getMethod(name,types);
        return m.invoke(target instanceof Class?null:target,args);
    }
    static void setting(String key,boolean value)throws Exception{ProbeSupport.setting(key,String.valueOf(value));}
    static String page(String config){return "https://chat.mobile.kick.com/?config="+android.net.Uri.encode(config);}
    static void lifecycle()throws Exception {
        setting("emotes_7tv",true);
        Capture old=(Capture)ProbeSupport.allocate(Capture.class), current=(Capture)ProbeSupport.allocate(Capture.class);
        old.url=current.url=page("{\"channelId\":668}");
        Class<?> chat=c(CHAT);Class<?>[] pageTypes={WebView.class,String.class};
        call(chat,"onPage",pageTypes,old,old.url);
        call(chat,"onPage",pageTypes,current,current.url);
        Map<?,?> pages=(Map<?,?>)ProbeSupport.field(chat,"PAGES").get(null);
        call(chat,"onPageDisposed",new Class<?>[]{WebView.class},old);
        ProbeSupport.check(!pages.containsKey(old) && pages.containsKey(current),"old WebView disposal preserves current page");
        ProbeSupport.check(((java.lang.ref.WeakReference<?>)ProbeSupport.field(chat,"active").get(null)).get()==current,"old disposal preserves current native authority");
        JSONObject options=new JSONObject(current.source.substring(current.source.lastIndexOf("\n(")+2,current.source.length()-2));
        JSONObject end=new JSONObject().put("type","lurk7tvDispose").put("generation","stale")
                .put("channelId",options.get("channelId")).put("slug",options.get("sevenTvChannel"));
        Class<?>[] messageTypes={WebView.class,String.class,String.class};
        call(chat,"onMessage",messageTypes,current,end.toString(),current.url);
        ProbeSupport.check(pages.containsKey(current),"stale disposal cannot invalidate current generation");
        end.put("generation",options.get("generation"));
        call(chat,"onMessage",messageTypes,current,end.toString(),"https://example.invalid/");
        ProbeSupport.check(pages.containsKey(current),"foreign disposal cannot invalidate current generation");
        call(chat,"onMessage",messageTypes,current,end.toString(),current.url);
        ProbeSupport.check(!pages.containsKey(current) && ((java.lang.ref.WeakReference<?>)ProbeSupport.field(chat,"active").get(null)).get()==null,"valid pagehide ends native authority");
        end.put("type","lurk7tvCatalog");call(chat,"onMessage",messageTypes,current,end.toString(),current.url);
        ProbeSupport.check(!pages.containsKey(current),"late catalog cannot resurrect disposed page");
        ProbeSupport.check(Boolean.FALSE.equals(call(chat,"onMessage",messageTypes,current,"{\"type\":\"stock\"}",current.url)),"ordinary stock bridge message falls through");
        call(chat,"onPage",pageTypes,current,current.url);
        call(chat,"onPageDisposed",new Class<?>[]{WebView.class},current);
        ProbeSupport.check(!pages.containsKey(current) && ((java.lang.ref.WeakReference<?>)ProbeSupport.field(chat,"active").get(null)).get()==null,"native destroy ends authority without next page");
        setting("emotes_7tv",false);
        ProbeSupport.check(Boolean.FALSE.equals(call(chat,"onMessage",messageTypes,current,end.toString(),current.url)),"with 7TV off no bridge message is taken");
        setting("emotes_7tv",true);
        System.out.println("PASS: native WebView lifecycle, scoped disposal and late catalog guards");
    }
    /** Chat keywords: the page's line batches through the real KickChat and ChatFilter, verdicts back to the page. */
    static void keywords()throws Exception {
        Class<?> chat=c(CHAT);Class<?>[] pageTypes={WebView.class,String.class},messageTypes={WebView.class,String.class,String.class};
        setting("emotes_7tv",false);setting("chat_keywords",true);setting("chat_highlight_mentions",true);
        setting("chat_highlight_vibrate",false);
        ProbeSupport.setting("chat_highlight_words","clutch, gg wp");ProbeSupport.setting("chat_blocked_words","spoiler");
        ProbeSupport.setting("chat_blocked_users","Troll, @handle-only");
        Capture view=(Capture)ProbeSupport.allocate(Capture.class);
        view.url=page("{\"channelId\":668,\"selfUser\":{\"id\":1,\"slug\":\"me-too\",\"username\":\"Me_Too\"}}");
        call(chat,"onPage",pageTypes,view,view.url);
        JSONObject options=new JSONObject(view.source.substring(view.source.lastIndexOf("\n(")+2,view.source.length()-2));
        ProbeSupport.check(options.getBoolean("keywords") && options.has("generation"),"keywords option and page generation");
        String generation=options.getString("generation");
        org.json.JSONArray items=new org.json.JSONArray()
            .put(line("a","Troll","troll","hello"))
            .put(line("b","Someone","handle-only","hi"))
            .put(line("c","Viewer","viewer","no spoiler please"))
            .put(line("d","Viewer","viewer","hey @Me_Too look"))
            .put(line("e","Me_Too","me-too","talking about me-too myself"))
            .put(line("f","Viewer","viewer","that was CLUTCH"))
            .put(line("g","Viewer","viewer","gg wp everyone"))
            .put(line("h","Viewer","viewer","clutches and ggs"))
            .put(line("bad id\"","Viewer","viewer","clutch"));
        JSONObject batch=new JSONObject().put("type","lurkKeywords").put("generation",generation).put("items",items);
        view.source=null;
        ProbeSupport.check(Boolean.TRUE.equals(call(chat,"onMessage",messageTypes,view,batch.toString(),view.url)),"keyword batch is taken");
        String js=view.source;
        ProbeSupport.check(js!=null && js.startsWith("window.lurkChat && window.lurkChat.verdicts && window.lurkChat.verdicts("),"verdicts go back to the page");
        JSONObject verdicts=new JSONObject(js.substring(js.indexOf("verdicts(")+9,js.length()-2));
        ProbeSupport.check(verdicts.getInt("a")==2 && verdicts.getInt("b")==2 && verdicts.getInt("c")==2,"blocked user by name, by handle, and a blocked word hide");
        ProbeSupport.check(verdicts.getInt("d")==1 && !verdicts.has("e"),"a mention of the signed-in user is tinted, their own message isn't");
        ProbeSupport.check(verdicts.getInt("f")==1 && verdicts.getInt("g")==1 && !verdicts.has("h"),"highlight words and phrases, whole words, any case");
        ProbeSupport.check(verdicts.length()==6,"no verdict for plain lines or a malformed ID");
        view.source=null;
        call(chat,"onMessage",messageTypes,view,batch.put("generation","stale").toString(),view.url);
        ProbeSupport.check(view.source==null,"a batch from another page generation gets no verdicts");
        call(chat,"onMessage",messageTypes,view,batch.put("generation",generation).toString(),"https://example.invalid/");
        ProbeSupport.check(view.source==null,"a batch from a foreign origin gets no verdicts");
        setting("chat_keywords",false);
        ProbeSupport.check(Boolean.FALSE.equals(call(chat,"onMessage",messageTypes,view,batch.toString(),view.url)),"with keywords and 7TV off the bridge message is left to Kick");
        call(chat,"onPageDisposed",new Class<?>[]{WebView.class},view);
        System.out.println("PASS: Chat keywords batches, ChatFilter verdicts, page and origin guards");
    }
    /** Chat timestamps, text size and compact chat reach the page as options, each only when set. */
    static void look()throws Exception {
        Class<?>[] pageTypes={WebView.class,String.class};
        setting("chat_timestamps",true);ProbeSupport.setting("chat_text_size","20");setting("chat_compact",true);
        Capture view=(Capture)ProbeSupport.allocate(Capture.class);
        call(c(CHAT),"onPage",pageTypes,view,page("{}"));
        JSONObject options=new JSONObject(view.source.substring(view.source.lastIndexOf("\n(")+2,view.source.length()-2));
        ProbeSupport.check(options.getBoolean("timestamps") && options.getInt("textSize")==20 && options.getBoolean("compact"),"timestamps, text size and compact reach the page");
        if(ProbeSupport.registered("chat_timestamp_format")){
            ProbeSupport.check(options.getInt("clock")==0,"the 24-hour clock reaches the page by default");
            ProbeSupport.setting("chat_timestamp_format","1");
            call(c(CHAT),"onPageStarted",pageTypes,view,page("{}"));
            options=new JSONObject(view.source.substring(view.source.lastIndexOf("\n(")+2,view.source.length()-2));
            ProbeSupport.check(options.getInt("clock")==1,"the 12-hour clock reaches the page");
            ProbeSupport.setting("chat_timestamp_format","0");
        }
        setting("chat_timestamps",false);ProbeSupport.setting("chat_text_size","99");setting("chat_compact",false);
        view.source=null;
        call(c(CHAT),"onPage",pageTypes,view,page("{}"));
        ProbeSupport.check(view.source==null,"switched off, and an out-of-range size, add nothing");
        ProbeSupport.setting("chat_text_size","0");
        System.out.println("PASS: chat look options");
    }
    static JSONObject line(String id,String name,String slug,String text)throws Exception{
        return new JSONObject().put("id",id).put("name",name).put("slug",slug).put("text",text);
    }
    static JSONObject emit(String name,String url)throws Exception {
        Capture capture=(Capture)ProbeSupport.allocate(Capture.class);
        call(c(CHAT),"onPage",new Class<?>[]{WebView.class,String.class},capture,url);
        if(capture.source==null)return null;
        System.out.println("CAPTURE " + name + " " + Base64.encodeToString(capture.source.getBytes(StandardCharsets.UTF_8),Base64.NO_WRAP));
        return new JSONObject(capture.source.substring(capture.source.lastIndexOf("\n(")+2,capture.source.length()-2));
    }
    /** The options KickChat would give the page, without a capture for the page test. */
    static JSONObject quiet(String url)throws Exception {
        Capture capture=(Capture)ProbeSupport.allocate(Capture.class);
        call(c(CHAT),"onPage",new Class<?>[]{WebView.class,String.class},capture,url);
        if(capture.source==null)return null;
        return new JSONObject(capture.source.substring(capture.source.lastIndexOf("\n(")+2,capture.source.length()-2));
    }
    static Object builder()throws Exception{return c("okhttp3.OkHttpClient$Builder").getConstructor().newInstance();}
    static void response(String url,String json,int status,boolean intercept)throws Exception {
        Object b=builder();
        ProbeSupport.check(call(c(HTTP),"withInterceptor",new Class<?>[]{c("okhttp3.OkHttpClient$Builder")},b)==b,"builder identity");
        Object client=call(b,"build",new Class<?>[]{});
        List<?> interceptors=(List<?>)call(client,"interceptors",new Class<?>[]{});
        ProbeSupport.check(interceptors.size()==(intercept?1:0),"provider interception switch");
        if(!intercept)return;
        Object rb=c("okhttp3.Request$Builder").getConstructor().newInstance();
        call(rb,"url",new Class<?>[]{String.class},url);
        Object request=call(rb,"build",new Class<?>[]{});
        Object body=call(c("okhttp3.ResponseBody"),"create",new Class<?>[]{c("okhttp3.MediaType"),String.class},null,json);
        Object sb=c("okhttp3.Response$Builder").getConstructor().newInstance();
        call(sb,"request",new Class<?>[]{c("okhttp3.Request")},request);
        call(sb,"protocol",new Class<?>[]{c("okhttp3.Protocol")},c("okhttp3.Protocol").getField("HTTP_1_1").get(null));
        call(sb,"code",new Class<?>[]{int.class},status);call(sb,"message",new Class<?>[]{String.class},"fixture");
        call(sb,"body",new Class<?>[]{c("okhttp3.ResponseBody")},body);
        Object response=call(sb,"build",new Class<?>[]{});
        int[] proceeds={0};
        Object chain=Proxy.newProxyInstance(c("okhttp3.Interceptor$Chain").getClassLoader(),new Class<?>[]{c("okhttp3.Interceptor$Chain")},(p,m,a)->{
            if(m.getName().equals("request"))return request;
            if(m.getName().equals("proceed")){ProbeSupport.check(a[0]==request,"request preserved");proceeds[0]++;return response;}
            throw new AssertionError("unexpected chain call " + m);
        });
        Object result=call(interceptors.get(0),"intercept",new Class<?>[]{c("okhttp3.Interceptor$Chain")},chain);
        ProbeSupport.check(result==response && proceeds[0]==1,"response identity and one proceed");
        ProbeSupport.check(json.equals(call(body,"string",new Class<?>[]{})),"peek preserves unread response body");
    }
    /**
     * Anonymous chat: with its switch on, KickHttp refuses what posts to a chat on Kick's API (a message, a reply or a
     * quick emote, and a celebration's action) before it reaches the network, and lets everything else through; with
     * it off (and 7TV off) no interceptor is added.
     */
    static void anonymous()throws Exception {
        if(!ProbeSupport.registered("chat_anonymous")){System.out.println("SKIP: Anonymous chat isn't in this APK");return;}
        setting("emotes_7tv",false);setting("chat_anonymous",true);
        Object b=builder();
        call(c(HTTP),"withInterceptor",new Class<?>[]{c("okhttp3.OkHttpClient$Builder")},b);
        List<?> interceptors=(List<?>)call(call(b,"build",new Class<?>[]{}),"interceptors",new Class<?>[]{});
        ProbeSupport.check(interceptors.size()==1,"Anonymous chat adds one interceptor");
        Object interceptor=interceptors.get(0);
        Object body=call(c("okhttp3.RequestBody"),"create",new Class<?>[]{c("okhttp3.MediaType"),String.class},null,"{}");
        String[][] cases={
            {"POST","https://kick.com/api/v2/messages/send/123","blocked"},
            {"POST","https://web.kick.com/api/v2/messages/send/123","blocked"},
            {"POST","https://kick.com/api/v2/chatrooms/5/celebrations/abc/action","blocked"},
            {"GET","https://kick.com/api/v2/messages/send/123","sent"},
            {"POST","https://kick.com/api/v2/channels/xqc/follow","sent"},
            {"POST","https://example.com/api/v2/messages/send/123","sent"},
            {"POST","https://mobile.kick.com/api/v1/stream/1/playback","sent"},
        };
        for(String[] each:cases){
            Object rb=c("okhttp3.Request$Builder").getConstructor().newInstance();
            call(rb,"url",new Class<?>[]{String.class},each[1]);
            call(rb,"method",new Class<?>[]{String.class,c("okhttp3.RequestBody")},each[0],each[0].equals("GET")?null:body);
            Object request=call(rb,"build",new Class<?>[]{});
            int[] proceeds={0};
            Object chain=Proxy.newProxyInstance(c("okhttp3.Interceptor$Chain").getClassLoader(),new Class<?>[]{c("okhttp3.Interceptor$Chain")},(p,m,a)->{
                if(m.getName().equals("request"))return request;
                if(m.getName().equals("proceed")){proceeds[0]++;return null;}
                throw new AssertionError("unexpected chain call " + m);
            });
            String outcome;
            try{call(interceptor,"intercept",new Class<?>[]{c("okhttp3.Interceptor$Chain")},chain);outcome="sent";}
            catch(InvocationTargetException e){
                ProbeSupport.check(e.getCause() instanceof java.io.IOException,"a refused send fails as I/O: "+e.getCause());
                outcome="blocked";
            }
            ProbeSupport.check(outcome.equals(each[2]) && proceeds[0]==(outcome.equals("sent")?1:0),
                "Anonymous chat: "+each[0]+" "+each[1]+" was "+outcome+" with "+proceeds[0]+" proceeds");
        }
        setting("chat_anonymous",false);
        b=builder();
        call(c(HTTP),"withInterceptor",new Class<?>[]{c("okhttp3.OkHttpClient$Builder")},b);
        interceptors=(List<?>)call(call(b,"build",new Class<?>[]{}),"interceptors",new Class<?>[]{});
        ProbeSupport.check(interceptors.isEmpty(),"Anonymous chat off: no interceptor");
        setting("emotes_7tv",true);
        System.out.println("PASS: Anonymous chat refuses chat sends on Kick's API and passes everything else; off adds nothing");
    }
    public static void main(String[] args){ProbeSupport.run("Kick native response-to-page options",()->{
        try(ZipFile apk=new ZipFile(args[0])){
            String script=new String(apk.getInputStream(apk.getEntry("assets/lurk-chat.js")).readAllBytes(),StandardCharsets.UTF_8);
            // Cache actual APK asset; no Android WebView renderer is needed to capture the bridge call.
            ProbeSupport.field(c(CHAT),"script").set(null,script+"\n");
        }
        // Show deleted messages has its own scenario below; its option only asks the page for a report.
        setting("chat_show_deleted",false);
        for(String key:new String[]{"emotes_7tv","chat_ignore_clears","hide_sub_messages","hide_host_messages","hide_reward_redemptions"})setting(key,true);
        response("https://kick.com/api/v2/channels/xqc","{\"id\":668,\"slug\":\"xqc\",\"user_id\":676}",200,true);
        JSONObject options=emit("full",page("{\"channelId\":668}"));
        ProbeSupport.check(options.getString("sevenTvChannel").equals("xqc") && options.getString("sevenTvUser").equals("676"),"numeric IDs from full response");
        response("https://api.kick.com/api/v1/channels/xqc/info","{\"id\":\"669\",\"slug\":\"xqc\",\"user_id\":\"676\"}",200,true);
        options=emit("info",page("{\"channelId\":\"669\"}"));
        ProbeSupport.check(options.getString("sevenTvUser").equals("676"),"string IDs from info response");
        // Kick's real info response has no user_id; the owner's ID is in their profile picture's address.
        response("https://kick.com/api/v2/channels/gmhikaru/info","{\"id\":1770127,\"slug\":\"gmhikaru\",\"user\":{\"username\":\"GMHikaru\","
            +"\"profile_pic\":\"https://files.kick.com/images/user/1820952/profile_image/conversion/f02d-fullsize.webp\"}}",200,true);
        options=quiet(page("{\"channelId\":1770127}"));
        ProbeSupport.check(options.getString("sevenTvUser").equals("1820952"),"owner from the info response's profile picture");
        response("https://kick.com/api/v2/channels/other/info","{\"id\":1770128,\"slug\":\"other\",\"user\":{"
            +"\"profile_pic\":\"https://evil.example/images/user/5/profile_image/x.webp\"}}",200,true);
        options=quiet(page("{\"channelId\":1770128}"));
        ProbeSupport.check(options.getString("sevenTvChannel").equals("other") && options.isNull("sevenTvUser"),"a picture elsewhere names no owner");
        for(String url:new String[]{"https://evilkick.com/api/v2/channels/xqc","https://kick.com/api/v2/channels/xqc/nope"})
            response(url,"{\"id\":777,\"slug\":\"wrong\",\"user_id\":999}",200,true);
        response("https://kick.com/api/v2/channels/xqc","{\"id\":777,\"slug\":\"wrong\"}",500,true);
        response("https://kick.com/api/v2/channels/xqc","not-json",200,true);
        options=emit("unknown",page("{\"channelId\":777}"));
        ProbeSupport.check(options.isNull("sevenTvChannel") && options.isNull("sevenTvUser"),"unknown and rejected responses use globals only");
        ProbeSupport.check(emit("preview",page("{\"channelId\":668}")+"&preview=true")==null,"gift preview untouched");
        ProbeSupport.check(emit("foreign","https://example.invalid/")==null,"foreign page untouched");
        setting("emotes_7tv",false);response("https://kick.com/api/v2/channels/xqc","{}",200,false);
        options=emit("provider-off",page("malformed"));
        ProbeSupport.check(!options.has("sevenTv") && options.getBoolean("ignoreClears") && options.getJSONArray("hide").length()==4,"independent native switches with provider off");
        setting("emotes_7tv",true);
        options=emit("malformed",page("malformed"));
        ProbeSupport.check(options!=null && options.getBoolean("ignoreClears") && options.getJSONArray("hide").length()==4,"malformed config must retain unrelated ignoreClears/hide options");
        ProbeSupport.check(options.getBoolean("sevenTv") && options.isNull("sevenTvChannel"),"malformed config falls back to global emotes");
        options=emit("missing-config","https://chat.mobile.kick.com/");
        ProbeSupport.check(options.isNull("sevenTvChannel"),"missing config uses globals");
        options=emit("invalid-id",page("{\"channelId\":{}}"));
        ProbeSupport.check(options.isNull("sevenTvChannel"),"invalid ID type uses globals");
        setting("chat_ignore_clears",false);setting("hide_sub_messages",false);setting("hide_host_messages",false);setting("hide_reward_redemptions",false);
        options=emit("provider-only",page("{\"channelId\":668}"));
        ProbeSupport.check(!options.has("ignoreClears") && !options.has("hide"),"provider does not enable other switches");
        setting("emotes_7tv",false);ProbeSupport.check(emit("all-off",page("{}"))==null,"all switches off does not inject");
        String[] keys={"chat_ignore_clears","hide_sub_messages","hide_host_messages","hide_reward_redemptions"};
        String[] names={"clears-only","subs-only","hosts-only","rewards-only"};
        int[] selectors={0,2,1,1};
        for(int i=0;i<keys.length;i++){
            setting(keys[i],true);options=emit(names[i],page("{}"));
            ProbeSupport.check(!options.has("sevenTv") && options.has("ignoreClears")== (i==0),"independent clear/provider switches " + names[i]);
            ProbeSupport.check((options.has("hide")?options.getJSONArray("hide").length():0)==selectors[i],"independent hide selectors " + names[i]);
            setting(keys[i],false);
        }
        setting("chat_show_deleted",true);options=emit("moderator-only",page("{}"));
        ProbeSupport.check(options.getBoolean("moderatorView") && options.length()==1,"Show deleted messages alone only asks for its report");
        setting("chat_show_deleted",false);
        // Third-party badges alone: the owner for the badge socket, no emotes.
        setting("badges_7tv",true);
        response("https://kick.com/api/v2/channels/xqc","{\"id\":668,\"slug\":\"xqc\",\"user_id\":676}",200,true);
        options=quiet(page("{\"channelId\":668}"));
        ProbeSupport.check(options.getBoolean("sevenTvBadges") && options.getString("sevenTvUser").equals("676") && !options.has("sevenTv")
            && !options.has("sevenTvChannel"),"7TV badges alone: the owner and no emotes");
        setting("badges_7tv",false);
        lifecycle();
        keywords();
        look();
        anonymous();
    });}
}
