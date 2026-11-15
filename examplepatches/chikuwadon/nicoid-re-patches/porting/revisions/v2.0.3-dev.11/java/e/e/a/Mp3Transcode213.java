package e.e.a;

import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.util.Log;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import net.sourceforge.lame.mp3.Lame;
import net.sourceforge.lame.mp3.MPEGMode;

/**
 * Decode the authenticated MP4 audio track into PCM, then truly encode
 * MPEG-1/2 Layer III. No native shared objects, shell commands or external
 * applications are required on the device.
 *
 * The Java LAME encoder is vendored at a pinned upstream source commit.
 */
final class Mp3Transcode213 {
 private Mp3Transcode213(){}
 static final int FRAMES=1152;

 static void convert(Mp4Transfer115 job,File source,File target,int kbps)throws Exception{
  if(kbps!=128&&kbps!=192&&kbps!=256)
   throw new IOException("MP3ビットレートが不正です");
  MediaExtractor extractor=new MediaExtractor();
  MediaCodec decoder=null;
  Lame lame=null;
  boolean completed=false;
  try{
   extractor.setDataSource(source.getAbsolutePath());
   int track=-1;
   MediaFormat format=null;
   for(int i=0;i<extractor.getTrackCount();i++){
    MediaFormat candidate=extractor.getTrackFormat(i);
    String mime=candidate.getString(MediaFormat.KEY_MIME);
    if(mime!=null&&mime.startsWith("audio/")){track=i;format=candidate;break;}
   }
   if(track<0||format==null)throw new IOException("MP3変換用の音声トラックがありません");
   String mime=format.getString(MediaFormat.KEY_MIME);
   extractor.selectTrack(track);
   decoder=MediaCodec.createDecoderByType(mime);
   // Force portable 16-bit PCM when the hardware decoder supports it.
   format.setInteger(MediaFormat.KEY_PCM_ENCODING,AudioFormat.ENCODING_PCM_16BIT);
   decoder.configure(format,null,null,0);
   decoder.start();

   MediaCodec.BufferInfo info=new MediaCodec.BufferInfo();
   boolean sourceEnded=false,decoderEnded=false;
   int sampleRate=0,channels=0,pcmType=AudioFormat.ENCODING_PCM_16BIT;
   float[] left=new float[FRAMES],right=new float[FRAMES];
   int filled=0;
   byte[] encoded=new byte[65536];
   long samples=0;
   try(OutputStream output=new BufferedOutputStream(new FileOutputStream(target))){
    while(!decoderEnded){
     job.check();
     if(!sourceEnded){
      int slot=decoder.dequeueInputBuffer(10000);
      if(slot>=0){
       ByteBuffer input=decoder.getInputBuffer(slot);
       if(input==null)throw new IOException("AAC入力バッファを取得できません");
       input.clear();
       int n=extractor.readSampleData(input,0);
       if(n<0){
        decoder.queueInputBuffer(slot,0,0,0,MediaCodec.BUFFER_FLAG_END_OF_STREAM);
        sourceEnded=true;
       }else{
        long time=extractor.getSampleTime();
        decoder.queueInputBuffer(slot,0,n,Math.max(0,time),0);
        extractor.advance();
       }
      }
     }
     int slot=decoder.dequeueOutputBuffer(info,10000);
     if(slot==MediaCodec.INFO_OUTPUT_FORMAT_CHANGED){
      MediaFormat out=decoder.getOutputFormat();
      int newRate=out.getInteger(MediaFormat.KEY_SAMPLE_RATE);
      int newChannels=out.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
      int newPcm=out.containsKey(MediaFormat.KEY_PCM_ENCODING)
          ?out.getInteger(MediaFormat.KEY_PCM_ENCODING):AudioFormat.ENCODING_PCM_16BIT;
      if(newRate<8000||newRate>192000||newChannels<1||newChannels>2
          ||newPcm!=AudioFormat.ENCODING_PCM_16BIT&&newPcm!=AudioFormat.ENCODING_PCM_FLOAT)
       throw new IOException("対応していない音声形式です");
      if(lame!=null&&(newRate!=sampleRate||newChannels!=channels))
       throw new IOException("途中で音声形式が変更されました");
      sampleRate=newRate;channels=newChannels;pcmType=newPcm;
     }else if(slot>=0){
      if(lame==null){
       MediaFormat out=decoder.getOutputFormat();
       sampleRate=out.getInteger(MediaFormat.KEY_SAMPLE_RATE);
       channels=out.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
       if(channels<1||channels>2||sampleRate<8000||sampleRate>192000)
        throw new IOException("対応していない音声サンプリング設定です");
       pcmType=out.containsKey(MediaFormat.KEY_PCM_ENCODING)
           ?out.getInteger(MediaFormat.KEY_PCM_ENCODING):AudioFormat.ENCODING_PCM_16BIT;
       if(pcmType!=AudioFormat.ENCODING_PCM_16BIT&&pcmType!=AudioFormat.ENCODING_PCM_FLOAT)
        throw new IOException("対応していない音声PCM形式です");
       lame=new Lame();
       lame.getFlags().setInNumChannels(channels);
       lame.getFlags().setInSampleRate(sampleRate);
       lame.getFlags().setBitRate(kbps);
       lame.getFlags().setQuality(Lame.QUALITY_MIDDLE);
       lame.getFlags().setMode(channels==1?MPEGMode.MONO:MPEGMode.JOINT_STEREO);
       lame.getId3().init(lame.getFlags());
       lame.getFlags().setWriteId3tagAutomatic(false);
       if(lame.initParams()<0)throw new IOException("MP3エンコーダを初期化できません");
      }
      if(info.size>0){
       ByteBuffer pcm=decoder.getOutputBuffer(slot);
       if(pcm==null)throw new IOException("音声デコード結果を取得できません");
       pcm.position(info.offset);
       pcm.limit(info.offset+info.size);
       pcm.order(ByteOrder.LITTLE_ENDIAN);
       final int bytesPer=pcmType==AudioFormat.ENCODING_PCM_FLOAT?4:2;
       if(pcm.remaining()%(bytesPer*channels)!=0)
        throw new IOException("PCMフレームが不完全です");
       while(pcm.remaining()>=bytesPer*channels){
        job.check();
        left[filled]=pcmType==AudioFormat.ENCODING_PCM_FLOAT
            ?Math.max(-1f,Math.min(1f,pcm.getFloat()))*2147483647f
            :pcm.getShort()*65536f;
        right[filled]=channels==1?left[filled]:
            pcmType==AudioFormat.ENCODING_PCM_FLOAT
            ?Math.max(-1f,Math.min(1f,pcm.getFloat()))*2147483647f
            :pcm.getShort()*65536f;
        filled++;samples++;
        if(filled==FRAMES){
         int n=lame.encodeBuffer(left,right,filled,encoded);
         if(n<0||n>encoded.length)throw new IOException("MP3エンコードに失敗しました");
         output.write(encoded,0,n);
         filled=0;
        }
       }
      }
      decoder.releaseOutputBuffer(slot,false);
      decoderEnded=(info.flags&MediaCodec.BUFFER_FLAG_END_OF_STREAM)!=0;
     }
    }
    if(lame==null||samples==0)throw new IOException("変換対象の音声データが空です");
    if(filled>0){
     int n=lame.encodeBuffer(left,right,filled,encoded);
     if(n<0||n>encoded.length)throw new IOException("MP3の最終フレームが不正です");
     output.write(encoded,0,n);
    }
    int flushed=lame.encodeFlush(encoded);
    if(flushed<0||flushed>encoded.length)throw new IOException("MP3の書き出しを完了できません");
    output.write(encoded,0,flushed);
    output.flush();
   }
   if(!target.isFile()||target.length()<128)throw new IOException("MP3出力ファイルが空です");
   completed=true;
   Log.i("nicoid-mp3","MP3 encoded at "+kbps+"kbps; frames="+samples);
  }finally{
   if(lame!=null)try{lame.close();}catch(Exception ignored){}
   if(decoder!=null){try{decoder.stop();}catch(Exception ignored){}decoder.release();}
   extractor.release();
   if(!completed)target.delete();
  }
 }
}