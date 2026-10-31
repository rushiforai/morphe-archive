/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.List;

/** Unison enrichment, then the extension's public Google Translate fallback. No invented timings. */
final class LyricsEnrichment {
    private static final String SEPARATOR="\n\n;\n\n";
    static JSONObject fetch(LyricsNetwork network,JSONObject request)throws Exception{
        JSONArray input=request.getJSONArray("lines");
        if(input.length()>200)throw new IllegalArgumentException("Too many enrichment lines");
        String language=request.optString("to","en");
        if(!language.matches("[a-zA-Z-]{2,20}"))throw new IllegalArgumentException("Invalid language");
        for(int i=0;i<input.length();i++)if(input.getString(i).length()>500)throw new IllegalArgumentException("Enrichment line too long");
        try{
            JSONObject response=new JSONObject(network.request("https://unison.betterlyrics.org/translate","POST",request.toString(),"application/json"));
            if(response.optJSONArray("lines")!=null&&response.getJSONArray("lines").length()==input.length())return response;
        }catch(Exception ignored){}
        JSONArray result=new JSONArray();for(int i=0;i<input.length();i++)result.put(new JSONObject());
        int index=0;
        while(index<input.length()){
            int first=index;StringBuilder joined=new StringBuilder();
            while(index<input.length()){
                String text=input.getString(index);String next=joined.length()==0?text:joined+SEPARATOR+text;
                if(index>first&&LyricsNetwork.encode(next).length()>12000)break;
                joined.setLength(0);joined.append(next);index++;
            }
            String url="https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl="+LyricsNetwork.encode(language)+"&dt=t&dt=rm&q="+LyricsNetwork.encode(joined.toString());
            JSONArray response=new JSONArray(network.request(url,"GET",null,null));
            JSONArray segments=response.getJSONArray(0);StringBuilder translated=new StringBuilder(),romanized=new StringBuilder();
            for(int i=0;i<segments.length();i++){
                JSONArray segment=segments.optJSONArray(i);if(segment==null)continue;
                if(!segment.isNull(0))translated.append(segment.optString(0));
                if(segment.length()>3&&!segment.isNull(3))romanized.append(segment.optString(3));
            }
            String[] translation=translated.toString().split(java.util.regex.Pattern.quote(SEPARATOR),-1);
            String[] romanization=romanized.toString().split(java.util.regex.Pattern.quote(SEPARATOR),-1);
            // Translation services may collapse the separators. Reject that batch instead of
            // attaching a neighbor's words or inventing a different line alignment.
            if(translation.length==index-first){
                for(int i=first;i<index;i++){
                    JSONObject line=result.getJSONObject(i);String original=input.getString(i);
                    if(!translation[i-first].equalsIgnoreCase(original))line.put("translation",translation[i-first]).put("needsTranslation",true);
                    if(romanization.length==index-first&&!romanization[i-first].equalsIgnoreCase(original))line.put("romanization",romanization[i-first]);
                }
            }
        }
        return new JSONObject().put("lines",result).put("provider","Google Translate");
    }
}
