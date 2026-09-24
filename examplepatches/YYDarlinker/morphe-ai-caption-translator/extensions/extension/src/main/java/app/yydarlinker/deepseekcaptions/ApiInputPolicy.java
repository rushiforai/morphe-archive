package app.yydarlinker.deepseekcaptions;
import android.preference.Preference;
import android.widget.AdapterView;
/** Scoped exception to host breadcrumb copying; never reads or replaces clipboard contents. */
public final class ApiInputPolicy {
    public static boolean owns(String key) {
        return "deepseek_caption_prompt".equals(key) || "deepseek_caption_profiles".equals(key) || "deepseek_caption_base_url".equals(key) || "deepseek_caption_api_key".equals(key)
            || "deepseek_caption_model".equals(key) || "deepseek_caption_test_api".equals(key);
    }
    public static boolean consumePathCopy(AdapterView<?> list,android.view.View view,int position,long id) {
        Object item=list==null ? null : list.getItemAtPosition(position);
        return item instanceof Preference && owns(((Preference)item).getKey());
    }
}
