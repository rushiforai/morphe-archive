package ge;

import a5.a0;
import a5.h2;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.text.Layout;
import android.view.View;
import androidx.core.graphics.Insets;
import com.google.android.gms.tasks.Task;
import com.stripe.android.payments.core.authentication.threeds2.Stripe3ds2TransactionActivity;
import f10.o;
import fe.k0;
import gf.r0;
import gf.x0;
import gf.y0;
import io.sentry.a1;
import io.sentry.i2;
import io.sentry.j2;
import io.sentry.m0;
import io.sentry.n0;
import io.sentry.o4;
import io.sentry.q2;
import io.sentry.transport.ICurrentDateProvider;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.jvm.internal.Intrinsics;
import xk.l0;
import xk.r2;
import xk.v0;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements wf.e, fe.d, j2, a1, io.sentry.util.b, ICurrentDateProvider, a0, fi.e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57389a;

    public /* synthetic */ d(int i5) {
        this.f57389a = i5;
    }

    @Override // io.sentry.util.b
    public Object a() {
        switch (this.f57389a) {
            case 15:
                return new q2();
            case 16:
                return new io.sentry.metrics.b();
            default:
                ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
                for (io.sentry.clientreport.d dVar : io.sentry.clientreport.d.values()) {
                    for (io.sentry.i iVar : io.sentry.i.values()) {
                        concurrentHashMap.put(new io.sentry.clientreport.c(dVar.getReason(), iVar.getCategory()), new AtomicLong(0L));
                    }
                }
                return Collections.unmodifiableMap(concurrentHashMap);
        }
    }

    @Override // fe.d
    public fe.e b(Bundle bundle) {
        r2 r2VarS;
        hf.a[] aVarArr;
        float f11;
        int i5;
        float f12;
        int i11;
        int i12;
        boolean z11 = true;
        switch (this.f57389a) {
            case 9:
                ArrayList parcelableArrayList = bundle.getParcelableArrayList(Integer.toString(0, 36));
                if (parcelableArrayList == null) {
                    l0 l0Var = v0.f96030b;
                    r2VarS = r2.f96007e;
                } else {
                    r2VarS = wf.a.s(k0.H, parcelableArrayList);
                }
                return new x0(bundle.getString(Integer.toString(1, 36), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), (k0[]) r2VarS.toArray(new k0[0]));
            case 10:
                ArrayList parcelableArrayList2 = bundle.getParcelableArrayList(Integer.toString(0, 36));
                return parcelableArrayList2 == null ? new y0(new x0[0]) : new y0((x0[]) wf.a.s(x0.f57654f, parcelableArrayList2).toArray(new x0[0]));
            case 11:
                ArrayList parcelableArrayList3 = bundle.getParcelableArrayList(Integer.toString(1, 36));
                if (parcelableArrayList3 == null) {
                    aVarArr = new hf.a[0];
                } else {
                    hf.a[] aVarArr2 = new hf.a[parcelableArrayList3.size()];
                    for (int i13 = 0; i13 < parcelableArrayList3.size(); i13++) {
                        aVarArr2[i13] = (hf.a) hf.a.f59836i.b((Bundle) parcelableArrayList3.get(i13));
                    }
                    aVarArr = aVarArr2;
                }
                return new hf.b(aVarArr, bundle.getLong(Integer.toString(2, 36), 0L), bundle.getLong(Integer.toString(3, 36), -9223372036854775807L), bundle.getInt(Integer.toString(4, 36)));
            case 12:
                long j11 = bundle.getLong(Integer.toString(0, 36));
                int i14 = bundle.getInt(Integer.toString(1, 36), -1);
                int i15 = bundle.getInt(Integer.toString(7, 36), -1);
                ArrayList parcelableArrayList4 = bundle.getParcelableArrayList(Integer.toString(2, 36));
                int[] intArray = bundle.getIntArray(Integer.toString(3, 36));
                long[] longArray = bundle.getLongArray(Integer.toString(4, 36));
                long j12 = bundle.getLong(Integer.toString(5, 36));
                boolean z12 = bundle.getBoolean(Integer.toString(6, 36));
                if (intArray == null) {
                    intArray = new int[0];
                }
                int[] iArr = intArray;
                Uri[] uriArr = new Uri[0];
                if (parcelableArrayList4 != null) {
                    uriArr = (Uri[]) parcelableArrayList4.toArray(uriArr);
                }
                Uri[] uriArr2 = uriArr;
                if (longArray == null) {
                    longArray = new long[0];
                }
                return new hf.a(j11, i14, i15, iArr, uriArr2, longArray, j12, z12);
            default:
                CharSequence charSequence = bundle.getCharSequence(Integer.toString(0, 36));
                CharSequence charSequence2 = charSequence != null ? charSequence : null;
                Layout.Alignment alignment = (Layout.Alignment) bundle.getSerializable(Integer.toString(1, 36));
                Layout.Alignment alignment2 = alignment != null ? alignment : null;
                Layout.Alignment alignment3 = (Layout.Alignment) bundle.getSerializable(Integer.toString(2, 36));
                Layout.Alignment alignment4 = alignment3 != null ? alignment3 : null;
                Bitmap bitmap = (Bitmap) bundle.getParcelable(Integer.toString(3, 36));
                Bitmap bitmap2 = bitmap != null ? bitmap : null;
                if (bundle.containsKey(Integer.toString(4, 36)) && bundle.containsKey(Integer.toString(5, 36))) {
                    f11 = bundle.getFloat(Integer.toString(4, 36));
                    i5 = bundle.getInt(Integer.toString(5, 36));
                } else {
                    f11 = -3.4028235E38f;
                    i5 = Integer.MIN_VALUE;
                }
                int i16 = bundle.containsKey(Integer.toString(6, 36)) ? bundle.getInt(Integer.toString(6, 36)) : Integer.MIN_VALUE;
                float f13 = bundle.containsKey(Integer.toString(7, 36)) ? bundle.getFloat(Integer.toString(7, 36)) : -3.4028235E38f;
                int i17 = bundle.containsKey(Integer.toString(8, 36)) ? bundle.getInt(Integer.toString(8, 36)) : Integer.MIN_VALUE;
                if (bundle.containsKey(Integer.toString(10, 36)) && bundle.containsKey(Integer.toString(9, 36))) {
                    f12 = bundle.getFloat(Integer.toString(10, 36));
                    i11 = bundle.getInt(Integer.toString(9, 36));
                } else {
                    f12 = -3.4028235E38f;
                    i11 = Integer.MIN_VALUE;
                }
                float f14 = bundle.containsKey(Integer.toString(11, 36)) ? bundle.getFloat(Integer.toString(11, 36)) : -3.4028235E38f;
                float f15 = bundle.containsKey(Integer.toString(12, 36)) ? bundle.getFloat(Integer.toString(12, 36)) : -3.4028235E38f;
                if (bundle.containsKey(Integer.toString(13, 36))) {
                    i12 = bundle.getInt(Integer.toString(13, 36));
                } else {
                    i12 = -16777216;
                    z11 = false;
                }
                return new jf.b(charSequence2, alignment2, alignment4, bitmap2, f11, i5, i16, f13, i17, i11, f12, f14, f15, !bundle.getBoolean(Integer.toString(14, 36), false) ? false : z11, i12, bundle.containsKey(Integer.toString(15, 36)) ? bundle.getInt(Integer.toString(15, 36)) : Integer.MIN_VALUE, bundle.containsKey(Integer.toString(16, 36)) ? bundle.getFloat(Integer.toString(16, 36)) : 0.0f);
        }
    }

    @Override // io.sentry.a1
    public Object c() {
        return null;
    }

    public void d(Object obj) {
        ((r0) obj).f57615b.getClass();
    }

    public Constructor e() {
        switch (this.f57389a) {
            case 22:
                if (Boolean.TRUE.equals(Class.forName("com.google.android.exoplayer2.ext.flac.FlacLibrary").getMethod("isAvailable", null).invoke(null, null))) {
                    return Class.forName("com.google.android.exoplayer2.ext.flac.FlacExtractor").asSubclass(ke.j.class).getConstructor(Integer.TYPE);
                }
                return null;
            default:
                return Class.forName("com.google.android.exoplayer2.decoder.midi.MidiExtractor").asSubclass(ke.j.class).getConstructor(null);
        }
    }

    @Override // wf.e
    public void invoke(Object obj) {
        b bVar = (b) obj;
        switch (this.f57389a) {
            case 0:
                bVar.getClass();
                break;
            case 1:
                bVar.getClass();
                break;
            case 2:
                bVar.getClass();
                break;
            case 3:
                bVar.getClass();
                break;
            case 4:
                bVar.getClass();
                break;
            case 5:
                bVar.getClass();
                break;
            case 6:
                bVar.getClass();
                break;
            default:
                bVar.getClass();
                break;
        }
    }

    @Override // io.sentry.j2
    public void j(m0 m0Var) {
        switch (this.f57389a) {
            case 13:
                i2 i2Var = (i2) m0Var;
                i2Var.getClass();
                i2Var.f67299b = null;
                i2Var.f67300c = null;
                i2Var.f67301d.clear();
                o4 o4Var = i2Var.f67302e;
                o4Var.clear();
                Iterator<n0> it = i2Var.f67306i.getScopeObservers().iterator();
                while (it.hasNext()) {
                    io.sentry.cache.f fVar = (io.sentry.cache.f) it.next();
                    fVar.getClass();
                    fVar.b(new fa.l0(20, fVar, o4Var));
                }
                i2Var.f67303f.clear();
                i2Var.f67304g.clear();
                i2Var.f67305h.clear();
                i2Var.a();
                i2Var.o.clear();
                break;
            default:
                ((i2) m0Var).c(new o(m0Var, 25));
                break;
        }
    }

    @Override // fi.e
    public void onComplete(Task task) {
        mc0.d.f76206a.b("Review flow completed", new Object[0]);
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        int i5 = Stripe3ds2TransactionActivity.f44308r;
        Intrinsics.g(view, "view");
        Insets insetsG = h2Var.f296a.g(7);
        Intrinsics.f(insetsG, "getInsets(...)");
        view.setPaddingRelative(insetsG.bottom, view.getPaddingTop(), view.getPaddingEnd(), view.getPaddingBottom());
        return h2.f295b;
    }
}
