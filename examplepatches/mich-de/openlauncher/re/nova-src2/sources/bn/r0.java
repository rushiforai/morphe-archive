package bn;

import com.google.firebase.crashlytics.internal.common.CrashlyticsAppQualitySessionsSubscriber;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r0 implements o0 {

    /* renamed from: f, reason: collision with root package name */
    public static final double f18269f = Math.random();

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ int f18270g = 0;

    /* renamed from: a, reason: collision with root package name */
    public final ul.g f18271a;

    /* renamed from: b, reason: collision with root package name */
    public final om.e f18272b;

    /* renamed from: c, reason: collision with root package name */
    public final en.k f18273c;

    /* renamed from: d, reason: collision with root package name */
    public final m f18274d;

    /* renamed from: e, reason: collision with root package name */
    public final CoroutineContext f18275e;

    public r0(ul.g firebaseApp, om.e firebaseInstallations, en.k sessionSettings, m eventGDTLogger, CoroutineContext backgroundDispatcher) {
        Intrinsics.g(firebaseApp, "firebaseApp");
        Intrinsics.g(firebaseInstallations, "firebaseInstallations");
        Intrinsics.g(sessionSettings, "sessionSettings");
        Intrinsics.g(eventGDTLogger, "eventGDTLogger");
        Intrinsics.g(backgroundDispatcher, "backgroundDispatcher");
        this.f18271a = firebaseApp;
        this.f18272b = firebaseInstallations;
        this.f18273c = sessionSettings;
        this.f18274d = eventGDTLogger;
        this.f18275e = backgroundDispatcher;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x0078, code lost:
    
        if (r0.b(r1) == r6) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(r0 r0Var, ContinuationImpl continuationImpl) {
        q0 q0Var;
        en.k kVar = r0Var.f18273c;
        if (continuationImpl instanceof q0) {
            q0Var = (q0) continuationImpl;
            int i5 = q0Var.f18268v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q0Var.f18268v = i5 - Integer.MIN_VALUE;
            } else {
                q0Var = new q0(r0Var, continuationImpl);
            }
        }
        Object objB = q0Var.f18266t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q0Var.f18268v;
        if (i11 == 0) {
            ResultKt.b(objB);
            cn.c cVar = cn.c.f20140a;
            q0Var.f18268v = 1;
            objB = cVar.b(q0Var);
            if (objB != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            Boolean boolA = kVar.f52841a.a();
            if (((boolA == null && (boolA = kVar.f52842b.a()) == null) ? true : boolA.booleanValue()) && f18269f <= kVar.a()) {
                return Boolean.TRUE;
            }
            return Boolean.FALSE;
        }
        ResultKt.b(objB);
        Collection collectionValues = ((Map) objB).values();
        if (!(collectionValues instanceof Collection) || !collectionValues.isEmpty()) {
            Iterator it = collectionValues.iterator();
            while (it.hasNext()) {
                if (((CrashlyticsAppQualitySessionsSubscriber) it.next()).isDataCollectionEnabled()) {
                    q0Var.f18268v = 2;
                }
            }
        }
        return Boolean.FALSE;
    }
}
