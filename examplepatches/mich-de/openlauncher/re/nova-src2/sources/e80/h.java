package e80;

import cl.l0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f52260a;

    /* renamed from: b, reason: collision with root package name */
    public int f52261b;

    /* renamed from: c, reason: collision with root package name */
    public int f52262c;

    /* renamed from: d, reason: collision with root package name */
    public l0 f52263d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f52264e;

    /* renamed from: f, reason: collision with root package name */
    public h f52265f;

    /* renamed from: g, reason: collision with root package name */
    public h f52266g;

    public h() {
        this.f52260a = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        this.f52264e = true;
        this.f52263d = null;
    }

    public final int a() {
        return this.f52262c - this.f52261b;
    }

    public final h b() {
        h hVar = this.f52265f;
        h hVar2 = this.f52266g;
        if (hVar2 != null) {
            Intrinsics.d(hVar2);
            hVar2.f52265f = this.f52265f;
        }
        h hVar3 = this.f52265f;
        if (hVar3 != null) {
            Intrinsics.d(hVar3);
            hVar3.f52266g = this.f52266g;
        }
        this.f52265f = null;
        this.f52266g = null;
        return hVar;
    }

    public final void c(h segment) {
        Intrinsics.g(segment, "segment");
        segment.f52266g = this;
        segment.f52265f = this.f52265f;
        h hVar = this.f52265f;
        if (hVar != null) {
            hVar.f52266g = segment;
        }
        this.f52265f = segment;
    }

    public final h d() {
        l0 gVar = this.f52263d;
        if (gVar == null) {
            h hVar = i.f52267a;
            gVar = new g();
            this.f52263d = gVar;
        }
        int i5 = this.f52261b;
        int i11 = this.f52262c;
        gVar.m();
        Unit unit = Unit.f71706a;
        return new h(this.f52260a, i5, i11, gVar);
    }

    public final void e(h sink, int i5) {
        Intrinsics.g(sink, "sink");
        byte[] bArr = sink.f52260a;
        if (!sink.f52264e) {
            throw new IllegalStateException("only owner can write");
        }
        if (sink.f52262c + i5 > 8192) {
            l0 l0Var = sink.f52263d;
            if (l0Var != null ? l0Var.G() : false) {
                throw new IllegalArgumentException();
            }
            int i11 = sink.f52262c;
            int i12 = sink.f52261b;
            if ((i11 + i5) - i12 > 8192) {
                throw new IllegalArgumentException();
            }
            u90.b.v(bArr, i12, bArr, i11, 2);
            sink.f52262c -= sink.f52261b;
            sink.f52261b = 0;
        }
        int i13 = sink.f52262c;
        int i14 = this.f52261b;
        u90.b.q(this.f52260a, i13, bArr, i14, i14 + i5);
        sink.f52262c += i5;
        this.f52261b += i5;
    }

    public h(byte[] bArr, int i5, int i11, l0 l0Var) {
        this.f52260a = bArr;
        this.f52261b = i5;
        this.f52262c = i11;
        this.f52263d = l0Var;
        this.f52264e = false;
    }
}
