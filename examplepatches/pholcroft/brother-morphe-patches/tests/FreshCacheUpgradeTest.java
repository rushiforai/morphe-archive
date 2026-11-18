import android.content.Context;
import android.content.SharedPreferences;
import app.template.extension.extension.AutoCache;

public class FreshCacheUpgradeTest {
    public static void main(String[] args) {
        Context context=new Context();
        SharedPreferences old=context.getSharedPreferences("morphe_printer_cache_v1",Context.MODE_PRIVATE);
        old.edit().putBoolean("enabled",false).putString("entry|192.0.2.1|1.2.3","integer:7").apply();
        AutoCache.init(context);
        if(AutoCache.enabled())throw new AssertionError("the prior cache preference must be preserved");
        if(!AutoCache.printers().isEmpty())throw new AssertionError("legacy cached responses must not be imported");
        AutoCache.setEnabled(true);AutoCache.init(context);
        if(!AutoCache.enabled())throw new AssertionError("subsequent starts must retain the new setting");
        if(old.getString("entry|192.0.2.1|1.2.3",null)!=null)
            throw new AssertionError("obsolete legacy printer data must be removed");
    }
}
