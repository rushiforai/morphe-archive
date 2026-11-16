package e.e.a;
import android.os.Bundle;
import org.json.JSONObject;

/** #135: recover existing like state from the nested official watch data. */
public final class LikeState219 {
 private LikeState219(){}
 public static void capture(JSONObject response,Bundle target){
  if(response==null||target==null||target.getBoolean("nicoid_like_known",false))return;
  JSONObject video=response.optJSONObject("video");
  JSONObject viewer=video==null?null:video.optJSONObject("viewer");
  JSONObject like=viewer==null?null:viewer.optJSONObject("like");
  if(like==null){
   viewer=response.optJSONObject("viewer");
   like=viewer==null?null:viewer.optJSONObject("like");
  }
  if(like!=null&&like.has("isLiked")){
   target.putBoolean("nicoid_liked",like.optBoolean("isLiked",false));
   target.putBoolean("nicoid_like_known",true);
  }
 }
}
