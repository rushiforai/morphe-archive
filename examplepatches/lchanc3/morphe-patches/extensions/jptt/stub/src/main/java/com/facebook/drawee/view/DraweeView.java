package com.facebook.drawee.view;

import android.content.Context;
import android.widget.ImageView;

import com.facebook.drawee.interfaces.DraweeController;
import com.facebook.drawee.interfaces.DraweeHierarchy;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public class DraweeView extends ImageView {

    public DraweeView(Context context) {
        super(context);
    }

    public DraweeController getController() {
        throw new UnsupportedOperationException("stub");
    }

    public DraweeHierarchy getHierarchy() {
        throw new UnsupportedOperationException("stub");
    }
}
