import io.github.jordanwoodson.extension.shared.twitch.TwitchEmotes;
import io.github.jordanwoodson.extension.shared.twitch.TwitchBadges;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import java.lang.reflect.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public final class TwitchProvidersProbe {
    static final String ROOT = "io.github.jordanwoodson.extension.shared.twitch.";
    static Object field(String type, String name) throws Exception {
        Field f = Class.forName(ROOT + type).getDeclaredField(name); f.setAccessible(true); return f.get(null);
    }
    static void check(boolean value, String why) { if (!value) throw new AssertionError(why); }
    static String line(String text) { return "@room-id=123;emotes= :alice!a@a PRIVMSG #room :" + text; }
    static String add(String text, Map<String,String> codes) throws Exception {
        Method m = TwitchEmotes.class.getDeclaredMethod("addEmotes", String.class, Map.class);
        m.setAccessible(true); return (String)m.invoke(null,text,codes);
    }
    static void seed(String scope, String code, String id) throws Exception { seed(scope, code, id, null); }
    static void seed(String scope, String code, String id, String owner) throws Exception {
        Class<?> emote = Class.forName(ROOT + "TwitchEmotes$Emote");
        Constructor<?> c = emote.getDeclaredConstructor(String.class,String.class,String.class); c.setAccessible(true);
        Object array = Array.newInstance(emote, 1); Array.set(array,0,c.newInstance(code,id,owner));
        Constructor<?> e = Class.forName(ROOT + "TwitchEmotes$Entry").getDeclaredConstructors()[0]; e.setAccessible(true);
        // Reflection reaches a private Entry type; only this known String-keyed cache write needs the cast.
        @SuppressWarnings("unchecked") Map<String,Object> sets = (Map<String,Object>)field("TwitchEmotes","SETS");
        sets.put("7:" + scope,e.newInstance(array,Long.MAX_VALUE));
    }
    public static void main(String[] args) throws Exception {
        switch (args[0]) {
            case "demand-reacquire": {
                Class<?> type=Class.forName(ROOT+"TwitchThirdParty$Demand");
                Constructor<?> ctor=type.getDeclaredConstructor();ctor.setAccessible(true);Object demand=ctor.newInstance();
                Method add=type.getDeclaredMethod("add",java.util.function.BooleanSupplier.class);add.setAccessible(true);
                java.util.concurrent.atomic.AtomicBoolean old=new java.util.concurrent.atomic.AtomicBoolean(true);
                for(int i=0;i<64;i++) {java.util.function.BooleanSupplier owner=new java.util.function.BooleanSupplier(){public boolean getAsBoolean(){return old.get();}};add.invoke(demand,owner);}
                old.set(false);add.invoke(demand,(java.util.function.BooleanSupplier)()->true);
                check(((java.util.function.BooleanSupplier)demand).getAsBoolean(),"new owner survives retired owner capacity");
                break;
            }
            case "queue-rejection": {
                ThreadPoolExecutor pool=(ThreadPoolExecutor)field("TwitchThirdParty","POOL");
                CountDownLatch started=new CountDownLatch(3),release=new CountDownLatch(1);
                for(int i=0;i<3;i++)pool.execute(()->{started.countDown();try{release.await();}catch(InterruptedException e){Thread.currentThread().interrupt();}});
                check(started.await(2,TimeUnit.SECONDS),"workers occupied");
                for(int i=0;i<50;i++)pool.execute(()->{});
                Settings.values.put("emotes_7tv","true");TwitchEmotes.onChatChannel("123");
                check(((Set)field("TwitchEmotes","LOADING")).isEmpty(),"rejection clears loading");
                check(((Map)field("TwitchEmotes","RN_REQUESTS")).isEmpty(),"rejection clears demand");
                release.countDown();pool.shutdown();check(pool.awaitTermination(3,TimeUnit.SECONDS),"queue drains");
                break;
            }
            case "unicode": {
                Map<String,String> map = Map.of("Kappa","lurk7s_test", "𐐀","lurk7s_letter");
                for (String prefix : new String[]{"😀 ","é ","👩‍💻 "}) {
                    int start=prefix.codePointCount(0,prefix.length());
                    check(add(line(prefix+"Kappa"),map).contains("lurk7s_test:"+start+"-"+(start+4)),"code point offset "+prefix);
                }
                check(add(line("𐐀"),map).contains("lurk7s_letter:0-0"),"supplementary code");
                check(add(line("\u0001ACTION 😀 Kappa\u0001"),map).contains("lurk7s_test:2-6"),"ACTION excludes wrapper");
                String stock=line("Kappa").replace("emotes=", "emotes=25:0-4");
                check(add(stock,map)==stock,"stock range precedence/identity");
                String punctuation=line("Kappa!"); check(add(punctuation,map)==punctuation,"whole token punctuation");
                String off=line("Kappa");check(TwitchEmotes.rnFrame(off)==off,"providers off identity");
                String ordinary="https://example.com/lurk7s_test";check(TwitchEmotes.url(ordinary)==ordinary,"ordinary image identity");
                break;
            }
            case "multiline": {
                Settings.values.put("emotes_7tv","true");seed("123","Kappa","lurk7s_test");seed("global","Global","lurk7s_global");
                String frame="PING :tmi.twitch.tv\r\n"+line("😀 Kappa")+"\r\n";
                check(TwitchEmotes.rnFrame(frame).equals("PING :tmi.twitch.tv\r\n"+line("😀 Kappa").replace("emotes=", "emotes=lurk7s_test:2-6")+"\r\n"),"PING-first frame preserves all lines and rewrites tagged message");
                seed("456","Kappa","lurk7s_shared");
                check(TwitchEmotes.rnFrame(line("Kappa").replace("room-id=123", "room-id=123;source-room-id=456")).contains("lurk7s_shared:0-4"),"shared source room precedence");
                break;
            }
            case "rn-dispose": case "rn-native-demand": case "rn-badges-dispose": case "rn-pronouns-dispose": {
                AtomicInteger requests=new AtomicInteger();
                URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler() {
                    protected URLConnection openConnection(URL url) { requests.incrementAndGet(); return new HttpURLConnection(url) {
                        public void connect(){} public void disconnect(){} public boolean usingProxy(){return false;}
                        public int getResponseCode(){return 404;}
                    }; }
                } : null);
                boolean pronouns=args[0].equals("rn-pronouns-dispose"), badges=args[0].equals("rn-badges-dispose");
                ThreadPoolExecutor pool=(ThreadPoolExecutor)field(pronouns?"TwitchPronouns":"TwitchThirdParty",pronouns?"LOOKUPS":"POOL");
                int threads=pronouns?1:3;
                CountDownLatch started=new CountDownLatch(threads),release=new CountDownLatch(1);
                for(int i=0;i<threads;i++)pool.execute(()->{started.countDown();try{release.await();}catch(InterruptedException e){Thread.currentThread().interrupt();}});
                check(started.await(2,TimeUnit.SECONDS),"workers occupied");
                Settings.values.put(pronouns?"badges_pronouns":badges?"badges_chatterino":"emotes_7tv","true");
                java.util.concurrent.atomic.AtomicBoolean active=new java.util.concurrent.atomic.AtomicBoolean(true);
                if(pronouns){Field names=Class.forName(ROOT+"TwitchPronouns").getDeclaredField("names");names.setAccessible(true);names.set(null,Map.of());}
                Class<?> owner=Class.forName(ROOT+(pronouns?"TwitchPronouns":badges?"TwitchBadges":"TwitchEmotes"));
                Method request=badges?owner.getDeclaredMethod("requestRn",java.util.function.BooleanSupplier.class):owner.getDeclaredMethod("requestRn",String.class,java.util.function.BooleanSupplier.class);request.setAccessible(true);
                if(badges)request.invoke(null,(java.util.function.BooleanSupplier)active::get);
                else request.invoke(null,pronouns?"alice":"123",(java.util.function.BooleanSupplier)active::get);
                if(args[0].equals("rn-native-demand"))TwitchEmotes.onChatChannel("123");
                active.set(false);release.countDown();pool.shutdown();check(pool.awaitTermination(3,TimeUnit.SECONDS),"workers complete");
                check(requests.get()==(args[0].equals("rn-native-demand")?2:0),"RN dispose preserves only native shared demand");
                check(((Set)field("TwitchEmotes","LOADING")).isEmpty(),"dispose completion cleared loading");
                break;
            }
            case "describe": {
                // Emote and badge info: which list a chat emote image came from, from its CDN URL.
                Method describe=TwitchEmotes.class.getDeclaredMethod("describe",String.class);describe.setAccessible(true);
                seed("123","Kappa","lurk7s_abc","Maker");
                seed("global","Other","lurk7a_xyz",null);
                String[] found=(String[])describe.invoke(null,"https://cdn.7tv.app/emote/abc/2x.png");
                check(found[0].equals("7TV")&&"channel".equals(found[1])&&"Maker".equals(found[2]),"channel emote and its owner");
                found=(String[])describe.invoke(null,"https://cdn.7tv.app/emote/xyz/2x.gif");
                check("global".equals(found[1])&&found[2]==null,"global emote without an owner");
                seed("456","Kappa","lurk7s_abc","Another");
                TwitchEmotes.onChatChannel("123");
                check("Maker".equals(((String[])describe.invoke(null,"https://cdn.7tv.app/emote/abc/3x.png"))[2]),"the channel whose chat is open wins");
                found=(String[])describe.invoke(null,"https://cdn.7tv.app/emote/bc/2x.png");
                check(found[0].equals("7TV")&&found[1]==null,"an ID's tail is not the ID");
                check(describe.invoke(null,"https://static-cdn.jtvnw.net/emoticons/v2/25/default/dark/2.0")==null,"Twitch emotes aren't third-party");
                check(describe.invoke(null,"https://cdn.7tv.app/emote/abc")==null,"a URL without a file isn't an emote image");
                break;
            }
            case "cache-bound": {
                Class<?> emote=Class.forName(ROOT+"TwitchEmotes$Emote");Object empty=Array.newInstance(emote,0);
                Method put=TwitchEmotes.class.getDeclaredMethod("put",String.class,empty.getClass(),long.class);put.setAccessible(true);
                for(int i=0;i<100;i++)put.invoke(null,"7:"+i,empty,3600000L);
                check(((Map)field("TwitchEmotes","SETS")).size()<=39,"fresh room caches are bounded");
                Method add=TwitchEmotes.class.getDeclaredMethod("add",List.class,int.class,String.class,String.class,boolean.class,float.class,String.class);add.setAccessible(true);
                List emotes=new ArrayList();
                for(int i=0;i<9000;i++)add.invoke(null,emotes,0,"wide"+i,"Wide"+i,false,2f,null);
                check(((Map)field("TwitchEmotes","RATIOS")).size()<=8192,"wide-emote metadata cache is bounded");
                break;
            }
            case "rn-passive": {
                Settings.values.put("emotes_7tv","true");seed("123","Kappa","lurk7s_test");
                Method cached=TwitchEmotes.class.getDeclaredMethod("cachedRn",String.class);cached.setAccessible(true);
                Map result=(Map)cached.invoke(null,"123");check(result.get("Kappa").equals("lurk7s_test"),"passive cache shares native data");
                check(((Set)field("TwitchEmotes","LOADING")).isEmpty(),"passive snapshot never schedules missing globals");
                break;
            }
            case "rn-frame-passive": {
                Settings.values.put("emotes_7tv","true");
                String frame=line("hello");check(TwitchEmotes.rnFrame(frame)==frame,"uncached RN frame stays stock");
                check(((Set)field("TwitchEmotes","LOADING")).isEmpty(),"RN ingress does not create unowned provider requests");
                break;
            }
            case "queued-disable": case "badges-disable": case "pronouns-disable": {
                AtomicInteger requests=new AtomicInteger();
                URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler() {
                    protected URLConnection openConnection(URL url) { requests.incrementAndGet(); return new HttpURLConnection(url) {
                        public void connect(){} public void disconnect(){} public boolean usingProxy(){return false;}
                        public int getResponseCode(){return 404;}
                    }; }
                } : null);
                boolean pronouns=args[0].equals("pronouns-disable"), badges=args[0].equals("badges-disable");
                ThreadPoolExecutor pool=(ThreadPoolExecutor)field(pronouns?"TwitchPronouns":"TwitchThirdParty",pronouns?"LOOKUPS":"POOL");
                CountDownLatch started=new CountDownLatch(pronouns?1:3),release=new CountDownLatch(1);
                for(int i=0;i<(pronouns?1:3);i++)pool.execute(()->{started.countDown();try{release.await();}catch(InterruptedException e){Thread.currentThread().interrupt();}});
                check(started.await(2,TimeUnit.SECONDS),"workers occupied");
                String key=pronouns?"badges_pronouns":badges?"badges_chatterino":"emotes_7tv";
                Settings.values.put(key,"true");
                if(pronouns){
                    Field names=Class.forName(ROOT+"TwitchPronouns").getDeclaredField("names");names.setAccessible(true);names.set(null,Map.of());
                    Method badge=Class.forName(ROOT+"TwitchPronouns").getDeclaredMethod("badge",String.class);badge.setAccessible(true);badge.invoke(null,"alice");
                }else if(badges)TwitchBadges.badges(List.of(),new Object(),Object.class);
                else TwitchEmotes.onChatChannel("123");
                Settings.values.put(key,"false");release.countDown();
                pool.shutdown();check(pool.awaitTermination(3,TimeUnit.SECONDS),"workers complete");
                check(requests.get()==0,"queued opt-out started "+requests.get()+" requests");
                check(((Set)field("TwitchEmotes","LOADING")).isEmpty(),"cancelled loading flags cleared");
                if(pronouns)check(((Set)field("TwitchPronouns","PENDING")).isEmpty(),"cancelled pronoun pending cleared");
                break;
            }
            default: throw new AssertionError(args[0]);
        }
        System.out.println("PASS "+args[0]);
    }
}
