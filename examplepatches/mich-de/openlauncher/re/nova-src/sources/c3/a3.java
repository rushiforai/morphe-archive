package c3;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public final class a3 implements b3.g2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f19209a;

    /* renamed from: b, reason: collision with root package name */
    public final List f19210b;

    /* renamed from: c, reason: collision with root package name */
    public Float f19211c = null;

    /* renamed from: d, reason: collision with root package name */
    public Float f19212d = null;

    /* renamed from: e, reason: collision with root package name */
    public j3.i f19213e = null;

    /* renamed from: f, reason: collision with root package name */
    public j3.i f19214f = null;

    public a3(ArrayList arrayList, int i5) {
        this.f19209a = i5;
        this.f19210b = arrayList;
    }

    public final void a(j3.i iVar) {
        this.f19213e = iVar;
    }

    public final void b(j3.i iVar) {
        this.f19214f = iVar;
    }

    @Override // b3.g2
    public final boolean isValidOwnerScope() {
        return this.f19210b.contains(this);
    }
}
