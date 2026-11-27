package dev.jason.gboardpatches.extension.sharedmodel;

import java.util.LinkedHashSet;
import org.json.*;

/** Decode the terminal task result; partial streams are never interpreted as instructions. */
final class SharedInstructionSuggestions {
    private SharedInstructionSuggestions(){}
    static String[] parse(String result){
        if(result==null || result.length()>8192)throw new IllegalArgumentException("SUGGESTIONS_SIZE");
        String value=result.trim();
        if(value.startsWith("```")){
            int line=value.indexOf('\n');
            if(line<0 || !value.endsWith("```") || !value.substring(3,line).trim().matches("(?i)json|"))throw new IllegalArgumentException("SUGGESTIONS_JSON");
            value=value.substring(line+1,value.length()-3).trim();
        }
        try{
            JSONTokener tokens=new JSONTokener(value);Object parsed=tokens.nextValue();
            if(tokens.nextClean()!=0)throw new IllegalArgumentException("SUGGESTIONS_TRAILING_DATA");
            if(parsed instanceof JSONObject)parsed=((JSONObject)parsed).get("suggestions");
            if(!(parsed instanceof JSONArray))throw new IllegalArgumentException("SUGGESTIONS_TYPE");
            JSONArray array=(JSONArray)parsed;if(array.length()>3)throw new IllegalArgumentException("SUGGESTIONS_COUNT");
            LinkedHashSet<String> instructions=new LinkedHashSet<>();
            for(int i=0;i<array.length();i++){
                Object item=array.get(i);if(!(item instanceof String))throw new IllegalArgumentException("SUGGESTIONS_ITEM_TYPE");
                String instruction=((String)item).trim();if(instruction.isEmpty() || instruction.length()>512)throw new IllegalArgumentException("SUGGESTIONS_ITEM_SIZE");
                instructions.add(instruction);
            }
            return instructions.toArray(new String[0]);
        }catch(JSONException invalid){throw new IllegalArgumentException("SUGGESTIONS_JSON");}
    }
}
