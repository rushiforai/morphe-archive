/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.content.Context;
import android.util.AtomicFile;
import org.json.JSONObject;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Comparator;

/** Positive lyric responses only, seven-day TTL, bounded to 24 MiB / 96 entries. */
final class LyricsDiskCache {
    private final File directory;
    LyricsDiskCache(Context context){directory=new File(context.getCacheDir(),"bdcrusher-lyrics-v1");}
    private File file(String key)throws Exception{
        byte[] digest=MessageDigest.getInstance("SHA-256").digest(key.getBytes(StandardCharsets.UTF_8));
        StringBuilder name=new StringBuilder();for(byte value:digest)name.append(String.format(java.util.Locale.ROOT,"%02x",value&255));
        return new File(directory,name+".json");
    }
    synchronized JSONObject get(String key){
        return read(key,false);
    }
    /** The new permanent library validates this known recording/query before accepting it. */
    synchronized JSONObject migrate(String key){return read(key,true);}
    private JSONObject read(String key,boolean migration){
        try{
            File file=file(key);if(!file.isFile()||file.length()>4*1024*1024)return null;
            JSONObject wrapper=new JSONObject(new String(new AtomicFile(file).readFully(),StandardCharsets.UTF_8));
            if(!migration&&System.currentTimeMillis()-wrapper.getLong("saved")>7L*24*60*60*1000)return null;
            return wrapper.getJSONObject("payload");
        }catch(Exception ignored){return null;}
    }
    synchronized void put(String key,JSONObject payload){
        try{
            directory.mkdirs();AtomicFile file=new AtomicFile(file(key));
            byte[] bytes=new JSONObject().put("saved",System.currentTimeMillis()).put("payload",payload).toString().getBytes(StandardCharsets.UTF_8);
            if(bytes.length>4*1024*1024)return;
            FileOutputStream output=null;
            try{output=file.startWrite();output.write(bytes);file.finishWrite(output);}catch(Exception ex){file.failWrite(output);return;}
            File[] files=directory.listFiles((dir,name)->name.matches("[a-f0-9]{64}\\.json"));
            if(files==null)return;Arrays.sort(files,Comparator.comparingLong(File::lastModified));
            long total=0;for(File item:files)total+=item.length();int count=files.length;
            for(File item:files){if(total<=24L*1024*1024&&count<=96)break;long length=item.length();if(item.delete()){total-=length;count--;}}
        }catch(Exception ignored){}
    }
}
