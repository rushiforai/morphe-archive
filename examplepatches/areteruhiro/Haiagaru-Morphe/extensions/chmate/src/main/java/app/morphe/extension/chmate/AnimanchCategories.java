package app.morphe.extension.chmate;

import java.util.regex.Pattern;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/** Extract the board identity from a verified thread page, not its /board/ URL. */
final class AnimanchCategories {
    private static final Pattern CATEGORY=Pattern.compile("/category[1-9][0-9]{0,3}/");

    static final class Category {
        final String path,name;
        Category(String path,String name){this.path=path;this.name=name;}
    }

    static String fromThread(String html,String threadId){
        Category found=identify(html,threadId);return found==null?null:found.path;
    }

    static Category identify(String html,String threadId){
        if(threadId==null||!threadId.matches("[1-9][0-9]{0,11}"))return null;
        Document doc=Jsoup.parse(html,AnimanchProtocol.ORIGIN+"/board/"+threadId+"/");
        Element canonical=doc.selectFirst("link[rel=canonical]");
        if(canonical!=null&&!threadId.equals(AnimanchProtocol.threadId(canonical.absUrl("href"))))return null;
        if(doc.getElementById("resList")==null)return null;
        for(Element link:doc.select("#breadcrumb a[href]")){
            String url=link.absUrl("href");
            if(!url.startsWith(AnimanchProtocol.ORIGIN+"/"))continue;
            String path=url.substring(AnimanchProtocol.ORIGIN.length());
            if(CATEGORY.matcher(path).matches()){
                String label=link.text().trim();
                if(label.startsWith("カテゴリ『")&&label.endsWith("』"))label=label.substring(5,label.length()-1).trim();
                if(label.isEmpty()||label.length()>100||label.contains("://"))label="あにまん ("+path.substring(1,path.length()-1)+")";
                return new Category(path,label);
            }
        }
        return null;
    }

    private AnimanchCategories(){}
}
