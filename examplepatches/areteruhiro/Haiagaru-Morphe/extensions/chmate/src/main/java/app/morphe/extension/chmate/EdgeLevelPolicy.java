package app.morphe.extension.chmate;

import java.net.URI;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.*;

/** Public observations are scoped to an Edge board and posting day, never an ID alone. */
final class EdgeLevelPolicy {
    static final String SOURCE="https://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/";
    static final ZoneId JST=ZoneId.of("Asia/Tokyo");
    private static final Pattern BADGE=Pattern.compile("</b>\\s*\\(L([0-9]{1,4})(?: [^<>()\\r\\n]{1,100})?\\)<b>\\s*$",Pattern.CASE_INSENSITIVE);
    private static final Pattern HEADER=Pattern.compile("^(20[0-9]{2}/[0-9]{2}/[0-9]{2})\\([^)]{1,8}\\) ([0-9]{2}:[0-9]{2}:[0-9]{2}(?:\\.[0-9]{1,3})?).*? ID:([A-Za-z0-9+/!_.-]{8,100})(?:\\s|$)");
    static final class Fact {
        final String board,day,id,thread;final int level,response;final long at;
        Fact(String board,String day,String id,int level,long at,String thread,int response){this.board=board;this.day=day;this.id=id;this.level=level;this.at=at;this.thread=thread;this.response=response;}
        String key(){return board+"|"+day+"|"+id;}
    }
    static boolean edge(String url){try{URI u=URI.create(url);String h=u.getHost();return u.getUserInfo()==null&&u.getPort()==-1&&("https".equals(u.getScheme())||"http".equals(u.getScheme()))&&h!=null&&(h.equals("bbs.eddibb.cc")||h.equals("d1ch.cc")||h.equals("v1ch.cc"));}catch(RuntimeException e){return false;}}
    static String thread(String url){if(!edge(url))return null;URI u=URI.create(url);Matcher m=Pattern.compile("^/test/read\\.cgi/([A-Za-z0-9_-]{1,80})/([0-9]{9,11})(?:/.*)?$").matcher(u.getPath());return m.matches()?"https://"+u.getHost()+"/test/read.cgi/"+m.group(1)+"/"+m.group(2)+"/":null;}
    static String board(String url){String t=thread(url);if(t!=null){URI u=URI.create(t);return "edge/"+u.getPath().split("/")[3];}if(!edge(url))return null;Matcher m=Pattern.compile("^/([A-Za-z0-9_-]{1,80})/?$").matcher(URI.create(url).getPath());return m.matches()?"edge/"+m.group(1):null;}
    static String day(String text){try{return LocalDate.parse(text,DateTimeFormatter.ISO_LOCAL_DATE).toString();}catch(RuntimeException e){return null;}}
    static String id(String value){if(value==null)return null;String s=value.trim();if(s.startsWith("ID:"))s=s.substring(3);return s.matches("[A-Za-z0-9+/!_.-]{8,100}")&&!Arrays.asList("DELETED","CAP_USER","OVER1000").contains(s)?s:null;}
    static int badge(String rawName){if(rawName==null||rawName.length()>4096)return -1;Matcher m=BADGE.matcher(rawName);return m.find()?Integer.parseInt(m.group(1)):-1;}
    static Fact parse(String thread,int response,String rawName,String header){String b=board(thread);if(b==null||response<1||header==null||header.length()>4096)return null;int level=badge(rawName);if(level<0)return null;Matcher m=HEADER.matcher(header);if(!m.find()||id(m.group(3))==null)return null;
        try{String date=m.group(1).replace('/','-');String time=m.group(2);int dot=time.indexOf('.');if(dot<0)time+=".000";else while(time.length()-dot<4)time+="0";long at=LocalDateTime.parse(date+"T"+time).atZone(JST).toInstant().toEpochMilli();return new Fact(b,date,m.group(3),level,at,thread,response);}catch(RuntimeException invalid){return null;}}
    static Fact identity(String thread,int response,String rawId,String header){String normalized=id(rawId);if(normalized==null)return null;Fact f=parse(thread,response,"</b>(L0)<b>",header+" ID:"+normalized);return f==null?null:new Fact(f.board,f.day,normalized,-1,f.at,thread,response);}
    static Map<String,Fact> dat(String thread,String dat){Map<String,Fact> facts=new HashMap<>();String canonical=thread(thread);if(canonical==null||dat==null||dat.length()>4*1024*1024)throw new IllegalArgumentException("Invalid Edge DAT");int no=0;for(String line:dat.split("\n",10002)){if(++no>10000)break;String[] fields=line.replace("\r","").split("<>",-1);if(fields.length<5)continue;Fact f=parse(canonical,no,fields[0],fields[2]);if(f!=null)put(facts,f);}return facts;}
    static void put(Map<String,Fact> facts,Fact next){Fact old=facts.get(next.key());if(old==null||next.at>old.at||(next.at==old.at&&next.level>old.level))facts.put(next.key(),next);}
    private EdgeLevelPolicy(){}
}
