package x7;

import android.app.Application;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.bluetooth.BluetoothManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.PersistableBundle;
import android.util.AttributeSet;
import android.util.Base64;
import android.util.TypedValue;
import androidx.compose.ui.node.LayoutNode;
import androidx.work.impl.WorkDatabase_Impl;
import b.c0;
import b3.a0;
import b3.q2;
import com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService;
import com.google.android.gms.internal.consent_sdk.d0;
import com.google.android.gms.internal.consent_sdk.h0;
import com.google.android.gms.internal.consent_sdk.i0;
import com.google.android.gms.internal.consent_sdk.k7;
import com.google.android.gms.internal.consent_sdk.l7;
import com.google.android.gms.internal.measurement.v6;
import e00.j3;
import e10.z2;
import hv.z1;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicReference;
import java.util.zip.Adler32;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import r.j0;
import z.o0;

/* loaded from: classes.dex */
public final class u implements l7 {

    /* renamed from: a, reason: collision with root package name */
    public Object f95208a;

    /* renamed from: b, reason: collision with root package name */
    public Object f95209b;

    /* renamed from: c, reason: collision with root package name */
    public Object f95210c;

    public /* synthetic */ u(Object obj, Object obj2, Object obj3) {
        this.f95208a = obj;
        this.f95209b = obj2;
        this.f95210c = obj3;
    }

    public static final Object a(u uVar, int i5, z1 z1Var, j3 j3Var) {
        uVar.getClass();
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(j3Var));
        mVar.t();
        if (!uVar.j().getAdapter().getProfileProxy(((Context) uVar.f95208a).getApplicationContext(), new jx.d(z1Var, mVar, i5), i5)) {
            new jx.c(i5, mVar).invoke();
        }
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    public static float i(PointF pointF, PointF pointF2) {
        return (float) Math.acos(((pointF.y * pointF2.y) + (pointF.x * pointF2.x)) / (pointF2.length() * pointF.length()));
    }

    public static u r(Context context, AttributeSet attributeSet, int[] iArr, int i5) {
        return new u(context, context.obtainStyledAttributes(attributeSet, iArr, i5, 0));
    }

    public void b(LayoutNode layoutNode, a0 a0Var) {
        v6 v6Var = (v6) this.f95208a;
        v6 v6Var2 = (v6) this.f95209b;
        v6 v6Var3 = (v6) this.f95210c;
        int iOrdinal = a0Var.ordinal();
        if (iOrdinal == 0) {
            v6Var.a(layoutNode);
            v6Var3.a(layoutNode);
            return;
        }
        if (iOrdinal == 1) {
            v6Var2.a(layoutNode);
            v6Var3.a(layoutNode);
            return;
        }
        if (iOrdinal == 2) {
            if (layoutNode.getLookaheadRoot() != null) {
                v6Var3.a(layoutNode);
                return;
            } else {
                v6Var.a(layoutNode);
                return;
            }
        }
        if (iOrdinal != 3) {
            throw new NoWhenBranchMatchedException();
        }
        if (layoutNode.getLookaheadRoot() != null) {
            v6Var3.a(layoutNode);
        } else {
            v6Var2.a(layoutNode);
        }
    }

    public ll.d c() throws GeneralSecurityException {
        Integer num = (Integer) this.f95208a;
        if (num == null) {
            throw new GeneralSecurityException("key size not set");
        }
        if (((Integer) this.f95209b) == null) {
            throw new GeneralSecurityException("tag size not set");
        }
        if (((ll.c) this.f95210c) != null) {
            return new ll.d(num.intValue(), ((Integer) this.f95209b).intValue(), (ll.c) this.f95210c);
        }
        throw new GeneralSecurityException("variant not set");
    }

    public td.i d() {
        String strConcat = ((String) this.f95208a) == null ? " backendName" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (((qd.d) this.f95210c) == null) {
            strConcat = strConcat.concat(" priority");
        }
        if (strConcat.isEmpty()) {
            return new td.i((String) this.f95208a, (byte[]) this.f95209b, (qd.d) this.f95210c);
        }
        throw new IllegalStateException("Missing required properties:".concat(strConcat));
    }

    public boolean e(LayoutNode layoutNode) {
        return !(layoutNode.getLookaheadRoot() == null) && (((q2) ((v6) this.f95208a).f33136b).contains(layoutNode) || ((q2) ((v6) this.f95209b).f33136b).contains(layoutNode));
    }

    public void f(Bitmap bitmap, Canvas canvas, float f11, float f12, float f13) {
        int height = bitmap.getHeight();
        Rect rect = (Rect) this.f95208a;
        rect.top = 0;
        rect.bottom = height;
        RectF rectF = (RectF) this.f95209b;
        rectF.top = f12;
        rectF.bottom = f12 + height;
        int width = bitmap.getWidth();
        int i5 = width / 2;
        float f14 = i5;
        float f15 = f11 + f14;
        g(bitmap, canvas, 0, i5, f11, f15);
        float f16 = f13 - f14;
        g(bitmap, canvas, i5, width, f16, f13);
        g(bitmap, canvas, i5 - 5, i5 + 5, f15, f16);
    }

