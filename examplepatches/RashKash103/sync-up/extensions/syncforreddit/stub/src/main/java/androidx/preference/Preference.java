package androidx.preference;

/**
 * A row of a settings screen, as the preference library the app carries names its members.
 *
 * <p>Compile only. The library is obfuscated in the app, so the names here are the ones it
 * actually has rather than the ones it was written with; what each one is was established from
 * how the app itself uses it.
 */
public class Preference {
    /** setSummary: the line under the title. */
    /** getContext: the context the row is drawn in, which is themed as the screen is. */
    public android.content.Context k() {
        throw new UnsupportedOperationException("Stub");
    }

    public void D0(CharSequence summary) {
        throw new UnsupportedOperationException("Stub");
    }

    /**
     * setEnabled: whether the row can be used. A row that cannot is drawn faded and does not
     * answer a tap, which is how a setting that does not apply is shown.
     */
    public void q0(boolean enabled) {
        throw new UnsupportedOperationException("Stub");
    }

    /** isEnabled: whether the row can be used, its dependencies included. */
    public boolean I() {
        throw new UnsupportedOperationException("Stub");
    }

    /** setOnPreferenceClickListener. */
    public void A0(d listening) {
        throw new UnsupportedOperationException("Stub");
    }

    /** OnPreferenceClickListener, as the library names it here. */
    public interface d {
        /** onPreferenceClick: answer true where the tap was dealt with. */
        boolean a(Preference row);
    }

    /** notifyChanged: draw the row again, after something it shows has changed. */
    public void M() {
        throw new UnsupportedOperationException("Stub");
    }

    /** getKey. */
    public String r() {
        throw new UnsupportedOperationException("Stub");
    }

    /** getTitle. */
    public CharSequence E() {
        throw new UnsupportedOperationException("Stub");
    }

    /** setTitle: the words at the top of the row. */
    public void G0(CharSequence title) {
        throw new UnsupportedOperationException("Stub");
    }

    /**
     * setVisible: whether the row is on the screen at all, as against drawn and unusable.
     * Final in the library, and tells the screen to lay itself out again.
     */
    public final void H0(boolean visible) {
        throw new UnsupportedOperationException("Stub");
    }

    /** isVisible. */
    public final boolean L() {
        throw new UnsupportedOperationException("Stub");
    }

    /** setIcon, by resource id. */
    public void s0(int icon) {
        throw new UnsupportedOperationException("Stub");
    }

    /** setSelectable: whether the row answers a tap at all. */
    public void C0(boolean selectable) {
        throw new UnsupportedOperationException("Stub");
    }
}
