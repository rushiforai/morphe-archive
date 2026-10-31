package ads_mobile_sdk;

import b.q5;
import b.t8;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public final class jq extends q5 {

    /* renamed from: a, reason: collision with root package name */
    public int f5335a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final int f5336b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t8 f5337c;

    public jq(t8 t8Var) {
        this.f5337c = t8Var;
        this.f5336b = t8Var.size();
    }

    @Override // b.q5
    public final byte a() {
        int i5 = this.f5335a;
        if (i5 >= this.f5336b) {
            throw new NoSuchElementException();
        }
        this.f5335a = i5 + 1;
        return this.f5337c.b(i5);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f5335a < this.f5336b;
    }
}
