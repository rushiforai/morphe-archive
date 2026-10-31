package c50;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class f implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19694a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f19695b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f19696c;

    public /* synthetic */ f(Function1 function1, Function1 function12, int i5) {
        this.f19694a = i5;
        this.f19695b = function1;
        this.f19696c = function12;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19694a) {
            case 0:
                Intrinsics.g(obj, "<this>");
                Function1 function1 = this.f19695b;
                if (function1 != null) {
                    function1.invoke(obj);
                }
                this.f19696c.invoke(obj);
                break;
            case 1:
                this.f19695b.invoke(obj);
                this.f19696c.invoke(obj);
                break;
            default:
                this.f19695b.invoke(obj);
                this.f19696c.invoke(obj);
                break;
        }
        return Unit.f71706a;
    }
}
