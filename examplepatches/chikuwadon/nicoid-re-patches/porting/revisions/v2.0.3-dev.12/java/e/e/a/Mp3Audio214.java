package e.e.a;

import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import java.io.*;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.*;
import org.json.*;

/**
 * Download only the authenticated HLS AUDIO rendition; never fetch video
 * media segments. Produces a temporary AUDIO-ONLY MP4 for the unchanged
 * MediaCodec AAC -> PCM -> Java LAME MP3 transcoder.
 */
final class Mp3Audio214 {
 private Mp3Audio214(){}

 static File fetch(Mp4Transfer115 task,Object model)throws Exception {
  task.check();
  DownloadJobs115.Job job=task.job;
  JSONObject watch=GuestWatch.watch(model,job.id);
  if(watch==null)throw new IOException("動画情報を取得できません");
  JSONObject video=watch.getJSONObject("video");
  job.title=video.optString("title",job.title);
  JSONObject domand=watch.getJSONObject("media").getJSONObject("domand");
  JSONArray videos=domand.getJSONArray("videos"),audios=domand.getJSONArray("audios");
  JSONObject lowest=null;
  int low=Integer.MAX_VALUE;
  for(int i=0;i<videos.length();i++){
   JSONObject candidate=videos.getJSONObject(i);
   if(!candidate.optBoolean("isAvailable"))continue;
   int h=candidate.optInt("height",Mp4Transfer115.height(candidate.optString("id")));
   if(h>0&&h<low){low=h;lowest=candidate;}
   else if(lowest==null){lowest=candidate;}
  }
  if(lowest==null)throw new IOException("音声取得に必要な配信情報がありません");
  JSONObject chosenAudio=null;
  for(int i=0;i<audios.length();i++){
   JSONObject a=audios.getJSONObject(i);
   if(a.optBoolean("isAvailable")){chosenAudio=a;break;}
  }
  if(chosenAudio==null)throw new IOException("音声のみの配信が利用できません");
  // The access-right API expects a video/audio pair for authorization.
  // No video media segment is downloaded. Only an audio HLS playlist is read.
  JSONArray outputs=new JSONArray().put(new JSONArray()
      .put(lowest.getString("id")).put(chosenAudio.getString("id")));
  String api="https://nvapi.nicovideo.jp/v1/watch/"+Uri.encode(job.id)
      +"/access-rights/hls?actionTrackId="+Uri.encode(
          watch.getJSONObject("client").getString("watchTrackId"));
  String response=Quality195.request(model,api,
      new JSONObject().put("outputs",outputs).toString(),
      domand.getString("accessRightKey"));
  task.check();
  String master=new JSONObject(response).getJSONObject("data").getString("contentUrl");
  task.cookie=SecurityPolicy240.cookie(master,VideoDetails.cookie(),ModernPlayback.domandCookie);
  URL root=new URL(master);
  String playlist=task.text(root);
  URL audioUrl=null;
  // Select the explicitly declared AUDIO rendition, not the video variant.
  for(String line:playlist.split("\\r?\\n")){
   if(!line.startsWith("#EXT-X-MEDIA:"))continue;
   Map<String,String> attrs=Mp4Playlist115.attrs(line);
   if("AUDIO".equals(attrs.get("TYPE"))&&attrs.get("URI")!=null){
    audioUrl=Mp4Playlist115.resolve(root,attrs.get("URI"));
    break;
   }
  }
  if(audioUrl==null)
   throw new IOException("音声のみのHLS配信が見つかりません（動画は取得しません）");
  Mp4Playlist115.Plan plan=Mp4Playlist115.parse(audioUrl,task.text(audioUrl));
  if(!task.folder.isDirectory()&&!task.folder.mkdirs())
   throw new IOException("MP3作業フォルダを作成できません");
  job.phase="音声のみ取得中";
  job.total=plan.bytes;
  job.assets=plan.segments.size();
  job.finishedAssets=0;
  job.bytes=0;
  DownloadJobs115.changed(task.context);
  File raw=new File(task.folder,"audio-track.fragmented");
  try(OutputStream out=new BufferedOutputStream(new FileOutputStream(raw))){
   for(Mp4Playlist115.Segment seg:plan.segments){
    task.check();
    task.binary(seg,out);
    job.finishedAssets++;
   }
  }
  task.check();
  File ready=new File(task.folder,"audio-only.mp4");
  if(FragmentedMp4117.isFragmented(raw))muxFragmented(task,raw,ready);
  else muxPlatform(task,raw,ready);
  task.check();
  if(ready.length()<256)throw new IOException("音声ストリームをMP4として読み込めません");
  job.quality="MP3 "+Mp3Save214.bitrate(job)+"kbps";
  DownloadJobs115.changed(task.context);
  return ready;
 }

