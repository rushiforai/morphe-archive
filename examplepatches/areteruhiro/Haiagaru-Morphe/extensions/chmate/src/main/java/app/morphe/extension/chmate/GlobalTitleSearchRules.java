package app.morphe.extension.chmate;

import java.net.URI;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.*;

/** Thread-title matching and standard subject formats; no network or Android state. */
final class GlobalTitleSearchRules {
    private static final Pattern LINE=Pattern.compile("^(\\d{9,12})\\.(?:dat<>|cgi,)(.*)\\s+\\((\\d{1,7})\\)\\s*$");
    private static final Pattern TERMS=Pattern.compile("\"([^\"]+)\"|(\\S+)");
    static String normalize(String text){return Normalizer.normalize(text,Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);}
    static boolean matches(String title,String query){
        String text=normalize(title);Matcher terms=TERMS.matcher(normalize(query));boolean positive=false;
        while(terms.find()){
            String term=terms.group(1)!=null?terms.group(1):terms.group(2);
            if(term.startsWith("-")&&term.length()>1){if(text.contains(term.substring(1)))return false;}
            else {positive=true;if(!text.contains(term))return false;}
        }
        return positive;
    }
    static String threadUrl(String board,String id){
        BoardAddress b=BoardAddress.parse(board);URI u=URI.create(b.url);
        String base=u.getScheme()+"://"+u.getRawAuthority();
        String route=b.engine().equals("shitaraba")||u.getHost().equals("machi.to")||u.getHost().endsWith(".machi.to")?"/bbs/read.cgi/":"/test/read.cgi/";
        return base+route+b.path+"/"+id+"/";
    }
    static String key(String url){try{
        URI u=URI.create(url);String host=u.getHost();if(host==null)return url;
        host=host.toLowerCase(Locale.ROOT).replaceFirst("\\.(?:5ch\\.net|2ch\\.net)$",".5ch.io");
        return host+(u.getPort()<0?"":":"+u.getPort())+u.getPath().replaceAll("/+$","")+"/";
    }catch(IllegalArgumentException e){return url;}}
    static void existing(String tsv,Set<String> urls){
        for(String line:tsv.split("\\r?\\n")){String[] fields=line.split("\\t",-1);if(fields.length>=3)urls.add(key(fields[2]));}
    }
    interface PlainText {String decode(String title);}
    static void append(StringBuilder output,String subject,String board,String query,Set<String> urls,PlainText decoder){
        for(String line:subject.split("\\r?\\n")){
            Matcher match=LINE.matcher(line);if(!match.matches())continue;
            String title=match.group(2).trim();if(!matches(decoder.decode(title),query))continue;
            String url=threadUrl(board,match.group(1));if(!urls.add(key(url)))continue;
            output.append(title.replace('\t',' ').replace('\r',' ')).append('\t').append(match.group(3)).append('\t').append(url).append('\n');
            if(urls.size()>=5000)break;
        }
    }
    static boolean pink(String url){try{String host=URI.create(url).getHost();return host!=null&&(host.equals("bbspink.com")||host.endsWith(".bbspink.com"));}catch(IllegalArgumentException e){return false;}}
    private GlobalTitleSearchRules(){}
}
