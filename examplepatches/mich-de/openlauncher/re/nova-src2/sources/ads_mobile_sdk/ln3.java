package ads_mobile_sdk;

import android.content.Context;
import android.os.Build;
import b.c0;
import c80.d;
import e1.e1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.q0;
import t70.s1;

/* loaded from: classes2.dex */
public final class ln3 implements b.y3 {

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ int f6300k = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Context f6301a;

    /* renamed from: b, reason: collision with root package name */
    public final String f6302b;

    /* renamed from: c, reason: collision with root package name */
    public final qq0 f6303c;

    /* renamed from: d, reason: collision with root package name */
    public t70.j0 f6304d;

    /* renamed from: e, reason: collision with root package name */
    public t70.j0 f6305e;

    /* renamed from: f, reason: collision with root package name */
    public kz2 f6306f;

    /* renamed from: g, reason: collision with root package name */
    public jr0 f6307g;

    /* renamed from: h, reason: collision with root package name */
    public final d f6308h;

    /* renamed from: i, reason: collision with root package name */
    public final s1 f6309i;

    /* renamed from: j, reason: collision with root package name */
    public String f6310j;

    public ln3(Context context, String afmaVersion, qq0 flagDataStore) {
        Intrinsics.g(context, "context");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(flagDataStore, "flagDataStore");
        this.f6301a = context;
        this.f6302b = afmaVersion;
        this.f6303c = flagDataStore;
        this.f6308h = new d();
        this.f6309i = m0.c();
    }

    @Override // b.y3
    public final Object a(ContinuationImpl continuationImpl) {
        return a(this, continuationImpl);
    }

