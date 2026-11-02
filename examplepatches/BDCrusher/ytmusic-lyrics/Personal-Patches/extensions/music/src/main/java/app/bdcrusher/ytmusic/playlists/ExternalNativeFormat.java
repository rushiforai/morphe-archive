/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import android.content.Context;
import android.media.*;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import java.io.*;
import java.nio.ByteBuffer;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.*;

/** Inspect actual external media; never reuse service ranges for a remuxed/transcoded file. */
final class ExternalNativeFormat {
    private ExternalNativeFormat(){}
    static byte[] inspect(Context context,Uri uri,String id,long bytes,String title,String artist,int seconds){
        if(bytes<=0||seconds<=0)return null;
        MediaExtractor extractor=new MediaExtractor();
        try{
            byte[] prefix=new byte[128];
            ParcelFileDescriptor descriptor=context.getContentResolver().openFileDescriptor(uri,"r");if(descriptor==null)return null;
            try(ParcelFileDescriptor.AutoCloseInputStream in=new ParcelFileDescriptor.AutoCloseInputStream(descriptor)){
                if(in.getChannel().size()!=bytes)return null;in.getChannel().position(0);int count=in.read(prefix);if(count<12)return null;
            }
            boolean webm=prefix[0]==0x1a&&(prefix[1]&255)==0x45&&(prefix[2]&255)==0xdf&&(prefix[3]&255)==0xa3&&new String(prefix,java.nio.charset.StandardCharsets.ISO_8859_1).contains("webm");
            boolean mp4=prefix[4]=='f'&&prefix[5]=='t'&&prefix[6]=='y'&&prefix[7]=='p';if(!webm&&!mp4)return null;
            extractor.setDataSource(context,uri,null);MediaFormat audio=null;int track=-1;
            for(int i=0;i<extractor.getTrackCount();i++){MediaFormat format=extractor.getTrackFormat(i);String mime=format.getString(MediaFormat.KEY_MIME);if(mime!=null&&mime.startsWith("video/"))return null;if(mime!=null&&mime.startsWith("audio/")){if(audio!=null)return null;audio=format;track=i;}}
            if(audio==null)return null;String codec=audio.getString(MediaFormat.KEY_MIME),mime;int itag;
            if(webm&&"audio/opus".equals(codec)){mime="audio/webm; codecs=\"opus\"";itag=251;}
            else if(mp4&&"audio/mp4a-latm".equals(codec)&&audio.containsKey(MediaFormat.KEY_AAC_PROFILE)&&audio.getInteger(MediaFormat.KEY_AAC_PROFILE)==2){mime="audio/mp4; codecs=\"mp4a.40.2\"";itag=140;}
            else return null;
            extractor.selectTrack(track);if(extractor.readSampleData(ByteBuffer.allocate(256*1024),0)<=0)return null;
            Format.Builder format=Format.newBuilder().setItag(itag).setMimeType(mime).setUrl(LocalPlayback.ORIGIN+id).setContentLength(bytes).setApproxDurationMs(seconds*1000L);
            if(audio.containsKey(MediaFormat.KEY_CHANNEL_COUNT))format.setAudioChannels(audio.getInteger(MediaFormat.KEY_CHANNEL_COUNT));if(audio.containsKey(MediaFormat.KEY_SAMPLE_RATE))format.setAudioSampleRate(audio.getInteger(MediaFormat.KEY_SAMPLE_RATE));
            VideoDetails details=VideoDetails.newBuilder().setVideoId(id).setTitle(title).setOwnerChannelName(artist).setLengthSeconds(seconds).build();
            return PlayerResponse.newBuilder().setVideoDetails(details).setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(format)).build().toByteArray();
        }catch(Exception unsupported){return null;}finally{extractor.release();}
    }
}
