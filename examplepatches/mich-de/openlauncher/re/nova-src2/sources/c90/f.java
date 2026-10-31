package c90;

import b90.j;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import x80.h0;
import x80.m0;
import x80.x;
import x80.y;

/* loaded from: classes.dex */
public final class f implements x {

    /* renamed from: a, reason: collision with root package name */
    public final j f19888a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f19889b;

    /* renamed from: c, reason: collision with root package name */
    public final int f19890c;

    /* renamed from: d, reason: collision with root package name */
    public final b90.e f19891d;

    /* renamed from: e, reason: collision with root package name */
    public final h0 f19892e;

    /* renamed from: f, reason: collision with root package name */
    public final int f19893f;

    /* renamed from: g, reason: collision with root package name */
    public final int f19894g;

    /* renamed from: h, reason: collision with root package name */
    public final int f19895h;

    /* renamed from: i, reason: collision with root package name */
    public int f19896i;

    public f(j jVar, ArrayList arrayList, int i5, b90.e eVar, h0 request, int i11, int i12, int i13) {
        Intrinsics.g(request, "request");
        this.f19888a = jVar;
        this.f19889b = arrayList;
        this.f19890c = i5;
        this.f19891d = eVar;
        this.f19892e = request;
        this.f19893f = i11;
        this.f19894g = i12;
        this.f19895h = i13;
    }

    public static f a(f fVar, int i5, b90.e eVar, h0 h0Var, int i11) {
        if ((i11 & 1) != 0) {
            i5 = fVar.f19890c;
        }
        int i12 = i5;
        if ((i11 & 2) != 0) {
            eVar = fVar.f19891d;
        }
        b90.e eVar2 = eVar;
        if ((i11 & 4) != 0) {
            h0Var = fVar.f19892e;
        }
        h0 request = h0Var;
        int i13 = fVar.f19893f;
        int i14 = fVar.f19894g;
        int i15 = fVar.f19895h;
        Intrinsics.g(request, "request");
        return new f(fVar.f19888a, fVar.f19889b, i12, eVar2, request, i13, i14, i15);
    }

    public final m0 b(h0 request) {
        Intrinsics.g(request, "request");
        ArrayList arrayList = this.f19889b;
        int size = arrayList.size();
        int i5 = this.f19890c;
        if (i5 >= size) {
            throw new IllegalStateException("Check failed.");
        }
        this.f19896i++;
        b90.e eVar = this.f19891d;
        if (eVar != null) {
            if (!eVar.f17665b.b(request.f95509a)) {
                throw new IllegalStateException(("network interceptor " + arrayList.get(i5 - 1) + " must retain the same host and port").toString());
            }
            if (this.f19896i != 1) {
                throw new IllegalStateException(("network interceptor " + arrayList.get(i5 - 1) + " must call proceed() exactly once").toString());
            }
        }
        int i11 = i5 + 1;
        f fVarA = a(this, i11, null, request, 58);
        y yVar = (y) arrayList.get(i5);
        m0 m0VarIntercept = yVar.intercept(fVarA);
        if (m0VarIntercept == null) {
            throw new NullPointerException("interceptor " + yVar + " returned null");
        }
        if (eVar != null && i11 < arrayList.size() && fVarA.f19896i != 1) {
            throw new IllegalStateException(("network interceptor " + yVar + " must call proceed() exactly once").toString());
        }
        if (m0VarIntercept.f95559g != null) {
            return m0VarIntercept;
        }
        throw new IllegalStateException(("interceptor " + yVar + " returned a response with no body").toString());
    }
}
