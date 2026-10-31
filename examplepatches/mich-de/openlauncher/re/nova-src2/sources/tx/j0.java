package tx;

import android.content.Context;
import android.content.SharedPreferences;
import com.instabridge.ai.context.AiContextManager;
import com.instabridge.ai.context.ContextType;
import java.security.MessageDigest;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public final class j0 {

    /* renamed from: a, reason: collision with root package name */
    public static final j0 f89820a = new j0();

    /* renamed from: b, reason: collision with root package name */
    public static final Object f89821b = MapsKt.j0(new Pair(io.p.f66706g, ContextType.LOCATION), new Pair(io.p.f66707h, ContextType.PHONE_APPS), new Pair(io.p.f66714q, ContextType.APP_USAGE), new Pair(io.p.n, ContextType.CALENDAR_EVENTS), new Pair(io.p.o, ContextType.CONTACTS), new Pair(io.p.f66710k, ContextType.DEVICE_STATE), new Pair(io.p.f66711l, ContextType.SEARCH_HISTORY));

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(String str, Function1 function1, ContinuationImpl continuationImpl) {
        g0 g0Var;
        if (continuationImpl instanceof g0) {
            g0Var = (g0) continuationImpl;
            int i5 = g0Var.f89749v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g0Var.f89749v = i5 - Integer.MIN_VALUE;
            } else {
                g0Var = new g0(continuationImpl);
            }
        }
        Object obj = g0Var.f89748u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g0Var.f89749v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                g0Var.f89747t = str;
                g0Var.f89749v = 1;
                Object objInvoke = function1.invoke(g0Var);
                str = objInvoke;
                if (objInvoke == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                String str2 = g0Var.f89747t;
                ResultKt.b(obj);
                str = str2;
            }
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.p(e11, "sync[%s] FAILED — LLM will see stale data for this category", str);
        }
        return Unit.f71706a;
    }

    public static Object c(Context context, b10.r0 r0Var) throws Throwable {
        if (!fo.d.j()) {
            return Unit.f71706a;
        }
        AiContextManager aiContextManagerD = fo.d.d();
        a80.e eVar = t70.y0.f88884a;
        Object objY = t70.m0.y(a80.d.f488c, new pu.q(aiContextManagerD, context, null, 29), r0Var);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0031  */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object, java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(Context context, io.p pVar, mx.e0 e0Var) throws Throwable {
        ContextType contextType;
        boolean zIsContextTypeAllowed;
        Continuation continuation;
        Object next;
        if (fo.d.j() && (contextType = (ContextType) f89821b.get(pVar)) != null) {
            int i5 = 0;
            if (contextType != ContextType.LOCATION || !j10.m.i(context)) {
                zIsContextTypeAllowed = fo.d.d().isContextTypeAllowed(contextType);
                if (zIsContextTypeAllowed) {
                    return Unit.f71706a;
                }
                Iterator it = e(fo.d.d(), context).iterator();
                while (true) {
                    continuation = null;
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (((e0) next).f89700a == contextType) {
                        break;
                    }
                }
                e0 e0Var2 = (e0) next;
                if (e0Var2 == null) {
                    return Unit.f71706a;
                }
                a80.e eVar = t70.y0.f88884a;
                Object objY = t70.m0.y(a80.d.f488c, new h0(contextType, e0Var2, continuation, i5), e0Var);
                return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
            }
            zIsContextTypeAllowed = false;
            if (zIsContextTypeAllowed) {
            }
        }
        return Unit.f71706a;
    }

    public static List e(AiContextManager aiContextManager, Context context) {
        Continuation continuation = null;
        return ul.b.Q(new e0(ContextType.PHONE_APPS, new i0(aiContextManager, context, continuation, 0)), new e0(ContextType.APP_USAGE, new i0(aiContextManager, context, continuation, 1)), new e0(ContextType.CALENDAR_EVENTS, new i0(aiContextManager, context, continuation, 2)), new e0(ContextType.CONTACTS, new i0(aiContextManager, context, continuation, 3)), new e0(ContextType.LOCATION, new i0(context, aiContextManager, null)), new e0(ContextType.SEARCH_HISTORY, new c0.g0(context, continuation, 9)));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Context context, ContextType contextType, String str, ContinuationImpl continuationImpl) {
        f0 f0Var;
        SharedPreferences sharedPreferences;
        String str2;
        String str3;
        if (continuationImpl instanceof f0) {
            f0Var = (f0) continuationImpl;
            int i5 = f0Var.f89726y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f0Var.f89726y = i5 - Integer.MIN_VALUE;
            } else {
                f0Var = new f0(this, continuationImpl);
            }
        }
        Object obj = f0Var.f89724w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f0Var.f89726y;
        if (i11 == 0) {
            ResultKt.b(obj);
            SharedPreferences sharedPreferences2 = context.getSharedPreferences("nova_ai_context_hashes", 0);
            String strK = b.c0.k("hash_", contextType.name());
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = str.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            String strM0 = kotlin.collections.c.M0(messageDigest.digest(bytes), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, new s10.i(28), 30);
            if (Intrinsics.b(sharedPreferences2.getString(strK, null), strM0)) {
                return Unit.f71706a;
            }
            AiContextManager aiContextManagerD = fo.d.d();
            f0Var.f89721t = sharedPreferences2;
            f0Var.f89722u = strK;
            f0Var.f89723v = strM0;
            f0Var.f89726y = 1;
            if (aiContextManagerD.addContext(contextType, str, f0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            sharedPreferences = sharedPreferences2;
            str2 = strK;
            str3 = strM0;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str3 = f0Var.f89723v;
            str2 = f0Var.f89722u;
            sharedPreferences = f0Var.f89721t;
            ResultKt.b(obj);
        }
        a2.c.v(sharedPreferences, str2, str3);
        return Unit.f71706a;
    }
}
