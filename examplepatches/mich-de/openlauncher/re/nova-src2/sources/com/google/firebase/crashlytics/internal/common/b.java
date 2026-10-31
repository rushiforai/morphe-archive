package com.google.firebase.crashlytics.internal.common;

import java.io.File;
import java.util.Comparator;

/* loaded from: classes.dex */
public final /* synthetic */ class b implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return CrashlyticsAppQualitySessionsStore.lambda$static$1((File) obj, (File) obj2);
    }
}
