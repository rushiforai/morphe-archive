package com.amplitude;

import android.view.View;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.p, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0494p extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20709a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C0514t f20710b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0494p(View view, C0514t c0514t) {
        super(1);
        this.f20709a = view;
        this.f20710b = c0514t;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int iIntValue = ((Number) obj).intValue();
        View view = this.f20709a;
        C0514t c0514t = this.f20710b;
        if (view.isAttachedToWindow()) {
            view.addOnAttachStateChangeListener(new ViewOnAttachStateChangeListenerC0488o(view, c0514t, iIntValue));
        } else {
            u4 u4Var = c0514t.f20751b;
            ((Map) u4Var.f20785g.getValue()).remove(Integer.valueOf(iIntValue));
            if (((Map) u4Var.f20785g.getValue()).isEmpty()) {
                ((AtomicInteger) AbstractC0484n1.f20679a.getValue()).set(10);
            }
        }
        return Unit.f71706a;
    }
}
