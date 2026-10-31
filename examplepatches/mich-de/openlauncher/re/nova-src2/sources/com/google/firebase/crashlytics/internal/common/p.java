package com.google.firebase.crashlytics.internal.common;

import android.app.ApplicationExitInfo;
import java.util.function.Predicate;

/* loaded from: classes.dex */
public final /* synthetic */ class p implements Predicate {
    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        return SessionReportingCoordinator.lambda$persistRelevantAppExitInfoEvent$0((ApplicationExitInfo) obj);
    }
}
