package app.template.extension.extension;

import android.app.Activity;
import android.os.Bundle;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.util.Base64;
import android.widget.ScrollView;
import android.widget.TextView;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;

/** Side-by-side source-style old/new values; data remains local to this process. */
public final class ReplayDiffActivity extends Activity {
 private static volatile List<ReplayEngine.Change> changes=Collections.emptyList();
 public static void setChanges(List<ReplayEngine.Change> items){changes=items;}
 private static String label(String oid){if(oid.equals("1.3.6.1.2.1.1.1.0"))return "System description";if(oid.equals("1.3.6.1.2.1.1.5.0"))return "Printer name";if(oid.equals("1.3.6.1.2.1.1.3.0"))return "System uptime (changes normally)";if(oid.equals("1.3.6.1.2.1.2.2.1.6.1"))return "Hardware address";if(ReplayEngine.isRoutine(oid))return "Uptime (changes normally)";return "Printer object";}
 private static String display(String value){
  if(value==null)return "Not recorded";if(value.equals("missing:"))return "Not supported";if(value.startsWith("integer:"))return value.substring(8);
  if(value.startsWith("octets:"))try{byte[] b=Base64.decode(value.substring(7),Base64.DEFAULT);String s=new String(b,StandardCharsets.UTF_8);boolean text=true;for(int i=0;i<s.length();i++)if(Character.isISOControl(s.charAt(i))&&s.charAt(i)!='\n'&&s.charAt(i)!='\t'){text=false;break;}if(text&&!s.contains("\ufffd")){s=s.replace("\n"," ");return s;}StringBuilder out=new StringBuilder(b.length*2+2);out.append("0x");String hex="0123456789abcdef";for(byte x:b){out.append(hex.charAt((x&255)>>>4)).append(hex.charAt(x&15));}return out.toString();}catch(Exception ignored){}return "Unsupported value";
 }
 private static String window(String value,int difference){if(value.length()<=256)return value;int start=Math.max(0,Math.min(difference,value.length())-40),end=Math.min(value.length(),start+216);return (start>0?"...":"")+value.substring(start,end)+(end<value.length()?"...":"")+" [length "+value.length()+"]";}
 private static void line(SpannableStringBuilder out,String text,int color){int start=out.length();out.append(text).append("\n");out.setSpan(new ForegroundColorSpan(color),start,out.length(),0);}
 @Override public void onCreate(Bundle state){super.onCreate(state);setTitle("Printer data differences");TextView view=new TextView(this);view.setTypeface(Typeface.MONOSPACE);view.setTextSize(13);int pad=(int)(16*getResources().getDisplayMetrics().density);view.setPadding(pad,pad,pad,pad);SpannableStringBuilder out=new SpannableStringBuilder();List<ReplayEngine.Change> snapshot=changes;if(snapshot.isEmpty())out.append("No saved differences are available.");int count=0;for(ReplayEngine.Change c:snapshot){if(count++>=200){out.append("\nFurther differences omitted from this view.");break;}out.append(label(c.oid)).append("\n").append(c.oid).append("\n");String before=display(c.before),after=display(c.after);int difference=0;while(difference<before.length()&&difference<after.length()&&before.charAt(difference)==after.charAt(difference))difference++;line(out,"- Original: "+window(before,difference),0xffa52626);line(out,"+ Replay: "+window(after,difference),0xff16723a);out.append("\n");}view.setText(out);ScrollView scroll=new ScrollView(this);scroll.addView(view);setContentView(scroll);}
}