 static void muxFragmented(Mp4Transfer115 task,File source,File target)throws Exception{
  try(FragmentedMp4117 movie=new FragmentedMp4117(source)){
   FragmentedMp4117.Format format=null;
   for(FragmentedMp4117.Format f:movie.formats)
    if("audio/mp4a-latm".equals(f.mime)){format=f;break;}
   if(format==null)throw new IOException("音声フラグメントにAACトラックがありません");
   FragmentedMp4117.Cursor cursor=movie.cursor(format);
   if(cursor.sample==null)throw new IOException("音声フラグメントが空です");
   MediaFormat info=MediaFormat.createAudioFormat(format.mime,format.rate,format.channels);
   info.setByteBuffer("csd-0",ByteBuffer.wrap(format.csd0));
   MediaMuxer writer=new MediaMuxer(target.getAbsolutePath(),MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
   boolean running=false;
   try{
    int track=writer.addTrack(info);
    writer.start();running=true;
    ByteBuffer buf=ByteBuffer.allocateDirect(1024*1024);
    MediaCodec.BufferInfo sampleInfo=new MediaCodec.BufferInfo();
    long origin=cursor.sample.timeUs,last=-1;
    while(cursor.sample!=null){
     task.check();
     FragmentedMp4117.Sample sample=cursor.sample;
     if(sample.size>FragmentedMp4117.MAX_FRAME)throw new IOException("音声フレームが大きすぎます");
     if(sample.size>buf.capacity())buf=ByteBuffer.allocateDirect(sample.size);
     buf.clear();
     int n=cursor.write(buf);
     buf.flip();
     long time=sample.timeUs-origin;
     if(time<0)throw new IOException("音声の時刻が不正です");
     sampleInfo.set(0,n,time,sample.sync?MediaCodec.BUFFER_FLAG_KEY_FRAME:0);
     writer.writeSampleData(track,buf,sampleInfo);
     last=time;
     cursor.advance();
    }
    if(last<0)throw new IOException("音声データが空です");
    writer.stop();running=false;
   }finally{
    if(running)try{writer.stop();}catch(Exception ignored){}
    writer.release();
   }
  }
 }

 static void muxPlatform(Mp4Transfer115 task,File raw,File target)throws Exception{
  MediaExtractor in=new MediaExtractor();
  MediaMuxer writer=null;
  boolean started=false;
  try{
   in.setDataSource(raw.getAbsolutePath());
   int selected=-1;MediaFormat format=null;
   for(int i=0;i<in.getTrackCount();i++){
    MediaFormat f=in.getTrackFormat(i);
    String mime=f.getString(MediaFormat.KEY_MIME);
    if(mime!=null&&mime.startsWith("audio/")){selected=i;format=f;break;}
   }
   if(selected<0)throw new IOException("音声のみのトラックを開けません");
   in.selectTrack(selected);
   writer=new MediaMuxer(target.getAbsolutePath(),MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
   int index=writer.addTrack(format);
   writer.start();started=true;
   ByteBuffer buf=ByteBuffer.allocateDirect(4*1024*1024);
   MediaCodec.BufferInfo item=new MediaCodec.BufferInfo();
   long origin=Math.max(0,in.getSampleTime());
   int count=0;
   while(in.getSampleTime()>=0){
    task.check();
    buf.clear();
    long size=in.getSampleSize();
    if(size>buf.capacity())throw new IOException("音声フレームが大きすぎます");
    int n=in.readSampleData(buf,0);
    if(n<0)break;
    long t=Math.max(0,in.getSampleTime()-origin);
    item.set(0,n,t,(in.getSampleFlags()&MediaExtractor.SAMPLE_FLAG_SYNC)!=0?MediaCodec.BUFFER_FLAG_KEY_FRAME:0);
    writer.writeSampleData(index,buf,item);
    count++;
    in.advance();
   }
   if(count==0)throw new IOException("音声データが空です");
   writer.stop();started=false;
  }finally{
   in.release();
   if(writer!=null){if(started)try{writer.stop();}catch(Exception ignored){}writer.release();}
  }
 }
}