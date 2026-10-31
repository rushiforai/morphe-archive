/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import java.text.Normalizer;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

/** Conservative metadata cleanup; cover/live/remix/version labels are significant. */
final class LyricsLookup {
    static String title(String value){return clean(value).replaceAll("(?i)\\s*[\\[(](?:official\\s+(?:(?:music|lyric|lyrics)\\s+)?(?:video|audio)|(?:lyric|lyrics)\\s+video)(?:\\s+(?:hd|4k))*[\\])]\\s*"," ").replaceAll("\\s+"," ").trim();}
    static String artist(String value){return clean(value).replaceAll("(?i)\\s+-\\s+Topic$","").replace(", & ",", ").trim();}
    private static String clean(String s){return s==null?"":Normalizer.normalize(s,Normalizer.Form.NFKC).trim();}
    private static String key(String s){return clean(s).toLowerCase(Locale.ROOT).replaceAll("[\\s\\p{P}]+"," ").trim();}
    static JSONObject best(JSONArray candidates,String song,String performer,int duration){
        JSONObject best=null;double score=-Double.MAX_VALUE;
        for(int i=0;i<Math.min(50,candidates.length());i++){
            JSONObject candidate=candidates.optJSONObject(i);if(candidate==null)continue;
            if(!key(title(candidate.optString("trackName"))).equals(key(title(song)))||!key(artist(candidate.optString("artistName"))).equals(key(artist(performer))))continue;
            double found=candidate.optDouble("duration",0),delta=Math.abs(found-duration);
            if(duration>0&&(found<=0||delta>2))continue;
            boolean synced=!candidate.optString("syncedLyrics").trim().isEmpty(),plain=!candidate.optString("plainLyrics").trim().isEmpty();
            if(!synced&&!plain)continue;
            double quality=(synced?1000:0)-(duration>0?delta:0);
            if(quality>score){score=quality;best=candidate;}
        }
        return best;
    }
}
