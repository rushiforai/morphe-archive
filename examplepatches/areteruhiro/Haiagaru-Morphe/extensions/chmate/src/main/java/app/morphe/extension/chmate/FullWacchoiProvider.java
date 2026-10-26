package app.morphe.extension.chmate;

import java.util.regex.Pattern;

/** Provider policy for full tokens, including the native name prefix. No ID-menu settings. */
final class FullWacchoiProvider {
    private static final Pattern FULL=Pattern.compile("(?<![A-Za-z0-9+/])[A-Za-z0-9+/]{4}-[A-Za-z0-9+/]{4}(?![A-Za-z0-9+/])");
    static boolean full(String query){return query!=null&&FULL.matcher(WacchoiSearch.normalizeSlipText(query)).find();}
    static boolean edge(String host){return "bbs.eddibb.cc".equalsIgnoreCase(host)||"v1ch.cc".equalsIgnoreCase(host);}
    static boolean kyodemo(int mode,boolean edge,boolean previous){
        if(edge)return true;
        return mode==2||(mode==3&&previous);
    }
    static String choiceKey(String host,String board){
        return "wacchoi/"+(host==null?"":host.toLowerCase(java.util.Locale.ROOT))+"/"+(board==null?"":board);
    }
    private FullWacchoiProvider(){}
}
