package app.morphe.extension.chmate;
import java.net.*;
import java.util.*;

/** Board identification uses the actual request URL/form, never the most recently opened tab. */
final class BoardCookiePolicy {
    static String board(String address,String formBoard){
        try{
            URI uri=URI.create(address);String host=uri.getHost();
            if(host==null||uri.getUserInfo()!=null||!("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme())))return null;
            String path=uri.getPath(),name=null;String[] parts=path.split("/");
            if(formBoard!=null)name=formBoard;
            else if(path.startsWith("/test/read.cgi/")&&parts.length>3)name=parts[3];
            else if(path.startsWith("/bbs/read.cgi/")&&parts.length>3)name=parts[3];
            else if(parts.length>1&&!Arrays.asList("test","bbs","auth","captcha","3").contains(parts[1]))name=parts[1];
            if(name==null||!name.matches("[A-Za-z0-9_-]{1,80}"))return null;
            return "https://"+host.toLowerCase(Locale.ROOT)+(uri.getPort()==-1?"":":"+uri.getPort())+"/"+name+"/";
        }catch(RuntimeException invalid){return null;}
    }
    static String formBoard(String form){
        if(form==null||form.length()>131072)return null;
        String found=null;
        try{
            for(String field:form.split("&")){
                String[] pair=field.split("=",2);
                if(pair.length==2&&("bbs".equals(URLDecoder.decode(pair[0],"UTF-8"))||"board".equals(URLDecoder.decode(pair[0],"UTF-8")))){
                    String value=URLDecoder.decode(pair[1],"UTF-8");
                    if(!value.matches("[A-Za-z0-9_-]{1,80}")||found!=null&&!found.equals(value))return null;
                    found=value;
                }
            }
        }catch(Exception invalid){return null;}
        return found;
    }
    static boolean sameServer(String first,String second){
        try{
            URI a=URI.create(first),b=URI.create(second);
            if(a.getHost()==null||b.getHost()==null||b.getUserInfo()!=null)return false;
            if(!("http".equalsIgnoreCase(b.getScheme())||"https".equalsIgnoreCase(b.getScheme())))return false;
            int ap=a.getPort(),bp=b.getPort();
            if(ap==80||ap==443)ap=-1;if(bp==80||bp==443)bp=-1;
            return a.getHost().equalsIgnoreCase(b.getHost())&&ap==bp;
        }catch(RuntimeException invalid){return false;}
    }
    static boolean matches(String cookie,String address){
        try{
            URI uri=URI.create(address);String host=uri.getHost(),path=uri.getRawPath();
            if(host==null)return false;if(path==null||path.isEmpty())path="/";
            String domain=null,cookiePath="/";boolean secure=false;
            String[] attributes=cookie.split(";");
            for(int i=1;i<attributes.length;i++){
                String[] pair=attributes[i].trim().split("=",2);
                if(pair[0].equalsIgnoreCase("secure"))secure=true;
                if(pair.length<2)continue;
                if(pair[0].equalsIgnoreCase("domain"))domain=pair[1].replaceFirst("^\\.","").toLowerCase(Locale.ROOT);
                if(pair[0].equalsIgnoreCase("path"))cookiePath=pair[1];
            }
            host=host.toLowerCase(Locale.ROOT);
            if(domain!=null&&!host.equals(domain)&&!host.endsWith("."+domain))return false;
            return (!secure||"https".equalsIgnoreCase(uri.getScheme()))&&(path.equals(cookiePath)||path.startsWith(cookiePath)&&(cookiePath.endsWith("/")||path.charAt(cookiePath.length())=='/'));
        }catch(RuntimeException invalid){return false;}
    }
    static String cookieKey(String encoded){
        String[] fields=encoded.split(";");String name=fields[0].split("=",2)[0].trim(),domain="",path="/";
        for(int i=1;i<fields.length;i++){String[] value=fields[i].trim().split("=",2);if(value.length!=2)continue;
            if("domain".equalsIgnoreCase(value[0]))domain=value[1].toLowerCase(Locale.ROOT);
            if("path".equalsIgnoreCase(value[0]))path=value[1];}
        return name+"\n"+domain+"\n"+path;
    }
    private BoardCookiePolicy(){}
}
