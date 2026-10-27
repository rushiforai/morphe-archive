package app.morphe.extension.chmate;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

/** UA header validation and request scope; no mutation of cookies, bodies or identity tokens. */
final class ViewingUserAgentRules {
    static boolean valid(String agent) {
        if (agent == null || agent.isEmpty() || agent.length() > 1024) return false;
        for (int i = 0; i < agent.length(); i++) if (agent.charAt(i) < 32 || agent.charAt(i) > 126) return false;
        return true;
    }

    static boolean reading(String url, String method) {
        if (!("GET".equalsIgnoreCase(method) || "HEAD".equalsIgnoreCase(method)) || url == null) return false;
        try {
            URI uri = URI.create(url);
            if (!("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))
                    || uri.getHost() == null || uri.getUserInfo() != null) return false;
            String path = uri.getPath();
            return path != null && (path.matches(".*/(?:subject\\.txt|SETTING\\.TXT|bbsmenu\\.(?:html|json))")
                    || path.matches(".*/(?:dat|kako)/[^?#]*\\.dat(?:\\.gz)?")
                    || path.startsWith("/test/read.cgi/") || path.startsWith("/bbs/read.cgi/")
                    || path.startsWith("/bbs/rawmode.cgi/"));
        } catch (IllegalArgumentException invalid) { return false; }
    }
    static boolean eligible(String url,String method){
        if(url==null||method==null||!method.matches("[A-Za-z]+"))return false;
        try{
            URI uri=URI.create(url);
            return ("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme()))
                    &&uri.getHost()!=null&&uri.getUserInfo()==null;
        }catch(IllegalArgumentException invalid){return false;}
    }

    static String[] headers(String[] original, String agent) {
        if (!valid(agent) || original == null || original.length % 2 != 0) return original;
        for (int i = 0; i < original.length; i += 2) {
            if ("User-Agent".equalsIgnoreCase(original[i]) && original[i + 1] != null
                    && original[i + 1].startsWith("Monazilla/1.00 2chMate/")) {
                agent = withNativeIdentity(original[i + 1], agent);
                break;
            }
        }
        List<String> result = new ArrayList<>();
        for (int i = 0; i < original.length; i += 2) if (!"User-Agent".equalsIgnoreCase(original[i])) {
            result.add(original[i]); result.add(original[i + 1]);
        }
        result.add("User-Agent"); result.add(agent);
        return result.toArray(new String[0]);
    }
    /** Native ChMate adds its identity before http.agent. Retain that identity when replacing the suffix. */
    static String withNativeIdentity(String original, String selected) {
        if (!valid(selected)) return original;
        String prefix="Monazilla/1.00 2chMate/";
        if (original == null || !original.startsWith(prefix) || selected.startsWith(prefix)) return selected;
        int suffix=original.indexOf(" Dalvik/",prefix.length());
        if (suffix < 0) suffix=original.indexOf(" Mozilla/",prefix.length());
        // Unknown native formats are retained rather than losing the client/version identity.
        if (suffix < 0) return original;
        String result=original.substring(0,suffix+1)+selected;
        return valid(result)?result:original;
    }
    private ViewingUserAgentRules() { }
}
