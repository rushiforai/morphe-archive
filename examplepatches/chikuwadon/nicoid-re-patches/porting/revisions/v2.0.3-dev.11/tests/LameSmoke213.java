import java.io.File;
import java.io.FileOutputStream;
import net.sourceforge.lame.mp3.Lame;
import net.sourceforge.lame.mp3.MPEGMode;

/** JVM smoke test of the exact Java LAME build used by the Android MPP. */
public final class LameSmoke213 {
 public static void main(String[] args)throws Exception{
  Lame encoder=new Lame();
  try{
   encoder.getFlags().setInNumChannels(2);
   encoder.getFlags().setInSampleRate(44100);
   encoder.getFlags().setBitRate(192);
   encoder.getFlags().setQuality(Lame.QUALITY_MIDDLE);
   encoder.getFlags().setMode(MPEGMode.JOINT_STEREO);
   encoder.getId3().init(encoder.getFlags());
   encoder.getFlags().setWriteId3tagAutomatic(false);
   if(encoder.initParams()<0)throw new AssertionError("LAME initParams failed");
   byte[] mp3=new byte[65536];
   float[] l=new float[1152],r=new float[1152];
   long written=0;
   try(FileOutputStream out=new FileOutputStream(new File(args[0]))){
    for(int block=0;block<40;block++){
     for(int i=0;i<l.length;i++){
      double signal=Math.sin((block*l.length+i)*2*Math.PI*440/44100.0);
      l[i]=(float)(signal*0.6*2147483647.0);
      r[i]=l[i];
     }
     int n=encoder.encodeBuffer(l,r,1152,mp3);
     if(n<0)throw new AssertionError("Invalid MP3 sample result");
     out.write(mp3,0,n);written+=n;
    }
    int end=encoder.encodeFlush(mp3);
    if(end<0)throw new AssertionError("MP3 flush failed");
    out.write(mp3,0,end);written+=end;
   }
   if(written<5000)throw new AssertionError("Too little audio: "+written);
   byte[] first=java.nio.file.Files.readAllBytes(new File(args[0]).toPath());
   boolean sync=false;
   for(int i=0;i<Math.min(4096,first.length-1);i++){
    if((first[i]&255)==255&&(first[i+1]&224)==224){sync=true;break;}
   }
   if(!sync)throw new AssertionError("No MPEG audio frame sync");
   System.out.println("PASS LAME MP3 192kbps encoder; "+written+" bytes");
  }finally{encoder.close();}
 }
}