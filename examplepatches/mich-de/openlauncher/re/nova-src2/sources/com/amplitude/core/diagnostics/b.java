package com.amplitude.core.diagnostics;

import io.branch.search.internal.E9;
import java.io.File;
import java.io.FileFilter;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements FileFilter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20515a;

    public /* synthetic */ b(int i5) {
        this.f20515a = i5;
    }

    @Override // java.io.FileFilter
    public final boolean accept(File file) {
        switch (this.f20515a) {
            case 0:
                return DiagnosticsStorage.loadEventsFromDirectory$lambda$13(file);
            default:
                return E9.a(file);
        }
    }
}
