package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class N1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<Function0<Unit>> f62958a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f62959b;

    public N1() {
        List<Function0<Unit>> listSynchronizedList = Collections.synchronizedList(new ArrayList());
        Intrinsics.f(listSynchronizedList, "synchronizedList(mutableListOf())");
        this.f62958a = listSynchronizedList;
        this.f62959b = new AtomicBoolean(false);
    }

    public final void a() {
        if (this.f62959b.compareAndSet(false, true)) {
            Iterator<T> it = this.f62958a.iterator();
            while (it.hasNext()) {
                ((Function0) it.next()).invoke();
            }
        }
    }
}
