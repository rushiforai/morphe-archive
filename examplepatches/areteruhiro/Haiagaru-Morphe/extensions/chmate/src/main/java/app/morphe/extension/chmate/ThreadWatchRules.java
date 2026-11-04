package app.morphe.extension.chmate;

import java.net.URI;
import java.util.*;
import java.util.regex.*;

/** Data-only parsing shared by the UI and background worker. */
final class ThreadWatchRules {
    private static final Pattern PATH=Pattern.compile("/test/read\\.cgi/([A-Za-z0-9_-]+)/([0-9]{9,11})(?:/.*)?");
    private static final Pattern SHITARABA=Pattern.compile("/bbs/read\\.cgi/([A-Za-z0-9_-]+)/([0-9]{1,10})/([0-9]{9,11})(?:/.*)?");
    private static final Pattern ROW=Pattern.compile("^([0-9]{9,11})(?:\\.dat<>|\\.cgi,)(.*?)\\s*\\(([0-9]{1,7})\\)\\s*$");
    private static final Pattern ANCHOR=Pattern.compile("(?:>>|＞＞)([0-9]{1,7})(?:\\s*[-－–]\\s*([0-9]{1,7}))?((?:\\s*[,、]\\s*[0-9]{1,7})*)");
    static final class Target {
        final String url,subject,id,dat;
        final boolean shitaraba;
        Target(String url,String subject,String id){this(url,subject,id,null);}
        Target(String url,String subject,String id,String raw){this.url=url;this.subject=subject;this.id=id;shitaraba=raw!=null;
            dat=raw!=null?raw:subject.substring(0,subject.length()-"subject.txt".length())+"dat/"+id+".dat";}
    }
    static Target target(String value){
        try{
            URI u=new URI(value);String host=u.getHost();
            if(host==null||u.getUserInfo()!=null||u.getPort()!=-1||!("https".equals(u.getScheme())||"http".equals(u.getScheme())))return null;
            String origin="https://"+host.toLowerCase(Locale.ROOT);
            Matcher m=SHITARABA.matcher(u.getPath());
            if(m.matches()){
                if(!host.equalsIgnoreCase("jbbs.shitaraba.net")&&!host.equalsIgnoreCase("jbbs.livedoor.jp"))return null;
                origin="https://jbbs.shitaraba.net";String board=m.group(1)+"/"+m.group(2),id=m.group(3);
                return new Target(origin+"/bbs/read.cgi/"+board+"/"+id+"/",origin+"/"+board+"/subject.txt",id,origin+"/bbs/rawmode.cgi/"+board+"/"+id+"/");
            }
            m=PATH.matcher(u.getPath());if(!m.matches())return null;
            return new Target(origin+"/test/read.cgi/"+m.group(1)+"/"+m.group(2)+"/",origin+"/"+m.group(1)+"/subject.txt",m.group(2));
        }catch(Exception invalid){return null;}
    }
    static Target fromParts(String server,String board,Object id){
        boolean shitaraba="jbbs.shitaraba.net".equalsIgnoreCase(server)||"jbbs.livedoor.jp".equalsIgnoreCase(server);
        return target("https://"+server+(shitaraba?"/bbs/read.cgi/":"/test/read.cgi/")+board+"/"+id+"/");
    }
    static Map<String,Integer> counts(String text){
        Map<String,Integer> out=new HashMap<>();
        if(text==null||text.trim().startsWith("<"))return out;
        for(String line:text.split("\n")){Matcher m=ROW.matcher(line);if(m.matches())out.put(m.group(1),Integer.parseInt(m.group(3)));}
        return out;
    }
    static int increase(int before,int after){return before>=0&&after>before?after-before:0;}
    static Map<String,String> titles(String text){
        Map<String,String> out=new HashMap<>();
        if(text==null||text.trim().startsWith("<"))return out;
        for(String line:text.split("\n")){Matcher m=ROW.matcher(line);if(m.matches())out.put(m.group(1),m.group(2));}
        return out;
    }
    /** Compatibility projection for ordinary 5ch notification previews. */
    static Map<Integer,String> bodies(String dat,int before,int count){
        Map<Integer,String> out=new LinkedHashMap<>();
        if(dat==null||before<0)return out;
        String[] lines=dat.split("\n");
        for(int no=Math.max(before+1,count-2);no<=count&&no<=lines.length;no++){
            String[] fields=lines[no-1].split("<>",-1);if(fields.length<5)continue;
            String body=fields[3];out.put(no,body.substring(0,Math.min(body.length(),16384)));
        }
        return out;
    }
    /** Keep response numbers in rawmode, including gaps left by deleted posts. */
    static Map<Integer,String> newBodies(Target target,String dat,int before,int count){
        Map<Integer,String> out=new LinkedHashMap<>();
        if(dat==null||before<0)return out;
        String[] lines=dat.split("\n");
        for(int i=0;i<lines.length;i++){
            String[] fields=lines[i].split("<>",-1);int number=i+1,body=3;
            if(target.shitaraba){
                if(fields.length<6)continue;
                try{number=Integer.parseInt(fields[0]);}catch(NumberFormatException invalid){continue;}
                body=4;
            }else if(fields.length<5)continue;
            if(number>before&&number<=count)out.put(number,fields[body].substring(0,Math.min(fields[body].length(),16384)));
        }
        return out;
    }
    static Set<Integer> ownPosts(String flags){
        Set<Integer> result=new HashSet<>();if(flags==null)return result;
        for(String part:flags.split(",")){
            String[] pair=part.split(":");if(pair.length!=2)continue;
            try{int no=Integer.parseInt(pair[0]),bits=Integer.parseInt(pair[1]);if(no>0&&(bits&1)!=0)result.add(no);}catch(NumberFormatException ignored){}
        }
        return result;
    }
    static boolean repliesTo(String plain,int no,Set<Integer> mine){
        if(plain==null||mine.isEmpty()||mine.contains(no))return false;
        Matcher m=ANCHOR.matcher(plain);
        while(m.find()){
            int first=Integer.parseInt(m.group(1)),last=m.group(2)==null?first:Integer.parseInt(m.group(2));
            for(int own:mine)if(own<no&&own>=first&&own<=last)return true;
            if(!m.group(3).isEmpty())for(String part:m.group(3).split("[,、]"))if(!part.trim().isEmpty()){
                int own=Integer.parseInt(part.trim());if(own<no&&mine.contains(own))return true;
            }
        }
        return false;
    }
    private ThreadWatchRules(){}
}
