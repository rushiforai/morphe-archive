package app.morphe.extension.chmate;

import java.io.IOException;import java.net.URI;import java.util.*;import org.jsoup.Jsoup;import org.jsoup.nodes.*;

/** Catalogues omit/truncate text. Resolve OP titles from bounded normal index pages. */
final class FutabaCatalogue {
    private static final Map<String,String> TITLES=Collections.synchronizedMap(new LinkedHashMap<String,String>(128,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,String> entry){return size()>2048;}
    });
    interface Fetch { String get(String url)throws IOException; }
    static List<SiteBoardProtocol.Topic> topics(SiteBoardProtocol.Board board,String catalogue,Fetch fetch)throws IOException {
        return topics(board,catalogue,fetch,150);
    }
    static List<SiteBoardProtocol.Topic> topics(SiteBoardProtocol.Board board,String catalogue,Fetch fetch,int limit)throws IOException {
        limit=Math.max(1,Math.min(500,limit));
        List<SiteBoardProtocol.Topic> topics=SiteBoardProtocol.topics(board,catalogue);
        Map<String,String> titles=new HashMap<>();Set<String> visited=new HashSet<>();
        LinkedHashMap<String,SiteBoardProtocol.Topic> discovered=new LinkedHashMap<>();
        ArrayDeque<String> pending=new ArrayDeque<>();pending.add(board.url+"futaba.htm");
        Set<String> wanted=new HashSet<>();for(int i=0;i<Math.min(limit,topics.size());i++){SiteBoardProtocol.Topic topic=topics.get(i);wanted.add(topic.id);String cached=TITLES.get(board.url+topic.id);if(cached!=null)titles.put(topic.id,cached);}
        while(!pending.isEmpty()&&visited.size()<10&&(titles.size()<wanted.size()||topics.size()+discovered.size()<limit)) {
            String url=pending.removeFirst();if(!visited.add(url))continue;
            final String html;try{html=fetch.get(url);}catch(IOException unavailable){continue;}
            Document doc=Jsoup.parse(html,url);
            for(Element thread:doc.select(".thre[data-res]")) {
                String id=thread.attr("data-res");if(!id.matches("[1-9][0-9]{0,11}"))continue;
                Element opening=thread.clone();opening.select("table").remove();
                Element subject=opening.selectFirst(".csb"),body=opening.selectFirst("blockquote");
                String title=subject==null?"":subject.text().trim();
                if(title.isEmpty()||title.equals("無題"))title=body==null?"":body.text().trim();
                if(!title.isEmpty()){title=title.length()>120?title.substring(0,120):title;titles.put(id,title);TITLES.put(board.url+id,title);}
                if(!wanted.contains(id)&&topics.size()+discovered.size()<limit)discovered.putIfAbsent(id,new SiteBoardProtocol.Topic(id,title.isEmpty()?"No."+id:title,Math.min(999999,thread.select("td.rtd").size()+1)));
            }
            for(Element link:doc.select("a[href], form[action]")) {
                if(link.tagName().equals("form")&&!link.attr("method").equalsIgnoreCase("get"))continue;
                String next=SiteBoardProtocol.resolve(url,link.attr(link.tagName().equals("form")?"action":"href"));
                if(next==null||!next.startsWith(board.url))continue;
                String suffix=next.substring(board.url.length());
                if(suffix.matches("(?:[0-9]{1,2}|futaba)\\.htm")&&!visited.contains(next)&&!pending.contains(next))pending.add(next);
            }
        }
        ArrayList<SiteBoardProtocol.Topic> resolved=new ArrayList<>();
        for(int i=0;i<Math.min(limit,topics.size());i++){SiteBoardProtocol.Topic topic=topics.get(i);resolved.add(new SiteBoardProtocol.Topic(topic.id,titles.getOrDefault(topic.id,topic.title),topic.count));}
        // Catalogue views can truncate the active list to 50. Index pages expose more OPs.
        resolved.addAll(discovered.values());
        return resolved;
    }
    private FutabaCatalogue(){}
}
