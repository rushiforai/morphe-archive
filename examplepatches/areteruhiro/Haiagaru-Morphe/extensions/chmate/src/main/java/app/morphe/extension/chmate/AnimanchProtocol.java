package app.morphe.extension.chmate;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.*;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
import org.jsoup.safety.Safelist;

/** Site-format adapter. No network or native-state mutation; derived from saved public pages. */
final class AnimanchProtocol {
    static final String ORIGIN="https://bbs.animanch.com";
    static final String CHECK=ORIGIN+"/inc/comment.php?preCheck", POST=ORIGIN+"/inc/comment.php";
    private static final Pattern THREAD=Pattern.compile("/board/([1-9][0-9]{0,11})/(?:([1-9][0-9]{0,5})/?)?");
    private static final Pattern RESPONSE=Pattern.compile("res([1-9][0-9]{0,4})");
    private static final Safelist BODY=new Safelist().addTags("a","br","b","strong","i","em","s","del","blockquote","p","span")
            .addAttributes("a","href").addProtocols("a","href","http","https");
    static final class Reply {
        final int number;final String name,date,html;final List<String> images;
        Reply(int number,String name,String date,String html,List<String> images){
            this.number=number;this.name=name;this.date=date;this.html=html;
            this.images=Collections.unmodifiableList(new ArrayList<>(images));
        }
    }
    static final class Page {
        final String id,title;final List<Reply> replies;
        Page(String id,String title,List<Reply> replies){this.id=id;this.title=title;this.replies=Collections.unmodifiableList(replies);}
    }
    static final class Topic {
        final String id,title;final int replies;
        Topic(String id,String title,int replies){this.id=id;this.title=title;this.replies=replies;}
    }
    static String threadId(String url){
        Matcher match=threadMatch(url);return match==null?null:match.group(1);
    }
    /** A direct /board/id/res link has priority over a #resN fragment. */
    static String replyNumber(String url){
        Matcher match=threadMatch(url);return match==null?null:match.group(2);
    }
    private static Matcher threadMatch(String url){
        try{
            URI uri=URI.create(url);if(!"https".equalsIgnoreCase(uri.getScheme())||!"bbs.animanch.com".equalsIgnoreCase(uri.getHost())
                    ||uri.getUserInfo()!=null||uri.getPort()!=-1||uri.getRawQuery()!=null)return null;
            Matcher match=THREAD.matcher(uri.getRawPath());return match.matches()?match:null;
        }catch(RuntimeException invalid){return null;}
    }
    static Page thread(String html,String address)throws IOException{
        Page page=threadSlice(html,address);int expected=1;for(Reply reply:page.replies)if(reply.number!=expected++)throw new IOException("レス番号に重複または欠落があります");return page;
    }
    /** Mobile pages deliberately omit older responses; the paginator validates the final sequence. */
    static Page threadSlice(String html,String address)throws IOException{
        String expected=threadId(address);if(expected==null)throw new IOException("あにまんのスレURLではありません");
        Document doc=Jsoup.parse(html,address);doc.outputSettings().prettyPrint(false);
        Element canonical=doc.selectFirst("link[rel=canonical]");
        if(canonical!=null&&!expected.equals(threadId(canonical.attr("href"))))throw new IOException("別スレの応答です");
        Element list=doc.getElementById("resList");if(list==null)throw new IOException("本文を取得できません（認証画面・削除・通信エラーを確認してください）");
        ArrayList<Reply> rows=new ArrayList<>();Set<Integer> seen=new HashSet<>();
        for(Element item:list.children()){
            if(!item.tagName().equals("li"))continue;
            Matcher number=RESPONSE.matcher(item.id());if(!number.matches())continue;
            int n=Integer.parseInt(number.group(1));if(!seen.add(n)||!rows.isEmpty()&&n<=rows.get(rows.size()-1).number)throw new IOException("レス番号に重複または逆転があります");
            Element content=item.selectFirst(".resbody");if(content==null)throw new IOException("レス本文が欠落しています");
            Element clean=content.clone();ArrayList<String> images=new ArrayList<>();
            // The site's inbound-reply badge is navigation, not text written by this author.
            clean.select(".reply").remove();
            // The site renders YouTube embeds as an anchor with a video id but no href.
            for(Element link:clean.select("a.youtube.mvthumb[data]")){
                String video=link.attr("data");
                if(video.matches("[A-Za-z0-9_-]{11}"))link.attr("href","https://www.youtube.com/watch?v="+video).text("YouTube: https://www.youtube.com/watch?v="+video);
            }
            // Embedded X posts use a date-only link with a protocol-relative URL.
            for(Element quote:clean.select("blockquote.twitter-tweet"))for(Element link:quote.select("a[href]")){
                String source=absolute(address,link.attr("href"));
                if(source==null)continue;
                Matcher tweet=Pattern.compile("https://(?:twitter\\.com|x\\.com)/([A-Za-z0-9_]{1,15})/status/([0-9]{1,24})(?:[?#].*)?").matcher(source);
                if(tweet.matches()){
                    String url="https://x.com/"+tweet.group(1)+"/status/"+tweet.group(2);
                    link.attr("href",url).text(url);
                }
            }
            for(Element link:clean.select("a.thumb[href]")){
                String source=absolute(address,link.attr("href"));
                if(source!=null&&imageOfThread(source,expected))images.add(source);
                link.remove();
            }
            // Saved-page image filenames and vote/pop-up markup are never used as media sources.
            clean.select("script,style,iframe,form,input,button,img").remove();
            for(Element link:clean.select("a.reslink[href]")){
                Matcher ref=Pattern.compile("#res([1-9][0-9]{0,4})$").matcher(link.attr("href"));
                String target=absolute(address,link.attr("href"));
                if(ref.find()&&localReply(target,expected))link.replaceWith(new TextNode(">>"+ref.group(1)));
            }
            for(Element link:clean.select("a[href]")){
                String href=absolute(address,link.attr("href"),false);
                if(href==null)link.removeAttr("href");else {
                    link.attr("href",href);
                    if(link.hasClass("row")&&link.selectFirst("div")!=null
                            &&link.selectFirst("strong")!=null&&link.selectFirst("small")!=null)
                        link.empty().text(href);
                }
            }
            String body=Jsoup.clean(clean.html(),address,BODY,new Document.OutputSettings().prettyPrint(false));
            rows.add(new Reply(n,text(item,".resname"),text(item,".resposted"),body,images));
        }
        if(rows.isEmpty())throw new IOException("本文のレスがありません");
        String title=doc.title().replaceFirst("[｜|]あにまん掲示板$","").trim();
        if(title.isEmpty())throw new IOException("スレタイトルがありません");
        return new Page(expected,title,rows);
    }
    static List<Topic> catalogue(String html)throws IOException{
        Document doc=Jsoup.parse(html,ORIGIN+"/");LinkedHashMap<String,Topic> rows=new LinkedHashMap<>();
        for(Element card:doc.select(".card")){
            // Current categories use <a class="card" href="/board/...">;
            // older catalogues can place an <a> inside .card instead.
            Element link=card.normalName().equals("a")&&card.hasAttr("href")?card:card.selectFirst("a[href*=/board/]");if(link==null)continue;
            String id=threadId(absolute(ORIGIN+"/",link.attr("href")));if(id==null)continue;
            Element count=card.selectFirst(".threadCount");String raw=count==null?"":count.text().trim();
            if(!raw.matches("[0-9]{1,6}"))continue;
            Element label=link.clone();label.select(".threadCount").remove();String title=label.text().trim();
            if(!title.isEmpty())rows.putIfAbsent(id,new Topic(id,title,Integer.parseInt(raw)));
        }
        if(rows.isEmpty())throw new IOException("スレ一覧を取得できません");
        return Collections.unmodifiableList(new ArrayList<>(rows.values()));
    }
    /** Request construction only. Caller must obtain confirmation and run CHECK before POST. */
    static String replyForm(String thread,String name,String body)throws IOException{
        if(thread==null||!thread.matches("[1-9][0-9]{0,11}"))throw new IOException("スレ番号が不正です");
        if(name==null||body==null||body.trim().isEmpty())throw new IOException("本文を入力してください");
        if(name.length()>15||body.length()>100000)throw new IOException("投稿内容が長すぎます");
        String normalized=body.replace("\r\n","\n").replace('\r','\n');
        return "thread="+thread+"&name="+encode(name)+"&text="+encode(normalized);
    }
    static int postedReply(String json,String expected)throws IOException{
        try{
            if(expected==null||!expected.matches("[1-9][0-9]{0,11}"))throw new IOException("投稿先のスレ番号が不正です");
            JSONObject answer=new JSONObject(json);String thread=String.valueOf(answer.get("thread")),number=String.valueOf(answer.get("number"));
            if(!thread.equals(expected)||!number.matches("[1-9][0-9]{0,4}"))throw new IOException("投稿結果のスレ・レス番号が不正です");
            // The site acknowledges the write with thread/number. Its optional browser
            // navigation hint is not a receipt and is never followed by the native client.
            return Integer.parseInt(number);
        }catch(IOException error){throw error;}catch(Exception error){throw new IOException("投稿の成功を確認できません",error);}
    }
    static String postingError(String body){
        if(body==null||body.length()>32768)return "";
        Document doc=Jsoup.parse(body);doc.select("script,style,form,input,textarea").remove();
        if(doc.title().equals("Just a moment...")&&body.contains("challenges.cloudflare.com"))return "\nCloudflareの認証が必要です。書き込み画面の「あにまんの認証」を開き、通常の認証後に「認証情報を利用」を押してください。本文はまだ送信していません。";
        String text=doc.select(".alert,.bg-danger").text();
        if(text.isEmpty())try{Object error=new JSONObject(body).opt("error");if(error instanceof String)text=(String)error;}catch(Exception notJson){}
        text=text.replaceAll("[\\p{Cntrl}&&[^\\n\\t]]","").trim();
        return text.isEmpty()?"":"\n"+(text.length()>400?text.substring(0,400):text);
    }
    private static String encode(String s)throws IOException{return URLEncoder.encode(s,"UTF-8");}
    private static String text(Element parent,String selector){Element child=parent.selectFirst(selector);return child==null?"":child.text();}
    private static String absolute(String base,String link){
        return absolute(base,link,true);
    }
    private static String absolute(String base,String link,boolean httpsOnly){
        try{URI u=URI.create(base).resolve(link);return ("https".equalsIgnoreCase(u.getScheme())||!httpsOnly&&"http".equalsIgnoreCase(u.getScheme()))&&u.getHost()!=null&&u.getUserInfo()==null?u.toASCIIString():null;}
        catch(RuntimeException invalid){return null;}
    }
    private static boolean imageOfThread(String url,String id){
        try{URI u=URI.create(url);return "https".equalsIgnoreCase(u.getScheme())&&"bbs.animanch.com".equals(u.getHost())&&u.getPort()==-1&&u.getPath().matches("/(?:arc/)?img/"+id+"/[1-9][0-9]*");}
        catch(RuntimeException invalid){return false;}
    }
    private static boolean localReply(String url,String id){
        try{URI u=URI.create(url);return "bbs.animanch.com".equals(u.getHost())&&u.getPort()==-1
                &&(u.getPath().equals("/board/")||u.getPath().equals("/board/"+id+"/"));}
        catch(RuntimeException invalid){return false;}
    }
    private AnimanchProtocol(){}
}
