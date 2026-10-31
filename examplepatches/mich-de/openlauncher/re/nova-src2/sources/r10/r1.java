package r10;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class r1 extends i0 {

    /* renamed from: b, reason: collision with root package name */
    public final ey.p f85226b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f85227c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85228d;

    /* renamed from: e, reason: collision with root package name */
    public final String f85229e;

    /* renamed from: f, reason: collision with root package name */
    public final Function0 f85230f;

    public r1(ey.p pVar, ArrayList arrayList, String str, String str2, Function0 function0) {
        super(function0);
        this.f85226b = pVar;
        this.f85227c = arrayList;
        this.f85228d = str;
        this.f85229e = str2;
        this.f85230f = function0;
    }

    @Override // r10.i0
    public final String a() {
        return this.f85228d;
    }

    @Override // r10.i0
    public final Function0 b() {
        return this.f85230f;
    }

    @Override // r10.i0
    public final String c() {
        return this.f85229e;
    }

    public final List d() {
        return this.f85227c;
    }

    public final ey.p e() {
        return this.f85226b;
    }
}
