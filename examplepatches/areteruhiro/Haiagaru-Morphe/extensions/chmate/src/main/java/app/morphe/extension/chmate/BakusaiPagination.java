package app.morphe.extension.chmate;

import java.io.IOException;import java.util.*;import java.util.regex.*;import org.jsoup.Jsoup;import org.jsoup.nodes.*;

/** Validates the complete response sequence before exposing a new native DAT. */
final class BakusaiPagination {
 interface Fetch {String get(String url)throws IOException;}
 static SiteBoardProtocol.ThreadPage thread(SiteBoardProtocol.Board board,String id,String initial,Fetch fetch)throws IOException{
  String origin=board.threadUrl(id);Pattern route=Pattern.compile("https://bakusai\\.com/thr_res/acode=[0-9]{1,3}/"+Pattern.quote(board.path.replaceFirst("^acode=[0-9]+/","")+"tid="+id+"/")+"p=([1-9][0-9]{0,2})/tp=[0-9]{1,3}/");
  TreeMap<Integer,SiteBoardProtocol.Entry> responses=new TreeMap<>();Set<String> visited=new HashSet<>(),unavailableCodes=new TreeSet<>();ArrayDeque<String> pending=new ArrayDeque<>();pending.add(origin);String title=null;int expected=0;boolean initialLatest=true,emptySource=false,repeatedPage=false;BakusaiAccessError initialError=null;
  while(!pending.isEmpty()){
   String url=pending.removeFirst();if(!visited.add(url))continue;if(visited.size()>200)throw new IOException("爆サイのページ数が取得上限を超えました");
   Document doc=Jsoup.parse(url.equals(origin)?initial:fetch.get(url),url);doc.outputSettings().prettyPrint(false);
   if(url.equals(origin)){Element selected=doc.selectFirst("form select[name=p] option[selected]");if(selected!=null&&selected.attr("value").matches("[1-9][0-9]{0,2}")){initialLatest=selected.attr("value").equals("1");visited.add(origin+"p="+selected.attr("value")+"/tp=1/");}}
   String errorCode=BakusaiAccessError.code(doc);
   if(errorCode!=null){
    if(url.equals(origin)){
     // Some valid threads reject only the unpaged URL. Try the explicit first
     // page once, then follow the site's actual pagination in the normal reader.
     initialError=new BakusaiAccessError(errorCode);pending.add(origin+"p=1/tp=1/");continue;
    }
    unavailableCodes.add(errorCode);continue;
   }
   SiteBoardProtocol.ThreadPage page=SiteBoardProtocol.bakusaiSlice(board,id,doc,false);if(title==null)title=page.title;else if(!title.equals(page.title))throw new IOException("取得中にスレのタイトルが変わりました。再取得してください");
   // The unpaged URL can itself be an older page without an OP or selected option.
   if(url.equals(origin)&&page.entries.stream().noneMatch(row->row.original.equals("0"))){initialLatest=false;String first=origin+"p=1/tp=1/";if(!visited.contains(first))pending.add(first);}
   // Mobile continuation pages omit the OP and its total counter together.
   if(expected==0||url.equals(origin)||doc.selectFirst(".res-count, #res0_whole .thrlis_comment_space + span")!=null)expected=Math.max(expected,SiteBoardProtocol.bakusaiCount(doc));if(expected>10000)throw new IOException("爆サイのレス数が取得上限を超えました");
   // Desktop pages can include the OP while returning an older page, without a
   // selected-page control. Infer latest-page coverage from actual response IDs.
   if(url.equals(origin)&&expected>0&&page.entries.stream().mapToInt(row->Integer.parseInt(row.original)).max().orElse(0)<expected){
    initialLatest=false;String first=origin+"p=1/tp=1/";visited.remove(first);if(!pending.contains(first))pending.add(first);
   }
   if(expected>0&&doc.selectFirst("#No-write-message, #res_list > li.No-write-message")!=null&&page.entries.stream().noneMatch(row->!row.original.equals("0")))emptySource=true;
   int before=responses.size();for(SiteBoardProtocol.Entry row:page.entries){int number=Integer.parseInt(row.original);SiteBoardProtocol.Entry old=responses.putIfAbsent(number,row);if(old!=null&&(!old.body.equals(row.body)||!old.media.equals(row.media)))throw new IOException("取得中にレスが変更されました。再取得してください");}
   if(!url.equals(origin)&&responses.size()==before&&!page.entries.isEmpty())repeatedPage=true;
   if(responses.size()==expected+1&&responses.firstKey()==0&&responses.lastKey()==expected)return new SiteBoardProtocol.ThreadPage(title,new ArrayList<>(responses.values()));
   for(Element a:doc.select("a[href]")){String next=SiteBoardProtocol.resolve(url,a.attr("href"));if(next==null)continue;int hash=next.indexOf('#');if(hash>=0)next=next.substring(0,hash);Matcher m=route.matcher(next);if(m.matches()&&(!m.group(1).equals("1")||!initialLatest)){next=origin+"p="+m.group(1)+"/tp=1/";if(!visited.contains(next)&&!pending.contains(next))pending.add(next);}}
   // The site's page selector can advertise later pages even when one intervening page fails.
   for(Element select:doc.select("form select[name=p]")){Element form=select.closest("form");String action=form==null?null:SiteBoardProtocol.resolve(url,form.attr("action"));if(action==null||!id.equals(SiteBoardProtocol.threadIn(board,action)))continue;
    for(Element option:select.select("option[value]")){String number=option.attr("value");if(!number.matches("[1-9][0-9]{0,2}")||number.equals("1")&&initialLatest)continue;String next=origin+"p="+number+"/tp=1/";if(!visited.contains(next)&&!pending.contains(next))pending.add(next);}
   }
  }
  if(title==null&&initialError!=null)throw initialError;
  // After every advertised page was read, a source can still omit individual numbers.
  // Preserve their slots without inventing content or declaring the posts deleted.
  boolean omittedNumbers=!repeatedPage&&expected>0&&responses.containsKey(0)&&responses.lastKey()==expected;
  if((emptySource||!unavailableCodes.isEmpty()||omittedNumbers)&&title!=null&&responses.containsKey(0)&&responses.lastKey()<=expected){
   String notice=(!unavailableCodes.isEmpty()?"元サイトのエラー（"+String.join("、",unavailableCodes)+"）により":emptySource?"元サイトがレス数を表示しながらレス一覧を空で返しているため":"元サイトの取得済みページにこの番号のレスが含まれていないため")+"、このレスはまだ取得できていません。再取得して確認してください。";
   for(int number=1;number<=expected;number++)responses.putIfAbsent(number,new SiteBoardProtocol.Entry(Integer.toString(number),"未取得","",notice,Collections.emptyList()));
   SiteBoardProtocol.Entry opening=responses.get(0);responses.put(0,new SiteBoardProtocol.Entry(opening.original,opening.name,opening.date,opening.body+"<br><b>一部のレスが未取得です。該当レスに取得できなかった理由を表示しています。</b>",opening.media));
   return new SiteBoardProtocol.ThreadPage(title,new ArrayList<>(responses.values()));
  }
  throw new IOException("爆サイのレスを全件取得できませんでした。再取得してください");
 }
 private BakusaiPagination(){}
}
