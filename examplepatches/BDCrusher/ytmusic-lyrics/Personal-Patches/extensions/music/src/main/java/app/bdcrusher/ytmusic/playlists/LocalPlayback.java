/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import android.util.AtomicFile;
import java.io.*;
import java.util.*;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.*;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;

/** Native-player stream substitution for an exact saved recording. No playlist/queue replacement. */
public final class LocalPlayback {
    public static final String ORIGIN="https://bdcrusher-offline.invalid/audio/";
    private LocalPlayback(){}
    private static File formatFile(String id){File audio=PlaylistRuntime.audio(id);return audio==null?null:new File(audio.getParentFile(),id+".format.pb");}
    public static synchronized void saved(String id,Format format,VideoDetails details){
        File target=formatFile(id);if(target==null)return;
        // Retain initialization/index ranges and codec details. Drop expiring service URLs/ciphers.
        Format local=format.toBuilder().setUrl(ORIGIN+id).setContentLength(PlaylistRuntime.audio(id).length()).clearSignatureCipher().build();
        details=details.toBuilder().setVideoId(id).build();
        AtomicFile atomic=new AtomicFile(target);FileOutputStream out=null;
        try{out=atomic.startWrite();out.write(PlayerResponse.newBuilder().setVideoDetails(details).setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(local)).build().toByteArray());atomic.finishWrite(out);NativeMediaCache.prepare("",id,0);}
        catch(Exception failure){if(out!=null)atomic.failWrite(out);FeatureDiagnostics.record("Offline-player","Could not save native format metadata; audio file kept");}
    }
    public static synchronized byte[] response(String id){
        if(!app.bdcrusher.ytmusic.common.PersonalRuntime.installed(Utils.getContext(),"downloads"))return null;
        if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))return null;File target=formatFile(id);if(target==null){ExternalFiles.Item external=ExternalFiles.get(id);return external!=null&&ExternalFiles.granted(Utils.getContext())?external.nativeResponse():null;}if(!target.isFile()&&!new File(target+".bak").isFile()||target.length()>256*1024)return null;
        try(InputStream in=new AtomicFile(target).openRead()){
            ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] b=new byte[8192];int n;while((n=in.read(b))>=0){if(bytes.size()+n>256*1024)return null;bytes.write(b,0,n);}
            PlayerResponse response=PlayerResponse.parseFrom(bytes.toByteArray());if(!id.equals(response.getVideoDetails().getVideoId())||response.getStreamingData().getAdaptiveFormatsCount()!=1)return null;
            Format format=response.getStreamingData().getAdaptiveFormats(0);File audio=PlaylistRuntime.audio(id);
            if(audio==null||audio.length()!=format.getContentLength()||!format.getUrl().equals(ORIGIN+id))return null;
            return response.toByteArray();
        }catch(Exception invalid){FeatureDiagnostics.record("Offline-player","Saved format is unreadable; native network handling retained");return null;}
    }
    public static long duration(String id){byte[] data=response(id);if(data==null)return 0;try{return PlayerResponse.parseFrom(data).getVideoDetails().getLengthSeconds();}catch(Exception ignored){return 0;}}
    /** Preserve every native response field, including eligibility and metadata, changing only audio streams. */
    public static byte[] replace(byte[] original){
        try{PlayerResponse nativeResponse=PlayerResponse.parseFrom(original);String id=nativeResponse.getVideoDetails().getVideoId();
            if(nativeResponse.hasPlayabilityStatus()&&nativeResponse.getPlayabilityStatus().getStatus()!=Status.OK)return null;
            byte[] saved=response(id);if(saved==null)return null;
            PlayerResponse local=PlayerResponse.parseFrom(saved);return nativeResponse.toBuilder().setStreamingData(local.getStreamingData()).build().toByteArray();
        }catch(Exception invalid){return null;}
    }
}
