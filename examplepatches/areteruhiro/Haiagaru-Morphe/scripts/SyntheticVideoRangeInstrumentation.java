package app.haiagaru.tests.opentabs;
import android.app.*;import android.content.*;import android.os.*;import android.media.*;import android.graphics.*;import java.io.*;import java.net.*;import java.nio.*;import java.lang.reflect.*;

/** Grey synthetic H.264; virtual 48MiB free atom puts moov at the tail, without network or user media. */
public final class SyntheticVideoRangeInstrumentation extends Instrumentation {
 private static final long GAP=48L*1024*1024;private int checks,requests;private long transferred;
 private void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
 private byte[] movie(File target)throws Exception{
  MediaCodec codec=MediaCodec.createEncoderByType("video/avc");MediaMuxer muxer=new MediaMuxer(target.getPath(),MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);boolean started=false;
  try{
   MediaFormat format=MediaFormat.createVideoFormat("video/avc",32,32);format.setInteger(MediaFormat.KEY_COLOR_FORMAT,MediaCodecInfo.CodecCapabilities.COLOR_FormatYUV420Flexible);format.setInteger(MediaFormat.KEY_BIT_RATE,64000);format.setInteger(MediaFormat.KEY_FRAME_RATE,10);format.setInteger(MediaFormat.KEY_I_FRAME_INTERVAL,1);codec.configure(format,null,null,MediaCodec.CONFIGURE_FLAG_ENCODE);codec.start();
   int queued=0,track=-1;boolean end=false;MediaCodec.BufferInfo info=new MediaCodec.BufferInfo();
   for(int attempts=0;attempts<300&&!end;attempts++){
    if(queued<3){int input=codec.dequeueInputBuffer(10000);if(input>=0){ByteBuffer bytes=codec.getInputBuffer(input);bytes.clear();for(int n=0;n<32*32*3/2;n++)bytes.put((byte)128);codec.queueInputBuffer(input,0,queued<2?32*32*3/2:0,queued*100000,queued==2?MediaCodec.BUFFER_FLAG_END_OF_STREAM:0);queued++;}}
    int output=codec.dequeueOutputBuffer(info,10000);
    if(output==MediaCodec.INFO_OUTPUT_FORMAT_CHANGED){track=muxer.addTrack(codec.getOutputFormat());muxer.start();started=true;}
    else if(output>=0){if(info.size>0&&(info.flags&MediaCodec.BUFFER_FLAG_CODEC_CONFIG)==0){ByteBuffer bytes=codec.getOutputBuffer(output);bytes.position(info.offset);bytes.limit(info.offset+info.size);muxer.writeSampleData(track,bytes,info);}end=(info.flags&MediaCodec.BUFFER_FLAG_END_OF_STREAM)!=0;codec.releaseOutputBuffer(output,false);}
   }ok(end&&started,"synthetic AVC encoded");
  }finally{try{codec.stop();}catch(Exception ignored){}codec.release();if(started)muxer.stop();muxer.release();}
  try(FileInputStream input=new FileInputStream(target)){ByteArrayOutputStream output=new ByteArrayOutputStream();byte[] buffer=new byte[4096];for(int n;(n=input.read(buffer))>=0;)output.write(buffer,0,n);return output.toByteArray();}
 }
 private final class Ranged extends HttpURLConnection {
  private final byte[] first,tail;private final long tailAt,total;private long begin,end;
  Ranged(byte[] first,byte[] tail)throws Exception{super(new URL("https://fixture.invalid/video.mp4"));this.first=first;this.tail=tail;tailAt=first.length+GAP;total=tailAt+tail.length;}
  public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}
  public int getResponseCode(){requests++;String[] range=getRequestProperty("Range").substring(6).split("-");begin=Long.parseLong(range[0]);end=Math.min(total-1,Long.parseLong(range[1]));return 206;}
  public String getHeaderField(String name){return name.equals("Content-Range")?"bytes "+begin+"-"+end+"/"+total:null;}
  public InputStream getInputStream(){return new InputStream(){long position=begin;public int read(){if(position>end)return -1;long p=position++;transferred++;if(p<first.length)return first[(int)p]&255;if(p>=tailAt)return tail[(int)(p-tailAt)]&255;long gap=p-first.length;return gap<4?(int)((GAP>>(24-8*gap))&255):gap<8?"free".charAt((int)gap-4):0;}};}
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();File input=null,output=null;try{
  Context app=getTargetContext();ClassLoader loader=app.getClassLoader();File directory=new File(app.getCacheDir(),"haiagaru-video-frames");directory.mkdirs();input=File.createTempFile("frame-synthetic-",".mp4",directory);output=File.createTempFile("preview-synthetic-",".jpg",directory);
  byte[] original=movie(input);int moov=-1,moovSize=0;ByteBuffer header=ByteBuffer.wrap(original);
  for(int at=0;at+8<=original.length;){int size=header.getInt(at);if(size<8||at+size>original.length)throw new IOException("invalid synthetic atom");if(header.getInt(at+4)==0x6d6f6f76){moov=at;moovSize=size;break;}at+=size;}
  ok(moov>=0,"moov found in encoded fixture");byte[] first=original.clone(),tail=java.util.Arrays.copyOfRange(original,moov,moov+moovSize);
  // Replace the original moov with same-sized free space: mdat offsets stay valid.
  ByteBuffer.wrap(first).putInt(moov+4,0x66726565);
  Class<?> type=loader.loadClass("app.morphe.extension.chmate.BoundedVideoDataSource"),factory=loader.loadClass(type.getName()+"$Connections");
  Object connections=java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{factory},(proxy,method,args)->new Ranged(first,tail));Constructor<?> constructor=type.getDeclaredConstructor(factory,long.class,long.class);constructor.setAccessible(true);
  try(MediaDataSource source=(MediaDataSource)constructor.newInstance(connections,24L*1024*1024,20000L)){
   ok(source.getSize()>48L*1024*1024,"logical MP4 exceeds default transfer limit");MediaMetadataRetriever retriever=new MediaMetadataRetriever();
   try{retriever.setDataSource(source);Bitmap frame=retriever.getScaledFrameAtTime(0,MediaMetadataRetriever.OPTION_CLOSEST,64,64);ok(frame!=null&&frame.getWidth()>0&&frame.getHeight()>0,"real Android frame from sparse source");if(frame!=null)frame.recycle();}finally{retriever.release();}
  }
  ok(transferred<24L*1024*1024,"range transfer stays under limit");ok(requests>=2,"head/tail metadata seeks");
  Class<?> service=loader.loadClass("app.morphe.extension.chmate.VideoFrameDecodeService");Method decode=service.getDeclaredMethod("decode",Context.class,File.class,File.class,boolean.class,int.class,int.class);decode.setAccessible(true);
  android.content.SharedPreferences health=app.getSharedPreferences("haiagaru-video-decoder-health",0);Method blocked=service.getDeclaredMethod("blocked",Context.class);blocked.setAccessible(true);
  blocked.invoke(null,app);health.edit().putBoolean("unsafe",true).putLong("unsafeSince",SystemClock.elapsedRealtime()-61000).commit();
  ok(!(Boolean)blocked.invoke(null,app),"interrupted decoder automatically recovers after cooldown");
  ok((Boolean)decode.invoke(null,app,input,output,false,0,1),"private decoder process responds to synthetic file");
  BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;BitmapFactory.decodeFile(output.getPath(),bounds);ok(bounds.outWidth>0&&bounds.outHeight>0,"private decoder JPEG valid");
  result.putString("result","PASS "+checks+" native AVC/range checks; virtual=48MiB+, bytes="+transferred+", requests="+requests);finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("error",error.toString()+"\n"+android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}finally{if(input!=null)input.delete();if(output!=null)output.delete();}}
}
