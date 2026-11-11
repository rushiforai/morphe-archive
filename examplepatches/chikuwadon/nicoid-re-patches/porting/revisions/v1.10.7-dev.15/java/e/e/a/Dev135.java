package e.e.a;

import android.app.AlertDialog;
import android.app.Dialog;
import android.preference.DialogPreference;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/** Style all standard preference dialogs, preserving their persistence handlers. */
public final class Dev135 {
    private static final Set<Preference> STYLED =
        Collections.newSetFromMap(new WeakHashMap<Preference,Boolean>());
    private Dev135() {}
    public static void roundSettings(PreferenceGroup group) {
        if(group==null)return;
        for(int i=0;i<group.getPreferenceCount();i++) {
            Preference preference=group.getPreference(i);
            if(preference instanceof DialogPreference && !STYLED.contains(preference)) {
                DialogPreference nativeDialog=(DialogPreference)preference;
                Preference.OnPreferenceClickListener old=preference.getOnPreferenceClickListener();
                STYLED.add(preference);
                preference.setOnPreferenceClickListener(p -> {
                    boolean handled=old!=null && old.onPreferenceClick(p);
                    Dialog window=nativeDialog.getDialog();
                    if(window instanceof AlertDialog && window.isShowing()) {
                        try {
                            Dev112.staticCall("e.e.a.UiDialogs", "style",
                                new Class<?>[]{AlertDialog.class}, (AlertDialog)window);
                        }
                        catch(Exception error) {
                            android.util.Log.w("nicoid-dialog","Could not round preference dialog",error);
                        }
                    }
                    return handled;
                });
            }
            if(preference instanceof PreferenceGroup)
                roundSettings((PreferenceGroup)preference);
        }
    }
}
