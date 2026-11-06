package android.appwidget;
import android.content.ComponentName;
import android.os.UserHandle;
public class AppWidgetProviderInfo {
    public ComponentName provider, configure;
    public UserHandle profile;
    public UserHandle getProfile() { return profile; }
}
