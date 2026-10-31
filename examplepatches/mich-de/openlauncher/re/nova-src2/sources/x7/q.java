package x7;

import androidx.recyclerview.widget.u1;
import androidx.work.OverwritingInputMerger;
import b.c0;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import h6.c1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: x, reason: collision with root package name */
    public static final String f95170x;

    /* renamed from: a, reason: collision with root package name */
    public final String f95171a;

    /* renamed from: b, reason: collision with root package name */
    public int f95172b;

    /* renamed from: c, reason: collision with root package name */
    public final String f95173c;

    /* renamed from: d, reason: collision with root package name */
    public final String f95174d;

    /* renamed from: e, reason: collision with root package name */
    public o7.g f95175e;

    /* renamed from: f, reason: collision with root package name */
    public final o7.g f95176f;

    /* renamed from: g, reason: collision with root package name */
    public long f95177g;

    /* renamed from: h, reason: collision with root package name */
    public long f95178h;

    /* renamed from: i, reason: collision with root package name */
    public long f95179i;

    /* renamed from: j, reason: collision with root package name */
    public o7.f f95180j;

    /* renamed from: k, reason: collision with root package name */
    public final int f95181k;

    /* renamed from: l, reason: collision with root package name */
    public int f95182l;

    /* renamed from: m, reason: collision with root package name */
    public long f95183m;
    public long n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final long f95184p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f95185q;

    /* renamed from: r, reason: collision with root package name */
    public final int f95186r;

    /* renamed from: s, reason: collision with root package name */
    public final int f95187s;

    /* renamed from: t, reason: collision with root package name */
    public final int f95188t;

    /* renamed from: u, reason: collision with root package name */
    public long f95189u;

    /* renamed from: v, reason: collision with root package name */
    public int f95190v;

    /* renamed from: w, reason: collision with root package name */
    public final int f95191w;

    static {
        String strE = o7.r.e("WorkSpec");
        Intrinsics.f(strE, "tagWithPrefix(\"WorkSpec\")");
        f95170x = strE;
    }

    public q(String id2, int i5, String workerClassName, String inputMergerClassName, o7.g input, o7.g output, long j11, long j12, long j13, o7.f constraints, int i11, int i12, long j14, long j15, long j16, long j17, boolean z11, int i13, int i14, int i15, long j18, int i16, int i17) {
        Intrinsics.g(id2, "id");
        fq.c.o(i5, "state");
        Intrinsics.g(workerClassName, "workerClassName");
        Intrinsics.g(inputMergerClassName, "inputMergerClassName");
        Intrinsics.g(input, "input");
        Intrinsics.g(output, "output");
        Intrinsics.g(constraints, "constraints");
        fq.c.o(i12, "backoffPolicy");
        fq.c.o(i13, "outOfQuotaPolicy");
        this.f95171a = id2;
        this.f95172b = i5;
        this.f95173c = workerClassName;
        this.f95174d = inputMergerClassName;
        this.f95175e = input;
        this.f95176f = output;
        this.f95177g = j11;
        this.f95178h = j12;
        this.f95179i = j13;
        this.f95180j = constraints;
        this.f95181k = i11;
        this.f95182l = i12;
        this.f95183m = j14;
        this.n = j15;
        this.o = j16;
        this.f95184p = j17;
        this.f95185q = z11;
        this.f95186r = i13;
        this.f95187s = i14;
        this.f95188t = i15;
        this.f95189u = j18;
        this.f95190v = i16;
        this.f95191w = i17;
    }

    public static q b(q qVar, String str, int i5, String str2, o7.g gVar, int i11, long j11, int i12, int i13, long j12, int i14, int i15) {
        String id2 = (i15 & 1) != 0 ? qVar.f95171a : str;
        int i16 = (i15 & 2) != 0 ? qVar.f95172b : i5;
        String workerClassName = (i15 & 4) != 0 ? qVar.f95173c : str2;
        String inputMergerClassName = qVar.f95174d;
        o7.g input = (i15 & 16) != 0 ? qVar.f95175e : gVar;
        o7.g output = qVar.f95176f;
        long j13 = qVar.f95177g;
        long j14 = qVar.f95178h;
        long j15 = qVar.f95179i;
        o7.f constraints = qVar.f95180j;
        int i17 = (i15 & 1024) != 0 ? qVar.f95181k : i11;
        int i18 = qVar.f95182l;
        long j16 = qVar.f95183m;
        long j17 = (i15 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? qVar.n : j11;
        long j18 = qVar.o;
        long j19 = qVar.f95184p;
        boolean z11 = qVar.f95185q;
        int i19 = qVar.f95186r;
        int i21 = (i15 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? qVar.f95187s : i12;
        int i22 = (i15 & 524288) != 0 ? qVar.f95188t : i13;
        long j21 = (i15 & 1048576) != 0 ? qVar.f95189u : j12;
        int i23 = (i15 & 2097152) != 0 ? qVar.f95190v : i14;
        int i24 = qVar.f95191w;
        qVar.getClass();
        Intrinsics.g(id2, "id");
        fq.c.o(i16, "state");
        Intrinsics.g(workerClassName, "workerClassName");
        Intrinsics.g(inputMergerClassName, "inputMergerClassName");
        Intrinsics.g(input, "input");
        Intrinsics.g(output, "output");
        Intrinsics.g(constraints, "constraints");
        fq.c.o(i18, "backoffPolicy");
        fq.c.o(i19, "outOfQuotaPolicy");
        return new q(id2, i16, workerClassName, inputMergerClassName, input, output, j13, j14, j15, constraints, i17, i18, j16, j17, j18, j19, z11, i19, i21, i22, j21, i23, i24);
    }

    public final long a() {
        return vm.d.b(this.f95172b == 1 && this.f95181k > 0, this.f95181k, this.f95182l, this.f95183m, this.n, this.f95187s, d(), this.f95177g, this.f95179i, this.f95178h, this.f95189u);
    }

    public final boolean c() {
        return !Intrinsics.b(o7.f.f79652i, this.f95180j);
    }

    public final boolean d() {
        return this.f95178h != 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return Intrinsics.b(this.f95171a, qVar.f95171a) && this.f95172b == qVar.f95172b && Intrinsics.b(this.f95173c, qVar.f95173c) && Intrinsics.b(this.f95174d, qVar.f95174d) && Intrinsics.b(this.f95175e, qVar.f95175e) && Intrinsics.b(this.f95176f, qVar.f95176f) && this.f95177g == qVar.f95177g && this.f95178h == qVar.f95178h && this.f95179i == qVar.f95179i && Intrinsics.b(this.f95180j, qVar.f95180j) && this.f95181k == qVar.f95181k && this.f95182l == qVar.f95182l && this.f95183m == qVar.f95183m && this.n == qVar.n && this.o == qVar.o && this.f95184p == qVar.f95184p && this.f95185q == qVar.f95185q && this.f95186r == qVar.f95186r && this.f95187s == qVar.f95187s && this.f95188t == qVar.f95188t && this.f95189u == qVar.f95189u && this.f95190v == qVar.f95190v && this.f95191w == qVar.f95191w;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iD = c0.d(c0.d(c0.d(c0.d((c0.F(this.f95182l) + u4.a(this.f95181k, (this.f95180j.hashCode() + c0.d(c0.d(c0.d((this.f95176f.hashCode() + ((this.f95175e.hashCode() + c0.e(c0.e((c0.F(this.f95172b) + (this.f95171a.hashCode() * 31)) * 31, 31, this.f95173c), 31, this.f95174d)) * 31)) * 31, 31, this.f95177g), 31, this.f95178h), 31, this.f95179i)) * 31, 31)) * 31, 31, this.f95183m), 31, this.n), 31, this.o), 31, this.f95184p);
        boolean z11 = this.f95185q;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return Integer.hashCode(this.f95191w) + u4.a(this.f95190v, c0.d(u4.a(this.f95188t, u4.a(this.f95187s, (c0.F(this.f95186r) + ((iD + i5) * 31)) * 31, 31), 31), 31, this.f95189u), 31);
    }

    public final String toString() {
        return c1.t(new StringBuilder("{WorkSpec: "), this.f95171a, AbstractJsonLexerKt.END_OBJ);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ q(String str, int i5, String str2, String str3, o7.g gVar, o7.g gVar2, long j11, long j12, long j13, o7.f fVar, int i11, int i12, long j14, long j15, long j16, long j17, boolean z11, int i13, int i14, long j18, int i15, int i16, int i17) {
        o7.g gVar3;
        o7.g gVar4;
        int i18 = (i17 & 2) != 0 ? 1 : i5;
        String name = (i17 & 8) != 0 ? OverwritingInputMerger.class.getName() : str3;
        if ((i17 & 16) != 0) {
            o7.g EMPTY = o7.g.f79665c;
            Intrinsics.f(EMPTY, "EMPTY");
            gVar3 = EMPTY;
        } else {
            gVar3 = gVar;
        }
        if ((i17 & 32) != 0) {
            o7.g EMPTY2 = o7.g.f79665c;
            Intrinsics.f(EMPTY2, "EMPTY");
            gVar4 = EMPTY2;
        } else {
            gVar4 = gVar2;
        }
        this(str, i18, str2, name, gVar3, gVar4, (i17 & 64) != 0 ? 0L : j11, (i17 & 128) != 0 ? 0L : j12, (i17 & 256) != 0 ? 0L : j13, (i17 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? o7.f.f79652i : fVar, (i17 & 1024) != 0 ? 0 : i11, (i17 & 2048) != 0 ? 1 : i12, (i17 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? 30000L : j14, (i17 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? -1L : j15, (i17 & ReaderJsonLexerKt.BATCH_SIZE) == 0 ? j16 : 0L, (32768 & i17) != 0 ? -1L : j17, (65536 & i17) != 0 ? false : z11, (131072 & i17) != 0 ? 1 : i13, (262144 & i17) != 0 ? 0 : i14, 0, (1048576 & i17) != 0 ? Long.MAX_VALUE : j18, (2097152 & i17) != 0 ? 0 : i15, (i17 & 4194304) != 0 ? -256 : i16);
    }
}
