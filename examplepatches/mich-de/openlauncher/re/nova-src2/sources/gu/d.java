package gu;

import bu.m;
import kotlin.Function;
import kotlin.jvm.internal.FunctionAdapter;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f57821a;

    public d(m mVar) {
        this.f57821a = mVar;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f57821a;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        return this.f57821a.equals(((FunctionAdapter) obj).b());
    }

    public final int hashCode() {
        return this.f57821a.hashCode();
    }
}
