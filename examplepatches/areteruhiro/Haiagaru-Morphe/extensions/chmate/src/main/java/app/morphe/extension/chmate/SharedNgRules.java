package app.morphe.extension.chmate;

import java.net.URI;
import java.text.Normalizer;
import java.util.*;
import java.util.regex.*;

/** Data-only shared conditions. Downloaded expressions are never executed. */
final class SharedNgRules {
    static int reportThreshold(String value){
        try{int number=Integer.parseInt(value.trim());if(number>=1)return number;}catch(RuntimeException invalid){}
        throw new IllegalArgumentException("1〜2147483647の整数を入力してください");
    }
    static final Pattern DATE=Pattern.compile("(20\\d{2})/(\\d{2})/(\\d{2})");
    static final Pattern WACCHOI=Pattern.compile("[A-Za-z0-9+/]{4}-[A-Za-z0-9+/]{4}");
    private static final Pattern WHITESPACE=Pattern.compile("\\s+");
    /** Submission policy only: local ChMate NG registrations remain unchanged. */
    static boolean shareableKeyword(String value){
        String normalized=text(value).replace(" ", "");
        if(normalized.codePointCount(0,normalized.length())<5)return false;
        boolean onlyLatin=true;
        for(int i=0;i<normalized.length();){int cp=normalized.codePointAt(i);i+=Character.charCount(cp);
            if(!Character.isLetter(cp)||Character.UnicodeScript.of(cp)!=Character.UnicodeScript.LATIN){onlyLatin=false;break;}}
        return !onlyLatin;
    }
    static String text(String value){return WHITESPACE.matcher(Normalizer.normalize(value==null?"":value,Normalizer.Form.NFKC)).replaceAll(" ").trim();}
    static String board(String value){
        try{URI u=URI.create(value);String host=u.getHost(),path=u.getPath();
            if(host==null||u.getUserInfo()!=null||!("http".equals(u.getScheme())||"https".equals(u.getScheme())))return "";
            host=host.toLowerCase(Locale.ROOT);
            if(host.endsWith(".5ch.io")||host.endsWith(".5ch.net")||host.endsWith(".2ch.net"))host="5ch";
            if(path==null||!path.matches("/[A-Za-z0-9_.-]+(?:/[A-Za-z0-9_.-]+)*/?"))return "";
            return family(host+(u.getPort()>0&&u.getPort()!=80&&u.getPort()!=443?":"+u.getPort():"")+"/all");
        }catch(Exception invalid){return "";}
    }
    static String family(String scope){
        if(scope==null||scope.equals("unknown.invalid/unresolved")||scope.equals("*"))return scope;
        String host=scope.split("/",2)[0].toLowerCase(Locale.ROOT);
        if(host.equals("5ch")||host.equals("5ch.io")||host.endsWith(".5ch.io")||host.equals("5ch.net")||host.endsWith(".5ch.net")||host.endsWith(".2ch.net"))return "5ch/all";
        if(host.equals("pink")||host.equals("bbspink.com")||host.endsWith(".bbspink.com"))return "pink/all";
        if(host.equals("edge")||host.equals("bbs.eddibb.cc")||host.equals("bbs.eddibb.net"))return "edge/all";
        if(host.equals("jbbs.livedoor.jp"))host="jbbs.shitaraba.net";
        if(host.equals("open2ch.net")||host.endsWith(".open2ch.net"))host="open2ch.net";
        if(host.equals("2ch.sc")||host.endsWith(".2ch.sc"))host="2ch.sc";
        if(host.equals("talk.jp")||host.endsWith(".talk.jp"))host="talk.jp";
        return host+"/all";
    }
    static String boardLabel(String scope){
        String group=family(scope);if(group==null||group.equals("unknown.invalid/unresolved"))return "掲示板を特定できません";
        switch(group){case "5ch/all":return "5ch";case "edge/all":return "エッヂ";case "pink/all":return "PINK";
            case "jbbs.shitaraba.net/all":return "したらば掲示板";case "open2ch.net/all":return "おーぷん2ch";case "2ch.sc/all":return "2ch.sc";case "talk.jp/all":return "Talk";case "bbs.punipuni.eu/all":return "ぷにぷに";case "*":return "すべての掲示板";
            default:return group.substring(0,group.length()-4);}
    }
    /** Native external NG scopes encode the host/path as one key, even without a board catalog row. */
    static String nativeBoard(String scope){
        if(scope==null||scope.trim().isEmpty())return "*";
        String direct=board(scope);if(!direct.isEmpty())return direct;
        try{
            String decoded=java.net.URLDecoder.decode(scope,"UTF-8");
            direct=board(decoded);if(!direct.isEmpty())return direct;
            // Require an explicit host, never interpret a bare board name as an external service.
            if(decoded.matches("[A-Za-z0-9.-]+\\.[A-Za-z]{2,}(?::[0-9]+)?/[A-Za-z0-9_.-]+(?:/[A-Za-z0-9_.-]+)*/?"))return board("https://"+decoded);
        }catch(Exception invalid){}
        return "";
    }
    /** Resolve native board keys only against registered boards; ambiguous aliases stay unresolved. */
    static String boardScope(String scope,List<String[]> registered){
        if(scope==null||scope.trim().isEmpty())return "*";
        String direct=nativeBoard(scope);if(!direct.isEmpty())return direct;
        Set<String> found=new HashSet<>();
        for(String[] row:registered)try{
            String name=java.net.URLDecoder.decode(row[0],"UTF-8"),server=row[1],path=name;
            if(name.startsWith(server+"/"))path=name.substring(server.length()+1);
            else if(name.contains("/")&&name.substring(0,name.indexOf('/')).contains("."))path=name.substring(name.indexOf('/')+1);
            String canonical=board("https://"+server+"/"+path+"/");
            if(!canonical.isEmpty()&&(scope.equals(row[0])||scope.equals(name)||scope.equals(path)||scope.equals(canonical)))found.add(canonical);
        }catch(Exception ignored){}
        return found.size()==1?found.iterator().next():"unknown.invalid/unresolved";
    }
    static String day(String date){Matcher m=DATE.matcher(date==null?"":date);if(!m.find())return "";
        try{return format(date(m.group(1)+"-"+m.group(2)+"-"+m.group(3)));}catch(Exception invalid){return "";}}
    static Calendar date(String value){
        if(value==null||!value.matches("20\\d{2}-\\d{2}-\\d{2}"))throw new IllegalArgumentException("日付が不正です");
        Calendar result=new GregorianCalendar(TimeZone.getTimeZone("UTC"),Locale.ROOT);result.clear();result.setLenient(false);
        result.set(Integer.parseInt(value.substring(0,4)),Integer.parseInt(value.substring(5,7))-1,Integer.parseInt(value.substring(8,10)));result.getTime();return result;
    }
    static String format(Calendar value){return String.format(Locale.ROOT,"%04d-%02d-%02d",value.get(Calendar.YEAR),value.get(Calendar.MONTH)+1,value.get(Calendar.DAY_OF_MONTH));}
    // 5ch changes its weekly Wacchoi on Thursday. Unknown external lifetimes stay in moderation.
    static String week(String text){String d=day(text);if(d.isEmpty())return "";Calendar value=date(d);value.add(Calendar.DAY_OF_MONTH,-((value.get(Calendar.DAY_OF_WEEK)-Calendar.THURSDAY+7)%7));return format(value);}
    static String wacchoi(String name){Matcher m=WACCHOI.matcher(name==null?"":name);return m.find()?m.group():"";}
    static final class Rule {
        final String id,board,kind,value,period;final int votes,minLevel,minVotes;final boolean revoked,regex;
        private final Pattern expression;
        Rule(String id,String board,String kind,String value,String period,int votes,boolean revoked){
            this(id,board,kind,value,period,votes,revoked,1,0);
        }
        Rule(String id,String board,String kind,String value,String period,int votes,boolean revoked,int minLevel,int minVotes){
            this(id,board,kind,value,period,votes,revoked,minLevel,minVotes,false);
        }
        Rule(String id,String board,String kind,String value,String period,int votes,boolean revoked,int minLevel,int minVotes,boolean regex){
            if(id==null||!id.matches("[a-f0-9]{64}")||board==null||!(board.equals("*")||board.matches("[a-z0-9.-]+(?::[0-9]+)?(?:/[A-Za-z0-9_.-]+)+"))||board.equals("unknown.invalid/unresolved")||board.length()>300||votes<0)throw new IllegalArgumentException("共有NG形式が不正です");
            if(!Arrays.asList("id","wacchoi","prefix","suffix","keyword","name","trip","reporter").contains(kind)||value==null||value.isEmpty()||value.length()>2000||period==null)throw new IllegalArgumentException("共有NG条件が不正です");
            if(kind.equals("keyword")&&(text(value).isEmpty()||!period.isEmpty()))throw new IllegalArgumentException("キーワードまたは有効期間が不正です");
            if(!regex&&kind.equals("id")&&!value.matches("[A-Za-z0-9+/!_.-]{1,100}"))throw new IllegalArgumentException("IDが不正です");
            if(kind.equals("reporter")&&(!"edge/all".equals(family(board))||!value.matches("[A-Za-z0-9+/!_.-]{1,100}")))throw new IllegalArgumentException("記者IDが不正です");
            if(!regex&&kind.equals("wacchoi")&&!WACCHOI.matcher(value).matches())throw new IllegalArgumentException("ワッチョイは全体を指定してください");
            if(!regex&&Arrays.asList("prefix","suffix").contains(kind)&&!value.matches("[A-Za-z0-9+/]{4}"))throw new IllegalArgumentException("4桁が不正です");
            if(minLevel<1||minLevel>5||minVotes<0)throw new IllegalArgumentException("禁止レベルが不正です");
            if(regex&&kind.equals("reporter"))throw new IllegalArgumentException("記者IDは完全一致で指定してください");
            this.regex=regex;this.expression=regex?Pattern.compile(value):null;
            this.minLevel=minLevel;this.minVotes=minVotes;this.id=id;this.board=family(board);this.kind=kind;this.value=!regex&&kind.equals("keyword")?text(value):value;this.period="";this.votes=votes;this.revoked=revoked;
        }
        boolean expressionMatches(String input){
            if(expression==null||input==null)return false;
            try{return expression.matcher(new TimedText(input,0,input.length(),System.nanoTime()+2_000_000L)).find();}
            catch(RegexDeadline|StackOverflowError invalid){return false;}
        }
        boolean matches(String boardUrl,String responseId,String name,String date,String body,int threshold){
            if(regex){
                String current=SharedNgRules.board(boardUrl);
                if(revoked||votes<Math.max(threshold,minVotes)||!(board.equals(current)||board.equals("*")&&!kind.equals("reporter")))return false;
                String input=kind.equals("id")?responseId:kind.equals("keyword")?body:kind.equals("name")||kind.equals("trip")?name:wacchoi(name);
                if((kind.equals("prefix")||kind.equals("suffix"))&&input.length()==9)input=kind.equals("prefix")?input.substring(0,4):input.substring(5);
                return expressionMatches(input);
            }
            return matchesPrepared(SharedNgRules.board(boardUrl),responseId,wacchoi(name),day(date),week(date),text(body),threshold);
        }
        boolean matchesPrepared(String currentBoard,String responseId,String currentWacchoi,String day,String week,String body,int threshold){
            if(revoked||votes<Math.max(threshold,minVotes)||!(board.equals(currentBoard)||board.equals("*")&&!kind.equals("reporter")))return false;
            if(regex)return expressionMatches(kind.equals("id")?responseId:kind.equals("keyword")?body:currentWacchoi);
            switch(kind){case "id":return value.equals(responseId);
                case "wacchoi":return value.equals(currentWacchoi);
                case "prefix":return currentWacchoi.startsWith(value+"-");
                case "suffix":return currentWacchoi.endsWith("-"+value);
                case "name":case "trip":case "reporter":return false;
                default:return body.contains(value);}
        }
    }
    private static final class RegexDeadline extends RuntimeException {
        @Override public synchronized Throwable fillInStackTrace(){return this;}
    }
    /** Shared regexes cannot monopolize a render/evaluation worker through backtracking. */
    private static final class TimedText implements CharSequence {
        final String text;final int start,end;final long deadline;
        TimedText(String text,int start,int end,long deadline){this.text=text;this.start=start;this.end=end;this.deadline=deadline;}
        public int length(){return end-start;}
        public char charAt(int index){if(System.nanoTime()>deadline)throw new RegexDeadline();return text.charAt(start+index);}
        public CharSequence subSequence(int from,int to){return new TimedText(text,start+from,start+to,deadline);}
        @Override public String toString(){return text.substring(start,end);}
    }
}
