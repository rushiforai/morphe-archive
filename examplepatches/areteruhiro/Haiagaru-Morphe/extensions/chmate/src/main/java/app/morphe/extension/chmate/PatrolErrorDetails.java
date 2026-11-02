package app.morphe.extension.chmate;
import java.lang.reflect.*;
import java.net.URI;
import java.util.*;
/** Per-patrol error URLs only, appended to ChMate's own event. No cookies or query parameters. */
public final class PatrolErrorDetails {
    private static final ThreadLocal<LinkedHashMap<String,String>> ERRORS=new ThreadLocal<>();
    public static String subjectMethod(){return "";} // Verified BBSUrlInfo subject getter, bound by the patch.
    public static void begin(){ERRORS.set(new LinkedHashMap<>());}
    public static void end(){PatrolErrorHistory.save(ERRORS.get());ERRORS.remove();}
    public static void recordInfo(Object info,Throwable error){
        Map<String,String> entries=ERRORS.get();if(entries==null||info==null||entries.size()>=100)return;
        try{
            Method getter=info.getClass().getDeclaredMethod(subjectMethod());getter.setAccessible(true);
            String url=safeUrl((String)getter.invoke(info));if(url!=null)entries.putIfAbsent(url,error==null?"取得エラー":error.getClass().getSimpleName());
        }catch(ReflectiveOperationException|RuntimeException ignored){}
    }
    public static void record(Object board,Throwable error){
        Map<String,String> entries=ERRORS.get();if(entries==null||board==null||entries.size()>=100)return;
        try{
            Object info=null;
            for(Method m:board.getClass().getDeclaredMethods())if(m.getParameterTypes().length==0&&m.getReturnType().getName().equals("jp.syoboi.a2chMate.client.BBSUrlInfo")){m.setAccessible(true);info=m.invoke(board);break;}
            if(info==null)return;
            recordInfo(info,error);
        }catch(ReflectiveOperationException|RuntimeException ignored){}
    }
    static String safeUrl(String value){
        try{URI u=URI.create(value);if(!("http".equals(u.getScheme())||"https".equals(u.getScheme()))||u.getHost()==null||u.getRawUserInfo()!=null)return null;
            String path=u.getRawPath();if(path==null)path="/";path=path.replaceFirst("/subject(?:-metadent)?\\.txt$","/");
            return u.getScheme()+"://"+u.getRawAuthority()+path;
        }catch(RuntimeException invalid){return null;}
    }
    public static String append(String message){
        Map<String,String> entries=ERRORS.get();PatrolErrorHistory.save(entries);ERRORS.remove();if(entries==null||entries.isEmpty())return message;
        StringBuilder text=new StringBuilder(message==null?"":message).append("\n\n取得に失敗した板（URL）:");
        for(Map.Entry<String,String> entry:entries.entrySet()){
            if(text.length()+entry.getKey().length()+entry.getValue().length()>16000){text.append("\n（以降は省略）");break;}
            text.append('\n').append(entry.getKey()).append(" — ").append(entry.getValue());
        }
        return text.toString();
    }
    private PatrolErrorDetails(){}
}
