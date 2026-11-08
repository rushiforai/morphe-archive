package e.e.a;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Per-listing one-pass index; avoids N HLS directory scans for N cached videos. */
public final class Dev117 {
    private static final Pattern NAME=Pattern.compile("^((?:sm|nm|so|ss)[0-9]+)(.*)$");
    private static final ThreadLocal<Index> CURRENT=new ThreadLocal<>();
    static final class Entry {
        long mp4=-1,assets,packed;
        boolean playlist;
    }
    static final class Index {
        final String folder;
        final Map<String,Entry> videos=new HashMap<>();
        Index(String root) { folder=strip(root); }
    }
    private Dev117() {}
    private static String strip(String folder) {
        if(folder==null)return "";
        while(folder.endsWith("/"))folder=folder.substring(0,folder.length()-1);
        return folder;
    }
    public static void start(String root,File[] files) {
        Index index=new Index(root);
        if(files!=null)for(File file:files){
            try {
                if(!file.isFile())continue;
                String name=file.getName();
                Matcher m=NAME.matcher(name);
                if(!m.matches())continue;
                String suffix=m.group(2),id=m.group(1);
                Entry info=index.videos.get(id);
                if(info==null){info=new Entry();index.videos.put(id,info);}
                if(suffix.equals(".mp4"))info.mp4=file.length();
                else if(suffix.equals(".m3u8"))info.playlist=true;
                else if(suffix.equals(".ncache"))info.packed=file.length();
                else if(suffix.startsWith("_asset_"))info.assets+=Math.max(0,file.length());
            } catch (RuntimeException ignored) {
                // A cache file can disappear while the index is built.
            }
        }
        CURRENT.set(index);
    }
    /** Return -2 to use the original completion detection if verification is required. */
    public static long completedBytes(String root,String videoId) {
        Index index=CURRENT.get();
        if(index==null || !index.folder.equals(strip(root)))return -2;
        Entry e=index.videos.get(videoId);
        if(e==null || e.mp4<0)return -1;
        if(e.packed>0 && e.playlist)return -2; // Verify archive index as before.
        if(e.playlist)return e.assets>0?e.assets:-1;
        if(e.mp4>0 && e.mp4<1024)return -2; // Preserve incomplete-marker detection.
        return e.mp4>0?e.mp4:-1;
    }
    public static void finish() { CURRENT.remove(); }
}
