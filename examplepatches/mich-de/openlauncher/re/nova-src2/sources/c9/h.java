package c9;

import android.view.MotionEvent;
import com.amplitude.Y2;
import com.teslacoilsw.conditions.ConditionSetId;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import m00.t;
import p1.e1;
import t00.s;
import t70.j0;
import t70.m0;

/* loaded from: classes2.dex */
public final class h implements x80.j, Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19865a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f19866b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f19867c;

    public /* synthetic */ h(int i5, Object obj, Object obj2) {
        this.f19865a = i5;
        this.f19866b = obj;
        this.f19867c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.util.LinkedHashMap, java.util.Map] */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Continuation continuation = null;
        switch (this.f19865a) {
            case 0:
                try {
                    ((b90.j) this.f19866b).cancel();
                } catch (Throwable unused) {
                }
                return Unit.f71706a;
            case 1:
                m0.t((j0) this.f19866b, null, null, new c4.k((jx.k) this.f19867c, ((ConditionSetId) obj).f45529a, continuation, 25), 3);
                return Unit.f71706a;
            case 2:
                return ((h00.f) this.f19866b).invoke(((List) this.f19867c).get(((Number) obj).intValue()));
            case 3:
                Boolean bool = (Boolean) obj;
                bool.getClass();
                ((Function2) this.f19866b).invoke((t) this.f19867c, bool);
                return Unit.f71706a;
            case 4:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                e1 e1Var = (e1) this.f19866b;
                String str = n00.f.f77555a;
                Map map = (Map) e1Var.getValue();
                if (map != null) {
                    Map.Entry entry = (Map.Entry) this.f19867c;
                    ?? linkedHashMap = new LinkedHashMap(b70.k.d0(map.size()));
                    for (Map.Entry entry2 : map.entrySet()) {
                        linkedHashMap.put(entry2.getKey(), Boolean.valueOf(Intrinsics.b(entry2.getKey(), entry.getKey()) ? zBooleanValue : ((Boolean) entry2.getValue()).booleanValue()));
                    }
                    continuation = linkedHashMap;
                }
                e1Var.setValue(continuation);
                return Unit.f71706a;
            case 5:
                androidx.room.h hVar = (androidx.room.h) this.f19866b;
                Object obj2 = hVar.f15219b;
                t70.m mVar = (t70.m) this.f19867c;
                synchronized (obj2) {
                    ((ArrayList) hVar.f15220c).remove(mVar);
                }
                return Unit.f71706a;
            case 6:
                MotionEvent interceptedEvent = (MotionEvent) obj;
                Intrinsics.g(interceptedEvent, "interceptedEvent");
                Iterator it = (Iterator) this.f19867c;
                return it.hasNext() ? ((Y2) it.next()).intercept(interceptedEvent, this) : ((q40.e) this.f19866b).f83667c.dispatchTouchEvent(interceptedEvent) ? p40.c.f82079b : p40.e.f82080a;
            case 7:
                int iIntValue = ((Number) obj).intValue();
                return ((Function2) this.f19866b).invoke(Integer.valueOf(iIntValue), ((List) this.f19867c).get(iIntValue));
            case 8:
                return ((s10.i) this.f19866b).invoke(((List) this.f19867c).get(((Number) obj).intValue()));
            default:
                int iIntValue2 = ((Number) obj).intValue();
                return ((s) this.f19866b).invoke(Integer.valueOf(iIntValue2), ((List) this.f19867c).get(iIntValue2));
        }
    }

    @Override // x80.j
    public void onFailure(x80.i iVar, IOException iOException) {
        if (iVar.p()) {
            return;
        }
        t70.m mVar = (t70.m) this.f19867c;
        int i5 = Result.f71687b;
        mVar.resumeWith(ResultKt.a(iOException));
    }

    @Override // x80.j
    public void onResponse(x80.i iVar, x80.m0 m0Var) {
        t70.m mVar = (t70.m) this.f19867c;
        int i5 = Result.f71687b;
        mVar.resumeWith(m0Var);
    }
}
