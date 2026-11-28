package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.net.Uri;
import android.webkit.WebView;
import org.json.*;

/** The same thread identity and copy choices for both archive result viewers. */
final class ArchiveResultActions {
    static String nativeUrl(String address){
        try{
            Uri u=Uri.parse(address);String host=u.getHost();
            if(!"https".equalsIgnoreCase(u.getScheme())&&!"http".equalsIgnoreCase(u.getScheme()))return null;
            if(u.getUserInfo()!=null)return null;
            java.util.List<String> p=u.getPathSegments();String board,key;
            if(("www.kyodemo.net".equalsIgnoreCase(host)||"kyodemo.net".equalsIgnoreCase(host))&&p.size()>=4&&"sdemo".equals(p.get(0))&&"r".equals(p.get(1))&&p.get(2).startsWith("e_e_")){
                board=p.get(2).substring(4);key=p.get(3);
            }else if(("bbs.eddibb.cc".equalsIgnoreCase(host)||"eagle.5ch.net".equalsIgnoreCase(host))&&p.size()>=4&&"test".equals(p.get(0))&&"read.cgi".equals(p.get(1))){board=p.get(2);key=p.get(3);}
            else return null;
            if(!board.matches("[a-zA-Z0-9_]+")||!key.matches("[0-9]{9,12}"))return null;
            return "https://bbs.eddibb.cc/test/read.cgi/"+board+"/"+key+"/";
        }catch(Exception invalid){return null;}
    }
    static String[] values(String title,String address){
        Uri original=Uri.parse(address);String sourceHost=original.getHost();
        if(sourceHost!=null&&(sourceHost.endsWith(".5ch.io")||sourceHost.endsWith(".5ch.net"))&&HissiLinkRouting.isThreadUrl(address)){
            java.util.List<String> parts=original.getPathSegments();if(parts.size()<4)return null;
            String nuko="https://n2ch.net/r/-/"+parts.get(2)+"/"+parts.get(3)+"/?redirect=t_kyodemo&guid=ON";
            return new String[]{title,address,title+"\n"+address,nuko,title+"\n"+nuko,parts.get(2)+"\n"+address};
        }
        String nativeUrl=nativeUrl(address);if(nativeUrl==null)return null;
        java.util.List<String> p=Uri.parse(nativeUrl).getPathSegments();
        String kyodemo="https://www.kyodemo.net/sdemo/r/e_e_"+p.get(2)+"/"+p.get(3)+"/";
        return new String[]{title,nativeUrl,title+"\n"+nativeUrl,kyodemo,title+"\n"+kyodemo,("liveedge".equals(p.get(2))?"エッヂ":p.get(2))+"\n"+nativeUrl};
    }
    static void show(Activity activity,String title,String address){
        if(NukoArchive.accepts(address)&&Uri.parse(address).getPath().startsWith("/r/-/")){
            NukoArchive.resolve(activity,address,url->show(activity,title,url));return;
        }
        String[] values=values(title,address);if(values==null||activity.isFinishing())return;
        new HaiagaruDialog.Builder(activity).setTitle("スレをコピー")
            .setItems(new String[]{"スレ名","スレURL","スレ名とスレURL","KyodemoのURL","スレ名とKyodemo URL","板名とスレURL"},(d,which)->{
                ((ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("スレ",values[which]));
                android.widget.Toast.makeText(activity,"コピーしました",android.widget.Toast.LENGTH_SHORT).show();
            }).setNegativeButton("キャンセル",null).show();
    }
    static final String SCRIPT="(function(){"
        +"window.haiagaruArchiveAt=function(x,y){var e=document.elementFromPoint(x,y),card=e&&e.closest('.thread'),a=card&&card.querySelector('a.title[href]');if(!a&&e)a=e.closest('a[href]');return a?JSON.stringify({title:(a.textContent||'').trim(),url:a.href}):'';};"
        +"if(window.haiagaruArchiveClick)return;window.haiagaruArchiveClick=true;document.addEventListener('click',function(e){var c=e.target.closest&&e.target.closest('.thread');if(!c)return;var a=c.querySelector('a.title[href]');if(!a||!/^https?:\\/\\/(?:bbs\\.eddibb\\.cc\\/test\\/read\\.cgi\\/|(?:www\\.)?kyodemo\\.net\\/sdemo\\/r\\/e_e_)/i.test(a.href))return;e.preventDefault();e.stopPropagation();HaiagaruBridge.openArchiveThread(a.href);},true);"
        +"})();";
    static void install(WebView view){view.evaluateJavascript(SCRIPT,null);
        if("n2ch.net".equalsIgnoreCase(Uri.parse(view.getUrl()==null?"":view.getUrl()).getHost()))
            view.evaluateJavascript("(function(){window.haiagaruArchiveAt=function(x,y){var e=document.elementFromPoint(x,y),a=e&&e.closest('a[href]');return a?JSON.stringify({title:(a.textContent||'').trim(),url:a.href}):'';};if(window.haiagaruNukoClick)return;window.haiagaruNukoClick=true;document.addEventListener('click',function(e){var a=e.target.closest&&e.target.closest('a[href]');if(!a)return;var u=new URL(a.href);if(u.hostname!=='n2ch.net'||!/^\\/r\\/-\\/[a-zA-Z0-9_]+\\/[0-9]{9,12}\\/$/.test(u.pathname))return;e.preventDefault();e.stopPropagation();HaiagaruBridge.openArchiveThread(a.href);},true);})()",null);
    }
    static void longPress(Activity activity,WebView view,float x,float y){
        float scale=Math.max(.1f,view.getScale());
        view.evaluateJavascript("(window.haiagaruArchiveAt&&window.haiagaruArchiveAt("+Math.round(x/scale)+","+Math.round(y/scale)+"))||''",raw->{
            try{Object decoded=new JSONTokener(raw).nextValue();if(!(decoded instanceof String)||((String)decoded).isEmpty())return;JSONObject data=new JSONObject((String)decoded);show(activity,data.optString("title"),data.optString("url"));}catch(Exception ignored){}
        });
    }
    private ArchiveResultActions(){}
}
