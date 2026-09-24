import android.os.Looper;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

/** YouTube 21.07.247 ART regression. Executes the real shared dispatcher up to its renderer
 * boundary using constructor-free host objects. No Activity/account/network or playback claim. */
public final class ArtCaptionHandoffProbe {
    static final String PREFIX="app.yydarlinker.deepseekcaptions.";
    static Object unsafe;
    static Method allocate;
    static Object alloc(Class<?> c)throws Exception{return allocate.invoke(unsafe,c);}
    static Object get(Class<?> c,Object o,String name)throws Exception{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);}
    static void set(Class<?> c,Object o,String name,Object value)throws Exception{Field f=c.getDeclaredField(name);f.setAccessible(true);f.set(o,value);}
    static Object invoke(Class<?> c,String name,Class<?>[] types,Object...args)throws Exception{
        Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);
    }
    static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args) {
        try { run(); } catch(Throwable error) { error.printStackTrace();System.exit(1); }
    }
    static Class<?> bridge,page,choice,memory,managerClass,trackClass,eventClass,originClass,modelClass;
    static Object automatic,preferred;
    static Constructor<?> eventCtor;
    static Method dispatch;
    static void varint(ByteArrayOutputStream b,int v){while(v>127){b.write((v&127)|128);v>>>=7;}b.write(v);}
    static void field(ByteArrayOutputStream b,int n,byte[] value){varint(b,(n<<3)|2);varint(b,value.length);b.write(value,0,value.length);}
    static void text(ByteArrayOutputStream b,int n,String value){field(b,n,value.getBytes(StandardCharsets.UTF_8));}
    static Object model(String video)throws Exception {
        // Real native protobuf parser -> native model constructor -> native track builder.
        // No fabricated model.videoId field assignment or prebuilt track for the normal path.
        ByteArrayOutputStream entry=new ByteArrayOutputStream();
        text(entry,1,"https://www.youtube.com/api/timedtext?v="+video+"&lang=en");
        text(entry,3,".en");text(entry,4,"en");
        ByteArrayOutputStream data=new ByteArrayOutputStream();field(data,1,entry.toByteArray());
        field(data,2,new byte[]{16,0}); // audio track: caption index 0
        Class<?> meta=Class.forName("bdxi"),base=meta.getSuperclass();
        Object parsed=base.getMethod("parseFrom",base,byte[].class).invoke(null,get(meta,null,"a"),data.toByteArray());
        return modelClass.getMethod("f",String.class,meta,boolean.class,String.class,String.class)
                .invoke(null,video,parsed,false,"Off","Auto-translate");
    }
    static Object manager(String video,String cpn)throws Exception {
        Object manager=alloc(managerClass);set(managerClass,manager,"o",model(video));
        Class<?> player=Class.forName("aoeg");
        Object proxy=Proxy.newProxyInstance(player.getClassLoader(),new Class<?>[]{player},(o,m,args)->{
            if(m.getName().equals("ap"))return cpn;
            throw new AssertionError("Unexpected player call "+m.getName());
        });
        set(managerClass,manager,"q",proxy);return manager;
    }
    static Object track(Object manager)throws Exception {
        List<?> tracks=(List<?>)invoke(bridge,"nativeTracks",new Class<?>[]{Object.class},manager);
        for(Object t:tracks)if("en".equals(invoke(bridge,"language",new Class<?>[]{Object.class},t)))return t;
        throw new AssertionError("Native model did not build source track");
    }
    static void foreground(String video)throws Exception{
        set(page,null,"currentId",video);invoke(bridge,"onVideoId",new Class<?>[]{String.class},video);
    }
    static void apply(Object manager,Object track,Object origin)throws Exception{
        // Read CPN through the real host producer rather than assuming it is videoId.
        String cpn=(String)managerClass.getMethod("c").invoke(manager);
        Object event=eventCtor.newInstance(track,origin,2,cpn);
        try{dispatch.invoke(manager,event);throw new AssertionError("Fixture must stop at renderer boundary");}
        catch(InvocationTargetException expected){
            Throwable cause=expected.getCause();require(cause instanceof NullPointerException,"Unexpected host failure: "+cause);
            require(Arrays.stream(cause.getStackTrace()).anyMatch(f->f.getClassName().equals("anws")&&f.getMethodName().equals("f")),"Did not reach renderer boundary: "+cause);
        }
    }
    static boolean on()throws Exception{return Boolean.TRUE.equals(invoke(choice,"isOn",new Class<?>[]{}));}
    static void run()throws Exception {
        if(Looper.getMainLooper()==null)Looper.prepareMainLooper();
        Class<?> u=Class.forName("sun.misc.Unsafe");unsafe=get(u,null,"theUnsafe");allocate=u.getMethod("allocateInstance",Class.class);
        bridge=Class.forName(PREFIX+"NativeCaptionBridge");page=Class.forName(PREFIX+"PageCaptionController");choice=Class.forName(PREFIX+"CaptionChoice");memory=Class.forName(PREFIX+"RememberedCaptionSelection");
        managerClass=Class.forName("anws");trackClass=Class.forName("anyg");eventClass=Class.forName("amof");originClass=Class.forName("amol");modelClass=Class.forName("anyi");
        boolean ai=Boolean.TRUE.equals(invoke(Class.forName(PREFIX+"CaptionAddonSupport"),"aiInstalled",new Class<?>[]{}));
        if(ai){
            Class<?> auto=Class.forName("app.morphe.extension.youtube.patches.AutoCaptionsPatch");
            ((AtomicBoolean)get(auto,null,"captionsButtonStatus")).set(true); // isolate official setting from this ownership test
        }
        for(Object item:originClass.getEnumConstants()){
            if(((Enum<?>)item).name().equals("DEFAULT"))automatic=item;
            if(((Enum<?>)item).name().equals("PREFERRED_TRACK"))preferred=item;
        }
        require(automatic!=null&&preferred!=null,"Native origins missing");
        eventCtor=eventClass.getConstructor(trackClass,originClass,int.class,String.class);dispatch=managerClass.getMethod("l",eventClass);
        if(!ai){runMemoryOnly();return;}
        Object last=null,lastTrack=null;
        for(int i=1;i<=20;i++){
            String video=String.format(Locale.ROOT,"%011d",i);
            foreground(video);Object manager=manager(video,"cpn_"+i+"_not_video"),track=track(manager);
            require(!video.equals(managerClass.getMethod("c").invoke(manager)),"CPN fixture must differ from videoId");
            apply(manager,track,automatic);
            require(on(),"Automatic dispatcher did not capture video "+i);
            require(video.equals(invoke(bridge,"nativeModelVideo",new Class<?>[]{Object.class},manager)),"Wrong bound model ID");
            Map<?,?> selections=(Map<?,?>)get(bridge,null,"selections");Object selected=selections.get(video);
            require(selected!=null,"No snapshot for video "+i);require(selections.size()<=6,"Snapshot bound exceeded");
            require(((java.lang.ref.WeakReference<?>)get(selected.getClass(),selected,"manager")).get()==manager,"Wrong manager");
            apply(manager,track,preferred);
            require(Integer.valueOf(1).equals(invoke(memory,"decision",new Class<?>[]{})),"Explicit selection memory missing");
            require("en".equals(invoke(memory,"language",new Class<?>[]{})),"Wrong remembered language");
            // Real patched native default selector must resolve a NEW video's model track.
            String next=String.format(Locale.ROOT,"%011d",i+1);Object future=manager(next,"prefetch_cpn_"+i);
            Object restored=managerClass.getMethod("b").invoke(future);
            require(restored!=null&&next.equals(get(trackClass,restored,"d")),"Remembered default must use fresh video track");
            apply(future,restored,automatic);require(on(),"Prefetch changed foreground state");
            apply(manager,null,preferred);require(!on(),"Explicit Off must update visible choice");
            require(Integer.valueOf(0).equals(invoke(memory,"decision",new Class<?>[]{})),"Off memory missing");
            require(managerClass.getMethod("b").invoke(future)==null,"Remembered Off must restore as Off");
            apply(manager,track,preferred);require(on(),"Selecting again must recover after Off");
            set(managerClass,manager,"o",null);apply(manager,null,automatic);
            require(on(),"Ownerless reset must not erase prior choice");
            require(Integer.valueOf(1).equals(invoke(memory,"decision",new Class<?>[]{})),"Reset erased memory");
            set(managerClass,manager,"o",model(video));
            if(last!=null){apply(last,lastTrack,automatic);apply(last,null,preferred);require(on(),"Late prior-video event changed visible choice");}
            last=manager;lastTrack=track;
        }
        // Real model/track mismatch still rejected; fixing CPN must not weaken isolation.
        String mismatchVideo="99999999999";foreground(mismatchVideo);
        apply(manager(mismatchVideo,"different_cpn"),lastTrack,preferred);
        require(!Boolean.TRUE.equals(invoke(choice,"known",new Class<?>[]{})),"True model/track mismatch accepted");
        System.out.println("ART_AUTOMATIC_HANDOFF_PASS videos=20 actual_dispatcher=true cpn_distinct=true native_model_factory=true native_memory_restore=true explicit_off=true background_isolated=true reset_preserved=true true_mismatch_rejected=true renderer_boundary_reached=true network=false");
    }
    static void runMemoryOnly()throws Exception {
        require("".equals(get(page,null,"currentId")),"Memory-only must not need the AI foreground hook");
        for(int i=1;i<=20;i++){
            String video=String.format(Locale.ROOT,"%011d",i),next=String.format(Locale.ROOT,"%011d",i+1);
            Object manager=manager(video,"memory_cpn_"+i),track=track(manager);
            apply(manager,track,preferred);
            require(Integer.valueOf(1).equals(invoke(memory,"decision",new Class<?>[]{})),"Memory-only On missing");
            Object future=manager(next,"next_cpn_"+i);Object restored=managerClass.getMethod("b").invoke(future);
            require(restored!=null&&next.equals(get(trackClass,restored,"d")),"Memory-only restored stale track");
            apply(future,restored,automatic);
            require(Integer.valueOf(1).equals(invoke(memory,"decision",new Class<?>[]{})),"Automatic apply erased memory");
            apply(future,null,preferred);
            require(Integer.valueOf(0).equals(invoke(memory,"decision",new Class<?>[]{})),"Memory-only Off missing");
            require(managerClass.getMethod("b").invoke(manager)==null,"Memory-only Off restoration failed");
            set(managerClass,future,"o",null);apply(future,null,automatic);
            require(Integer.valueOf(0).equals(invoke(memory,"decision",new Class<?>[]{})),"Reset changed memory-only choice");
            require(!Boolean.TRUE.equals(invoke(choice,"known",new Class<?>[]{})),"Memory-only touched AI choice");
        }
        System.out.println("ART_MEMORY_ONLY_PASS videos=20 foreground_hook_absent=true cpn_distinct=true native_memory_restore=true off_restore=true reset_preserved=true network=false");
    }

}
