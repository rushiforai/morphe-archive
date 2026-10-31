package com.google.android.gms.appset;

import android.content.Context;
import hh.d;

/* loaded from: classes.dex */
public final class AppSet {
    public static AppSetIdClient getClient(Context context) {
        return new d(context, 1);
    }
}
