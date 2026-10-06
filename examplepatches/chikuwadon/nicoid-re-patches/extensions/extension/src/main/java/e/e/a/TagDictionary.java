package e.e.a;
import android.widget.Button;
import org.json.JSONObject;
/** Article-existence metadata currently reports false even for existing articles. */
public final class TagDictionary {
 public static void apply(Button button,JSONObject tag){
  button.setCompoundDrawables(null,null,null,null);
  button.setCompoundDrawablePadding(0);
 }
}
