package r10;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.util.ComponentKey;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d implements r8.h {

    /* renamed from: a, reason: collision with root package name */
    public final fz.d0 f85125a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f85126b;

    /* renamed from: c, reason: collision with root package name */
    public final mx.k0 f85127c;

    /* renamed from: d, reason: collision with root package name */
    public final ja.h f85128d;

    public d(Context context, fz.d0 d0Var, Uri uri) {
        this.f85125a = d0Var;
        this.f85126b = uri;
        this.f85127c = new mx.k0(context, 0, 0, null, false, e10.q.f51751d, false, 0, 158);
        this.f85128d = (ja.h) ja.h.f69294h.h(context);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r8.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        c cVar;
        Bitmap bitmapCopy;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f85121v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f85121v = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, (ContinuationImpl) continuation);
            }
        }
        Object objQ = cVar.f85119t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f85121v;
        if (i11 == 0) {
            ResultKt.b(objQ);
            Uri uri = this.f85126b;
            String authority = uri.getAuthority();
            Intrinsics.d(authority);
            ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(authority);
            Intrinsics.d(componentNameUnflattenFromString);
            Long l9 = null;
            try {
                String fragment = uri.getFragment();
                if (fragment != null) {
                    l9 = new Long(Long.parseLong(fragment));
                }
            } catch (NumberFormatException unused) {
            }
            UserHandle userHandleE = l9 != null ? this.f85128d.e(l9.longValue()) : Process.myUserHandle();
            boolean zB = Intrinsics.b(uri.getQueryParameter("notheme"), InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
            fz.d0 d0Var = this.f85125a;
            if (zB) {
                bitmapCopy = this.f85127c.d(d0Var.k(d0Var.f556b.getPackageManager().getActivityInfo(componentNameUnflattenFromString, 0)), userHandleE, true).f21151a;
                return new r8.e(4, new aa.n(bitmapCopy, 0, false), false);
            }
            ComponentKey componentKey = new ComponentKey(componentNameUnflattenFromString, userHandleE);
            cVar.f85121v = 1;
            objQ = d0Var.Q(componentKey, cVar);
            if (objQ == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objQ);
        }
        Intrinsics.d(objQ);
        Bitmap bitmap = ((BitmapInfo) objQ).f21151a;
        Intrinsics.d(bitmap);
        bitmapCopy = bitmap.copy(Bitmap.Config.ARGB_8888, false);
        return new r8.e(4, new aa.n(bitmapCopy, 0, false), false);
    }
}
