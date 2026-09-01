package com.medium.android.donkey.write;

import defpackage.yq3;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/medium/android/donkey/write/EditPostSaveError;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "yq3", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class EditPostSaveError extends Exception {
    public final yq3 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EditPostSaveError(yq3 yq3Var, Throwable th) {
        super(th);
        yq3Var.getClass();
        this.a = yq3Var;
    }
}
