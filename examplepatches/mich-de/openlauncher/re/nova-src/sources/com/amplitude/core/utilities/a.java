package com.amplitude.core.utilities;

import io.sentry.n;
import java.io.File;
import java.io.FilenameFilter;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements FilenameFilter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20517a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f20518b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f20517a = i5;
        this.f20518b = obj;
    }

    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String str) {
        switch (this.f20517a) {
            case 0:
                return EventsFileManager.read$lambda$3((EventsFileManager) this.f20518b, file, str);
            case 1:
                return EventsFileManager.currentFile$lambda$11$lambda$10((EventsFileManager) this.f20518b, file, str);
            case 2:
                return EventsFileManager.handleV1Files$lambda$16$lambda$13((EventsFileManager) this.f20518b, file, str);
            default:
                return ((n) this.f20518b).a(str);
        }
    }
}
