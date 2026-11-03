package app.morphe.extension.chmate;

import java.net.URI;

/** The board's HTML page can render a browser challenge; its text download cannot always do so. */
final class ReadingAuthRules {
    static String page(String url){
        try{
            URI uri=URI.create(url);
            if("https".equals(uri.getScheme())&&"bbs.eddibb.cc".equals(uri.getHost())
                    &&uri.getUserInfo()==null&&uri.getPort()==-1
                    &&ViewingUserAgentRules.reading(url,"GET"))return "https://bbs.eddibb.cc/liveedge/";
        }catch(IllegalArgumentException|NullPointerException invalid){ /* Preserve unknown URLs. */ }
        return url;
    }
    static boolean isPage(String url){
        try{
            URI uri=URI.create(url);
            return "https".equals(uri.getScheme())&&"bbs.eddibb.cc".equals(uri.getHost())
                    &&uri.getUserInfo()==null&&uri.getPort()==-1&&"/liveedge/".equals(uri.getPath());
        }catch(IllegalArgumentException|NullPointerException invalid){return false;}
    }
    static boolean challengeTitle(String title){
        String value=title.toLowerCase(java.util.Locale.ROOT);
        return value.contains("just a moment")||value.contains("attention required")
                ||value.contains("確認が必要")||value.contains("しばらくお待ち")||value.contains("access denied");
    }
    private ReadingAuthRules(){}
}
