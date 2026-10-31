package m90;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f76115a;

    /* renamed from: b, reason: collision with root package name */
    public int f76116b;

    /* renamed from: c, reason: collision with root package name */
    public int f76117c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f76118d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f76119e;

    /* renamed from: f, reason: collision with root package name */
    public e0 f76120f;

    /* renamed from: g, reason: collision with root package name */
    public e0 f76121g;

    public e0() {
        this.f76115a = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
        this.f76119e = true;
        this.f76118d = false;
    }

    public final e0 a() {
        e0 e0Var = this.f76120f;
        if (e0Var == this) {
            e0Var = null;
        }
        e0 e0Var2 = this.f76121g;
        Intrinsics.d(e0Var2);
        e0Var2.f76120f = this.f76120f;
        e0 e0Var3 = this.f76120f;
        Intrinsics.d(e0Var3);
        e0Var3.f76121g = this.f76121g;
        this.f76120f = null;
        this.f76121g = null;
        return e0Var;
    }

    public final void b(e0 segment) {
        Intrinsics.g(segment, "segment");
        segment.f76121g = this;
        segment.f76120f = this.f76120f;
        e0 e0Var = this.f76120f;
        Intrinsics.d(e0Var);
        e0Var.f76121g = segment;
        this.f76120f = segment;
    }

    public final e0 c() {
        this.f76118d = true;
        return new e0(this.f76115a, this.f76116b, this.f76117c, true);
    }

    public final void d(e0 sink, int i5) {
        Intrinsics.g(sink, "sink");
        byte[] bArr = sink.f76115a;
        if (!sink.f76119e) {
            throw new IllegalStateException("only owner can write");
        }
        int i11 = sink.f76117c;
        int i12 = i11 + i5;
        if (i12 > 8192) {
            if (sink.f76118d) {
                throw new IllegalArgumentException();
            }
            int i13 = sink.f76116b;
            if (i12 - i13 > 8192) {
                throw new IllegalArgumentException();
            }
            u90.b.v(bArr, i13, bArr, i11, 2);
            sink.f76117c -= sink.f76116b;
            sink.f76116b = 0;
        }
        int i14 = sink.f76117c;
        int i15 = this.f76116b;
        u90.b.q(this.f76115a, i14, bArr, i15, i15 + i5);
        sink.f76117c += i5;
        this.f76116b += i5;
    }

    public e0(byte[] data, int i5, int i11, boolean z11) {
        Intrinsics.g(data, "data");
        this.f76115a = data;
        this.f76116b = i5;
        this.f76117c = i11;
        this.f76118d = z11;
        this.f76119e = false;
    }
}
