package com.google.firebase.crashlytics.internal.persistence;

import io.branch.search.internal.E9;
import java.io.File;
import java.io.FilenameFilter;
import r70.i;
import r70.j;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements FilenameFilter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34737a;

    public /* synthetic */ b(int i5) {
        this.f34737a = i5;
    }

    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String str) {
        switch (this.f34737a) {
            case 0:
                return CrashlyticsReportPersistence.isNormalPriorityEventFile(file, str);
            case 1:
                return str.endsWith(".envelope");
            case 2:
                return (j.A0(str, ".tmp", false) || i.v0(str) == null) ? false : true;
            default:
                return E9.a(file, str);
        }
    }
}
