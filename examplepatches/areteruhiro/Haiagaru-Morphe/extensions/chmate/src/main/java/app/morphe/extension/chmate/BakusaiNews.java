package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.util.*;
import org.json.*;
import org.jsoup.Jsoup;

/** The same read-only news catalog requested by the yamibaito page after loading. */
final class BakusaiNews {
    static final String URL="https://bakusai.com/img_newimgjson/";
    static SitePostProtocol.Plan request(){Map<String,String> fields=new LinkedHashMap<>();fields.put("newsFlg","true");fields.put("key","YamiNewsTidList");return new SitePostProtocol.Plan(URL,null,"UTF-8",false,fields,"https://bakusai.com/yamibaito/");}
    static final class Item {final String id,title,url;Item(String id,String title,String url){this.id=id;this.title=title;this.url=url;}}
    static List<Item> catalogue(String json)throws IOException{
        try{JSONArray rows=new JSONArray(json);if(rows.length()>256)throw new IOException("関連ニュースの取得上限を超えました");LinkedHashMap<String,Item> out=new LinkedHashMap<>();
            for(int n=0;n<rows.length();n++){JSONObject row=rows.getJSONObject(n);String id=row.get("tid").toString(),title=row.getString("title").trim();String decoded=URLDecoder.decode(row.getString("url"),"UTF-8");
                URI uri=URI.create(decoded);if(!"https".equals(uri.getScheme())||!"bakusai.com".equals(uri.getHost())||uri.getPort()!=-1||uri.getUserInfo()!=null||uri.getRawQuery()!=null||uri.getFragment()!=null)throw new IOException("関連ニュースのURLが不正です");
                String path=uri.getRawPath().replaceFirst("/ctrid=0/","/");if(!path.endsWith("/"))path+="/";
                SiteBoardProtocol.Board source=SiteBoardProtocol.address("https://bakusai.com"+path);
                if(!id.equals(source.thread)||!id.matches("[1-9][0-9]{0,11}")||title.isEmpty()||title.length()>1000)throw new IOException("関連ニュースのスレが一致しません");
                if(out.putIfAbsent(id,new Item(id,title,source.threadUrl(id)))!=null)throw new IOException("関連ニュースのスレが重複しています");
            }if(out.isEmpty())throw new IOException("関連ニュースのスレ一覧がありません");return new ArrayList<>(out.values());
        }catch(JSONException|IllegalArgumentException error){throw new IOException("関連ニュースの一覧形式を確認してください",error);}
    }
    static SiteBoardProtocol.Board canonical(String source,String id,String html)throws IOException{
        SiteBoardProtocol.Board before=SiteBoardProtocol.address(source);var link=Jsoup.parse(html).selectFirst("link[rel=canonical][href]");if(link==null)return before;
        SiteBoardProtocol.Board after=SiteBoardProtocol.address(link.attr("href"));
        String bid=before.path.substring(before.path.indexOf("bid="));if(!id.equals(after.thread)||!after.path.endsWith(bid))throw new IOException("関連ニュースの移動先スレが一致しません");return after;
    }
    private BakusaiNews(){}
}
