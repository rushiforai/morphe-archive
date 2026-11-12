package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Parsing shared by history persistence and the NGThread shortcut. */
public final class EdgeReporterId {
    // The reporter token is delimited by the display wrapper, not by a fixed
    // alphabet or length. Keep accepting future punctuation/ID formats while
    // excluding whitespace and the wrapper brackets from the token itself.
    private static final Pattern SUFFIX = Pattern.compile("\\s+\\[([^\\[\\]\\s]+)★\\]$");
    private static final Pattern DIAGNOSTIC=Pattern.compile("^\\{server:([^,]+), name:([^,]+), created:");
    private static final java.util.Map<String,String> SCOPES=new java.util.LinkedHashMap<String,String>(){
        @Override protected boolean removeEldestEntry(java.util.Map.Entry<String,String> row){return size()>128;}
    };
    private EdgeReporterId() {}
    public static String suffix(String title) {
        if (title == null) return null;
        Matcher matcher = SUFFIX.matcher(title);
        return matcher.find() ? matcher.group().trim() : null;
    }
    /** Reporter IDs are display metadata, not part of a next-thread title match. */
    public static String titleForNextThreadMatch(String title) {
        if (title == null) return null;
        Matcher matcher = SUFFIX.matcher(title);
        return matcher.find() ? title.substring(0, matcher.start()) : title;
    }
    public static boolean isBoard(Object board) {
        return scope(board)!=null;
    }
    /** Board keys and diagnostic BBSUrlInfo strings must resolve to an exact host. */
    public static String scope(Object board){
        if(board==null)return null;String value=board.toString();
        String lower=value.toLowerCase(java.util.Locale.ROOT);if(!lower.contains("kenmo.org")&&!lower.contains("bbs.eddibb.cc"))return null;
        Matcher diagnostic=DIAGNOSTIC.matcher(value);
        if(diagnostic.find())value=diagnostic.group(1)+"/"+diagnostic.group(2);
        value=value.replace("%2F","/").replace("%2f","/");
        synchronized(SCOPES){String known=SCOPES.get(value);if(known!=null)return known;}
        try{
            java.net.URI uri=new java.net.URI(value.contains("://")?value:"https://"+value);
            if(!("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme()))||uri.getUserInfo()!=null||uri.getQuery()!=null||uri.getFragment()!=null)return null;
            int expected="https".equalsIgnoreCase(uri.getScheme())?443:80;if(uri.getPort()!=-1&&uri.getPort()!=expected)return null;
            String host=uri.getHost(),path=uri.getPath();if(host==null||path==null||!path.matches("/[A-Za-z0-9_-]{1,80}/?"))return null;
            String name=path.substring(1).replaceFirst("/$","");
            String scope=host.equalsIgnoreCase("bbs.eddibb.cc")&&name.equals("liveedge")?"edge:liveedge":host.equalsIgnoreCase("kenmo.org")?"kenmo:"+name:null;
            if(scope!=null)synchronized(SCOPES){SCOPES.put(value,scope);}return scope;
        }catch(java.net.URISyntaxException ignored){}return null;
    }
    public static String restore(String title, String suffix) {
        if (title == null || title.isEmpty() || suffix(title) != null || suffix == null) return title;
        return suffix("x " + suffix) == null ? title : title + " " + suffix;
    }
}
