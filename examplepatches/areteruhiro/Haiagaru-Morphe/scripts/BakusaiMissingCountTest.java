package app.morphe.extension.chmate;
import java.nio.file.*;import java.io.*;import java.util.*;import org.jsoup.*;import org.jsoup.nodes.*;
public class BakusaiMissingCountTest{
 static int checks;static void ok(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
 public static void main(String[]args)throws Exception{
 String initial=Files.readString(Path.of("build/bakusai-8142054/android.raw"));var doc=Jsoup.parse(initial);ok(doc.selectFirst(".res-count, #res0_whole .thrlis_comment_space + span")==null,"real page-two response has no standard counter");ok(SiteBoardProtocol.bakusaiCount(doc)==1000,"actual closed-page title supplies total 1000");
 ok(SiteBoardProtocol.bakusaiCount(Jsoup.parse("<title>題名｜1,000レス｜爆サイ</title>"))==1000,"formatted title count supported");
 try{SiteBoardProtocol.bakusaiCount(Jsoup.parse("<title>題名</title><p>1000レス</p>"));throw new AssertionError("body count accepted");}catch(IOException expected){checks++;}
 var board=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=7/ctgid=148/bid=1548/");Set<Integer> fetched=new HashSet<>();List<String> urls=new ArrayList<>();
 var complete=BakusaiPagination.thread(board,"8142054",initial,url->{urls.add(url);var m=java.util.regex.Pattern.compile("/p=([1-9][0-9]*)/tp=1/$").matcher(url);if(!m.find())throw new AssertionError(url);int p=Integer.parseInt(m.group(1));ok(p!=2,"already returned initial page two is not fetched twice");ok(fetched.add(p),"regional aliases do not duplicate a page");ok(url.startsWith(board.threadUrl("8142054")),"pagination requests use a single canonical regional alias");
  Document next=Jsoup.parse(initial);next.outputSettings().prettyPrint(false);
  // A continuation page contains only previous-thread navigation in its article
  // slot. The synthetic first page must supply a real OP, not clone that slot.
  if(p==1)next.selectFirst("#res0_body, #threadBody").html("<div class=entry-content>先頭ページの本当の本文</div>");
  Element list=next.selectFirst("#res_list"),template=list.selectFirst("li.res_block").clone();list.select("li.res_block").remove();int first=Math.max(1,1000-p*7+1),last=1000-(p-1)*7;
  for(int n=first;n<=last;n++){Element row=template.clone();row.attr("id","res"+n+"_block");row.selectFirst(".res_body").text("試験本文"+n);list.appendChild(row);}for(Element selector:next.select("form select[name=p]")){selector.empty();for(int k=1;k<=143;k++)selector.appendElement("option").attr("value",""+k);}for(Element option:next.select("form select[name=p] option")){if(option.attr("value").equals(""+p))option.attr("selected","");else option.removeAttr("selected");}return next.html();
 });ok(fetched.contains(1),"latest page is retrieved when initial request returned page two");ok(complete.entries.size()==1001,"all 1000 replies plus OP recovered");ok(complete.entries.get(0).body.contains("先頭ページの本当の本文"),"navigation is never accepted as an OP");for(int n=0;n<complete.entries.size();n++)ok(complete.entries.get(n).original.equals(""+n),"native response numbering has no gaps");ok(urls.size()==142,"only 142 missing pages fetched for 143-page source");
 System.out.println("PASS "+checks+" real missing-counter/initial-page-two/1000-response regressions; public posts=0");
 }
}
