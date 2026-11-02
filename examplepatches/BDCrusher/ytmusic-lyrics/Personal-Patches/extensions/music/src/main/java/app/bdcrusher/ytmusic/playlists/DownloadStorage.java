/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import java.io.File;

/** Read-only inventory. External downloader files are never counted as app-owned bytes. */
public final class DownloadStorage {
    public static final String[] LABELS={"Downloaded audio","Cover artwork","Metadata and chapters","Temporary downloads"};
    public record Snapshot(long[] bytes,long[] counts,long free){public long owned(){long total=0;for(long n:bytes)total+=n;return total;}}
    private DownloadStorage(){}
    public static Snapshot scan(File audio,File internal,File preferences,long free){
        long[] bytes=new long[4],counts=new long[4];File[] files=audio==null?null:audio.listFiles();
        if(files!=null)for(File f:files)if(f.isFile()){
            String n=f.getName();int category=n.endsWith(".part")?3:n.endsWith(".webm")||n.endsWith(".m4a")?0:n.endsWith(".jpg")?1:2;add(f,category,bytes,counts);
        }
        for(String directory:new String[]{"bdcrusher-offline-native","bdcrusher-offline-playlists","bdcrusher-playlist-pages","bdcrusher-playlist-artwork"}){
            File[] entries=new File(internal,directory).listFiles();if(entries==null)continue;
            for(File f:entries)if(f.isFile())add(f,directory.endsWith("artwork")&&(f.getName().endsWith(".jpg")||f.getName().contains(".jpg."))?1:2,bytes,counts);
        }
        if(preferences!=null&&preferences.isFile())add(preferences,2,bytes,counts);
        return new Snapshot(bytes,counts,free);
    }
    private static void add(File f,int category,long[] bytes,long[] counts){bytes[category]+=f.length();counts[category]++;}
    /** Query an existing parent even before the first download creates the audio directory. */
    public static File volumePath(File desired,File fallback){
        File value=desired;while(value!=null&&!value.isDirectory())value=value.getParentFile();return value==null?fallback:value;
    }
}
