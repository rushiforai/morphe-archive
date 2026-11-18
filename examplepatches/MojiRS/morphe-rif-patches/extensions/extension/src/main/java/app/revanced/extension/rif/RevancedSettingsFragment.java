package app.revanced.extension.rif;

import android.content.Context;

import com.andrewshu.android.reddit.settings.RifBaseSettingsFragment;

/**
 * The "ReVanced" settings screen. It extends rif's own base settings fragment
 * (whose class name R8 keeps), so it gets rif's native preference styling and
 * XML-loading for free. We only override the obfuscated abstract method that returns
 * the preference-XML resource id; we look ours up by name at runtime so the extension
 * never has to reference a patch-generated R constant or any renamed androidx class.
 *
 * That method is obfuscated differently in each rif build, so both are implemented
 * (the other is just an unused extra method in the build that doesn't declare it):
 *   - E4()  free rif is fun
 *   - t4()  rif is fun golden platinum
 *
 * The actual preferences are added to res/xml/revanced_preferences.xml by each
 * patch's resource patch, so this screen is a shared, extensible framework.
 */
public class RevancedSettingsFragment extends RifBaseSettingsFragment {

    @Override
    protected int E4() {
        return preferencesXmlId();
    }

    @Override
    protected int t4() {
        return preferencesXmlId();
    }

    private static int preferencesXmlId() {
        try {
            Context ctx = Settings.context();
            if (ctx == null) return 0;
            return ctx.getResources()
                    .getIdentifier("revanced_preferences", "xml", ctx.getPackageName());
        } catch (Throwable t) {
            return 0;
        }
    }
}
