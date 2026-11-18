package androidx.preference;

import android.content.Context;
import android.util.AttributeSet;

/**
 * COMPILE-ONLY stub of androidx's SeekBarPreference as shipped in rif (class name kept, as
 * preference XML inflates it by name), so the extension can subclass it. Packaged into
 * ../../libs/rif-stubs.jar with RifBaseSettingsFragment (rebuild command there); rif
 * provides the real class at runtime. Only the XML-inflation constructor is declared:
 * every other member is R8-renamed, differently per rif build.
 */
public class SeekBarPreference {
    public SeekBarPreference(Context context, AttributeSet attrs) {
    }
}
