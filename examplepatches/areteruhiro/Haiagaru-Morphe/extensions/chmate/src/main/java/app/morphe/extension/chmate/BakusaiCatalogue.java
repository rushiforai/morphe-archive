package app.morphe.extension.chmate;

import java.io.IOException;
import java.util.*;
import java.util.regex.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;

/** Read additional list pages without following links outside the selected board. */
final class BakusaiCatalogue {
    interface Fetch {String get(String url)throws IOException;}
    private static final Pattern PAGE=Pattern.compile("/thr_tl/(acode=[0-9]{1,3}/ctgid=[0-9]{1,6}/bid=[0-9]{1,8}/)p=([1-9][0-9]{0,2})/");
    static List<SiteBoardProtocol.Topic> topics(SiteBoardProtocol.Board board,String first,Fetch fetch)throws IOException{
        return topics(board,first,fetch,100);
    }
    static List<SiteBoardProtocol.Topic> topics(SiteBoardProtocol.Board board,String first,Fetch fetch,int limit)throws IOException{
        limit=Math.max(1,Math.min(500,limit));
        LinkedHashMap<String,SiteBoardProtocol.Topic> result=new LinkedHashMap<>();
        String html=first;
        Set<String> visited=new HashSet<>();
        for(int number=1;number<=15;number++){
            List<SiteBoardProtocol.Topic> page;
            try{page=SiteBoardProtocol.topics(board,html);}catch(IOException invalid){if(number==1)throw invalid;break;}
            int before=result.size();for(SiteBoardProtocol.Topic item:page){if(result.size()>=limit)break;result.putIfAbsent(item.id,item);}
            if(result.size()>=limit)break;
            if(number>1&&result.size()==before)break;
            String next=null;
            for(Element anchor:Jsoup.parse(html,board.indexUrl()).select("a[href*=/thr_tl/][href*=p=]")){
                String url=anchor.absUrl("href");Matcher match=PAGE.matcher(java.net.URI.create(url).getPath());
                if(!match.matches()||Integer.parseInt(match.group(2))!=number+1)continue;
                try{if(!SiteBoardProtocol.sameBoard(board,SiteBoardProtocol.address(url)))continue;}catch(IOException invalid){continue;}
                next=url;break;
            }
            if(next==null||!visited.add(next))break;
            try{html=fetch.get(next);}catch(IOException unavailable){break;}
        }
        return new ArrayList<>(result.values());
    }
    private BakusaiCatalogue(){}
}
