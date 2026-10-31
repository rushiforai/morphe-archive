package io.branch.search.internal;

import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Ie extends C3165g9 {

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Set<String> f62689b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final P6 f62690c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ie(@NotNull Set tags, @NotNull P6 filterAction, @NotNull C3063a9 next) {
        super(next);
        Intrinsics.g(tags, "tags");
        Intrinsics.g(filterAction, "filterAction");
        Intrinsics.g(next, "next");
        this.f62689b = tags;
        this.f62690c = filterAction;
    }

    @Override // io.branch.search.internal.InterfaceC3148f9
    public final void a(@NotNull AbstractC3080b9 message) {
        Object next;
        Intrinsics.g(message, "message");
        if (Intrinsics.b(message.f64020b, "Internal-DEBUG")) {
            this.f64588a.a(message);
            return;
        }
        Iterator<T> it = this.f62689b.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            } else {
                next = it.next();
                if (r70.j.I0((String) next, message.f64020b, false)) {
                    break;
                }
            }
        }
        boolean z11 = next != null;
        if (!(z11 && this.f62690c == P6.ALLOW) && (z11 || this.f62690c != P6.DENY)) {
            return;
        }
        this.f64588a.a(message);
    }
}
