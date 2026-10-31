package com.android.systemui.plugins;

import android.os.Parcelable;
import com.android.systemui.plugins.annotations.ProvidesInterface;
import java.util.ArrayList;

@ProvidesInterface(action = OneSearch.ACTION, version = 5)
/* loaded from: classes2.dex */
public interface OneSearch extends Plugin {
    public static final String ACTION = "com.android.systemui.action.PLUGIN_ONE_SEARCH";
    public static final int VERSION = 5;

    Parcelable getImageBitmap(String str);

    ArrayList<Parcelable> getSuggests(Parcelable parcelable);

    void notifyEvent(Parcelable parcelable);

    void warmUp();
}
