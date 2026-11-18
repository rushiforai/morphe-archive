package app.wazeytm.extension.waze;

import com.waze.sdk.SdkConfiguration;
import java.util.Arrays;

/** Append a partner without breaking the native configuration's parallel arrays. */
public final class AudioPartnerConfig {
    private AudioPartnerConfig() { }

    public static boolean add(SdkConfiguration config, String packageName, String label, int scope) {
        if (config == null || config.PackageNames == null || config.AppNames == null
                || config.InstallationUrls == null || config.Scopes == null) return false;
        int length = config.PackageNames.length;
        if (config.AppNames.length != length || config.InstallationUrls.length != length
                || config.Scopes.length != length) return false;
        for (String existing : config.PackageNames) {
            if (packageName.equals(existing)) return false;
        }
        String[] packages = Arrays.copyOf(config.PackageNames, length + 1);
        String[] names = Arrays.copyOf(config.AppNames, length + 1);
        String[] urls = Arrays.copyOf(config.InstallationUrls, length + 1);
        int[] scopes = Arrays.copyOf(config.Scopes, length + 1);
        packages[length] = packageName;
        names[length] = label;
        urls[length] = "";
        scopes[length] = scope;
        config.PackageNames = packages;
        config.AppNames = names;
        config.InstallationUrls = urls;
        config.Scopes = scopes;
        return true;
    }
}
