package p1;

import android.content.Intent;
import android.graphics.Bitmap;
import android.media.MediaMetadata;
import android.net.Uri;
import android.widget.EditText;
import androidx.activity.result.contract.ActivityResultContracts$RequestPermission;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchEditText;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import java.util.concurrent.CancellationException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final /* synthetic */ class v1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81602a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f81603b;

    public /* synthetic */ v1(Object obj, int i5) {
        this.f81602a = i5;
        this.f81603b = obj;
    }

    /* JADX WARN: Type inference failed for: r0v10, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object it) {
        switch (this.f81602a) {
            case 0:
                y1 y1Var = (y1) this.f81603b;
                Throwable th2 = (Throwable) it;
                CancellationException cancellationExceptionA = ph.a.a("Recomposer effect job completed", th2);
                synchronized (y1Var.f81647b) {
                    try {
                        t70.r1 r1Var = y1Var.f81648c;
                        if (r1Var != null) {
                            w70.i2 i2Var = y1Var.f81663t;
                            w1 w1Var = w1.f81614b;
                            i2Var.getClass();
                            i2Var.k(null, w1Var);
                            r1Var.c(cancellationExceptionA);
                            y1Var.f81660q = null;
                            r1Var.w(new jt.e(29, y1Var, th2));
                        } else {
                            y1Var.f81649d = cancellationExceptionA;
                            w70.i2 i2Var2 = y1Var.f81663t;
                            w1 w1Var2 = w1.f81613a;
                            i2Var2.getClass();
                            i2Var2.k(null, w1Var2);
                            Unit unit = Unit.f71706a;
                        }
                    } catch (Throwable th3) {
                        throw th3;
                    }
                }
                return Unit.f71706a;
            case 1:
                z.p0 p0Var = (z.p0) this.f81603b;
                if (it instanceof z1.a0) {
                    ((z1.a0) it).i(4);
                }
                p0Var.d(it);
                return Unit.f71706a;
            case 2:
                q3.m0 m0Var = (q3.m0) it;
                return ((q3.q) this.f81603b).a(new q3.m0(null, m0Var.f83579b, m0Var.f83580c, m0Var.f83581d, m0Var.f83582e)).getValue();
            case 3:
                ?? r02 = (Lambda) this.f81603b;
                Intrinsics.g(it, "it");
                return r02.invoke();
            case 4:
                String str = (String) it;
                NovaSearchEditText novaSearchEditText = ((NovaAppDrawerSearchBar) ((AllAppsContainerView) this.f81603b).f21030l).b().f74425h;
                EditText editTextB = novaSearchEditText != null ? novaSearchEditText.b() : null;
                editTextB.setText(str);
                editTextB.setSelection(str.length());
                return Unit.f71706a;
            case 5:
                NovaSearchProvider novaSearchProvider = (NovaSearchProvider) this.f81603b;
                r10.b1 b1Var = NovaSearchProvider.Companion;
                return new Intent("android.intent.action.VIEW", Uri.parse(r70.j.F0(novaSearchProvider.f46230d, "%s", Uri.encode((String) it), false))).addFlags(335577088);
            case 6:
                t0.u1 u1Var = (t0.u1) this.f81603b;
                float fFloatValue = ((Float) it).floatValue();
                float fA = u1Var.a() + fFloatValue;
                m2 m2Var = u1Var.f88227b;
                if (fA > m2Var.m()) {
                    fFloatValue = m2Var.m() - u1Var.a();
                } else if (fA < 0.0f) {
                    fFloatValue = -u1Var.a();
                }
                u1Var.f88226a.p(u1Var.a() + fFloatValue);
                return Float.valueOf(fFloatValue);
            case 7:
                return ((g.o) this.f81603b).registerForActivityResult(new ActivityResultContracts$RequestPermission(), new w20.k((Function1) it));
            case 8:
                y1.e eVar = ((y1.d) this.f81603b).f96565c;
                return Boolean.valueOf(eVar != null ? eVar.c(it) : true);
            case 9:
                z1.v vVar = (z1.v) this.f81603b;
                synchronized (vVar.f97981g) {
                    z1.u uVar = vVar.f97983i;
                    Intrinsics.d(uVar);
                    Object obj = uVar.f97964b;
                    Intrinsics.d(obj);
                    int i5 = uVar.f97966d;
                    z.h0 h0Var = uVar.f97965c;
                    if (h0Var == null) {
                        h0Var = new z.h0();
                        uVar.f97965c = h0Var;
                        uVar.f97968f.m(obj, h0Var);
                        Unit unit2 = Unit.f71706a;
                    }
                    uVar.c(it, i5, obj, h0Var);
                }
                return Unit.f71706a;
            default:
                MediaMetadata mediaMetadata = (MediaMetadata) this.f81603b;
                Bitmap bitmap = mediaMetadata.getBitmap("android.media.metadata.ART");
                return bitmap == null ? mediaMetadata.getBitmap("android.media.metadata.ALBUM_ART") : bitmap;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public /* synthetic */ v1(Function0 function0) {
        this.f81602a = 3;
        this.f81603b = (Lambda) function0;
    }
}
