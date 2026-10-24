package app.morphe.extension.chmate;

import android.content.Context;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.*;
import java.util.function.Consumer;
import org.json.*;

/** Result snapshots stay off the Activity state transaction and off the UI thread. */
final class ToolTabResults {
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    static boolean valid(String token){return token!=null&&token.matches("[a-f0-9-]{36}");}
    private static File file(Context context,String token){
        if(!valid(token))throw new IllegalArgumentException("Invalid tab result key");
        return new File(new File(context.getCacheDir(),"haiagaru-tab-results"),token+".json");
    }
    static void save(Context context,String token,List<String[]> records,String status,String form){
        Context app=context.getApplicationContext();
        IO.execute(()->{try{
            JSONArray rows=new JSONArray();for(String[] record:records)rows.put(new JSONArray(java.util.Arrays.asList(record)));
            byte[] bytes=new JSONObject().put("rows",rows).put("status",status).put("form",form).toString().getBytes(StandardCharsets.UTF_8);
            File target=file(app,token);File directory=target.getParentFile();
            if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("Tab cache directory");
            AtomicFile atomic=new AtomicFile(target);FileOutputStream stream=null;
            try{stream=atomic.startWrite();stream.write(bytes);atomic.finishWrite(stream);stream=null;}
            finally{if(stream!=null)atomic.failWrite(stream);}
        }catch(Exception error){android.util.Log.w("Haiagaru","Tab results could not be cached",error);}});
    }
    static void load(Context context,String token,Consumer<JSONObject> ready){
        Context app=context.getApplicationContext();
        IO.execute(()->{try{
            AtomicFile atomic=new AtomicFile(file(app,token));
            JSONObject saved=new JSONObject(new String(atomic.readFully(),StandardCharsets.UTF_8));ready.accept(saved);
        }catch(FileNotFoundException absent){ready.accept(new JSONObject());}
        catch(Exception error){android.util.Log.w("Haiagaru","Tab result cache could not be read",error);ready.accept(new JSONObject());}});
    }
}
