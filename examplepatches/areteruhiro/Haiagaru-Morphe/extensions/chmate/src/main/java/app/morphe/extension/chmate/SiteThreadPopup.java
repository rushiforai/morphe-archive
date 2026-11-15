package app.morphe.extension.chmate;

import android.content.Context;
import android.text.format.DateUtils;
import java.io.*;
import java.nio.charset.Charset;

/** Displays external-board metadata without changing the native thread identity. */
public final class SiteThreadPopup {
    private static final class ThreadRef {
        final Context context;final SiteBoardGateway gateway;
        final String key,id;final long nativeId;
        ThreadRef(Context c,SiteBoardGateway g,String key,String id,long nativeId){
            context=c;gateway=g;this.key=key;this.id=id;this.nativeId=nativeId;
        }
    }
    private static ThreadRef ref(Object info)throws Exception{
        Context c=Haiagaru.applicationContextForExtension();if(c==null||info==null)return null;
        String[] fields=ExternalBoardEditor.infoFields().split(",");if(fields.length!=2)return null;
        String host=(String)NativeFields.find(info.getClass(),fields[0]).get(info);
        if(host==null||!host.startsWith("127.0.0.1:"))return null;
        String path=(String)NativeFields.find(info.getClass(),fields[1]).get(info);
        SiteBoardGateway gateway=SiteBoardGateway.get(c);
        String key=gateway.registeredKey(host,path);if(key==null)return null;
        Number id=(Number)NativeFields.find(info.getClass(),fields[0].equals("g")?"c":"e").get(info);
        long nativeId=id==null?0:id.longValue();
        return new ThreadRef(c,gateway,key,id==null?null:SiteThreadIds.source(id.toString()),nativeId);
    }
    private static Object info(Object model)throws Exception{
        String name=model.getClass().getName();
        String field=name.equals("o.q8")?"A":name.equals("o.TTInterstitialActivity")?"o":"p";
        return NativeFields.find(model.getClass(),field).get(model);
    }
    public static String date(String original,Object model){
        try{
            Object url=info(model);ThreadRef thread=ref(url);if(thread==null||thread.id==null)return original;
            long epoch=SiteThreadMetadata.cachedCreation(thread.key,thread.id);
            if(epoch<=0)epoch=localCreation(thread,url);
            return epoch>0?DateUtils.formatDateTime(thread.context,epoch*1000,23):"日時不明";
        }catch(Exception unavailable){return original;}
    }
    private static long localCreation(ThreadRef thread,Object info){
        // Bounded lookup for a previously cached thread, including a cold popup
        // before the asynchronous metadata index has been read.
        try{
            String version=thread.context.getPackageManager().getPackageInfo(thread.context.getPackageName(),0).versionName;
            String board=RefreshTargets.nativeBoard(info,version).toString();
            if(board.contains("/")||board.contains("\\")||board.isEmpty())return 0;
            File dir=thread.context.getExternalFilesDir("2chMate/dat");if(dir==null)return 0;
            File file=new File(dir,board+"_"+thread.nativeId+".dat");
            try(InputStream in=new BufferedInputStream(new FileInputStream(file))){
                ByteArrayOutputStream header=new ByteArrayOutputStream();
                for(int i=0;i<4096;i++){int ch=in.read();if(ch<0||ch==10)break;header.write(ch);}
                String[] fields=new String(header.toByteArray(),Charset.forName("windows-31j")).split("<>",4);
                if(fields.length>=3)return SiteThreadDates.parse(fields[2]);
            }
        }catch(Exception ignored){}
        return 0;
    }
    public static String boardName(String original,Object model){
        try{
            ThreadRef thread=ref(info(model));if(thread==null)return original;
            String key=thread.gateway.popupBoardKey(thread.key,thread.id);
            String name=thread.gateway.names.get(key);
            return name==null||name.isEmpty()?original:name;
        }catch(Exception unavailable){return original;}
    }
    public static String listModelName(String original,Object model){
        try{return listName(original,NativeThreadContext.flow(model,"f","d"));}
        catch(Exception unavailable){return original;}
    }
    public static String listName(String original,Object info){
        try{
            ThreadRef thread=ref(info);if(thread==null)return original;
            String name=thread.gateway.names.get(thread.key);
            return name==null||name.isEmpty()?original:name;
        }catch(Exception unavailable){return original;}
    }
    public static String boardRoute(Object info){
        try{
            ThreadRef thread=ref(info);
            return thread==null?null:thread.gateway.popupBoardUrl(thread.key,thread.id);
        }catch(Exception unavailable){return null;}
    }
    private SiteThreadPopup(){}
}
