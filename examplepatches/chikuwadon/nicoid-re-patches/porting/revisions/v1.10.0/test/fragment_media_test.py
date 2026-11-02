#!/usr/bin/env python3
"""Generate real fragmented AVC/AAC media, then compare production-reader packets to ffprobe."""
from pathlib import Path
import tempfile,subprocess,sys,json,struct
r=Path(__file__).resolve().parents[1]
def command(*args):subprocess.run(list(map(str,args)),check=True,stdout=subprocess.DEVNULL)
def boxes(data):
 out=[];at=0
 while at<len(data):
  size=struct.unpack_from('>I',data,at)[0];assert size>=8 and at+size<=len(data);out.append((data[at+4:at+8],data[at:at+size]));at+=size
 return out
def box(name,data):return struct.pack('>I',len(data)+8)+name+data
def retag(data,kind):
 b=bytearray(data)
 for name in [b'tkhd',b'trex',b'tfhd']:
  p=0
  while True:
   at=b.find(name,p)
   if at<0:break
   offset=at+4+(12 if name==b'tkhd' else 4);struct.pack_into('>I',b,offset,kind);p=at+4
 return bytes(b)
with tempfile.TemporaryDirectory() as d:
 t=Path(d);tools=Path(sys.argv[1]).resolve().parent
 command('ffmpeg','-v','error','-f','lavfi','-i','testsrc2=size=320x180:rate=15','-t','6','-c:v','libx264','-g','15','-bf','2','-pix_fmt','yuv420p','-an','-movflags','+frag_keyframe+empty_moov+default_base_moof',t/'video.mp4')
 command('ffmpeg','-v','error','-f','lavfi','-i','sine=frequency=880:sample_rate=48000','-t','6','-c:a','aac','-vn','-movflags','+frag_keyframe+empty_moov+default_base_moof',t/'audio.mp4')
 v=boxes((t/'video.mp4').read_bytes());a=boxes((t/'audio.mp4').read_bytes());vm=next(b for n,b in v if n==b'moov');am=next(b for n,b in a if n==b'moov');atrak=retag(next(b for n,b in boxes(am[8:]) if n==b'trak'),2);atrex=retag(next(b for n,b in boxes(next(b for n,b in boxes(am[8:]) if n==b'mvex')[8:]) if n==b'trex'),2)
 children=[]
 for n,b in boxes(vm[8:]):children.append(box(b'mvex',b[8:]+atrex) if n==b'mvex' else b)
 common=box(b'moov',b''.join(children)+atrak)
 for name,data in [('video-dual',v),('audio-dual',a)]:
  payload=[]
  for n,b in data:
   if n==b'moov':payload.append(common)
   elif n==b'mfra':continue
   elif name.startswith('audio') and n==b'moof':payload.append(retag(b,2))
   else:payload.append(b)
  (t/(name+'.mp4')).write_bytes(b''.join(payload))
 command('java','-jar',tools/'ecj.jar','-1.8','-warn:none','-d',t/'classes',r/'src/e/e/a/FragmentedMp4117.java',r/'test/InspectFragments.java')
 checks=0
 for name in ['video','audio','video-dual','audio-dual']:
  probe=json.loads(subprocess.check_output(['ffprobe','-v','error','-show_packets','-show_data_hash','sha256','-of','json',str(t/(name+'.mp4'))]))['packets']
  result=subprocess.check_output(['java','-cp',str(t/'classes'),'e.e.a.InspectFragments',str(t/(name+'.mp4'))],text=True)
  samples=[line.split() for line in result.splitlines() if line.startswith('SAMPLE ')]
  assert len(samples)==len(probe),(name,len(samples),len(probe));checks+=1
  for sample,packet in zip(samples,probe):
   assert abs(int(sample[1])-round(float(packet['pts_time'])*1e6))<=1,(name,sample,packet)
   assert int(sample[3])==int(packet['size'])
   assert sample[5].lower()==packet['data_hash'].split(':')[1].lower();checks+=3
  if name.endswith('dual'):assert result.count('FORMAT ')==2;checks+=1
  print(name+': '+str(len(samples))+' packets match ffprobe PTS, size and SHA-256')
 sources={
 'android/media/MediaFormat.java':'''package android.media;import java.nio.*;import java.util.*;public class MediaFormat{public String mime;public int width,height,rate,channels;public Map<String,ByteBuffer> csd=new HashMap<>();public static MediaFormat createVideoFormat(String m,int w,int h){MediaFormat f=new MediaFormat();f.mime=m;f.width=w;f.height=h;return f;}public static MediaFormat createAudioFormat(String m,int r,int c){MediaFormat f=new MediaFormat();f.mime=m;f.rate=r;f.channels=c;return f;}public void setByteBuffer(String k,ByteBuffer b){csd.put(k,b);}}''',
 'android/media/MediaCodec.java':'''package android.media;public class MediaCodec{public static final int BUFFER_FLAG_KEY_FRAME=1,BUFFER_FLAG_END_OF_STREAM=4;public static class BufferInfo{public int size,flags;public long presentationTimeUs;public void set(int o,int n,long t,int f){size=n;presentationTimeUs=t;flags=f;}}}''',
 'android/media/MediaMuxer.java':'''package android.media;import java.nio.*;import java.util.*;public class MediaMuxer{public static class OutputFormat{public static final int MUXER_OUTPUT_MPEG_4=0;}public static List<MediaFormat> formats=new ArrayList<>();public static int[] count;public static long[] ends;public MediaMuxer(String p,int f){formats.clear();count=new int[2];ends=new long[2];}public int addTrack(MediaFormat f){formats.add(f);return formats.size()-1;}public void start(){}public void stop(){}public void release(){}public void writeSampleData(int t,ByteBuffer b,MediaCodec.BufferInfo info){if(info.size==0){if(info.flags!=4)throw new AssertionError();ends[t]=info.presentationTimeUs;return;}if(formats.get(t).mime.startsWith("video")&&b.getInt(0)!=1)throw new AssertionError("Missing Annex B prefix");if(info.presentationTimeUs<0)throw new AssertionError();count[t]++;}}''',
 'e/e/a/Mp4Transfer115.java':'package e.e.a;class Mp4Transfer115{void check()throws java.io.IOException{if(Thread.currentThread().isInterrupted())throw new java.io.InterruptedIOException();}}',
 'e/e/a/DownloadWorker115.java':'package e.e.a;class DownloadWorker115{static void progress(){}}',
 'e/e/a/FragmentBridgeTest.java':'''package e.e.a;import java.io.*;import java.util.*;import android.media.*;public class FragmentBridgeTest{static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("Fragment bridge "+checks);}public static void main(String[] args)throws Exception{File root=new File(args[0]);for(String suffix:new String[]{"","-dual"}){FragmentMux117.mux(new Mp4Transfer115(),Arrays.asList(new File(root,"video"+suffix+".mp4"),new File(root,"audio"+suffix+".mp4")),new File(root,"out.mp4"));check(MediaMuxer.formats.size()==2);check(MediaMuxer.count[0]==90);check(MediaMuxer.count[1]==283);check(MediaMuxer.formats.get(0).width==320&&MediaMuxer.formats.get(0).height==180);check(MediaMuxer.formats.get(0).csd.get("csd-0").getInt(0)==1);check(MediaMuxer.formats.get(0).csd.get("csd-1").getInt(0)==1);check(MediaMuxer.formats.get(1).rate==48000&&MediaMuxer.formats.get(1).channels==1);check(MediaMuxer.formats.get(1).csd.get("csd-0").remaining()>1);check(MediaMuxer.ends[0]>5900000&&MediaMuxer.ends[1]>5900000);}System.out.println("FragmentBridgeTest: "+checks+" checks passed");}}'''
 }
 for name,source in sources.items():
  p=t/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source)
 command('java','-jar',tools/'ecj.jar','-1.8','-warn:none','-d',t/'bridge',*list((t/'stubs').rglob('*.java')),r/'src/e/e/a/FragmentedMp4117.java',r/'src/e/e/a/FragmentMux117.java')
 subprocess.run(['java','-cp',str(t/'bridge'),'e.e.a.FragmentBridgeTest',str(t)],check=True)
 (t/'broken.mp4').write_bytes((t/'video.mp4').read_bytes()[:-9])
 failed=subprocess.run(['java','-cp',str(t/'classes'),'e.e.a.InspectFragments',str(t/'broken.mp4')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 assert failed.returncode!=0;checks+=1
 print('FragmentMediaTest: '+str(checks)+' checks passed')
