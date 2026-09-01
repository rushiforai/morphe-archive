package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.preference.PreferenceManager;
import android.util.AttributeSet;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import java.util.ArrayList;
import java.util.UUID;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class e8 {
    public int a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;
    public Object f;

    public e8() {
        this.b = new lr5[32];
        this.c = new float[32];
        this.d = new byte[32];
        g78 g78Var = iqb.a;
        this.e = new g78();
        this.f = new g78();
    }

    public void a() {
        View view = (View) this.b;
        Drawable background = view.getBackground();
        if (background != null) {
            if (((i42) this.d) != null) {
                i42 i42Var = (i42) this.f;
                if (i42Var == null) {
                    i42Var = new i42();
                    this.f = i42Var;
                }
                i42Var.c = null;
                i42Var.b = false;
                i42Var.d = null;
                i42Var.a = false;
                WeakHashMap weakHashMap = ute.a;
                ColorStateList backgroundTintList = view.getBackgroundTintList();
                if (backgroundTintList != null) {
                    i42Var.b = true;
                    i42Var.c = backgroundTintList;
                }
                PorterDuff.Mode backgroundTintMode = view.getBackgroundTintMode();
                if (backgroundTintMode != null) {
                    i42Var.a = true;
                    i42Var.d = backgroundTintMode;
                }
                if (i42Var.b || i42Var.a) {
                    int[] drawableState = view.getDrawableState();
                    PorterDuff.Mode mode = j20.b;
                    scb.o(background, i42Var, drawableState);
                    return;
                }
            }
            i42 i42Var2 = (i42) this.e;
            if (i42Var2 != null) {
                int[] drawableState2 = view.getDrawableState();
                PorterDuff.Mode mode2 = j20.b;
                scb.o(background, i42Var2, drawableState2);
            } else {
                i42 i42Var3 = (i42) this.d;
                if (i42Var3 != null) {
                    int[] drawableState3 = view.getDrawableState();
                    PorterDuff.Mode mode3 = j20.b;
                    scb.o(background, i42Var3, drawableState3);
                }
            }
        }
    }

    public boolean b(int i) {
        ArrayList arrayList = (ArrayList) this.d;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            d8 d8Var = (d8) arrayList.get(i2);
            int i3 = d8Var.a;
            if (i3 != 8) {
                if (i3 == 1) {
                    int i4 = d8Var.b;
                    int i5 = d8Var.d + i4;
                    while (i4 < i5) {
                        if (g(i4, i2 + 1) == i) {
                            return true;
                        }
                        i4++;
                    }
                } else {
                    continue;
                }
            } else {
                if (g(d8Var.d, i2 + 1) == i) {
                    return true;
                }
            }
        }
        return false;
    }

    public void c() {
        ArrayList arrayList = (ArrayList) this.d;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            ((olb) this.e).e((d8) arrayList.get(i));
        }
        q(arrayList);
        this.a = 0;
    }

    public void d() {
        olb olbVar = (olb) this.e;
        c();
        ArrayList arrayList = (ArrayList) this.c;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            d8 d8Var = (d8) arrayList.get(i);
            int i2 = d8Var.a;
            if (i2 == 1) {
                olbVar.e(d8Var);
                olbVar.q(d8Var.b, d8Var.d);
            } else if (i2 == 2) {
                olbVar.e(d8Var);
                int i3 = d8Var.b;
                int i4 = d8Var.d;
                RecyclerView recyclerView = (RecyclerView) olbVar.b;
                recyclerView.Q(i3, i4, true);
                recyclerView.x0 = true;
                recyclerView.u0.c += i4;
            } else if (i2 == 4) {
                olbVar.e(d8Var);
                olbVar.o(d8Var.b, d8Var.d, d8Var.c);
            } else if (i2 == 8) {
                olbVar.e(d8Var);
                olbVar.r(d8Var.b, d8Var.d);
            }
        }
        q(arrayList);
        this.a = 0;
    }

    public void e(d8 d8Var) {
        int i;
        wc9 wc9Var = (wc9) this.b;
        int i2 = d8Var.a;
        if (i2 == 1 || i2 == 8) {
            ay0.e("should not dispatch add or move for pre layout");
            return;
        }
        int iU = u(d8Var.b, i2);
        int i3 = d8Var.b;
        int i4 = d8Var.a;
        if (i4 == 2) {
            i = 0;
        } else {
            if (i4 != 4) {
                ik4.h("op should be remove or update.", d8Var);
                return;
            }
            i = 1;
        }
        int i5 = 1;
        for (int i6 = 1; i6 < d8Var.d; i6++) {
            int iU2 = u((i * i6) + d8Var.b, d8Var.a);
            int i7 = d8Var.a;
            if (i7 == 2 ? iU2 != iU : !(i7 == 4 && iU2 == iU + 1)) {
                d8 d8VarL = l(d8Var.c, i7, iU, i5);
                f(d8VarL, i3);
                d8VarL.c = null;
                wc9Var.c(d8VarL);
                if (d8Var.a == 4) {
                    i3 += i5;
                }
                i5 = 1;
                iU = iU2;
            } else {
                i5++;
            }
        }
        Object obj = d8Var.c;
        d8Var.c = null;
        wc9Var.c(d8Var);
        if (i5 > 0) {
            d8 d8VarL2 = l(obj, d8Var.a, iU, i5);
            f(d8VarL2, i3);
            d8VarL2.c = null;
            wc9Var.c(d8VarL2);
        }
    }

    public void f(d8 d8Var, int i) {
        olb olbVar = (olb) this.e;
        olbVar.e(d8Var);
        int i2 = d8Var.a;
        if (i2 != 2) {
            if (i2 == 4) {
                olbVar.o(i, d8Var.d, d8Var.c);
                return;
            } else {
                ay0.e("only remove and update ops can be dispatched in first pass");
                return;
            }
        }
        int i3 = d8Var.d;
        RecyclerView recyclerView = (RecyclerView) olbVar.b;
        recyclerView.Q(i, i3, true);
        recyclerView.x0 = true;
        recyclerView.u0.c += i3;
    }

    public int g(int i, int i2) {
        ArrayList arrayList = (ArrayList) this.d;
        int size = arrayList.size();
        while (i2 < size) {
            d8 d8Var = (d8) arrayList.get(i2);
            int i3 = d8Var.a;
            int i4 = d8Var.b;
            if (i3 == 8) {
                if (i4 == i) {
                    i = d8Var.d;
                } else {
                    if (i4 < i) {
                        i--;
                    }
                    if (d8Var.d <= i) {
                        i++;
                    }
                }
            } else if (i4 > i) {
                continue;
            } else if (i3 == 2) {
                int i5 = d8Var.d;
                if (i < i4 + i5) {
                    return -1;
                }
                i -= i5;
            } else if (i3 == 1) {
                i += d8Var.d;
            }
            i2++;
        }
        return i;
    }

    public ColorStateList h() {
        i42 i42Var = (i42) this.e;
        if (i42Var != null) {
            return (ColorStateList) i42Var.c;
        }
        return null;
    }

    public PorterDuff.Mode i() {
        i42 i42Var = (i42) this.e;
        if (i42Var != null) {
            return (PorterDuff.Mode) i42Var.d;
        }
        return null;
    }

    public boolean j() {
        return ((ArrayList) this.c).size() > 0;
    }

    public void k(AttributeSet attributeSet, int i) {
        ColorStateList colorStateListI;
        View view = (View) this.b;
        Context context = view.getContext();
        int[] iArr = esa.y;
        vwa vwaVarX = vwa.x(context, attributeSet, iArr, i);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        View view2 = (View) this.b;
        ute.n(view2, view2.getContext(), iArr, attributeSet, (TypedArray) vwaVarX.c, i);
        try {
            if (typedArray.hasValue(0)) {
                this.a = typedArray.getResourceId(0, -1);
                j20 j20Var = (j20) this.c;
                Context context2 = view.getContext();
                int i2 = this.a;
                synchronized (j20Var) {
                    colorStateListI = j20Var.a.i(context2, i2);
                }
                if (colorStateListI != null) {
                    r(colorStateListI);
                }
            }
            if (typedArray.hasValue(1)) {
                view.setBackgroundTintList(vwaVarX.o(1));
            }
            if (typedArray.hasValue(2)) {
                view.setBackgroundTintMode(lm3.b(typedArray.getInt(2, -1), null));
            }
            vwaVarX.C();
        } catch (Throwable th) {
            vwaVarX.C();
            throw th;
        }
    }

    public d8 l(Object obj, int i, int i2, int i3) {
        d8 d8Var = (d8) ((wc9) this.b).a();
        if (d8Var != null) {
            d8Var.a = i;
            d8Var.b = i2;
            d8Var.d = i3;
            d8Var.c = obj;
            return d8Var;
        }
        d8 d8Var2 = new d8();
        d8Var2.a = i;
        d8Var2.b = i2;
        d8Var2.d = i3;
        d8Var2.c = obj;
        return d8Var2;
    }

    public void m() {
        this.a = -1;
        r(null);
        a();
    }

    public void n(int i) {
        ColorStateList colorStateListI;
        this.a = i;
        j20 j20Var = (j20) this.c;
        if (j20Var != null) {
            Context context = ((View) this.b).getContext();
            synchronized (j20Var) {
                colorStateListI = j20Var.a.i(context, i);
            }
        } else {
            colorStateListI = null;
        }
        r(colorStateListI);
        a();
    }

    public void o(d8 d8Var) {
        olb olbVar = (olb) this.e;
        ((ArrayList) this.d).add(d8Var);
        int i = d8Var.a;
        if (i == 1) {
            olbVar.q(d8Var.b, d8Var.d);
            return;
        }
        if (i == 2) {
            int i2 = d8Var.b;
            int i3 = d8Var.d;
            RecyclerView recyclerView = (RecyclerView) olbVar.b;
            recyclerView.Q(i2, i3, false);
            recyclerView.x0 = true;
            return;
        }
        if (i == 4) {
            olbVar.o(d8Var.b, d8Var.d, d8Var.c);
        } else if (i == 8) {
            olbVar.r(d8Var.b, d8Var.d);
        } else {
            ik4.h("Unknown update op type for ", d8Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:188:0x00ae A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:189:0x0130 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:192:0x0123 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:206:0x0012 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00a9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void p() {
        /*
            Method dump skipped, instruction units count: 706
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.e8.p():void");
    }

    public void q(ArrayList arrayList) {
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            d8 d8Var = (d8) arrayList.get(i);
            d8Var.c = null;
            ((wc9) this.b).c(d8Var);
        }
        arrayList.clear();
    }

    public void r(ColorStateList colorStateList) {
        if (colorStateList != null) {
            i42 i42Var = (i42) this.d;
            if (i42Var == null) {
                i42Var = new i42();
                this.d = i42Var;
            }
            i42Var.c = colorStateList;
            i42Var.b = true;
        } else {
            this.d = null;
        }
        a();
    }

    public void s(ColorStateList colorStateList) {
        i42 i42Var = (i42) this.e;
        if (i42Var == null) {
            i42Var = new i42();
            this.e = i42Var;
        }
        i42Var.c = colorStateList;
        i42Var.b = true;
        a();
    }

    public void t(PorterDuff.Mode mode) {
        i42 i42Var = (i42) this.e;
        if (i42Var == null) {
            i42Var = new i42();
            this.e = i42Var;
        }
        i42Var.d = mode;
        i42Var.a = true;
        a();
    }

    public int u(int i, int i2) {
        int i3;
        int i4;
        wc9 wc9Var = (wc9) this.b;
        ArrayList arrayList = (ArrayList) this.d;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            d8 d8Var = (d8) arrayList.get(size);
            int i5 = d8Var.a;
            int i6 = d8Var.b;
            if (i5 == 8) {
                int i7 = d8Var.d;
                if (i6 < i7) {
                    i4 = i7;
                    i3 = i6;
                } else {
                    i3 = i7;
                    i4 = i6;
                }
                if (i < i3 || i > i4) {
                    if (i < i6) {
                        if (i2 == 1) {
                            d8Var.b = i6 + 1;
                            d8Var.d = i7 + 1;
                        } else if (i2 == 2) {
                            d8Var.b = i6 - 1;
                            d8Var.d = i7 - 1;
                        }
                    }
                } else if (i3 == i6) {
                    if (i2 == 1) {
                        d8Var.d = i7 + 1;
                    } else if (i2 == 2) {
                        d8Var.d = i7 - 1;
                    }
                    i++;
                } else {
                    if (i2 == 1) {
                        d8Var.b = i6 + 1;
                    } else if (i2 == 2) {
                        d8Var.b = i6 - 1;
                    }
                    i--;
                }
            } else if (i6 <= i) {
                if (i5 == 1) {
                    i -= d8Var.d;
                } else if (i5 == 2) {
                    i += d8Var.d;
                }
            } else if (i2 == 1) {
                d8Var.b = i6 + 1;
            } else if (i2 == 2) {
                d8Var.b = i6 - 1;
            }
        }
        for (int size2 = arrayList.size() - 1; size2 >= 0; size2--) {
            d8 d8Var2 = (d8) arrayList.get(size2);
            int i8 = d8Var2.a;
            int i9 = d8Var2.d;
            if (i8 == 8) {
                if (i9 == d8Var2.b || i9 < 0) {
                    arrayList.remove(size2);
                    d8Var2.c = null;
                    wc9Var.c(d8Var2);
                }
            } else if (i9 <= 0) {
                arrayList.remove(size2);
                d8Var2.c = null;
                wc9Var.c(d8Var2);
            }
        }
        return i;
    }

    public void v() {
        long jLongValue;
        SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(f94.a()).edit();
        editorEdit.putLong("com.facebook.appevents.SessionInfo.sessionStartTime", ((Long) this.b).longValue());
        Long l = (Long) this.c;
        if (l != null) {
            jLongValue = l.longValue();
        } else {
            jLongValue = 0;
        }
        editorEdit.putLong("com.facebook.appevents.SessionInfo.sessionEndTime", jLongValue);
        editorEdit.putInt(mBTDfueQiGWRV.VhUFsMY, this.a);
        editorEdit.putString("com.facebook.appevents.SessionInfo.sessionId", ((UUID) this.d).toString());
        editorEdit.apply();
        hlb hlbVar = (hlb) this.f;
        if (hlbVar != null) {
            SharedPreferences.Editor editorEdit2 = PreferenceManager.getDefaultSharedPreferences(f94.a()).edit();
            editorEdit2.putString("com.facebook.appevents.SourceApplicationInfo.callingApplicationPackage", hlbVar.b);
            editorEdit2.putBoolean("com.facebook.appevents.SourceApplicationInfo.openedByApplink", hlbVar.c);
            editorEdit2.apply();
        }
    }

    public e8(View view) {
        this.a = -1;
        this.b = view;
        this.c = j20.a();
    }

    public e8(Long l, Long l2) {
        UUID uuidRandomUUID = UUID.randomUUID();
        uuidRandomUUID.getClass();
        this.b = l;
        this.c = l2;
        this.d = uuidRandomUUID;
    }
}
