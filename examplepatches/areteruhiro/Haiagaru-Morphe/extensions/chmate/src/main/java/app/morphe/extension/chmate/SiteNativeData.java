package app.morphe.extension.chmate;

import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.util.*;
import java.util.function.Function;
import java.util.regex.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;

/** Converts site records into the existing native subject/DAT protocol. */
final class SiteNativeData {
    static byte[] subject(List<SiteBoardProtocol.Topic> topics){
        return subject(topics,false);
    }
    static byte[] subject(List<SiteBoardProtocol.Topic> topics,boolean unknownCounts){
        StringBuilder out=new StringBuilder();for(SiteBoardProtocol.Topic t:topics){
            if(!t.id.matches("[1-9][0-9]{0,11}")||t.count<(unknownCounts?0:1)||t.count>1000000)throw new IllegalArgumentException("Invalid topic");
            try{out.append(SiteThreadIds.nativeId(t.id));}catch(java.io.IOException invalid){throw new IllegalArgumentException(invalid);}
            out.append(".dat<>").append(header(t.title)).append(" (").append(t.count).append(")\n");
        }return wire(out.toString());
    }
    static byte[] dat(SiteBoardProtocol.Board board,SiteBoardProtocol.ThreadPage page,Function<String,String> media,Function<String,String> links){
        LinkedHashMap<String,Integer> numbers=new LinkedHashMap<>();int next=1;
        for(SiteBoardProtocol.Entry e:page.entries)if(numbers.put(e.original,next++)!=null)throw new IllegalArgumentException("Duplicate original number");
        StringBuilder out=new StringBuilder();
        for(SiteBoardProtocol.Entry e:page.entries){
            Document doc=Jsoup.parseBodyFragment(e.body);doc.outputSettings().prettyPrint(false);
            for(Element a:doc.select("a[href]")){String target=links.apply(a.attr("href"));if(target!=null)a.attr("href",target);}
            // ChMate's DAT renderer handles <br>, but discards HTML paragraph boundaries.
            if(board.kind.equals("animanch"))animanchParagraphs(doc.body());
            else for(Element block:doc.select("p,blockquote")){
                block.before(new Element("br"));block.after(new Element("br"));block.unwrap();
            }
            String body=doc.body().html().replace("\r\n","<br>").replace("\r","<br>").replace("\n","<br>");
            if(board.kind.equals("animanch"))body=body.trim();
            Pattern references=Pattern.compile("&gt;(?:&gt;|No\\.)([0-9]+)(?:-([0-9]+))?");Matcher matches=references.matcher(body);StringBuffer fixed=new StringBuffer();
            while(matches.find()){
                Integer begin=numbers.get(matches.group(1)),end=matches.group(2)==null?null:numbers.get(matches.group(2));
                String replacement=begin!=null&&(matches.group(2)==null||end!=null)?"&gt;&gt;"+begin+(end==null?"":"-"+end):matches.group();
                matches.appendReplacement(fixed,Matcher.quoteReplacement(replacement));
            }matches.appendTail(fixed);body=fixed.toString();
            for(String image:e.media){String target=media.apply(image);if(target!=null){
                boolean animanch=board.kind.equals("animanch");
                if(!animanch||!body.isEmpty()&&!body.endsWith("<br>"))body+="<br>";
                body+="<a href=\""+Entities.escape(target)+"\">"+Entities.escape(animanch?image:target)+"</a>";
            }}
            String date=e.date;if(!board.kind.equals("animanch"))date+=" No."+e.original;
            out.append(header(e.name)).append("<><>").append(header(date)).append("<>").append(body).append("<>");
            if(numbers.get(e.original)==1)out.append(header(page.title));out.append('\n');
        }return wire(out.toString());
    }
    private static Node adjacent(Node node,boolean next){
        for(Node sibling=next?node.nextSibling():node.previousSibling();sibling!=null;sibling=next?sibling.nextSibling():sibling.previousSibling())
            if(!(sibling instanceof TextNode)||!((TextNode)sibling).isBlank())return sibling;
        return null;
    }
    private static boolean lineBreak(Node node){return node instanceof Element&&((Element)node).normalName().equals("br");}
    private static boolean edgeBreak(Element block,boolean first){
        List<Node> nodes=block.childNodes();
        for(int i=first?0:nodes.size()-1;i>=0&&i<nodes.size();i+=first?1:-1){Node node=nodes.get(i);
            if(!(node instanceof TextNode)||!((TextNode)node).isBlank())return lineBreak(node);
        }return false;
    }
    private static void animanchParagraphs(Element root){
        for(Element parent:root.getAllElements())for(TextNode node:parent.textNodes())
            node.text(node.getWholeText().replaceAll("[\\t\\r\\n\\f ]+"," "));
        for(Element block:root.select("p,blockquote")){
            Node before=adjacent(block,false),after=adjacent(block,true);
            if(before!=null&&!lineBreak(before)&&!edgeBreak(block,true))block.before(new Element("br"));
            if(after!=null&&!lineBreak(after)&&!edgeBreak(block,false))block.after(new Element("br"));
            block.unwrap();
        }
        for(TextNode node:new ArrayList<>(root.textNodes()))if(node.isBlank()
                &&(node.previousSibling()==null||node.nextSibling()==null||lineBreak(node.previousSibling())||lineBreak(node.nextSibling())))node.remove();
    }
    /** Native quote numbers must be translated before submitting to board-global numbering sites. */
    static String originalQuotes(String body,SiteBoardProtocol.ThreadPage page){
        Matcher matcher=Pattern.compile(">>([1-9][0-9]{0,5})(?:-([1-9][0-9]{0,5}))?").matcher(body);StringBuffer out=new StringBuffer();
        while(matcher.find()){
            int n=Integer.parseInt(matcher.group(1)),end=matcher.group(2)==null?0:Integer.parseInt(matcher.group(2));String replace=matcher.group();
            if(n<=page.entries.size()&&(end==0||end<=page.entries.size()))replace=">>"+page.entries.get(n-1).original+(end==0?"":"-"+page.entries.get(end-1).original);
            matcher.appendReplacement(out,Matcher.quoteReplacement(replace));
        }matcher.appendTail(out);return out.toString();
    }
    private static String header(String text){return Entities.escape(text.replace('\r',' ').replace('\n',' '));}
    static byte[] wire(String input){
        Charset charset=Charset.forName("windows-31j");CharsetEncoder encoder=charset.newEncoder();
        byte[] encoded=input.getBytes(charset);
        if(encoder.canEncode(input)&&new String(encoded,charset).equals(input))return encoded;
        StringBuilder out=new StringBuilder();for(int pos=0;pos<input.length();){int cp=input.codePointAt(pos);String letter=new String(Character.toChars(cp));
            if(encoder.canEncode(letter)&&new String(letter.getBytes(charset),charset).equals(letter))out.append(letter);else out.append("&#x").append(Integer.toHexString(cp)).append(';');pos+=Character.charCount(cp);}
        return out.toString().getBytes(charset);
    }
    private SiteNativeData(){}
}
