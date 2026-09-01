package com.medium.android.common.api;

import defpackage.l14;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/medium/android/common/api/Medium2Error;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Medium2Error extends RuntimeException {
    public final int a;
    public final String b;
    public final l14 c;

    /* JADX WARN: Illegal instructions before constructor call */
    public Medium2Error(Throwable th, int i, String str, l14 l14Var, int i2) {
        th = (i2 & 1) != 0 ? null : th;
        str = (i2 & 4) != 0 ? null : str;
        l14Var = (i2 & 8) != 0 ? null : l14Var;
        super(th);
        this.a = i;
        this.b = str;
        this.c = l14Var;
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return "Medium2Error(status=" + this.a + ", errorMessage=" + this.b + ", errorInfo=" + this.c + ")";
    }
}