    public void g(Bitmap bitmap, Canvas canvas, int i5, int i11, float f11, float f12) {
        Rect rect = (Rect) this.f95208a;
        rect.left = i5;
        rect.right = i11;
        RectF rectF = (RectF) this.f95209b;
        rectF.left = f11;
        rectF.right = f12;
        canvas.drawBitmap(bitmap, rect, rectF, (Paint) this.f95210c);
    }

    public Object h() {
        long jC = x1.f.c();
        if (jC == x1.n.f94976a) {
            return this.f95210c;
        }
        x1.m mVar = (x1.m) ((AtomicReference) this.f95208a).get();
        int iA = mVar.a(jC);
        if (iA >= 0) {
            return mVar.f94975c[iA];
        }
        return null;
    }

    public BluetoothManager j() {
        return (BluetoothManager) ((a70.d) this.f95209b).getValue();
    }

    public ColorStateList k(int i5) {
        int resourceId;
        ColorStateList colorStateListB;
        TypedArray typedArray = (TypedArray) this.f95209b;
        return (!typedArray.hasValue(i5) || (resourceId = typedArray.getResourceId(i5, 0)) == 0 || (colorStateListB = o4.a.b((Context) this.f95208a, resourceId)) == null) ? typedArray.getColorStateList(i5) : colorStateListB;
    }

    public Drawable l(int i5) {
        int resourceId;
        TypedArray typedArray = (TypedArray) this.f95209b;
        return (!typedArray.hasValue(i5) || (resourceId = typedArray.getResourceId(i5, 0)) == 0) ? typedArray.getDrawable(i5) : z2.b0((Context) this.f95208a, resourceId);
    }

    public Drawable m(int i5) {
        int resourceId;
        TypedArray typedArray = (TypedArray) this.f95209b;
        if (!typedArray.hasValue(i5) || (resourceId = typedArray.getResourceId(i5, 0)) == 0) {
            return null;
        }
        return r.p.a().c((Context) this.f95208a, resourceId);
    }

    public Typeface n(int i5, int i11, j0 j0Var) {
        int resourceId = ((TypedArray) this.f95209b).getResourceId(i5, 0);
        if (resourceId == 0) {
            return null;
        }
        if (((TypedValue) this.f95210c) == null) {
            this.f95210c = new TypedValue();
        }
        Context context = (Context) this.f95208a;
        TypedValue typedValue = (TypedValue) this.f95210c;
        ThreadLocal threadLocal = q4.k.f83638a;
        if (context.isRestricted()) {
            return null;
        }
        return q4.k.b(context, resourceId, typedValue, i11, j0Var, true, false);
    }

