package ads_mobile_sdk;

import b.c0;
import java.util.UUID;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class ax0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ tx0 f1178a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f1179b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f1180c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f1181d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f1182e;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1183t = 0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ax0(tx0 tx0Var, String str, UUID uuid, String str2, String str3, Continuation continuation) {
        super(2, continuation);
        this.f1178a = tx0Var;
        this.f1179b = str;
        this.f1180c = uuid;
        this.f1181d = str2;
        this.f1182e = str3;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1183t) {
            case 0:
                return new ax0(this.f1178a, this.f1179b, (UUID) this.f1180c, this.f1181d, this.f1182e, continuation);
            default:
                return new ax0(this.f1178a, continuation, this.f1179b, this.f1181d, this.f1182e, (String) this.f1180c);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1183t) {
        }
        return ((ax0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f1183t;
        Object obj2 = this.f1180c;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                StringBuilder sb2 = new StringBuilder();
                sb2.append(this.f1179b);
                sb2.append("({\"id\": \"");
                sb2.append((UUID) obj2);
                sb2.append("\", \"args\": ");
                sb2.append(this.f1181d);
                this.f1178a.evaluateJavascript(c0.r(sb2, ", \"use_javascript_interface\": \"", this.f1182e, "\"});"), null);
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                this.f1178a.loadDataWithBaseURL(this.f1179b, this.f1181d, this.f1182e, (String) obj2, null);
                break;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ax0(tx0 tx0Var, Continuation continuation, String str, String str2, String str3, String str4) {
        super(2, continuation);
        this.f1178a = tx0Var;
        this.f1179b = str;
        this.f1181d = str2;
        this.f1182e = str3;
        this.f1180c = str4;
    }
}
