package app.morphe.extension.chmate;

import java.time.*;
import java.util.Map;
import java.util.regex.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;

/** Creation dates are read from the original opening post, never inferred from numeric IDs. */
final class SiteThreadDates {
    private static final Pattern DATE=Pattern.compile("(?<![0-9])(20[0-9]{2}|[0-9]{2})[年/\\-]([0-9]{1,2})[月/\\-]([0-9]{1,2})日?(?:[（(][^）)]{0,12}[）)])?[ T]*([0-9]{1,2}):([0-9]{2})(?::([0-9]{2}))?");
    static long parse(String text){return parse(text,System.currentTimeMillis()/1000);}
    static long parse(String text,long now){
        if(text==null||text.length()>500)return 0;Matcher match=DATE.matcher(text);if(!match.find())return 0;
        try{int year=Integer.parseInt(match.group(1));if(year<100)year+=2000;long value=LocalDateTime.of(year,Integer.parseInt(match.group(2)),Integer.parseInt(match.group(3)),Integer.parseInt(match.group(4)),Integer.parseInt(match.group(5)),match.group(6)==null?0:Integer.parseInt(match.group(6))).atZone(ZoneId.of("Asia/Tokyo")).toEpochSecond();return value>0&&value<=now+300?value:0;}catch(RuntimeException invalid){return 0;}
    }
    static long opening(SiteBoardProtocol.Board board,String thread,String html){
        Document doc=Jsoup.parse(html,board.threadUrl(thread));Element date=null;
        if(board.kind.equals("bakusai"))date=doc.selectFirst(".titleheader .posts,#res0_whole .posts");
        else if(board.kind.equals("animanch"))date=doc.selectFirst("#res1 .resposted");
        else{Element opening=doc.selectFirst(".thre[data-res="+thread+"]");if(opening!=null){Element main=opening.clone();main.select("table").remove();date=main.selectFirst(".cnw");}}
        return date==null?0:parse(date.text());
    }
    /** Same thousandths-of-responses/day unit as ChMate's list renderer. */
    static long momentum(int count,long created,long now){if(count<1||created<1||created>now)return 0;long elapsed=Math.max(1,now-created);return count*86400000L/elapsed;}
    /** Resolve a site ID only when every cached board association agrees. */
    static long uniqueCachedDate(Map<String,Long> cache,String source,long fallback){
        String suffix=":"+source;Long match=null;
        for(Map.Entry<String,Long> entry:cache.entrySet())if(entry.getKey().endsWith(suffix)){
            long candidate=entry.getValue();if(match!=null&&match.longValue()!=candidate)return fallback;match=candidate;
        }
        return match==null?fallback:match;
    }
    private SiteThreadDates(){}
}
