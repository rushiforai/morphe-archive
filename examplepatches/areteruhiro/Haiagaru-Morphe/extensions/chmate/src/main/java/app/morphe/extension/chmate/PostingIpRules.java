package app.morphe.extension.chmate;

import java.util.regex.Pattern;

/** Inspect server-generated settings and poster headers, never quoted body text. */
final class PostingIpRules {
    private static final Pattern ADDRESS=Pattern.compile("(?:^|[\\s\\[(])([0-9a-fA-F:.*]+)(?:/[0-9]{1,3})?(?=$|[\\s\\])])");
    private static final Pattern SETTING=Pattern.compile("(?i)VIPQ2_EXTDAT:\\s*(?:checked|none|default):v{6,}:");
    static boolean exposes(String name,String firstBody){
        if(firstBody!=null&&SETTING.matcher(firstBody).find())return true;
        if(name!=null){java.util.regex.Matcher m=ADDRESS.matcher(name);while(m.find())if(address(m.group(1))||masked(m.group(1)))return true;}
        return false;
    }
    private static boolean masked(String value){
        if(value.matches("(?:[0-9a-fA-F]{1,4}:){2,7}\\*"))return true;
        if(value.matches("(?:[0-9]{1,3}\\.){1,3}\\*")){
            for(String part:value.substring(0,value.length()-2).split("\\."))if(Integer.parseInt(part)>255)return false;return true;
        }return false;
    }
    static boolean address(String value){
        if(value==null||value.length()>45)return false;
        if(value.indexOf(':')>=0){
            if(!value.matches("[0-9a-fA-F:.]+")||value.chars().filter(c->c==':').count()<2)return false;
            try{return java.net.InetAddress.getByName(value) instanceof java.net.Inet6Address||value.contains(".")&&value.startsWith("::");}
            catch(Exception invalid){return false;}
        }
        if(!value.matches("[0-9]{1,3}(?:\\.[0-9]{1,3}){3}"))return false;
        for(String part:value.split("\\."))if(Integer.parseInt(part)>255)return false;return true;
    }
    static boolean warn(int selected,int route){return selected!=0&&(route==0||(selected&route)!=0);}
    private PostingIpRules(){}
}
