package app.morphe.extension.chmate;

import java.io.IOException;
import java.net.URI;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;

/** Mobile views contain the OP and latest 200 replies. Follow only this thread's page links. */
final class AnimanchPagination {
    interface Fetch {String get(String url)throws IOException;}
    static SiteBoardProtocol.ThreadPage thread(SiteBoardProtocol.Board board,String id,String initial,Fetch fetch)throws IOException{
        String origin=board.threadUrl(id),title=null;TreeMap<Integer,AnimanchProtocol.Reply> rows=new TreeMap<>();
        Set<String> visited=new HashSet<>();ArrayDeque<String> pending=new ArrayDeque<>();pending.add(origin);int expected=0;
        while(!pending.isEmpty()){
            String address=pending.removeFirst();if(!visited.add(address))continue;if(visited.size()>50)throw new IOException("あにまんのページ数が取得上限を超えました");
            String html=address.equals(origin)?initial:fetch.get(address);AnimanchProtocol.Page slice=AnimanchProtocol.threadSlice(html,origin);
            if(title==null)title=slice.title;else if(!title.equals(slice.title))throw new IOException("取得中にスレのタイトルが変わりました。再取得してください");
            // Overlap is normal, including OP repeated on every page. Link previews can differ
            // between cached/mobile pages; retain the first snapshot for each response number.
            for(AnimanchProtocol.Reply reply:slice.replies)rows.putIfAbsent(reply.number,reply);
            if(rows.size()>10000)throw new IOException("あにまんのレス数が取得上限を超えました");
            Document doc=Jsoup.parse(html,address);
            if(address.equals(origin)){
                expected=rows.lastKey();Element counter=doc.selectFirst("#autoCheck[name]");
                if(counter!=null&&counter.attr("name").matches("[1-9][0-9]{0,4}"))expected=Math.max(expected,Integer.parseInt(counter.attr("name")));
                if(expected>10000)throw new IOException("あにまんのレス数が取得上限を超えました");
            }
            if(rows.firstKey()==1&&rows.lastKey()>=expected&&rows.size()==rows.lastKey()){
                ArrayList<SiteBoardProtocol.Entry> result=new ArrayList<>();for(AnimanchProtocol.Reply reply:rows.values())result.add(new SiteBoardProtocol.Entry(Integer.toString(reply.number),reply.name,reply.date,reply.html,reply.images));return new SiteBoardProtocol.ThreadPage(title,result);
            }
            for(Element link:doc.select(".pagination a[href]")){
                String next=pageUrl(link.absUrl("href"),id);if(next!=null&&!visited.contains(next)&&!pending.contains(next))pending.add(next);
            }
        }
        throw new IOException("あにまんのレスを全件取得できませんでした。再取得してください");
    }
    static String pageUrl(String address,String id){
        try{URI uri=URI.create(address);return "https".equals(uri.getScheme())&&"bbs.animanch.com".equals(uri.getHost())&&uri.getPort()==-1&&uri.getUserInfo()==null&&uri.getRawQuery()==null&&uri.getRawFragment()==null&&uri.getRawPath().matches("/board/"+java.util.regex.Pattern.quote(id)+"/[1-9][0-9]{0,2}/")?uri.toASCIIString():null;}catch(RuntimeException invalid){return null;}
    }
    private AnimanchPagination(){}
}
