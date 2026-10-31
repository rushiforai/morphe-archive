package c3;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class w extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19452j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ g2.d f19453k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w(g2.d dVar, int i5) {
        super(1);
        this.f19452j = i5;
        this.f19453k = dVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19452j) {
        }
        return Boolean.valueOf(((g2.z) obj).H(this.f19453k.f56863a));
    }
}
