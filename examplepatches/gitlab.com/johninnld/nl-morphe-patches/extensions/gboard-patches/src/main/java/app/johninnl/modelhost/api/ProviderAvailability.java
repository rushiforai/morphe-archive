package app.johninnl.modelhost.api;
import android.content.ComponentName;
public final class ProviderAvailability {
    public final boolean installed, exported;
    public final ComponentName component;
    public final String code;
    ProviderAvailability(boolean installed,boolean exported,ComponentName component,String code){this.installed=installed;this.exported=exported;this.component=component;this.code=code;}
}
