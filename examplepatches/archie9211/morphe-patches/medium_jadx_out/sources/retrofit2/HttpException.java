package retrofit2;

import defpackage.adb;
import defpackage.zcb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HttpException extends RuntimeException {
    public final int a;

    public HttpException(zcb zcbVar) {
        StringBuilder sb = new StringBuilder("HTTP ");
        adb adbVar = zcbVar.a;
        int i = adbVar.d;
        sb.append(i);
        sb.append(" ");
        sb.append(adbVar.c);
        super(sb.toString());
        this.a = i;
    }
}
