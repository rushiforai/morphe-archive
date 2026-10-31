package r20;

import com.amplitude.eventbridge.EventBridgeChannel;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import qx.z0;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f85334a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85335b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f85336c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f85337d;

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f85338e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f85339f;

    /* renamed from: g, reason: collision with root package name */
    public final Function1 f85340g;

    /* renamed from: h, reason: collision with root package name */
    public final Function1 f85341h;

    /* renamed from: i, reason: collision with root package name */
    public final SuspendLambda f85342i;

    /* renamed from: j, reason: collision with root package name */
    public final Function3 f85343j;

    public /* synthetic */ b(String str, String str2, Function1 function1, Function1 function12, Function1 function13, Function1 function14, Function1 function15, Function4 function4, e eVar, int i5) {
        this(str, str2, function1, function12, function13, function14, function15, (z0) null, function4, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : eVar);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public b(String str, String str2, Function1 function1, Function1 function12, Function1 function13, Function1 function14, Function1 function15, z0 z0Var, Function4 function4, Function3 function3) {
        this.f85334a = str;
        this.f85335b = str2;
        this.f85336c = function1;
        this.f85337d = function12;
        this.f85338e = function13;
        this.f85339f = function14;
        this.f85340g = function15;
        this.f85341h = z0Var;
        this.f85342i = (SuspendLambda) function4;
        this.f85343j = function3;
    }
}
