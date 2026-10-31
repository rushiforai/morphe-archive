package mk;

import aa.i0;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.IntentFilter;
import android.graphics.Point;
import android.graphics.SurfaceTexture;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseArray;
import android.view.SurfaceHolder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.Toast;
import androidx.work.Worker;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.android.launcher3.WallpaperCropActivity;
import com.google.android.gms.cloudmessaging.zzt;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiActivity;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zay;
import com.google.android.gms.internal.measurement.td;
import com.google.android.gms.signin.internal.zak;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ScheduledExecutorService;
import kotlin.Unit;
import o9.h3;
import o9.s2;
import o9.x3;
import rg.d0;
import rg.x;
import sp.m0;
import t70.k1;

/* loaded from: classes3.dex */
public final /* synthetic */ class w implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76491a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f76492b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f76493c;

    public /* synthetic */ w(int i5, Object obj, Object obj2) {
        this.f76491a = i5;
        this.f76492b = obj;
        this.f76493c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v29, types: [java.lang.Object, rg.h] */
    /* JADX WARN: Type inference failed for: r4v31, types: [java.lang.Object, rg.h] */
    @Override // java.lang.Runnable
    public final void run() {
        int iB;
        int iB2;
        sg.g gVar;
        x7.q qVar = null;
        int i5 = 1;
        switch (this.f76491a) {
            case 0:
                f fVar = (f) this.f76492b;
                Bundle bundle = (Bundle) this.f76493c;
                try {
                    lk.f fVar2 = (lk.f) ((IInterface) fVar.f76431b.f76470k);
                    if (fVar2 == null) {
                        return;
                    }
                    e eVar = fVar.f76433d;
                    lk.d dVar = (lk.d) fVar2;
                    Parcel parcelX = dVar.X();
                    parcelX.writeInt(1);
                    bundle.writeToParcel(parcelX, 0);
                    if (eVar == null) {
                        parcelX.writeStrongBinder(null);
                    } else {
                        parcelX.writeStrongBinder(eVar);
                    }
                    dVar.Y(parcelX, 4);
                    return;
                } catch (DeadObjectException e3) {
                    Log.e("HsdpClientImpl", "hsdpService is dead", e3);
                    return;
                } catch (RemoteException e11) {
                    Log.e("HsdpClientImpl", "Failed to call hsdpService.endSession", e11);
                    return;
                }
            case 1:
                ((n4.d) this.f76492b).f77782a = this.f76493c;
                return;
            case 2:
                ((Application) this.f76492b).unregisterActivityLifecycleCallbacks((n4.d) this.f76493c);
                return;
            case 3:
                Object obj = this.f76493c;
                Object obj2 = this.f76492b;
                try {
                    Method method = n4.e.f77791d;
                    if (method != null) {
                        method.invoke(obj2, obj, Boolean.FALSE, "AppCompat recreation");
                    } else {
                        n4.e.f77792e.invoke(obj2, obj, Boolean.FALSE);
                    }
                    return;
                } catch (RuntimeException e12) {
                    if (e12.getClass() == RuntimeException.class && e12.getMessage() != null && e12.getMessage().startsWith("Unable to stop")) {
                        throw e12;
                    }
                    return;
                } catch (Throwable th2) {
                    Log.e("ActivityRecreator", "Exception while invoking performStopActivity", th2);
                    return;
                }
            case 4:
                o6.a aVar = (o6.a) this.f76493c;
                Object obj3 = this.f76492b;
                if (aVar.f79612c.get()) {
                    mg.d dVar2 = aVar.f79614e;
                    if (dVar2.f76292i == aVar) {
                        SystemClock.uptimeMillis();
                        dVar2.f76292i = null;
                        dVar2.b();
                    }
                } else {
                    mg.d dVar3 = aVar.f79614e;
                    if (dVar3.f76291h != aVar) {
                        if (dVar3.f76292i == aVar) {
                            SystemClock.uptimeMillis();
                            dVar3.f76292i = null;
                            dVar3.b();
                        }
                    } else if (!dVar3.f76287d) {
                        SystemClock.uptimeMillis();
                        dVar3.f76291h = null;
                        n6.b bVar = dVar3.f76284a;
                        if (bVar != null) {
                            if (Looper.myLooper() == Looper.getMainLooper()) {
                                bVar.j(obj3);
                            } else {
                                bVar.k(obj3);
                            }
                        }
                    }
                }
                aVar.f79611b = 3;
                return;
            case 5:
                try {
                    ((Worker) this.f76493c).getClass();
                    throw new IllegalStateException("Expedited WorkRequests require a Worker to provide an implementation for \n `getForegroundInfo()`");
                } catch (Throwable th3) {
                    ((z7.j) this.f76492b).k(th3);
                    return;
                }
            case 6:
                s2 s2Var = (s2) this.f76493c;
                View view = (View) this.f76492b;
                int iIndexOfChild = s2Var.indexOfChild(view);
                if (iIndexOfChild == -1) {
                    return;
                }
                int iMax = Math.max(0, s2Var.getChildCount() - 1);
                Object[] objArr = iMax == 0 || iIndexOfChild > 0;
                if (objArr != false) {
                    s2Var.n0(iIndexOfChild - 1, true);
                }
                int iMin = Math.min(iMax, s2Var.getChildCount() - 1);
                int i11 = objArr != false ? 0 : iIndexOfChild + 1;
                if (objArr != false) {
                    iMin = iIndexOfChild - 1;
                }
                ArrayList arrayList = new ArrayList();
                while (i11 <= iMin) {
                    View childAt = s2Var.getChildAt(i11);
                    if (objArr == true) {
                        iB = i11 == 0 ? (s2Var.B(i11) - s2Var.getChildAt(i11).getMeasuredWidth()) - s2Var.f80112l : s2Var.B(i11 - 1);
                        iB2 = s2Var.B(i11);
                    } else {
                        iB = s2Var.B(i11) - s2Var.B(i11 - 1);
                        iB2 = 0;
                    }
                    childAt.setAlpha(Math.max(childAt.getAlpha(), 0.01f));
                    childAt.setTranslationX(iB - iB2);
                    AnimatorSet animatorSet = new AnimatorSet();
                    animatorSet.playTogether(ObjectAnimator.ofFloat(childAt, "translationX", 0.0f), ObjectAnimator.ofFloat(childAt, "alpha", 1.0f));
                    arrayList.add(animatorSet);
                    int i12 = s2.S;
                    childAt.setTag(2131428979, animatorSet);
                    i11++;
                }
                AnimatorSet animatorSet2 = new AnimatorSet();
                animatorSet2.playTogether(arrayList);
                animatorSet2.setDuration(s2Var.Q);
                animatorSet2.addListener(new i0(this, 14));
                animatorSet2.start();
                s2Var.removeView(view);
                s2Var.V(iIndexOfChild, view);
                return;
            case 7:
                WallpaperCropActivity wallpaperCropActivity = (WallpaperCropActivity) this.f76493c;
                if (((hb.c) this.f76492b).f59595d == 2) {
                    wallpaperCropActivity.f20988p.setEnabled(true);
                    return;
                } else {
                    Toast.makeText(wallpaperCropActivity, wallpaperCropActivity.getString(2132020332), 1).show();
                    wallpaperCropActivity.finish();
                    return;
                }
            case 8:
                if (((h3) this.f76492b).getStatus() != AsyncTask.Status.FINISHED) {
                    ((View) this.f76493c).setVisibility(0);
                    return;
                }
                return;
            case 9:
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = (LauncherWallpaperPickerActivity) this.f76493c;
                Point point = (Point) this.f76492b;
                launcherWallpaperPickerActivity.h0(point.x, point.y);
                launcherWallpaperPickerActivity.setResult(-1);
                launcherWallpaperPickerActivity.finish();
                return;
            case 10:
                Runnable runnable = (Runnable) this.f76492b;
                if (runnable != null) {
                    runnable.run();
                }
                ((LauncherWallpaperPickerActivity) this.f76493c).p0(false);
                return;
            case 11:
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity2 = (LauncherWallpaperPickerActivity) this.f76492b;
                x3 x3Var = (x3) this.f76493c;
                hb.c cVar = x3Var.f80249e;
                if (cVar != null && cVar.f59595d == 2) {
                    launcherWallpaperPickerActivity2.o0(x3Var.f80263a);
                    launcherWallpaperPickerActivity2.f20988p.setEnabled(true);
                    return;
                }
                ViewGroup viewGroup = (ViewGroup) x3Var.f80263a.getParent();
                if (viewGroup != null) {
                    viewGroup.removeView(x3Var.f80263a);
                    Toast.makeText(launcherWallpaperPickerActivity2, launcherWallpaperPickerActivity2.getString(2132018039), 0).show();
                    return;
                }
                return;
            case 12:
                IBinder iBinder = (IBinder) this.f76493c;
                og.e eVar2 = (og.e) this.f76492b;
                synchronized (eVar2) {
                    if (iBinder == null) {
                        eVar2.e("Null service connection");
                    } else {
                        try {
                            eVar2.f80394c = new m.w(iBinder);
                            eVar2.f80392a = 2;
                            ((ScheduledExecutorService) eVar2.f80397f.f80408c).execute(new og.d(eVar2, i5));
                        } catch (RemoteException e13) {
                            eVar2.e(e13.getMessage());
                        }
                    }
                }
                return;
            case 13:
                og.f fVar3 = (og.f) this.f76493c;
                og.e eVar3 = (og.e) this.f76492b;
                int i13 = fVar3.f80398a;
                synchronized (eVar3) {
                    SparseArray sparseArray = eVar3.f80396e;
                    og.f fVar4 = (og.f) sparseArray.get(i13);
                    if (fVar4 != null) {
                        StringBuilder sb2 = new StringBuilder(String.valueOf(i13).length() + 20);
                        sb2.append("Timing out request: ");
                        sb2.append(i13);
                        Log.w("MessengerIpcClient", sb2.toString());
                        sparseArray.remove(i13);
                        fVar4.c(new zzt("Timed out waiting for response", null));
                        eVar3.l();
                    }
                }
                return;
            case 14:
                AnimatorSet animatorSet3 = ((ra.c) ((ra.f) this.f76493c).f85760b).f85756e;
                AnimatorSet animatorSet4 = (AnimatorSet) this.f76492b;
                if (animatorSet3 != animatorSet4) {
                    return;
                }
                animatorSet4.start();
                return;
            case 15:
                ConnectionResult connectionResult = (ConnectionResult) this.f76492b;
                ox.q qVar2 = (ox.q) this.f76493c;
                rg.e eVar4 = (rg.e) qVar2.f81106f;
                qg.c cVar2 = (qg.c) qVar2.f81102b;
                rg.p pVar = (rg.p) eVar4.f85883j.get((rg.a) qVar2.f81103c);
                if (pVar == null) {
                    return;
                }
                if (connectionResult.f31779g != 0) {
                    pVar.l(connectionResult, null);
                    return;
                }
                qVar2.f81101a = true;
                if (cVar2.requiresSignIn()) {
                    if (!qVar2.f81101a || (gVar = (sg.g) qVar2.f81104d) == null) {
                        return;
                    }
                    ((sg.e) cVar2).getRemoteService(gVar, (Set) qVar2.f81105e);
                    return;
                }
                try {
                    sg.f fVar5 = (sg.f) cVar2;
                    ((sg.e) cVar2).getRemoteService(null, fVar5.requiresSignIn() ? fVar5.f87429b : Collections.EMPTY_SET);
                    return;
                } catch (SecurityException e14) {
                    Log.e("GoogleApiManager", "Failed to get service from broker. ", e14);
                    ((sg.e) cVar2).disconnect("Failed to get service from broker.");
                    pVar.l(new ConnectionResult(10, null, null), null);
                    return;
                }
            case 16:
                td tdVar = (td) this.f76492b;
                rg.j jVar = (rg.j) this.f76493c;
                rg.i iVar = (rg.i) tdVar.f33084b;
                if (iVar == null) {
                    return;
                }
                jVar.e(iVar.f85889a);
                return;
            case 17:
                x xVar = (x) this.f76493c;
                zak zakVar = (zak) this.f76492b;
                xVar.getClass();
                ConnectionResult connectionResult2 = zakVar.f33819g;
                if (connectionResult2.f31779g == 0) {
                    zay zayVar = zakVar.f33820h;
                    sg.w.h(zayVar);
                    ConnectionResult connectionResult3 = zayVar.f31877h;
                    if (connectionResult3.f31779g != 0) {
                        Log.wtf("SignInCoordinator", "Sign-in succeeded with resolve account failure: ".concat(String.valueOf(connectionResult3)), new Exception());
                        xVar.f85940h.j(connectionResult3);
                        xVar.f85939g.disconnect();
                        return;
                    }
                    ox.q qVar3 = xVar.f85940h;
                    IBinder iBinder2 = zayVar.f31876g;
                    sg.g gVarU = iBinder2 == null ? null : sg.a.U(iBinder2);
                    Set<Scope> set = xVar.f85937e;
                    qVar3.getClass();
                    if (gVarU == null || set == null) {
                        Log.wtf("GoogleApiManager", "Received null response from onSignInSuccess", new Exception());
                        qVar3.j(new ConnectionResult(4, null, null));
                    } else {
                        qVar3.f81104d = gVarU;
                        qVar3.f81105e = set;
                        if (qVar3.f81101a) {
                            ((sg.e) ((qg.c) qVar3.f81102b)).getRemoteService(gVarU, set);
                        }
                    }
                } else {
                    xVar.f85940h.j(connectionResult2);
                }
                xVar.f85939g.disconnect();
                return;
            case 18:
                rg.n nVar = (rg.n) this.f76493c;
                if (nVar.f85896b) {
                    d0 d0Var = (d0) this.f76492b;
                    ConnectionResult connectionResult4 = d0Var.f85869b;
                    if (connectionResult4.f31779g != 0 && connectionResult4.f31780h != null) {
                        ?? r42 = nVar.f85895a;
                        Activity activityA = nVar.a();
                        PendingIntent pendingIntent = connectionResult4.f31780h;
                        sg.w.h(pendingIntent);
                        r42.startActivityForResult(GoogleApiActivity.a(activityA, pendingIntent, d0Var.f85868a, false), 1);
                        return;
                    }
                    Activity activityA2 = nVar.a();
                    int i14 = connectionResult4.f31779g;
                    pg.b bVar2 = nVar.f85899e;
                    if (bVar2.a(activityA2, i14, null) != null) {
                        bVar2.f(nVar.a(), nVar.f85895a, connectionResult4.f31779g, nVar);
                        return;
                    }
                    if (connectionResult4.f31779g != 18) {
                        int i15 = d0Var.f85868a;
                        nVar.f85897c.set(null);
                        nVar.f85901g.h(connectionResult4, i15);
                        return;
                    }
                    Activity activityA3 = nVar.a();
                    ProgressBar progressBar = new ProgressBar(activityA3, null, 16842874);
                    progressBar.setIndeterminate(true);
                    progressBar.setVisibility(0);
                    AlertDialog.Builder builder = new AlertDialog.Builder(activityA3);
                    builder.setView(progressBar);
                    builder.setMessage(sg.m.c(activityA3, 18));
                    builder.setPositiveButton(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (DialogInterface.OnClickListener) null);
                    AlertDialog alertDialogCreate = builder.create();
                    pg.b.i(activityA3, alertDialogCreate, "GooglePlayServicesUpdatingDialog", nVar);
                    Context applicationContext = nVar.a().getApplicationContext();
                    nx.l lVar = new nx.l(this, alertDialogCreate);
                    IntentFilter intentFilter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
                    intentFilter.addDataScheme("package");
                    jx.b bVar3 = new jx.b(lVar);
                    o4.a.c(applicationContext, bVar3, intentFilter, null, 2);
                    bVar3.f70397b = applicationContext;
                    if (pg.e.c(applicationContext)) {
                        return;
                    }
                    lVar.s();
                    bVar3.b();
                    return;
                }
                return;
            case 19:
                rg.n nVar2 = (rg.n) this.f76492b;
                c00.d dVar4 = (c00.d) this.f76493c;
                if (dVar4.f19044b > 0) {
                    Bundle bundle2 = (Bundle) dVar4.f19046d;
                    nVar2.b(bundle2 != null ? bundle2.getBundle("ConnectionlessLifecycleHelper") : null);
                }
                if (dVar4.f19044b >= 2) {
                    nVar2.f85896b = true;
                    nVar2.f();
                }
                if (dVar4.f19044b >= 3) {
                    nVar2.f();
                }
                if (dVar4.f19044b >= 4) {
                    nVar2.c();
                    return;
                }
                return;
            case 20:
                ((m0) this.f76493c).e((ai.j) this.f76492b);
                return;
            case 21:
                ((m0) this.f76493c).d((sp.f) this.f76492b);
                return;
            case 22:
                ((t70.m) this.f76493c).E((k1) this.f76492b, Unit.f71706a);
                return;
            case 23:
                ((w.e) this.f76493c).f93397b.onRelationshipValidationResult((Uri) this.f76492b);
                return;
            case 24:
                ((w.e) this.f76492b).f93397b.onActivityResized((Bundle) this.f76493c);
                return;
            case 25:
                p7.h hVar = ((w7.b) this.f76493c).f93828b.f82377f;
                String str = (String) this.f76492b;
                synchronized (hVar.f82346k) {
                    try {
                        p7.x xVarC = hVar.c(str);
                        if (xVarC != null) {
                            qVar = xVarC.f82397d;
                        }
                    } finally {
                    }
                }
                if (qVar == null || !qVar.c()) {
                    return;
                }
                synchronized (((w7.b) this.f76493c).f93830d) {
                    ((w7.b) this.f76493c).f93833g.put(w.b.j(qVar), qVar);
                    w7.b bVar4 = (w7.b) this.f76493c;
                    ((w7.b) this.f76493c).f93834h.put(w.b.j(qVar), t7.h.a(bVar4.f93835i, qVar, ((a8.c) bVar4.f93829c).f459b, bVar4));
                }
                return;
            case 26:
                wb.d dVar5 = (wb.d) this.f76493c;
                wb.d.jc(dVar5);
                if (dVar5.f94141dy != null) {
                    dVar5.f94141dy.obtainMessage(111, (SurfaceTexture) this.f76492b).sendToTarget();
                    return;
                }
                return;
            case 27:
                wb.d dVar6 = (wb.d) this.f76493c;
                wb.d.jc(dVar6);
                if (dVar6.f94141dy != null) {
                    dVar6.f94141dy.obtainMessage(110, (SurfaceHolder) this.f76492b).sendToTarget();
                    return;
                }
                return;
            case 28:
                wb.d dVar7 = (wb.d) this.f76493c;
                wb.d.jc(dVar7);
                if (dVar7.f94141dy != null) {
                    dVar7.f94141dy.obtainMessage(107, (com.bykv.vk.openvk.ycx.ycx.ycx.sya.a) this.f76492b).sendToTarget();
                    return;
                }
                return;
            default:
                q.c cVar3 = (q.c) this.f76492b;
                Typeface typeface = (Typeface) this.f76493c;
                q4.b bVar5 = (q4.b) cVar3.f83189b;
                if (bVar5 != null) {
                    bVar5.g(typeface);
                    return;
                }
                return;
        }
    }

    public /* synthetic */ w(Object obj, Object obj2, boolean z11, int i5) {
        this.f76491a = i5;
        this.f76493c = obj;
        this.f76492b = obj2;
    }

    public w(w.e eVar, int i5, Uri uri, boolean z11, Bundle bundle) {
        this.f76491a = 23;
        this.f76493c = eVar;
        this.f76492b = uri;
    }

    public w(w.e eVar, int i5, int i11, Bundle bundle) {
        this.f76491a = 24;
        this.f76492b = eVar;
        this.f76493c = bundle;
    }
}