    public ArrayList o(String str) throws IOException {
        WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f95208a;
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT DISTINCT tag FROM worktag WHERE work_spec_id=?");
        if (str == null) {
            tVarC.bindNull(1);
        } else {
            tVarC.bindString(1, str);
        }
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            ArrayList arrayList = new ArrayList(cursorL.getCount());
            while (cursorL.moveToNext()) {
                arrayList.add(cursorL.isNull(0) ? null : cursorL.getString(0));
            }
            return arrayList;
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    public void p(String id2, Set tags) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(tags, "tags");
        Iterator it = tags.iterator();
        while (it.hasNext()) {
            t tVar = new t((String) it.next(), id2);
            WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) this.f95208a;
            workDatabase_Impl.assertNotSuspendingTransaction();
            workDatabase_Impl.beginTransaction();
            try {
                ((b) this.f95209b).insert(tVar);
                workDatabase_Impl.setTransactionSuccessful();
            } finally {
                workDatabase_Impl.endTransaction();
            }
        }
    }

    public boolean q() {
        return !(((q2) ((v6) this.f95208a).f33136b).isEmpty() && ((q2) ((v6) this.f95210c).f33136b).isEmpty() && ((q2) ((v6) this.f95209b).f33136b).isEmpty());
    }

    public void s() {
        ((TypedArray) this.f95209b).recycle();
    }

    public void t(td.i iVar, int i5, boolean z11) {
        ae.a aVar = (ae.a) this.f95210c;
        Context context = (Context) this.f95208a;
        ComponentName componentName = new ComponentName(context, (Class<?>) JobInfoSchedulerService.class);
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        Adler32 adler32 = new Adler32();
        adler32.update(context.getPackageName().getBytes(Charset.forName("UTF-8")));
        adler32.update(iVar.f88985a.getBytes(Charset.forName("UTF-8")));
        adler32.update(ByteBuffer.allocate(4).putInt(ee.a.a(iVar.f88987c)).array());
        byte[] bArr = iVar.f88986b;
        if (bArr != null) {
            adler32.update(bArr);
        }
        int value = (int) adler32.getValue();
        if (!z11) {
            Iterator<JobInfo> it = jobScheduler.getAllPendingJobs().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                JobInfo next = it.next();
                int i11 = next.getExtras().getInt("attemptNumber");
                if (next.getId() == value) {
                    if (i11 >= i5) {
                        return;
                    }
                }
            }
        }
        Cursor cursorRawQuery = ((be.k) ((be.d) this.f95209b)).a().rawQuery("SELECT next_request_ms FROM transport_contexts WHERE backend_name = ? and priority = ?", new String[]{iVar.f88985a, String.valueOf(ee.a.a(iVar.f88987c))});
        try {
            Long lValueOf = cursorRawQuery.moveToNext() ? Long.valueOf(cursorRawQuery.getLong(0)) : 0L;
            cursorRawQuery.close();
            long jLongValue = lValueOf.longValue();
            JobInfo.Builder builder = new JobInfo.Builder(value, componentName);
            qd.d dVar = iVar.f88987c;
            builder.setMinimumLatency(aVar.a(dVar, jLongValue, i5));
            Set set = ((ae.b) aVar.f12736b.get(dVar)).f12739c;
            if (set.contains(ae.d.f12743a)) {
                builder.setRequiredNetworkType(2);
            } else {
                builder.setRequiredNetworkType(1);
            }
            if (set.contains(ae.d.f12745c)) {
                builder.setRequiresCharging(true);
            }
            if (set.contains(ae.d.f12744b)) {
                builder.setRequiresDeviceIdle(true);
            }
            PersistableBundle persistableBundle = new PersistableBundle();
            persistableBundle.putInt("attemptNumber", i5);
            persistableBundle.putString("backendName", iVar.f88985a);
            persistableBundle.putInt("priority", ee.a.a(dVar));
            byte[] bArr2 = iVar.f88986b;
            if (bArr2 != null) {
                persistableBundle.putString("extras", Base64.encodeToString(bArr2, 0));
            }
            builder.setExtras(persistableBundle);
            aVar.a(dVar, jLongValue, i5);
            jobScheduler.schedule(builder.build());
        } catch (Throwable th2) {
            cursorRawQuery.close();
            throw th2;
        }
    }

    public void u(Object obj) {
        long jC = x1.f.c();
        if (jC == x1.n.f94976a) {
            this.f95210c = obj;
            return;
        }
        synchronized (this.f95209b) {
            x1.m mVar = (x1.m) ((AtomicReference) this.f95208a).get();
            int iA = mVar.a(jC);
            if (iA >= 0) {
                mVar.f94975c[iA] = obj;
            } else {
                ((AtomicReference) this.f95208a).set(mVar.b(jC, obj));
                Unit unit = Unit.f71706a;
            }
        }
    }

    public void v(String str) {
        if (str == null) {
            throw new NullPointerException("Null backendName");
        }
        this.f95208a = str;
    }

    public void w(int i5) throws InvalidAlgorithmParameterException {
        if (i5 != 16 && i5 != 32) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 128-bit and 256-bit AES keys are supported", Integer.valueOf(i5 * 8)));
        }
        this.f95208a = Integer.valueOf(i5);
    }

    public void x(int i5) throws GeneralSecurityException {
        if (i5 < 10 || 16 < i5) {
            throw new GeneralSecurityException(c0.h(i5, "Invalid tag size for AesCmacParameters: "));
        }
        this.f95209b = Integer.valueOf(i5);
    }

    public void y() {
        o0 o0Var = (o0) this.f95208a;
        String str = (String) this.f95209b;
        List list = (List) o0Var.k(str);
        if (list != null) {
            list.remove((Function0) this.f95210c);
        }
        List list2 = list;
        if (list2 == null || list2.isEmpty()) {
            return;
        }
        o0Var.m(str, list);
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public Object zzb() {
        Application application = (Application) ((vm.c) this.f95209b).f92857b;
        h0 h0Var = i0.f32099b;
        com.google.android.gms.internal.consent_sdk.c.a(h0Var);
        return new d0(application, h0Var, (com.google.android.gms.internal.consent_sdk.c0) ((k7) this.f95210c).zzb(), false);
    }

    public u(Context context, TypedArray typedArray) {
        this.f95208a = context;
        this.f95209b = typedArray;
    }

    public u(int i5) {
        switch (i5) {
            case 6:
                List list = Collections.EMPTY_LIST;
                this.f95208a = list;
                this.f95209b = list;
                break;
            case 11:
                this.f95208a = new WeakHashMap();
                this.f95209b = new WeakHashMap();
                this.f95210c = new WeakHashMap();
                break;
            case 12:
                this.f95208a = new Rect();
                this.f95209b = new RectF();
                this.f95210c = new Paint(3);
                break;
            case 13:
                this.f95208a = new AtomicReference(x1.f.f94955b);
                this.f95209b = new Object();
                break;
            default:
                this.f95208a = new v6(2);
                this.f95209b = new v6(2);
                this.f95210c = new v6(2);
                break;
        }
    }
}
