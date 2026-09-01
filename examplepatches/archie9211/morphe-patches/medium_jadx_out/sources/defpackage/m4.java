package defpackage;

import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.credentials.CreateCredentialResponse;
import android.credentials.Credential;
import android.credentials.GetCredentialResponse;
import android.graphics.ColorSpace;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.http.CallbackException;
import android.net.http.HttpException;
import android.net.http.InlineExecutionProhibitedException;
import android.net.http.NetworkException;
import android.net.http.QuicException;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.text.GraphemeClusterSegmentFinder;
import android.text.Layout;
import android.util.Log;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.CursorAnchorInfo;
import android.view.inputmethod.DeleteGesture;
import android.view.inputmethod.DeleteRangeGesture;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.HandwritingGesture;
import android.view.inputmethod.InsertGesture;
import android.view.inputmethod.JoinOrSplitGesture;
import android.view.inputmethod.PreviewableHandwritingGesture;
import android.view.inputmethod.RemoveSpaceGesture;
import android.view.inputmethod.SelectGesture;
import android.view.inputmethod.SelectRangeGesture;
import android.widget.TextView;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.navigation.fragment.NavHostFragment;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.reader.R;
import java.util.Iterator;
import java.util.List;
import org.chromium.net.CronetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m4 {
    /* JADX WARN: Removed duplicated region for block: B:140:0x0264  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int A(defpackage.kx6 r16, android.view.inputmethod.HandwritingGesture r17, defpackage.lid r18, defpackage.zte r19, defpackage.eb8 r20) {
        /*
            Method dump skipped, instruction units count: 796
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m4.A(kx6, android.view.inputmethod.HandwritingGesture, lid, zte, eb8):int");
    }

    public static boolean B(kx6 kx6Var, PreviewableHandwritingGesture previewableHandwritingGesture, lid lidVar, CancellationSignal cancellationSignal) {
        pjd pjdVar;
        mx mxVar = kx6Var.j;
        if (mxVar != null) {
            rjd rjdVarD = kx6Var.d();
            if (mxVar.equals((rjdVarD == null || (pjdVar = rjdVarD.a.a) == null) ? null : pjdVar.a)) {
                int i = 1;
                if (previewableHandwritingGesture instanceof SelectGesture) {
                    SelectGesture selectGesture = (SelectGesture) previewableHandwritingGesture;
                    if (lidVar != null) {
                        long jH = guc.H(kx6Var, kk7.G(selectGesture.getSelectionArea()), selectGesture.getGranularity() != 1 ? 0 : 1);
                        kx6 kx6Var2 = lidVar.d;
                        if (kx6Var2 != null) {
                            kx6Var2.f(jH);
                        }
                        kx6 kx6Var3 = lidVar.d;
                        if (kx6Var3 != null) {
                            kx6Var3.e(bkd.b);
                        }
                        if (!bkd.c(jH)) {
                            lidVar.u(false);
                            lidVar.r(ci5.None);
                        }
                    }
                } else if (previewableHandwritingGesture instanceof DeleteGesture) {
                    DeleteGesture deleteGesture = (DeleteGesture) previewableHandwritingGesture;
                    if (lidVar != null) {
                        long jH2 = guc.H(kx6Var, kk7.G(deleteGesture.getDeletionArea()), deleteGesture.getGranularity() != 1 ? 0 : 1);
                        kx6 kx6Var4 = lidVar.d;
                        if (kx6Var4 != null) {
                            kx6Var4.e(jH2);
                        }
                        kx6 kx6Var5 = lidVar.d;
                        if (kx6Var5 != null) {
                            kx6Var5.f(bkd.b);
                        }
                        if (!bkd.c(jH2)) {
                            lidVar.u(false);
                            lidVar.r(ci5.None);
                        }
                    }
                } else if (previewableHandwritingGesture instanceof SelectRangeGesture) {
                    SelectRangeGesture selectRangeGesture = (SelectRangeGesture) previewableHandwritingGesture;
                    if (lidVar != null) {
                        long jI = guc.I(kx6Var, kk7.G(selectRangeGesture.getSelectionStartArea()), kk7.G(selectRangeGesture.getSelectionEndArea()), selectRangeGesture.getGranularity() != 1 ? 0 : 1);
                        kx6 kx6Var6 = lidVar.d;
                        if (kx6Var6 != null) {
                            kx6Var6.f(jI);
                        }
                        kx6 kx6Var7 = lidVar.d;
                        if (kx6Var7 != null) {
                            kx6Var7.e(bkd.b);
                        }
                        if (!bkd.c(jI)) {
                            lidVar.u(false);
                            lidVar.r(ci5.None);
                        }
                    }
                } else if (previewableHandwritingGesture instanceof DeleteRangeGesture) {
                    DeleteRangeGesture deleteRangeGesture = (DeleteRangeGesture) previewableHandwritingGesture;
                    if (lidVar != null) {
                        long jI2 = guc.I(kx6Var, kk7.G(deleteRangeGesture.getDeletionStartArea()), kk7.G(deleteRangeGesture.getDeletionEndArea()), deleteRangeGesture.getGranularity() != 1 ? 0 : 1);
                        kx6 kx6Var8 = lidVar.d;
                        if (kx6Var8 != null) {
                            kx6Var8.e(jI2);
                        }
                        kx6 kx6Var9 = lidVar.d;
                        if (kx6Var9 != null) {
                            kx6Var9.f(bkd.b);
                        }
                        if (!bkd.c(jI2)) {
                            lidVar.u(false);
                            lidVar.r(ci5.None);
                        }
                    }
                }
                if (cancellationSignal != null) {
                    cancellationSignal.setOnCancelListener(new m12(i, lidVar));
                }
                return true;
            }
        }
        return false;
    }

    public static void C(PendingIntent pendingIntent) {
        try {
            pendingIntent.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
        } catch (PendingIntent.CanceledException e) {
            Log.e("TextClassification", "error sending pendingIntent: " + pendingIntent + " error: " + e);
        }
    }

    public static void D(AccessibilityEvent accessibilityEvent, boolean z) {
        accessibilityEvent.setAccessibilityDataSensitive(z);
    }

    public static void E(AccessibilityNodeInfo accessibilityNodeInfo, boolean z) {
        accessibilityNodeInfo.setAccessibilityDataSensitive(z);
    }

    public static void F(EditorInfo editorInfo) {
        editorInfo.setSupportedHandwritingGestures(d46.R(SelectGesture.class, DeleteGesture.class, SelectRangeGesture.class, DeleteRangeGesture.class, JoinOrSplitGesture.class, InsertGesture.class, RemoveSpaceGesture.class));
        editorInfo.setSupportedHandwritingGesturePreviews(k80.S0(new Class[]{SelectGesture.class, DeleteGesture.class, SelectRangeGesture.class, DeleteRangeGesture.class}));
    }

    public static void G(TextView textView, int i, float f) {
        textView.setLineHeight(i, f);
    }

    public static final b24 H(int i, Throwable th) {
        if (i == 400) {
            return new w14(th, false);
        }
        if (i == 401) {
            return new a24(th);
        }
        if (i == 403) {
            return new v14(th != null ? th.getMessage() : null, th);
        }
        if (i == 404) {
            return new y14(th != null ? th.getMessage() : null, th);
        }
        if (i == 412) {
            return new w14(th, false);
        }
        if (i == 415) {
            return new w14(th, false);
        }
        if (i == 422) {
            return new w14(th, false);
        }
        if (i == 429) {
            return new w14(th, false);
        }
        switch (i) {
            case 408:
                return new x14(th, true);
            case 409:
                return new w14(th, false);
            case 410:
                return new w14(th, false);
            default:
                switch (i) {
                    case 500:
                        return new z14(th, false);
                    case 501:
                        return new z14(th, false);
                    case 502:
                        return new z14(th, true);
                    case 503:
                        return new z14(th, true);
                    case 504:
                        return new z14(th, true);
                    case 505:
                        return new z14(th, false);
                    default:
                        return null;
                }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x0092  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.b24 I(java.lang.Throwable r4) {
        /*
            Method dump skipped, instruction units count: 210
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m4.I(java.lang.Throwable):b24");
    }

    public static CronetException J(Exception exc) {
        if (!y30.C(exc)) {
            throw new IllegalArgumentException("Not an Android Cronet exception", exc);
        }
        if (mm.h(exc)) {
            QuicException quicException = (QuicException) exc;
            wr wrVar = new wr(quicException.getMessage(), quicException);
            new qq(quicException, true);
            return wrVar;
        }
        if (exc instanceof NetworkException) {
            return new qq((NetworkException) exc, false);
        }
        if (exc instanceof CallbackException) {
            CallbackException callbackException = (CallbackException) exc;
            return new om(callbackException.getMessage(), callbackException.getCause());
        }
        HttpException httpException = (HttpException) exc;
        return new vp(httpException.getMessage(), httpException);
    }

    public static final bo4 K(Context context, int i) {
        db8 db8VarI = i(context);
        db8VarI.getClass();
        ba8 ba8VarF = db8VarI.b.f();
        if (ba8VarF == null) {
            return cy3.a;
        }
        nv6 nv6Var = new nv6(new zz(ba8VarF.a().c("navController:destination_result", null), 7), i, 1);
        wn7 wn7Var = new wn7(26);
        qna qnaVar = m40.k;
        pwd.B(2, wn7Var);
        return new to4(new u50(9, m40.K(nv6Var, qnaVar, wn7Var)), new lo5(ba8VarF, null, 8), 3);
    }

    public static final void a(CursorAnchorInfo.Builder builder, qjd qjdVar, zwa zwaVar) {
        if (zwaVar.f()) {
            return;
        }
        f58 f58Var = qjdVar.b;
        int i = f58Var.f - 1;
        if (i < 0) {
            i = 0;
        }
        int iV = iq7.v(f58Var.e(zwaVar.b), 0, i);
        int iV2 = iq7.v(f58Var.e(zwaVar.d), 0, i);
        if (iV > iV2) {
            return;
        }
        while (true) {
            builder.addVisibleLineBounds(qjdVar.e(iV), f58Var.f(iV), qjdVar.f(iV), f58Var.b(iV));
            if (iV == iV2) {
                return;
            } else {
                iV++;
            }
        }
    }

    public static final void b(CursorAnchorInfo.Builder builder, qjd qjdVar, zwa zwaVar) {
        if (zwaVar.f()) {
            return;
        }
        f58 f58Var = qjdVar.b;
        int i = f58Var.f - 1;
        if (i < 0) {
            i = 0;
        }
        int iV = iq7.v(f58Var.e(zwaVar.b), 0, i);
        int iV2 = iq7.v(f58Var.e(zwaVar.d), 0, i);
        if (iV > iV2) {
            return;
        }
        while (true) {
            builder.addVisibleLineBounds(qjdVar.e(iV), f58Var.f(iV), qjdVar.f(iV), f58Var.b(iV));
            if (iV == iV2) {
                return;
            } else {
                iV++;
            }
        }
    }

    public static void c(pi2 pi2Var) throws Exception {
        try {
            pi2Var.run();
        } catch (Exception e) {
            if (e instanceof InlineExecutionProhibitedException) {
                org.chromium.net.InlineExecutionProhibitedException inlineExecutionProhibitedException = new org.chromium.net.InlineExecutionProhibitedException();
                inlineExecutionProhibitedException.initCause(e);
                throw inlineExecutionProhibitedException;
            }
            if (e instanceof HttpException) {
                throw J(e);
            }
            if (!Exception.class.isInstance(e)) {
                throw e;
            }
            throw e;
        }
    }

    public static CreateCredentialException d(Intent intent) {
        android.credentials.CreateCredentialException createCredentialException = (android.credentials.CreateCredentialException) intent.getSerializableExtra("android.service.credentials.extra.CREATE_CREDENTIAL_EXCEPTION", android.credentials.CreateCredentialException.class);
        if (createCredentialException == null) {
            return null;
        }
        String type = createCredentialException.getType();
        type.getClass();
        return qb8.d0(createCredentialException.getMessage(), type);
    }

    public static bf2 e(Intent intent, String str) {
        CreateCredentialResponse createCredentialResponse = (CreateCredentialResponse) intent.getParcelableExtra("android.service.credentials.extra.CREATE_CREDENTIAL_RESPONSE", CreateCredentialResponse.class);
        if (createCredentialResponse == null) {
            return null;
        }
        Bundle data = createCredentialResponse.getData();
        data.getClass();
        return w2g.p(str, data);
    }

    public static GetCredentialException f(Intent intent) {
        android.credentials.GetCredentialException getCredentialException = (android.credentials.GetCredentialException) intent.getSerializableExtra("android.service.credentials.extra.GET_CREDENTIAL_EXCEPTION", android.credentials.GetCredentialException.class);
        if (getCredentialException == null) {
            return null;
        }
        String type = getCredentialException.getType();
        type.getClass();
        return qb8.e0(getCredentialException.getMessage(), type);
    }

    public static k95 g(Intent intent) {
        GetCredentialResponse getCredentialResponse = (GetCredentialResponse) intent.getParcelableExtra("android.service.credentials.extra.GET_CREDENTIAL_RESPONSE", GetCredentialResponse.class);
        if (getCredentialResponse == null) {
            return null;
        }
        Credential credential = getCredentialResponse.getCredential();
        credential.getClass();
        String type = credential.getType();
        type.getClass();
        Bundle data = credential.getData();
        data.getClass();
        return new k95(kng.t(type, data));
    }

    public static int h(HandwritingGesture handwritingGesture, eb8 eb8Var) {
        String fallbackText = handwritingGesture.getFallbackText();
        if (fallbackText == null) {
            return 3;
        }
        eb8Var.invoke(new ax1(fallbackText, 1));
        return 5;
    }

    public static final db8 i(Context context) {
        i10 i10VarO0 = ht2.o0(context);
        if (!(i10VarO0 instanceof MainActivity)) {
            ik4.o("Expected to be called via the MainActivity but was ", i10VarO0);
            return null;
        }
        j15 j15VarC = ((MainActivity) i10VarO0).m().C(R.id.nav_host_fragment);
        j15VarC.getClass();
        return ((NavHostFragment) j15VarC).Y();
    }

    public static JobScheduler j(JobScheduler jobScheduler) {
        JobScheduler jobSchedulerForNamespace = jobScheduler.forNamespace("androidx.work.systemjobscheduler");
        jobSchedulerForNamespace.getClass();
        return jobSchedulerForNamespace;
    }

    public static AccessibilityNodeInfo.AccessibilityAction k() {
        return AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_IN_DIRECTION;
    }

    public static float l(VelocityTracker velocityTracker, int i) {
        return velocityTracker.getAxisVelocity(i);
    }

    public static void m(AccessibilityNodeInfo accessibilityNodeInfo, Rect rect) {
        accessibilityNodeInfo.getBoundsInWindow(rect);
    }

    public static CharSequence n(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.getContainerTitle();
    }

    public static int[] o(ojd ojdVar, RectF rectF, int i, final k6c k6cVar) {
        return ojdVar.f.getRangeForRect(rectF, i == 1 ? new zy(new d2f(ojdVar.f.getText(), 1, ojdVar.j())) : new GraphemeClusterSegmentFinder(ojdVar.f.getText(), ojdVar.a), new Layout.TextInclusionStrategy() { // from class: zp
            @Override // android.text.Layout.TextInclusionStrategy
            public final boolean isSegmentInside(RectF rectF2, RectF rectF3) {
                return ((Boolean) k6cVar.invoke(rectF2, rectF3)).booleanValue();
            }
        });
    }

    public static float p(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledHandwritingGestureLineMargin();
    }

    public static float q(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledHandwritingSlop();
    }

    public static int r(ViewConfiguration viewConfiguration, int i, int i2, int i3) {
        return viewConfiguration.getScaledMaximumFlingVelocity(i, i2, i3);
    }

    public static int s(ViewConfiguration viewConfiguration, int i, int i2, int i3) {
        return viewConfiguration.getScaledMinimumFlingVelocity(i, i2, i3);
    }

    public static boolean t(AccessibilityNodeInfo accessibilityNodeInfo) {
        return accessibilityNodeInfo.isAccessibilityDataSensitive();
    }

    public static boolean u(AccessibilityManager accessibilityManager) {
        return accessibilityManager.isRequestFromAccessibilityTool();
    }

    public static final void v(Context context, int i, Bundle bundle, ob8 ob8Var, w6 w6Var) throws PendingIntent.CanceledException {
        context.getClass();
        i10 i10VarO0 = ht2.o0(context);
        if (i10VarO0 instanceof MainActivity) {
            j15 j15VarC = ((MainActivity) i10VarO0).m().C(R.id.nav_host_fragment);
            j15VarC.getClass();
            ((NavHostFragment) j15VarC).Y().c(i, bundle, ob8Var, w6Var);
            return;
        }
        uz5 uz5Var = new uz5(context);
        uz5Var.n();
        ((Intent) uz5Var.c).setComponent(new ComponentName(context, (Class<?>) MainActivity.class));
        if (i == R.id.homeFragment) {
            uz5Var.a(R.id.homeFragment, bundle);
        } else {
            Bundle bundle2 = new Bundle();
            bundle2.putParcelable("bundle_info", new HomeFragment.BundleInfo(""));
            uz5Var.a(R.id.homeFragment, bundle2);
            uz5Var.a(i, bundle);
        }
        PendingIntent pendingIntentB = uz5Var.b();
        if (Build.VERSION.SDK_INT >= 34) {
            pendingIntentB.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
        } else {
            pendingIntentB.send();
        }
    }

    public static /* synthetic */ void w(Context context, int i, Bundle bundle, ob8 ob8Var, int i2) throws PendingIntent.CanceledException {
        if ((i2 & 2) != 0) {
            bundle = null;
        }
        if ((i2 & 4) != 0) {
            ob8Var = qb8.V();
        }
        v(context, i, bundle, ob8Var, null);
    }

    public static final void x(Context context, List list) throws PendingIntent.CanceledException {
        context.getClass();
        list.isEmpty();
        i10 i10VarO0 = ht2.o0(context);
        if (i10VarO0 instanceof MainActivity) {
            j15 j15VarC = ((MainActivity) i10VarO0).m().C(R.id.nav_host_fragment);
            j15VarC.getClass();
            NavHostFragment navHostFragment = (NavHostFragment) j15VarC;
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                la3 la3Var = (la3) it2.next();
                navHostFragment.Y().c(la3Var.a, la3Var.b, la3Var.c, null);
            }
            return;
        }
        uz5 uz5Var = new uz5(context);
        uz5Var.n();
        ((Intent) uz5Var.c).setComponent(new ComponentName(context, (Class<?>) MainActivity.class));
        int i = 0;
        for (Object obj : list) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            la3 la3Var2 = (la3) obj;
            if (i == 0 && la3Var2.a != R.id.homeFragment) {
                Bundle bundle = new Bundle();
                bundle.putParcelable("bundle_info", new HomeFragment.BundleInfo(""));
                uz5Var.a(R.id.homeFragment, bundle);
            }
            uz5Var.a(la3Var2.a, la3Var2.b);
            i = i2;
        }
        PendingIntent pendingIntentB = uz5Var.b();
        if (Build.VERSION.SDK_INT >= 34) {
            pendingIntentB.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
        } else {
            pendingIntentB.send();
        }
    }

    public static final ColorSpace y(jv1 jv1Var) {
        if (g76.L(jv1Var, lv1.v)) {
            return ColorSpace.get(ColorSpace.Named.BT2020_HLG);
        }
        if (g76.L(jv1Var, lv1.w)) {
            return ColorSpace.get(ColorSpace.Named.BT2020_PQ);
        }
        return null;
    }

    public static void z(long j, mx mxVar, boolean z, eb8 eb8Var) {
        if (z) {
            int i = bkd.c;
            int iCharCount = (int) (j >> 32);
            int iCharCount2 = (int) (j & 4294967295L);
            int iCodePointBefore = iCharCount > 0 ? Character.codePointBefore(mxVar, iCharCount) : 10;
            int iCodePointAt = iCharCount2 < mxVar.b.length() ? Character.codePointAt(mxVar, iCharCount2) : 10;
            if (guc.P(iCodePointBefore) && (guc.O(iCodePointAt) || guc.N(iCodePointAt))) {
                do {
                    iCharCount -= Character.charCount(iCodePointBefore);
                    if (iCharCount == 0) {
                        break;
                    } else {
                        iCodePointBefore = Character.codePointBefore(mxVar, iCharCount);
                    }
                } while (guc.P(iCodePointBefore));
                j = lk7.q(iCharCount, iCharCount2);
            } else if (guc.P(iCodePointAt) && (guc.O(iCodePointBefore) || guc.N(iCodePointBefore))) {
                do {
                    iCharCount2 += Character.charCount(iCodePointAt);
                    if (iCharCount2 == mxVar.b.length()) {
                        break;
                    } else {
                        iCodePointAt = Character.codePointAt(mxVar, iCharCount2);
                    }
                } while (guc.P(iCodePointAt));
                j = lk7.q(iCharCount, iCharCount2);
            }
        }
        int i2 = (int) (4294967295L & j);
        eb8Var.invoke(new ki5(new fp3[]{new t1c(i2, i2), new z53(bkd.d(j), 0)}));
    }
}
