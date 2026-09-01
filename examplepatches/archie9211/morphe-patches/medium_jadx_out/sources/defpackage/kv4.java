package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kv4 extends w4a implements ti6 {
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kv4(int i, int i2, Class cls, Object obj, String str, String str2) {
        super(obj, cls, str, str2, i);
        this.b = i2;
    }

    @Override // defpackage.fj6
    public final vi6 b() {
        return ((ti6) getReflected()).b();
    }

    @Override // defpackage.h41
    public final rg6 computeReflected() {
        return n1b.a.f(this);
    }

    @Override // defpackage.ti6
    public final Object get() {
        switch (this.b) {
        }
        return Integer.valueOf(((List) this.receiver).size());
    }

    @Override // defpackage.m45
    public final Object invoke() {
        return get();
    }
}
