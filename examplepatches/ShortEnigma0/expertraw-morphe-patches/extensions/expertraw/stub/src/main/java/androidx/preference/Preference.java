/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Expert RAW extension for Morphe. See LICENSE and NOTICE in the repository root.
 */
package androidx.preference;
import android.content.Context;
/** Stub of the app's bundled (Samsung SESL) androidx.preference (compile only). */
public class Preference {
    public interface OnPreferenceClickListener { boolean onPreferenceClick(Preference p); }
    public interface OnPreferenceChangeListener { boolean onPreferenceChange(Preference p, Object v); }
    public Context getContext() { throw new RuntimeException("stub"); }
    public void onAttached() { throw new RuntimeException("stub"); }
    public boolean callChangeListener(Object v) { throw new RuntimeException("stub"); }
    public void setOnPreferenceClickListener(OnPreferenceClickListener l) { throw new RuntimeException("stub"); }
    public void setOnPreferenceChangeListener(OnPreferenceChangeListener l) { throw new RuntimeException("stub"); }
}
