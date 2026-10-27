package app.morphe.extension.chmate;

import android.content.*;
import android.graphics.Bitmap;
import android.net.Uri;
import android.text.style.URLSpan;
import java.util.*;

final class Haiagaru {
 static boolean enabled=true,full=true,collapsible,card,actions,sites;
 static boolean xPostPreviewEnabled(){return enabled;} static boolean xPostPreviewFullText(){return full;}
 static boolean xPostPreviewCollapsible(){return collapsible;} static boolean xPostPreviewCard(){return card;}
 static boolean xPostPreviewActions(){return actions;} static boolean siteCardsEnabled(){return sites;}
 static boolean siteCardImages(){return false;} static int siteCardMaxPerResponse(){return 2;}
 static long siteCardCacheDurationMillis(){return 86400000L;}
}
final class XPostMetadata {
 static boolean fail;static int calls,failures;static String response;
 static void clear(){}
 static String fetchPreview(String id)throws java.io.IOException{calls++;if(fail||failures-->0)throw new java.io.IOException("Fixture transient failure");if(response!=null)return response;throw new AssertionError("Unexpected metadata download");}
}
final class XMediaAttachments {
 static String[] postIds(String source){ArrayList<String> result=new ArrayList<>();java.util.regex.Matcher m=java.util.regex.Pattern.compile("https://x\\.com/[^/ ]+/status/([0-9]+)").matcher(source);while(m.find())result.add(m.group(1));return result.toArray(new String[0]);}
}
final class DirectBodySelection {static void prepare(Object ignored){}}
final class XPostPreviewTouch {
 static class PostLink extends URLSpan {PostLink(String url){super(url);}}
 static final class ToggleLink extends PostLink {ToggleLink(String id){super("https://x.com/i/status/"+id);}}
 static final class ActionLink extends PostLink {ActionLink(String url,boolean copy){super(url);}}
 static String actionUrl(String action,String id){return "https://x.com/intent/"+action+"?id="+id;}
}
final class HaiagaruDialog {
 static final class Builder {
  Builder(Context c){} Builder setMessage(String text){return this;}
  Builder setNegativeButton(String text,DialogInterface.OnClickListener c){return this;}
  Builder setPositiveButton(String text,DialogInterface.OnClickListener c){return this;} void show(){}
 }
}
final class SiteCardMetadata {
 static final class Data {
  final String url,title,description,image,site;final boolean tunnel=false;final long savedAt;
  Data(String u,String t,String d,String i,String s){url=u;title=t;description=d;image=i;site=s;savedAt=System.currentTimeMillis();}
 }
 static String safeUrl(String url){try{return Uri.parse(url).getHost()!=null?url:null;}catch(Exception e){return null;}}
 static Data cached(String url){throw new AssertionError("Unexpected disk read");}
 static Data fetch(String url){throw new AssertionError("Unexpected download");}
 static Bitmap image(String url,boolean tunnel){throw new AssertionError("Unexpected image download");}
 static void store(Data data){} static void clear(){}
}
final class ImageVpnController {static boolean protectedPreview(String url){return false;}}
final class EmojiFontFallback {static void refreshVisibleRows(){}}
final class WacchoiSearchOptions {static final String PREFS="preview-layout-isolated";}
