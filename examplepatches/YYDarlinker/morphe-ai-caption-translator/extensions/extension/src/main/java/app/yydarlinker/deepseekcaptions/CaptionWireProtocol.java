package app.yydarlinker.deepseekcaptions;
import org.json.*;
/** Named wire fields. Numeric cache endpoints are intentionally NOT a model protocol. */
final class CaptionWireProtocol {
    static final String VERSION="semantic-objects-134";
    static JSONObject schema() throws JSONException {
        JSONObject string=new JSONObject().put("type","string");
        JSONObject segment=new JSONObject().put("type","object").put("additionalProperties",false)
                .put("properties",new JSONObject().put("source",string).put("translation",string))
                .put("required",new JSONArray().put("source").put("translation"));
        JSONObject item=new JSONObject().put("type","object").put("additionalProperties",false)
                .put("properties",new JSONObject().put("id",string).put("segments",new JSONObject().put("type","array").put("items",segment)))
                .put("required",new JSONArray().put("id").put("segments"));
        JSONObject root=new JSONObject().put("type","object").put("additionalProperties",false)
                .put("properties",new JSONObject().put("translations",new JSONObject().put("type","array").put("items",item)))
                .put("required",new JSONArray().put("translations"));
        return new JSONObject().put("type","json_schema").put("json_schema",new JSONObject().put("name","caption_plan").put("strict",true).put("schema",root));
    }
}
