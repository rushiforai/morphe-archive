package l1;

import kotlin.jvm.internal.PropertyReference0Impl;

/* loaded from: classes2.dex */
public final /* synthetic */ class m4 extends PropertyReference0Impl {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f73640d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m4(int i5, int i11, Class cls, Object obj, String str, String str2) {
        super(obj, cls, str, str2, i5);
        this.f73640d = i11;
    }

    @Override // kotlin.jvm.internal.PropertyReference0Impl, kotlin.reflect.KProperty0
    public final Object get() {
        switch (this.f73640d) {
            case 0:
                return ((p1.y2) this.receiver).getValue();
            case 1:
                return ((p1.y2) this.receiver).getValue();
            case 2:
                return ((p1.y2) this.receiver).getValue();
            default:
                return this.receiver.getClass().getSimpleName();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m4(y70.k kVar) {
        super(kVar, t70.m0.class, "classSimpleName", "getClassSimpleName(Ljava/lang/Object;)Ljava/lang/String;", 1);
        this.f73640d = 3;
    }
}
