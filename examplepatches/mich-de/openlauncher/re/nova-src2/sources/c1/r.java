package c1;

import android.graphics.Rect;
import android.os.Bundle;
import android.os.LocaleList;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import androidx.compose.ui.text.input.ImeOptions;
import androidx.recyclerview.widget.u1;
import c3.n3;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import e1.a1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import m3.l0;
import m3.o0;
import p10.c0;
import r3.z;
import t0.y0;

/* loaded from: classes2.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final View f19121a;

    /* renamed from: b, reason: collision with root package name */
    public final m f19122b;

    /* renamed from: e, reason: collision with root package name */
    public y0 f19125e;

    /* renamed from: f, reason: collision with root package name */
    public a1 f19126f;

    /* renamed from: g, reason: collision with root package name */
    public n3 f19127g;

    /* renamed from: i, reason: collision with root package name */
    public ImeOptions f19129i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f19130j;

    /* renamed from: k, reason: collision with root package name */
    public final Object f19131k;

    /* renamed from: l, reason: collision with root package name */
    public Rect f19132l;

    /* renamed from: m, reason: collision with root package name */
    public final o f19133m;

    /* renamed from: c, reason: collision with root package name */
    public Function1 f19123c = new a00.a(14);

    /* renamed from: d, reason: collision with root package name */
    public Function1 f19124d = new a00.a(15);

    /* renamed from: h, reason: collision with root package name */
    public z f19128h = new z(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, o0.f75944b, 4);

    public r(View view, b bVar, m mVar) {
        this.f19121a = view;
        this.f19122b = mVar;
        ImeOptions.Companion.getClass();
        this.f19129i = ImeOptions.Default;
        this.f19130j = new ArrayList();
        this.f19131k = LazyKt.b(LazyThreadSafetyMode.f71681c, new as.c(this, 12));
        this.f19133m = new o(bVar, mVar);
    }

    public final s a(EditorInfo editorInfo) {
        int i5;
        int i11;
        z zVar = this.f19128h;
        String str = zVar.f85471a.f75880b;
        long j11 = zVar.f85472b;
        ImeOptions imeOptions = this.f19129i;
        int imeAction = imeOptions.getImeAction();
        if (imeAction == 1) {
            i5 = imeOptions.getSingleLine() ? 6 : 0;
        } else if (imeAction == 0) {
            i5 = 1;
        } else if (imeAction == 2) {
            i5 = 2;
        } else if (imeAction == 6) {
            i5 = 5;
        } else if (imeAction == 5) {
            i5 = 7;
        } else if (imeAction == 3) {
            i5 = 3;
        } else if (imeAction == 4) {
            i5 = 4;
        } else {
            if (imeAction != 7) {
                throw new IllegalStateException("invalid ImeAction");
            }
        }
        editorInfo.imeOptions = i5;
        imeOptions.getPlatformImeOptions();
        t3.b hintLocales = imeOptions.getHintLocales();
        if (Intrinsics.b(hintLocales, t3.b.f88510c)) {
            editorInfo.hintLocales = null;
        } else {
            ArrayList arrayList = new ArrayList(b70.c.u0(hintLocales, 10));
            Iterator it = hintLocales.f88511a.iterator();
            while (it.hasNext()) {
                arrayList.add(((t3.a) it.next()).f88509a);
            }
            Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
            editorInfo.hintLocales = new LocaleList((Locale[]) Arrays.copyOf(localeArr, localeArr.length));
        }
        int keyboardType = imeOptions.getKeyboardType();
        if (keyboardType == 1) {
            i11 = 1;
        } else if (keyboardType == 2) {
            editorInfo.imeOptions |= Integer.MIN_VALUE;
            i11 = 1;
        } else if (keyboardType == 3) {
            i11 = 2;
        } else if (keyboardType == 4) {
            i11 = 3;
        } else if (keyboardType == 5) {
            i11 = 17;
        } else if (keyboardType == 6) {
            i11 = 33;
        } else if (keyboardType == 7) {
            i11 = Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE;
        } else if (keyboardType == 8) {
            i11 = 18;
        } else {
            if (keyboardType != 9) {
                throw new IllegalStateException("Invalid Keyboard Type");
            }
            i11 = 8194;
        }
        editorInfo.inputType = i11;
        if (!imeOptions.getSingleLine()) {
            int i12 = editorInfo.inputType;
            if ((i12 & 1) == 1) {
                editorInfo.inputType = i12 | SQLiteDatabase.OPEN_SHAREDCACHE;
                if (imeOptions.getImeAction() == 1) {
                    editorInfo.imeOptions |= 1073741824;
                }
            }
        }
        if ((editorInfo.inputType & 1) == 1) {
            int capitalization = imeOptions.getCapitalization();
            if (capitalization == 1) {
                editorInfo.inputType |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            } else if (capitalization == 2) {
                editorInfo.inputType |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
            } else if (capitalization == 3) {
                editorInfo.inputType |= ReaderJsonLexerKt.BATCH_SIZE;
            }
            if (imeOptions.getAutoCorrect()) {
                editorInfo.inputType |= SQLiteDatabase.OPEN_NOMUTEX;
            }
        }
        int i13 = o0.f75945c;
        editorInfo.initialSelStart = (int) (j11 >> 32);
        editorInfo.initialSelEnd = (int) (j11 & 4294967295L);
        t2.c.M(editorInfo, str);
        editorInfo.imeOptions |= 33554432;
        if (!b1.d.f16525a || imeOptions.getKeyboardType() == 7 || imeOptions.getKeyboardType() == 8) {
            if (w4.a.c()) {
                c5.a.b(editorInfo, false);
            }
            if (editorInfo.extras == null) {
                editorInfo.extras = new Bundle();
            }
            editorInfo.extras.putBoolean("androidx.core.view.inputmethod.EditorInfoCompat.STYLUS_HANDWRITING_ENABLED", false);
        } else {
            if (w4.a.c()) {
                c5.a.b(editorInfo, true);
            }
            if (editorInfo.extras == null) {
                editorInfo.extras = new Bundle();
            }
            editorInfo.extras.putBoolean("androidx.core.view.inputmethod.EditorInfoCompat.STYLUS_HANDWRITING_ENABLED", true);
            editorInfo.setSupportedHandwritingGestures(ul.b.Q(ab.j.u(), ab.j.A(), ab.j.w(), ab.j.y(), ab.j.B(), ab.j.C(), ab.j.D()));
            editorInfo.setSupportedHandwritingGesturePreviews(kotlin.collections.c.f1(new Class[]{ab.j.u(), ab.j.A(), ab.j.w(), ab.j.y()}));
        }
        p pVar = q.f19120a;
        s sVar = new s(this.f19128h, new a5.d(this, 27), this.f19129i.getAutoCorrect(), this.f19125e, this.f19126f, this.f19127g);
        this.f19130j.add(new WeakReference(sVar));
        return sVar;
    }

    public final void b(h2.c cVar) {
        Rect rect;
        this.f19132l = new Rect(MathKt.b(cVar.f59018a), MathKt.b(cVar.f59019b), MathKt.b(cVar.f59020c), MathKt.b(cVar.f59021d));
        if (!this.f19130j.isEmpty() || (rect = this.f19132l) == null) {
            return;
        }
        this.f19121a.requestRectangleOnScreen(new Rect(rect));
    }

    public final void c(z zVar, z zVar2) {
        boolean z11 = (o0.b(this.f19128h.f85472b, zVar2.f85472b) && Intrinsics.b(this.f19128h.f85473c, zVar2.f85473c)) ? false : true;
        this.f19128h = zVar2;
        int size = this.f19130j.size();
        for (int i5 = 0; i5 < size; i5++) {
            s sVar = (s) ((WeakReference) this.f19130j.get(i5)).get();
            if (sVar != null) {
                sVar.f19140g = zVar2;
            }
        }
        o oVar = this.f19133m;
        synchronized (oVar.f19106c) {
            oVar.f19113j = null;
            oVar.f19115l = null;
            oVar.f19114k = null;
            oVar.f19116m = null;
            oVar.n = null;
            Unit unit = Unit.f71706a;
        }
        if (Intrinsics.b(zVar, zVar2)) {
            if (z11) {
                m mVar = this.f19122b;
                int iF = o0.f(zVar2.f85472b);
                int iE = o0.e(zVar2.f85472b);
                o0 o0Var = this.f19128h.f85473c;
                int iF2 = o0Var != null ? o0.f(o0Var.f75946a) : -1;
                o0 o0Var2 = this.f19128h.f85473c;
                mVar.a().updateSelection(mVar.f19099b, iF, iE, iF2, o0Var2 != null ? o0.e(o0Var2.f75946a) : -1);
                return;
            }
            return;
        }
        if (zVar != null && (!Intrinsics.b(zVar.f85471a.f75880b, zVar2.f85471a.f75880b) || (o0.b(zVar.f85472b, zVar2.f85472b) && !Intrinsics.b(zVar.f85473c, zVar2.f85473c)))) {
            m mVar2 = this.f19122b;
            mVar2.a().restartInput(mVar2.f19099b);
            return;
        }
        int size2 = this.f19130j.size();
        for (int i11 = 0; i11 < size2; i11++) {
            s sVar2 = (s) ((WeakReference) this.f19130j.get(i11)).get();
            if (sVar2 != null) {
                z zVar3 = this.f19128h;
                m mVar3 = this.f19122b;
                if (sVar2.f19144k) {
                    sVar2.f19140g = zVar3;
                    if (sVar2.f19142i) {
                        mVar3.a().updateExtractedText(mVar3.f19099b, sVar2.f19141h, c0.r(zVar3));
                    }
                    o0 o0Var3 = zVar3.f85473c;
                    long j11 = zVar3.f85472b;
                    int iF3 = o0Var3 != null ? o0.f(o0Var3.f75946a) : -1;
                    o0 o0Var4 = zVar3.f85473c;
                    mVar3.a().updateSelection(mVar3.f19099b, o0.f(j11), o0.e(j11), iF3, o0Var4 != null ? o0.e(o0Var4.f75946a) : -1);
                }
            }
        }
    }

    public final void d(z zVar, r3.s sVar, l0 l0Var, h2.c cVar, h2.c cVar2) {
        o oVar = this.f19133m;
        synchronized (oVar.f19106c) {
            try {
                oVar.f19113j = zVar;
                oVar.f19115l = sVar;
                oVar.f19114k = l0Var;
                oVar.f19116m = cVar;
                oVar.n = cVar2;
                if (oVar.f19108e || oVar.f19107d) {
                    oVar.a();
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
