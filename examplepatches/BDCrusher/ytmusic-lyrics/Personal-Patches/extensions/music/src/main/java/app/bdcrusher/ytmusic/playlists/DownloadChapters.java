/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import android.os.Environment;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.sponsorblock.MusicSponsorBlockConfig;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.sponsorblock.objects.*;
import app.morphe.extension.shared.sponsorblock.requests.SBRequester;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;

/** Sidecar chapters retain original timestamps, category identity and normal skip/color settings. */
public final class DownloadChapters {
    private DownloadChapters(){}
    private static File file(String id){if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return null;return new File(new File(Utils.getContext().getExternalFilesDir(Environment.DIRECTORY_MUSIC),"Morphe"),id+".chapters.json");}
    public static void fetch(String id,int duration){
        if(!app.bdcrusher.ytmusic.common.PersonalRuntime.installed(Utils.getContext(),"sponsorblock")||!MusicSponsorBlockConfig.isInstalled()||!Settings.SB_ENABLED.get()||!DownloadPrompt.preferences(Utils.getContext()).getBoolean("chapters",true))return;
        try{SponsorSegment[] segments=SBRequester.getSegments(id);if(segments.length==0)return;save(id,duration,segments);}
        catch(Exception failure){FeatureDiagnostics.record("Download-chapters","Segment lookup failed; saved audio retained");}
    }
    public static synchronized void save(String id,int duration,SponsorSegment[] segments)throws Exception{
        File target=file(id);if(target==null)return;JSONArray rows=new JSONArray();
        for(SponsorSegment s:segments)if(s.start>=0&&s.end>s.start&&(duration<=0||s.end<=duration*1000L+1000))rows.put(new JSONObject().put("category",s.category.keyValue).put("title",s.category.title.toString()).put("color",s.category.getColorWithOpacity()).put("start",s.start).put("end",s.end).put("uuid",s.UUID==null?"":s.UUID).put("locked",s.isLocked));
        if(rows.length()==0)return;AtomicFile atomic=new AtomicFile(target);FileOutputStream out=null;
        try{out=atomic.startWrite();out.write(new JSONObject().put("schema",1).put("videoId",id).put("duration",duration).put("segments",rows).toString().getBytes(StandardCharsets.UTF_8));atomic.finishWrite(out);}catch(Exception failure){if(out!=null)atomic.failWrite(out);throw failure;}
    }
    public static synchronized SponsorSegment[] read(String id){
        File source=file(id);if(source==null||!source.isFile()||source.length()>1024*1024)return null;
        try(InputStream in=new AtomicFile(source).openRead()){
            ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))>=0){if(bytes.size()+n>1024*1024)return null;bytes.write(buffer,0,n);}
            JSONObject saved=new JSONObject(new String(bytes.toByteArray(),StandardCharsets.UTF_8));if(saved.optInt("schema")!=1||!id.equals(saved.optString("videoId")))return null;
            JSONArray rows=saved.getJSONArray("segments");if(rows.length()>1000)return null;List<SponsorSegment> segments=new ArrayList<>();
            for(int i=0;i<rows.length();i++){JSONObject row=rows.getJSONObject(i);SegmentCategory category=SegmentCategory.byCategoryKey(row.getString("category"));long start=row.getLong("start"),end=row.getLong("end");if(category==null||category.behaviour==CategoryBehaviour.IGNORE||start<0||end<=start)continue;segments.add(new SponsorSegment(category,row.optString("uuid"),start,end,row.optBoolean("locked")));}
            return segments.toArray(new SponsorSegment[0]);
        }catch(Exception invalid){FeatureDiagnostics.record("Download-chapters","Unreadable sidecar retained; no cached segments applied");return null;}
    }
}
