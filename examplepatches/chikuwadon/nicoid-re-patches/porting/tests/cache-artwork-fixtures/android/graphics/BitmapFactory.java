package android.graphics;
import java.io.*;
public class BitmapFactory {
 public static class Options {public boolean inJustDecodeBounds;public int outWidth=-1,outHeight=-1,inSampleSize=1;}
 public static Bitmap decodeStream(InputStream in){return decodeStream(in,null,null);}
 public static Bitmap decodeStream(InputStream in,android.graphics.Rect padding,Options options){try{DataInputStream d=new DataInputStream(in);int w=d.readInt(),h=d.readInt();if(options!=null){options.outWidth=w;options.outHeight=h;if(options.inJustDecodeBounds)return null;int sample=Math.max(1,options.inSampleSize);w=Math.max(1,w/sample);h=Math.max(1,h/sample);}return w>0&&h>0?new Bitmap(w,h):null;}catch(IOException e){return null;}}
}
