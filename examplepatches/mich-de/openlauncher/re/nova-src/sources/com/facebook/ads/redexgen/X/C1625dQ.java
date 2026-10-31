package com.facebook.ads.redexgen.X;

import java.io.File;
import java.util.Comparator;

/* renamed from: com.facebook.ads.redexgen.X.dQ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1625dQ implements Comparator<File> {
    public C1625dQ() {
    }

    private int A00(long j11, long j12) {
        if (j11 < j12) {
            return -1;
        }
        return j11 == j12 ? 0 : 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.Comparator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final int compare(File file, File file2) {
        return A00(file.lastModified(), file2.lastModified());
    }
}
