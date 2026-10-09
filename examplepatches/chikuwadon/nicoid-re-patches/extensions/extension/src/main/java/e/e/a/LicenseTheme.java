package e.e.a;
import android.webkit.WebView;import android.widget.TextView;import android.util.TypedValue;import java.util.Locale;
public final class LicenseTheme {
 public static void load(WebView web,String base,String html,String mime,String encoding,String history){
  TextView probe=new TextView(web.getContext());int text=ThemeChoice.textColor(probe);TypedValue value=new TypedValue();int background=0;
  if(web.getContext().getTheme().resolveAttribute(android.R.attr.colorBackground,value,true))background=value.resourceId==0?value.data:web.getResources().getColor(value.resourceId);
  web.setBackgroundColor(background);int accent=ThemeChoice.accent(web.getContext());
  String css=String.format(Locale.ROOT,"<style>html,body{background:#%06x;color:#%06x}body{padding:8px}div{padding:8px;margin:8px 0;background:transparent;border:1px solid #%06x}a{color:#%06x}code{white-space:normal;overflow-wrap:anywhere}</style>",background&0xffffff,text&0xffffff,text&0xffffff,accent&0xffffff);
  web.loadDataWithBaseURL(base,html+css,mime,encoding,history);
 }
}
