package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class aib {
    public final ResponsesReference.ResponseViewType a;
    public final String b;

    public aib(ResponsesReference.ResponseViewType responseViewType, String str) {
        this.a = responseViewType;
        this.b = str;
    }

    public String a() {
        return this.b;
    }

    public abstract String b();

    public abstract String c();

    public ResponsesReference.ResponseViewType d() {
        return this.a;
    }
}
