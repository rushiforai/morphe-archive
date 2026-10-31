package com.google.firebase.crashlytics.internal.common;

import java.io.File;
import java.io.FilenameFilter;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements FilenameFilter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34699a;

    public /* synthetic */ a(int i5) {
        this.f34699a = i5;
    }

    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String str) {
        switch (this.f34699a) {
            case 0:
                return CrashlyticsAppQualitySessionsStore.lambda$static$0(file, str);
            default:
                return CrashlyticsController.lambda$static$0(file, str);
        }
    }
}
