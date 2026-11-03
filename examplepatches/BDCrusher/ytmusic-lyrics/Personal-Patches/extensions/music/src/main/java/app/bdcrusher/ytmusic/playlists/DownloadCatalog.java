/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import android.os.*;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.music.patches.downloads.OfflineTrack;

/** One progress source for rows, library and notifications. Existing media is indexed in place. */
public final class DownloadCatalog {
    public record Progress(String id,String state,long bytes,long total,String detail,MediaSelection selection){public int percent(){return total<=0?-1:(int)Math.min(state.equals("complete")?100:99,bytes*100/total);}}
    private static final ConcurrentHashMap<String,Progress> progress=new ConcurrentHashMap<>();
    private static final CopyOnWriteArrayList<Runnable> listeners=new CopyOnWriteArrayList<>();
    private static final Handler MAIN=new Handler(Looper.getMainLooper());private static boolean posted,loaded,loadScheduled;
    private static final ExecutorService LOAD=Executors.newSingleThreadExecutor();
    private DownloadCatalog(){}
    public static File directory(){return new File(Utils.getContext().getExternalFilesDir(android.os.Environment.DIRECTORY_MUSIC),"Morphe");}
    public static File video(String id){
        if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return null;
        File metadata=new File(directory(),id+".format.pb");
        try(var in=new android.util.AtomicFile(metadata).openRead()){
            if(metadata.length()>256*1024)return null;
            var data=app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse.parseFrom(in);
            if(!id.equals(data.getVideoDetails().getVideoId()))return null;
            for(var f:data.getStreamingData().getAdaptiveFormatsList())if(f.getMimeType().startsWith("video/")&&f.getUrl().equals(LocalPlayback.VIDEO_ORIGIN+id)){
                File chosen=new File(directory(),id+".video."+(f.getMimeType().contains("webm")?"webm":"mp4"));
                if(chosen.isFile()&&chosen.length()>0&&chosen.length()==f.getContentLength())return chosen;
            }
        }catch(Exception ignored){}return null;
    }
    public static boolean satisfies(String id,MediaSelection selection){
        if(LocalPlayback.response(id)==null)return false;
        if(selection.kind()==MediaSelection.Kind.AUDIO)return true;
        Progress saved=progress(id);
        return saved!=null&&saved.state().equals("complete")&&saved.selection().kind()==MediaSelection.Kind.VIDEO&&saved.selection().height()>=selection.height()&&(video(id)!=null||saved.detail().equals("Audio only"));
    }

