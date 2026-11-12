package app.morphe.extension.chmate;
import java.io.*;import java.net.*;import java.util.*;

/** Sparse MP4-style seeks and hostile/unsupported range responses, without media/network. */
public final class BoundedVideoDataSourceTest {
 static int checks,requests;static long size=100L*1024*1024;static String mode="ok";
 static void ok(boolean value,String message){if(!value)throw new AssertionError(message);checks++;}
 static byte expected(long position){return (byte)(position*31+7);}
 static final class Response extends HttpURLConnection {
  long first,last;Response()throws Exception{super(new URL("https://video.twimg.com/fixture.mp4"));}
  public void connect(){} public void disconnect(){} public boolean usingProxy(){return false;}
  public int getResponseCode(){requests++;String[] parts=getRequestProperty("Range").substring(6).split("-");first=Long.parseLong(parts[0]);last=Math.min(Long.parseLong(parts[1]),size-1);return mode.equals("noRange")?200:206;}
  public String getHeaderField(String key){if(!key.equals("Content-Range"))return null;if(mode.equals("malformed"))return "bytes */100";return "bytes "+(mode.equals("wrongStart")?first+1:first)+"-"+last+"/"+size;}
  public InputStream getInputStream(){return new InputStream(){long position=first;public int read(){if(position>last||mode.equals("truncated"))return -1;return expected(position++)&255;}};}
 }
 static BoundedVideoDataSource source(long budget,long timeout)throws Exception{return new BoundedVideoDataSource(()->{try{return new Response();}catch(Exception error){throw new IOException(error);}},budget,timeout);}
 static void rejected(String scenario)throws Exception{mode=scenario;try{source(1024*1024,3000);throw new AssertionError(scenario);}catch(IOException expected){checks++;}finally{mode="ok";}}
 public static void main(String[] args)throws Exception{
  try(BoundedVideoDataSource data=source(2*1024*1024,3000)){
   ok(data.getSize()==size,"size known without whole download");byte[] output=new byte[4096];long tail=size-9000;
   ok(data.readAt(tail,output,0,output.length)==output.length,"tail metadata random seek");for(int n=0;n<output.length;n++)ok(output[n]==expected(tail+n),"tail bytes");
   int before=requests;data.readAt(tail,output,0,output.length);ok(before==requests,"repeated reads reuse block");
   ok(data.readAt(size,output,0,1)==-1,"EOF");ok(data.readAt(0,output,0,0)==0,"zero read");
   long cross=256*1024-100;data.readAt(cross,output,0,output.length);for(int n=0;n<output.length;n++)ok(output[n]==expected(cross+n),"cross-block bytes");
   ok(data.transferredBytes()<=2*1024*1024,"transfer bounded");data.close();try{data.getSize();throw new AssertionError("closed");}catch(IOException expected){checks++;}
  }
  try(BoundedVideoDataSource data=source(256*1024,3000)){try{data.readAt(size-1,new byte[1],0,1);throw new AssertionError("budget");}catch(IOException expected){checks++;}ok(data.transferredBytes()==256*1024,"no transfer after budget exhausted");}
  rejected("noRange");rejected("malformed");rejected("wrongStart");rejected("truncated");
  try(BoundedVideoDataSource data=source(1024*1024,100)){Thread.sleep(120);try{data.readAt(0,new byte[1],0,1);throw new AssertionError("deadline");}catch(IOException expected){checks++;}}
  System.out.println("PASS "+checks+": bounded sparse reads, cache, range validation, transfer limit and deadline");
 }
}
