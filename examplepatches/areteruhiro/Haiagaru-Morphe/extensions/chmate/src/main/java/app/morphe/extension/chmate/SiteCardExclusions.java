package app.morphe.extension.chmate;

import java.net.URI;
import java.util.*;

/** URL rules for generic website cards only. Never edits source links or media attachments. */
final class SiteCardExclusions {
    static final String KEY="siteCardExcludedUrls";
    static final String DEFAULT="https://imgur.com/";
    private static final int MAX_LENGTH=8192,MAX_RULES=100;
    static final class Rule {
        final String host,path;
        Rule(String host,String path){this.host=host;this.path=path;}
        String url(){return "https://"+host+path;}
        boolean matches(URI url){
            String value=url.getHost();if(value==null)return false;
            value=value.toLowerCase(Locale.ROOT);
            if(!value.equals(host)&&!value.endsWith("."+host))return false;
            String target=url.normalize().getRawPath();if(target==null||target.isEmpty())target="/";
            return path.equals("/")||target.equals(path)||target.startsWith(path+"/");
        }
    }
    static List<Rule> parse(String source) {
        if(source==null||source.length()>MAX_LENGTH)throw new IllegalArgumentException("除外リストは8192文字以内で入力してください");
        LinkedHashMap<String,Rule> rules=new LinkedHashMap<>();int line=0;
        for(String item:source.split("\\r?\\n")){
            line++;String value=item.trim();if(value.isEmpty())continue;
            if(rules.size()>=MAX_RULES)throw new IllegalArgumentException("除外URLは100件以内で入力してください");
            try {
                URI uri=new URI(value.contains("://")?value:"https://"+value);
                String host=uri.getHost();String scheme=uri.getScheme();
                if(host==null||!(scheme.equalsIgnoreCase("http")||scheme.equalsIgnoreCase("https"))
                        ||uri.getRawUserInfo()!=null||uri.getRawQuery()!=null||uri.getRawFragment()!=null
                        ||uri.getPort()!=-1&&uri.getPort()!=(scheme.equalsIgnoreCase("https")?443:80)
                        ||!host.matches("(?i)[a-z0-9](?:[a-z0-9.-]*[a-z0-9])?\\.[a-z]{2,63}"))throw new IllegalArgumentException();
                String path=uri.normalize().getRawPath();if(path==null||path.isEmpty())path="/";
                while(path.length()>1&&path.endsWith("/"))path=path.substring(0,path.length()-1);
                Rule rule=new Rule(host.toLowerCase(Locale.ROOT),path);rules.put(rule.url(),rule);
            }catch(Exception invalid){throw new IllegalArgumentException(line+"行目のURLを確認してください（http/https、クエリ・#なし）");}
        }
        return Collections.unmodifiableList(new ArrayList<>(rules.values()));
    }
    static String normalize(String source) {
        StringBuilder out=new StringBuilder();for(Rule rule:parse(source)){if(out.length()>0)out.append('\n');out.append(rule.url());}return out.toString();
    }
    static boolean excluded(List<Rule> rules,String url) {
        try{URI uri=new URI(url);for(Rule rule:rules)if(rule.matches(uri))return true;}catch(Exception ignored){}
        return false;
    }
    private SiteCardExclusions(){}
}