    public static List<OfflineTrack> tracks(){
        File[] files=directory().listFiles();if(files==null)return List.of();Map<String,OfflineTrack> unique=new TreeMap<>();
        for(File f:files)if(f.isFile()&&f.getName().matches("[A-Za-z0-9_-]{11}\\.(webm|m4a)")){OfflineTrack t=OfflineTrack.load(f);if(!unique.containsKey(t.videoId())||f.getName().endsWith(".webm"))unique.put(t.videoId(),t);}
        return List.copyOf(unique.values());
    }
    public static Progress progress(String id){load();Progress p=progress.get(id);if(p!=null&&!p.state().equals("complete"))return p;return LocalPlayback.response(id)!=null?new Progress(id,"complete",1,1,video(id)!=null?"Video + audio":p==null?"Audio":p.detail(),p==null?MediaSelection.audio(AudioQuality.Tier.HIGH):p.selection()):p==null?null:new Progress(id,"missing",0,-1,"Saved media or playback metadata unavailable; retry to repair",p.selection());}
    public static void update(String id,String state,long bytes,long total,String detail,MediaSelection selection){if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return;Progress next=new Progress(id,state,Math.max(0,bytes),total,detail==null?"":detail,selection);Progress old=progress.put(id,next);if(old==null||!old.state().equals(state))persist(next);changed();}
    public static List<Progress> pending(){load();return progress.keySet().stream().map(DownloadCatalog::progress).filter(Objects::nonNull).filter(p->!p.state().equals("complete")).sorted(Comparator.comparing(Progress::id)).collect(java.util.stream.Collectors.toList());}
    public static void add(Runnable r){listeners.addIfAbsent(r);}public static void remove(Runnable r){listeners.remove(r);}
    public static synchronized void changed(){if(posted)return;posted=true;MAIN.postDelayed(()->{synchronized(DownloadCatalog.class){posted=false;}PlaylistRows.changed();for(Runnable r:listeners)r.run();},250);}
    public static String label(String id){Progress p=progress(id);if(p==null)return "";return switch(p.state()){case "downloading"->"Downloading"+(p.percent()<0?"":" · "+p.percent()+"%");case "queued"->"Queued";case "complete"->p.detail().equals("Audio only")?"Downloaded · Audio only":"Downloaded";case "failed"->"Download failed";case "missing"->"Saved media unavailable";default->p.state();};}
    public static void complete(String id,MediaSelection selection,String detail){update(id,"complete",1,1,detail,selection);persist(progress.get(id));}
    private static synchronized void load(){
        if(loaded)return;if(Looper.myLooper()==Looper.getMainLooper()){if(!loadScheduled){loadScheduled=true;LOAD.execute(()->{load();changed();});}return;}loaded=true;File[] files=directory().listFiles((d,n)->n.matches("[A-Za-z0-9_-]{11}\\.download\\.json(\\.bak)?"));if(files==null)return;
        for(File entry:files)if(entry.length()<16384)try(var input=new android.util.AtomicFile(entry.getName().endsWith(".bak")?new File(entry.getParentFile(),entry.getName().substring(0,entry.getName().length()-4)):entry).openRead()){var data=new org.json.JSONObject(new String(readBounded(input),java.nio.charset.StandardCharsets.UTF_8));String id=data.getString("id");if(!id.matches("[A-Za-z0-9_-]{11}")||!entry.getName().startsWith(id+".download.json"))throw new IOException("Progress identity mismatch");MediaSelection s=new MediaSelection(MediaSelection.Kind.valueOf(data.optString("kind","AUDIO")),AudioQuality.Tier.parse(data.optString("audio","HIGH")),data.optInt("height",1080));String state=data.optString("state","queued");if(state.equals("downloading"))state="queued";progress.putIfAbsent(id,new Progress(id,state,0,-1,data.optString("detail"),s));}catch(Exception invalid){app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Downloads-catalog","Unreadable saved progress kept for recovery");}
    }
    private static byte[] readBounded(InputStream in)throws IOException{ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] buffer=new byte[4096];int n;while((n=in.read(buffer))>=0){if(out.size()+n>16384)throw new IOException("Progress size limit");out.write(buffer,0,n);}return out.toByteArray();}
    private static void persist(Progress p){
        if(p==null)return;android.util.AtomicFile atomic=new android.util.AtomicFile(new File(directory(),p.id()+".download.json"));FileOutputStream out=null;try{
            if(!directory().isDirectory()&&!directory().mkdirs())throw new IOException("Download storage unavailable");var data=new org.json.JSONObject().put("schema",2).put("id",p.id()).put("state",p.state()).put("detail",p.detail()).put("kind",p.selection().kind().name()).put("audio",p.selection().audio().name()).put("height",p.selection().height());out=atomic.startWrite();out.write(data.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));atomic.finishWrite(out);
        }catch(Exception failure){if(out!=null)atomic.failWrite(out);app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Downloads-storage","Progress could not be saved; media files retained");}
    }
    public static void delete(String id){
        if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return;
        app.morphe.extension.music.patches.downloads.LocalDownloadManager.cancelQueued(id);
        if(app.morphe.extension.music.patches.downloads.LocalDownloadManager.active(id)){app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Downloads-storage","Pause the active download before deleting its media");return;}
        for(String suffix:new String[]{".webm",".m4a",".video.webm",".video.mp4",".jpg",".json",".format.pb",".format.pb.bak",".download.json",".download.json.bak",".chapters.json",".webm.part",".webm.part.resume",".webm.part.resume.bak",".video.webm.part",".video.mp4.part",".video.webm.part.resume",".video.mp4.part.resume",".video.webm.part.resume.bak",".video.mp4.part.resume.bak"}){File file=new File(directory(),id+suffix);new android.util.AtomicFile(file).delete();if(file.exists()||new File(file+".new").exists()||new File(file+".bak").exists())app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Downloads-storage","A saved file could not be deleted");}
        progress.remove(id);NativeMediaCache.remove(id);changed();PlaylistRuntime.filesChanged();
    }
    private static final Map<String,List<android.media.MediaCodecInfo.CodecCapabilities>> decoderCaps=new ConcurrentHashMap<>();
    public static boolean videoSupported(app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format f){
        try{
            String mime=f.getMimeType().toLowerCase(Locale.ROOT),type=mime.contains("avc")?"video/avc":mime.contains("vp9")||mime.contains("vp09")?"video/x-vnd.on2.vp9":mime.contains("av01")?"video/av01":mime.contains("hev")||mime.contains("hvc")?"video/hevc":"";
            if(type.isEmpty())return false;
            List<android.media.MediaCodecInfo.CodecCapabilities> capabilities=decoderCaps.get(type);
            if(capabilities==null){List<android.media.MediaCodecInfo.CodecCapabilities> found=new ArrayList<>();
                for(android.media.MediaCodecInfo info:new android.media.MediaCodecList(android.media.MediaCodecList.ALL_CODECS).getCodecInfos())if(!info.isEncoder())for(String supported:info.getSupportedTypes())if(type.equalsIgnoreCase(supported))try{found.add(info.getCapabilitiesForType(supported));}catch(RuntimeException ignored){}
                capabilities=List.copyOf(found);decoderCaps.put(type,capabilities);
            }
            android.media.MediaFormat format=android.media.MediaFormat.createVideoFormat(type,MediaSelection.width(f),MediaSelection.height(f));
            int profile=codecProfile(mime,type);if(profile<0)return false;if(profile>0)format.setInteger(android.media.MediaFormat.KEY_PROFILE,profile);
            for(var caps:capabilities)if(caps.isFormatSupported(format))return true;
        }catch(RuntimeException unavailable){}return false;
    }
    private static int codecProfile(String mime,String type){
        java.util.regex.Matcher codec=java.util.regex.Pattern.compile("(?:avc[13]\\.([0-9a-f]{6})|vp09\\.([0-9]{2})|av01\\.([0-9])\\.[0-9]{2}[mh]\\.([0-9]{2})|(?:hvc1|hev1)\\.([0-9]))").matcher(mime);
        if(type.equals("video/avc")){
            if(!codec.find()||codec.group(1)==null)return -1;
            return switch(Integer.parseInt(codec.group(1).substring(0,2),16)){case 66->1;case 77->2;case 88->4;case 100->8;case 110->16;case 122->32;case 244->64;default->-1;};
        }
        if(type.equals("video/x-vnd.on2.vp9")){if(!codec.find())return mime.contains("vp9")?1:-1;return codec.group(2)==null?-1:switch(Integer.parseInt(codec.group(2))){case 0->1;case 1->2;case 2->4;case 3->8;default->-1;};}
        if(type.equals("video/av01")){if(!codec.find()||!"0".equals(codec.group(3)))return -1;return "08".equals(codec.group(4))?1:"10".equals(codec.group(4))?2:-1;}
        if(type.equals("video/hevc")){if(!codec.find()||codec.group(5)==null)return -1;return "1".equals(codec.group(5))?1:"2".equals(codec.group(5))?2:-1;}
        return -1;
    }
}
