package com.facebook.drawee.interfaces;

import android.graphics.drawable.Drawable;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public interface SettableDraweeHierarchy extends DraweeHierarchy {
    void setImage(Drawable drawable, float progress, boolean immediate);
}
