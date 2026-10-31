package m0;

import kotlin.jvm.internal.PropertyReference0Impl;
import p1.y2;

/* loaded from: classes.dex */
public final /* synthetic */ class l extends PropertyReference0Impl {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f75435d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l(int i5, int i11, Class cls, Object obj, String str, String str2) {
        super(obj, cls, str, str2, i5);
        this.f75435d = i11;
    }

    @Override // kotlin.jvm.internal.PropertyReference0Impl, kotlin.reflect.KProperty0
    public final Object get() {
        switch (this.f75435d) {
        }
        return ((y2) this.receiver).getValue();
    }
}
