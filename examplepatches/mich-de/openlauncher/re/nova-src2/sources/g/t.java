package g;

import java.util.ListIterator;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class t extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f56434j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ a0 f56435k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t(a0 a0Var, int i5) {
        super(1);
        this.f56434j = i5;
        this.f56435k = a0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Object objPrevious;
        Object objPrevious2;
        switch (this.f56434j) {
            case 0:
                b backEvent = (b) obj;
                Intrinsics.g(backEvent, "backEvent");
                a0 a0Var = this.f56435k;
                ArrayDeque arrayDeque = a0Var.f56396b;
                ListIterator<E> listIterator = arrayDeque.listIterator(arrayDeque.getF71724c());
                while (true) {
                    if (listIterator.hasPrevious()) {
                        objPrevious = listIterator.previous();
                        if (((s) objPrevious).isEnabled()) {
                        }
                    } else {
                        objPrevious = null;
                    }
                }
                s sVar = (s) objPrevious;
                if (a0Var.f56397c != null) {
                    a0Var.c();
                }
                a0Var.f56397c = sVar;
                if (sVar != null) {
                    sVar.handleOnBackStarted(backEvent);
                }
                break;
            default:
                b backEvent2 = (b) obj;
                Intrinsics.g(backEvent2, "backEvent");
                a0 a0Var2 = this.f56435k;
                s sVar2 = a0Var2.f56397c;
                if (sVar2 == null) {
                    ArrayDeque arrayDeque2 = a0Var2.f56396b;
                    ListIterator<E> listIterator2 = arrayDeque2.listIterator(arrayDeque2.getF71724c());
                    while (true) {
                        if (listIterator2.hasPrevious()) {
                            objPrevious2 = listIterator2.previous();
                            if (((s) objPrevious2).isEnabled()) {
                            }
                        } else {
                            objPrevious2 = null;
                        }
                    }
                    sVar2 = (s) objPrevious2;
                }
                if (sVar2 != null) {
                    sVar2.handleOnBackProgressed(backEvent2);
                }
                break;
        }
        return Unit.f71706a;
    }
}
