package defpackage;

import java.util.Iterator;
import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import z2.y0;

/* loaded from: classes2.dex */
public final class a extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f50j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ List f51k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(int i5, List list) {
        super(0);
        this.f50j = i5;
        this.f51k = list;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Object next;
        switch (this.f50j) {
            case 0:
                Iterator it = this.f51k.iterator();
                while (true) {
                    if (it.hasNext()) {
                        next = it.next();
                        if (((y0) next).f98179b.isAttached()) {
                        }
                    } else {
                        next = null;
                    }
                }
                return (y0) next;
            default:
                return this.f51k;
        }
    }
}