    @Override // b.y3
    public final Object b(ContinuationImpl continuationImpl) {
        Object objK = this.f6309i.K(continuationImpl);
        return objK == CoroutineSingletons.f71806a ? objK : Unit.f71706a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a8 A[Catch: all -> 0x00cd, TryCatch #4 {all -> 0x00cd, blocks: (B:39:0x00a4, B:41:0x00a8, B:43:0x00ac, B:45:0x00be, B:55:0x00d3, B:48:0x00c3, B:49:0x00c8, B:53:0x00cf, B:70:0x0137, B:71:0x013c, B:72:0x013d, B:73:0x0142), top: B:89:0x00a4 }] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0111 A[Catch: all -> 0x0135, TryCatch #1 {all -> 0x0135, blocks: (B:59:0x0102, B:61:0x0111, B:62:0x0117), top: B:84:0x0102 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0117 A[Catch: all -> 0x0135, TRY_LEAVE, TryCatch #1 {all -> 0x0135, blocks: (B:59:0x0102, B:61:0x0111, B:62:0x0117), top: B:84:0x0102 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r12v19, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(ln3 ln3Var, ContinuationImpl continuationImpl) throws Throwable {
        in3 in3Var;
        c80.a aVar;
        ln3 ln3Var2;
        c80.a aVar2;
        c80.a aVar3;
        Throwable th2;
        String strA;
        t70.j0 j0Var;
        c80.a aVar4;
        q0 q0Var;
        String strO;
        ln3 ln3Var3;
        if (continuationImpl instanceof in3) {
            in3Var = (in3) continuationImpl;
            int i5 = in3Var.f4895f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                in3Var.f4895f = i5 - Integer.MIN_VALUE;
            } else {
                in3Var = new in3(ln3Var, continuationImpl);
            }
        }
        Object objY = in3Var.f4893d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = in3Var.f4895f;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                aVar = ln3Var.f6308h;
                in3Var.f4890a = ln3Var;
                in3Var.f4891b = aVar;
                in3Var.f4895f = 1;
                if (aVar.e(in3Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 == 2) {
                    aVar2 = (c80.a) in3Var.f4891b;
                    ln3Var2 = (ln3) in3Var.f4890a;
                    ResultKt.b(objY);
                    try {
                        strA = ln3Var2.f6310j;
                        if (strA == null) {
                            jr0 jr0Var = ln3Var2.f6307g;
                            if (jr0Var == null) {
                                Intrinsics.m("flags");
                                throw null;
                            }
                            if (((Boolean) jr0Var.a("gads:webview_initialization_executor:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                                j0Var = ln3Var2.f6305e;
                                if (j0Var == null) {
                                    Intrinsics.m("webViewInitializationScope");
                                    throw null;
                                }
                            } else {
                                j0Var = ln3Var2.f6304d;
                                if (j0Var == null) {
                                    Intrinsics.m("backgroundScope");
                                    throw null;
                                }
                            }
                            c0.c cVar = new c0.c(ln3Var2, j0Var, continuation, 1);
                            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                            Intrinsics.g(context, "context");
                            q0 q0VarE = m0.e(j0Var, context, new e1(cVar, null, 2), 2);
                            qq0 qq0Var = ln3Var2.f6303c;
                            in3Var.f4890a = ln3Var2;
                            in3Var.f4891b = aVar2;
                            in3Var.f4892c = q0VarE;
                            in3Var.f4895f = 3;
                            qq0Var.getClass();
                            Object objB = qq0.b(qq0Var, in3Var);
                            if (objB != coroutineSingletons) {
                                aVar4 = aVar2;
                                q0Var = q0VarE;
                                objY = objB;
                                strO = ((cq0) objY).o();
                                Intrinsics.d(strO);
                                if (strO.length() <= 0) {
                                }
                            }
                            return coroutineSingletons;
                        }
                        ((d) aVar2).g(null);
                        return strA;
                    } catch (Throwable th3) {
                        aVar3 = aVar2;
                        th2 = th3;
                        aVar4 = aVar3;
                        throw th2;
                    }
                }
                if (i11 != 3) {
                    if (i11 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ln3Var3 = (ln3) in3Var.f4891b;
                    aVar3 = (c80.a) in3Var.f4890a;
                    try {
                        ResultKt.b(objY);
                        Intrinsics.f(objY, "await(...)");
                        strA = ln3Var3.a((String) objY);
                        aVar2 = aVar3;
                        ((d) aVar2).g(null);
                        return strA;
                    } catch (Throwable th4) {
                        th2 = th4;
                        aVar4 = aVar3;
                        throw th2;
                    }
                }
                q0Var = in3Var.f4892c;
                c80.a aVar5 = (c80.a) in3Var.f4891b;
                ln3 ln3Var4 = (ln3) in3Var.f4890a;
                try {
                    ResultKt.b(objY);
                    aVar4 = aVar5;
                    ln3Var2 = ln3Var4;
                    try {
                        strO = ((cq0) objY).o();
                        Intrinsics.d(strO);
                        if (strO.length() <= 0) {
                            strA = ln3Var2.a(strO);
                            aVar2 = aVar4;
                            ((d) aVar2).g(null);
                            return strA;
                        }
                        in3Var.f4890a = aVar4;
                        in3Var.f4891b = ln3Var2;
                        in3Var.f4892c = null;
                        in3Var.f4895f = 4;
                        objY = q0Var.y(in3Var);
                        if (objY != coroutineSingletons) {
                            ln3Var3 = ln3Var2;
                            aVar3 = aVar4;
                            Intrinsics.f(objY, "await(...)");
                            strA = ln3Var3.a((String) objY);
                            aVar2 = aVar3;
                            ((d) aVar2).g(null);
                            return strA;
                        }
                        return coroutineSingletons;
                    } catch (Throwable th5) {
                        th2 = th5;
                        throw th2;
                    }
                } catch (Throwable th6) {
                    th2 = th6;
                    aVar3 = aVar5;
                    aVar4 = aVar3;
                    throw th2;
                }
            }
            ?? r12 = (c80.a) in3Var.f4891b;
            ln3 ln3Var5 = (ln3) in3Var.f4890a;
            ResultKt.b(objY);
            aVar = r12;
            ln3Var = ln3Var5;
            String str = ln3Var.f6310j;
            if (str != null) {
                return str;
            }
            d dVar = ln3Var.f6308h;
            in3Var.f4890a = ln3Var;
            in3Var.f4891b = dVar;
            in3Var.f4895f = 2;
            if (dVar.e(in3Var) != coroutineSingletons) {
                ln3Var2 = ln3Var;
                aVar2 = dVar;
                strA = ln3Var2.f6310j;
                if (strA == null) {
                }
                ((d) aVar2).g(null);
                return strA;
            }
            return coroutineSingletons;
        } finally {
            aVar.g(null);
        }
    }

    @Override // b.y3
    public final Object a() {
        d dVar = this.f6308h;
        if (!dVar.f()) {
            return null;
        }
        try {
            return this.f6310j;
        } finally {
            dVar.g(null);
        }
    }

    public final String a(String str) {
        jr0 jr0Var = this.f6307g;
        if (jr0Var != null) {
            if (((Boolean) jr0Var.a("gads:restore_reduced_ua:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                String str2 = Build.VERSION.RELEASE;
                String str3 = Build.MODEL;
                String str4 = Build.ID;
                StringBuilder sbW = c0.w("Android ", str2, "; ", str3, " Build/");
                sbW.append(str4);
                str = r70.j.F0(str, "Android 10; K", sbW.toString(), false);
            }
            String strH = a80.m.h(str, " (Mobile; ", this.f6302b, ")");
            this.f6310j = strH;
            return strH;
        }
        Intrinsics.m("flags");
        throw null;
    }
}
