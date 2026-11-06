package androidx.preference;

import android.content.Context;
import android.graphics.drawable.Drawable;

/** Stub preference fixture matching the 5.1.0 APK members used by SettingsBackup. */
public class Preference {
    public int W; // layout resource
    public int X;
    public boolean R; // icon space reserved
    public boolean S; // single line
    public boolean T;
    public int q; // icon res id
    public Drawable r; // icon drawable
    public String t; // key
    public CharSequence n; // title
    public CharSequence p; // summary
    public int k; // order
    public Object a0; // parent group
    public Object b; // preference manager
    public Object f; // click listener
    public Object Y; // adapter

    public Preference(Context context) {}

    // Obfuscated hierarchy attachment hook matching 5.1.0 Preference.k(h46)
    public void k(Object manager) {
        this.b = manager;
    }
}
