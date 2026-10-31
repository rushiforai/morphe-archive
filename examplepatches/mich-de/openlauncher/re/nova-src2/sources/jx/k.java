package jx;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collection;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final Context f70414a;

    public k(Context context) {
        this.f70414a = context.getApplicationContext();
    }

    public final Object a(ArrayList arrayList, Collection collection, ContinuationImpl continuationImpl) {
        Object objA = ((t5.g) e.f70405b.getValue(this.f70414a, e.f70404a[0])).a(new b10.k(collection, arrayList, (Continuation) null, 20), continuationImpl);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
