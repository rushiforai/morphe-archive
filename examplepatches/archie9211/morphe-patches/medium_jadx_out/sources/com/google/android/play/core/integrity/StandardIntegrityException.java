package com.google.android.play.core.integrity;

import com.google.android.gms.common.api.ApiException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class StandardIntegrityException extends ApiException {
    public final Throwable b;

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Removed duplicated region for block: B:8:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public StandardIntegrityException(int r6, java.lang.Throwable r7) {
        /*
            r5 = this;
            com.google.android.gms.common.api.Status r0 = new com.google.android.gms.common.api.Status
            java.util.Locale r1 = java.util.Locale.ROOT
            java.util.HashMap r1 = defpackage.hhf.a
            java.lang.Integer r2 = java.lang.Integer.valueOf(r6)
            boolean r3 = r1.containsKey(r2)
            if (r3 == 0) goto L3f
            java.util.HashMap r3 = defpackage.hhf.b
            boolean r4 = r3.containsKey(r2)
            if (r4 != 0) goto L19
            goto L3f
        L19:
            java.lang.Object r1 = r1.get(r2)
            java.lang.String r1 = (java.lang.String) r1
            java.lang.Object r2 = r3.get(r2)
            java.lang.String r2 = (java.lang.String) r2
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            r3.append(r1)
            java.lang.String r1 = " (https://developer.android.com/google/play/integrity/reference/com/google/android/play/core/integrity/model/StandardIntegrityErrorCode.html#"
            r3.append(r1)
            r3.append(r2)
            java.lang.String r1 = ")"
            r3.append(r1)
            java.lang.String r1 = r3.toString()
            goto L41
        L3f:
            java.lang.String r1 = ""
        L41:
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            java.lang.String r3 = "Standard Integrity API error ("
            r2.<init>(r3)
            r2.append(r6)
            java.lang.String r3 = "): "
            r2.append(r3)
            r2.append(r1)
            java.lang.String r1 = "."
            r2.append(r1)
            java.lang.String r1 = r2.toString()
            r2 = 0
            r0.<init>(r6, r1, r2, r2)
            r5.<init>(r0)
            if (r6 == 0) goto L68
            r5.b = r7
            return
        L68:
            java.lang.String r5 = "ErrorCode should not be 0."
            defpackage.ay0.e(r5)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.play.core.integrity.StandardIntegrityException.<init>(int, java.lang.Throwable):void");
    }

    @Override // java.lang.Throwable
    public final synchronized Throwable getCause() {
        return this.b;
    }
}
