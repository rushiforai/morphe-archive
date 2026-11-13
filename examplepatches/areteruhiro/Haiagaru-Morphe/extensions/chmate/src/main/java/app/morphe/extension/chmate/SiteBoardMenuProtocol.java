package app.morphe.extension.chmate;

import java.io.IOException;import java.util.*;import org.json.*;import org.jsoup.Jsoup;import org.jsoup.nodes.*;

/** Public board menus only; no posts or executable site code are retained. */
final class SiteBoardMenuProtocol {
 static final String[] KINDS={"edge","kenmo","bakusai","futaba","animanch"};
 static String title(String kind){return kind.equals("edge")?"エッヂ":kind.equals("kenmo")?"オルグ板":kind.equals("bakusai")?"爆サイ":kind.equals("futaba")?"ふたば":"あにまん";}
 static String home(String kind){return kind.equals("edge")?"https://bbs.eddibb.cc/liveedge/":kind.equals("kenmo")?"https://kenmo.org/":kind.equals("bakusai")?"https://bakusai.com/":kind.equals("futaba")?"https://www.2chan.net/":AnimanchProtocol.ORIGIN+"/";}
 static final String[] REGIONS={"hokkaido","hokubukyusyu","hokuriku","kansai","kitakanto","kitatohoku","koshinetstu","minamikanto","minamitohoku","nanbukyusyu","okinawa","sanin","sanyo","shikoku","tokai"};
 static final String[] REGION_NAMES={"北海道","北部九州","北陸","関西","北関東","北東北","甲信越","南関東","南東北","南部九州","沖縄","山陰","山陽","四国","東海"};
 static final class Choice {final String name,url,group;Choice(String name,String url,String group){this.name=name;this.url=url;this.group=group;}@Override public String toString(){return name+(group.isEmpty()?"":"（"+group+"）");}}
 static String source(String kind,int region)throws IOException{
  if(kind.equals("edge"))return home(kind);
  if(kind.equals("kenmo"))return "https://kenmo.org/bbsmenu.html";
  if(kind.equals("futaba"))return "https://www.2chan.net/bbsmenu.html";
  if(kind.equals("animanch"))return "https://bbs-menu.pages.dev/animanch_bbsmenu/bbsmenu.json";
  if(kind.equals("bakusai")&&region>=0&&region<REGIONS.length)return "https://bbs-menu.pages.dev/bakusai_bbsmenu/"+REGIONS[region]+"_bbsmenu.json";
  throw new IOException("未対応の板一覧です");
 }
 static List<Choice> parse(String kind,String content)throws IOException{
  LinkedHashMap<String,Choice> rows=new LinkedHashMap<>();
  if(kind.equals("edge"))add(rows,kind,"エッヂ",home(kind),"エッヂ");
  else if(kind.equals("bakusai")||kind.equals("animanch"))try{
   JSONArray groups=new JSONObject(content).getJSONArray("menu_list");for(int n=0;n<groups.length();n++){JSONArray entries=groups.getJSONObject(n).getJSONArray("category_content");for(int i=0;i<entries.length();i++){JSONObject row=entries.getJSONObject(i);add(rows,kind,row.optString("board_name"),row.optString("url"),row.optString("category_name"));}}
  }catch(JSONException invalid){throw new IOException("板一覧のJSONを確認できません",invalid);}
  else if(kind.equals("futaba")){
   String base=source(kind,0);Document doc=Jsoup.parse(content,base);
   String section="画像板";for(Element a:doc.select("b,a[href]")){
    if(a.tagName().equals("b")){if(!a.text().trim().isEmpty())section=a.text().trim();continue;}
    String target=SiteBoardProtocol.resolve(base,a.attr("href"));if(target==null)continue;
    add(rows,kind,a.text(),target,section);
   }
  }else throw new IOException("未対応の板一覧です");
  // The third-party Animanch BBSMENU can lag behind newly created categories.
  // Keep the reported home-console games board available until its source catches up.
  // putIfAbsent preserves the upstream label and folder once the menu is updated.
  if(kind.equals("animanch")&&!rows.isEmpty())
   add(rows,kind,"家庭用ゲーム",AnimanchProtocol.ORIGIN+"/category32/","単発スレ");
  if(rows.isEmpty())throw new IOException("板一覧がありません。認証・通信・サイトの形式を確認してください");
  return Collections.unmodifiableList(new ArrayList<>(rows.values()));
 }
 private static void add(Map<String,Choice> out,String kind,String name,String url,String group){
  if(kind.equals("edge")){if(home(kind).equals(url))out.putIfAbsent(url,new Choice(name,url,group));return;}
  try{SiteBoardProtocol.Board board=SiteBoardProtocol.address(url);if(!board.kind.equals(kind)||board.thread!=null||name.trim().isEmpty()||kind.equals("futaba")&&board.host.equals("www.2chan.net")&&board.path.equals("script"))return;out.putIfAbsent(board.url,new Choice(name.trim(),board.url,group.trim()));}catch(IOException ignored){/* Menus also contain news, advertising and unsupported endpoints. */}
 }
 private SiteBoardMenuProtocol(){}
}
