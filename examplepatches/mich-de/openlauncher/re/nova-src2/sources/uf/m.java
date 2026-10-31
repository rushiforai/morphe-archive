package uf;

import ai.u1;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.TextView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.m1;
import fe.a0;
import fe.a2;
import fe.b2;
import fe.f1;
import fe.i0;
import fe.k0;
import fe.l1;
import fe.x1;
import fe.y1;
import fe.z1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Arrays;
import java.util.Collections;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArrayList;
import o9.d4;
import t5.d0;
import xk.r2;
import xk.v0;

/* loaded from: classes3.dex */
public final class m extends FrameLayout {

    /* renamed from: n0, reason: collision with root package name */
    public static final float[] f91147n0;
    public final TextView A;
    public final TextView B;
    public final w C;
    public final StringBuilder D;
    public final Formatter E;
    public final x1 F;
    public final y1 G;
    public final d4 H;
    public final Drawable I;
    public final Drawable J;
    public final Drawable K;
    public final String L;
    public final String M;
    public final String N;
    public final Drawable O;
    public final Drawable P;
    public final float Q;
    public final float R;
    public final String S;
    public final String T;
    public final Drawable U;
    public final Drawable V;
    public final String W;

    /* renamed from: a, reason: collision with root package name */
    public final s f91148a;

    /* renamed from: a0, reason: collision with root package name */
    public final String f91149a0;

    /* renamed from: b, reason: collision with root package name */
    public final Resources f91150b;

    /* renamed from: b0, reason: collision with root package name */
    public l1 f91151b0;

    /* renamed from: c, reason: collision with root package name */
    public final g f91152c;

    /* renamed from: c0, reason: collision with root package name */
    public boolean f91153c0;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArrayList f91154d;

    /* renamed from: d0, reason: collision with root package name */
    public boolean f91155d0;

    /* renamed from: e, reason: collision with root package name */
    public final RecyclerView f91156e;

    /* renamed from: e0, reason: collision with root package name */
    public int f91157e0;

    /* renamed from: f, reason: collision with root package name */
    public final j f91158f;

    /* renamed from: f0, reason: collision with root package name */
    public final int f91159f0;

    /* renamed from: g, reason: collision with root package name */
    public final h f91160g;

    /* renamed from: g0, reason: collision with root package name */
    public final int f91161g0;

    /* renamed from: h, reason: collision with root package name */
    public final f f91162h;

    /* renamed from: h0, reason: collision with root package name */
    public long[] f91163h0;

    /* renamed from: i, reason: collision with root package name */
    public final f f91164i;

    /* renamed from: i0, reason: collision with root package name */
    public boolean[] f91165i0;

    /* renamed from: j, reason: collision with root package name */
    public final d0 f91166j;

    /* renamed from: j0, reason: collision with root package name */
    public final long[] f91167j0;

    /* renamed from: k, reason: collision with root package name */
    public final PopupWindow f91168k;

    /* renamed from: k0, reason: collision with root package name */
    public final boolean[] f91169k0;

    /* renamed from: l, reason: collision with root package name */
    public final int f91170l;

    /* renamed from: l0, reason: collision with root package name */
    public long f91171l0;

    /* renamed from: m, reason: collision with root package name */
    public final View f91172m;

    /* renamed from: m0, reason: collision with root package name */
    public boolean f91173m0;
    public final View n;
    public final View o;

    /* renamed from: p, reason: collision with root package name */
    public final View f91174p;

    /* renamed from: q, reason: collision with root package name */
    public final View f91175q;

    /* renamed from: r, reason: collision with root package name */
    public final TextView f91176r;

    /* renamed from: s, reason: collision with root package name */
    public final TextView f91177s;

    /* renamed from: t, reason: collision with root package name */
    public final ImageView f91178t;

    /* renamed from: u, reason: collision with root package name */
    public final ImageView f91179u;

    /* renamed from: v, reason: collision with root package name */
    public final View f91180v;

    /* renamed from: w, reason: collision with root package name */
    public final ImageView f91181w;

    /* renamed from: x, reason: collision with root package name */
    public final View f91182x;

    /* renamed from: y, reason: collision with root package name */
    public final View f91183y;

    /* renamed from: z, reason: collision with root package name */
    public final View f91184z;

    static {
        i0.a("goog.exo.ui");
        f91147n0 = new float[]{0.25f, 0.5f, 0.75f, 1.0f, 1.25f, 1.5f, 2.0f};
    }

    public m(Context context) throws Resources.NotFoundException {
        super(context, null, 0);
        this.f91157e0 = 5000;
        this.f91161g0 = 0;
        this.f91159f0 = 200;
        LayoutInflater.from(context).inflate(2131624115, this);
        setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        g gVar = new g(this);
        this.f91152c = gVar;
        this.f91154d = new CopyOnWriteArrayList();
        this.F = new x1();
        this.G = new y1();
        StringBuilder sb2 = new StringBuilder();
        this.D = sb2;
        this.E = new Formatter(sb2, Locale.getDefault());
        this.f91163h0 = new long[0];
        this.f91165i0 = new boolean[0];
        this.f91167j0 = new long[0];
        this.f91169k0 = new boolean[0];
        this.H = new d4(this, 13);
        this.A = (TextView) findViewById(2131427993);
        this.B = (TextView) findViewById(2131428012);
        ImageView imageView = (ImageView) findViewById(2131428024);
        this.f91181w = imageView;
        if (imageView != null) {
            imageView.setOnClickListener(gVar);
        }
        ImageView imageView2 = (ImageView) findViewById(2131427999);
        fk.t tVar = new fk.t(this, 26);
        if (imageView2 != null) {
            imageView2.setVisibility(8);
            imageView2.setOnClickListener(tVar);
        }
        ImageView imageView3 = (ImageView) findViewById(2131428003);
        fk.t tVar2 = new fk.t(this, 26);
        if (imageView3 != null) {
            imageView3.setVisibility(8);
            imageView3.setOnClickListener(tVar2);
        }
        View viewFindViewById = findViewById(2131428019);
        this.f91182x = viewFindViewById;
        if (viewFindViewById != null) {
            viewFindViewById.setOnClickListener(gVar);
        }
        View viewFindViewById2 = findViewById(2131428011);
        this.f91183y = viewFindViewById2;
        if (viewFindViewById2 != null) {
            viewFindViewById2.setOnClickListener(gVar);
        }
        View viewFindViewById3 = findViewById(2131427983);
        this.f91184z = viewFindViewById3;
        if (viewFindViewById3 != null) {
            viewFindViewById3.setOnClickListener(gVar);
        }
        w wVar = (w) findViewById(2131428014);
        View viewFindViewById4 = findViewById(2131428015);
        if (wVar != null) {
            this.C = wVar;
        } else if (viewFindViewById4 != null) {
            d dVar = new d(context);
            dVar.setId(2131428014);
            dVar.setLayoutParams(viewFindViewById4.getLayoutParams());
            ViewGroup viewGroup = (ViewGroup) viewFindViewById4.getParent();
            int iIndexOfChild = viewGroup.indexOfChild(viewFindViewById4);
            viewGroup.removeView(viewFindViewById4);
            viewGroup.addView(dVar, iIndexOfChild);
            this.C = dVar;
        } else {
            this.C = null;
        }
        w wVar2 = this.C;
        if (wVar2 != null) {
            ((d) wVar2).f91121x.add(gVar);
        }
        View viewFindViewById5 = findViewById(2131428010);
        this.o = viewFindViewById5;
        if (viewFindViewById5 != null) {
            viewFindViewById5.setOnClickListener(gVar);
        }
        View viewFindViewById6 = findViewById(2131428013);
        this.f91172m = viewFindViewById6;
        if (viewFindViewById6 != null) {
            viewFindViewById6.setOnClickListener(gVar);
        }
        View viewFindViewById7 = findViewById(2131428004);
        this.n = viewFindViewById7;
        if (viewFindViewById7 != null) {
            viewFindViewById7.setOnClickListener(gVar);
        }
        Typeface typefaceA = q4.k.a(context, 2131296258);
        View viewFindViewById8 = findViewById(2131428017);
        TextView textView = viewFindViewById8 == null ? (TextView) findViewById(2131428018) : null;
        this.f91177s = textView;
        if (textView != null) {
            textView.setTypeface(typefaceA);
        }
        viewFindViewById8 = viewFindViewById8 == null ? textView : viewFindViewById8;
        this.f91175q = viewFindViewById8;
        if (viewFindViewById8 != null) {
            viewFindViewById8.setOnClickListener(gVar);
        }
        View viewFindViewById9 = findViewById(2131427997);
        TextView textView2 = viewFindViewById9 == null ? (TextView) findViewById(2131427998) : null;
        this.f91176r = textView2;
        if (textView2 != null) {
            textView2.setTypeface(typefaceA);
        }
        viewFindViewById9 = viewFindViewById9 == null ? textView2 : viewFindViewById9;
        this.f91174p = viewFindViewById9;
        if (viewFindViewById9 != null) {
            viewFindViewById9.setOnClickListener(gVar);
        }
        ImageView imageView4 = (ImageView) findViewById(2131428016);
        this.f91178t = imageView4;
        if (imageView4 != null) {
            imageView4.setOnClickListener(gVar);
        }
        ImageView imageView5 = (ImageView) findViewById(2131428021);
        this.f91179u = imageView5;
        if (imageView5 != null) {
            imageView5.setOnClickListener(gVar);
        }
        Resources resources = context.getResources();
        this.f91150b = resources;
        this.Q = resources.getInteger(2131492887) / 100.0f;
        this.R = resources.getInteger(2131492886) / 100.0f;
        View viewFindViewById10 = findViewById(2131428029);
        this.f91180v = viewFindViewById10;
        if (viewFindViewById10 != null) {
            i(viewFindViewById10, false);
        }
        s sVar = new s(this);
        this.f91148a = sVar;
        sVar.C = true;
        j jVar = new j(this, new String[]{resources.getString(2132017821), resources.getString(2132017854)}, new Drawable[]{resources.getDrawable(2131231343), resources.getDrawable(2131231325)});
        this.f91158f = jVar;
        this.f91170l = resources.getDimensionPixelSize(2131165472);
        RecyclerView recyclerView = (RecyclerView) LayoutInflater.from(context).inflate(2131624117, (ViewGroup) null);
        this.f91156e = recyclerView;
        recyclerView.setAdapter(jVar);
        getContext();
        recyclerView.setLayoutManager(new LinearLayoutManager());
        PopupWindow popupWindow = new PopupWindow((View) recyclerView, -2, -2, true);
        this.f91168k = popupWindow;
        if (wf.v.f94376a < 23) {
            popupWindow.setBackgroundDrawable(new ColorDrawable(0));
        }
        popupWindow.setOnDismissListener(gVar);
        this.f91173m0 = true;
        this.f91166j = new d0(getResources());
        this.U = resources.getDrawable(2131231345);
        this.V = resources.getDrawable(2131231344);
        this.W = resources.getString(2132017810);
        this.f91149a0 = resources.getString(2132017809);
        this.f91162h = new f(this, 1);
        this.f91164i = new f(this, 0);
        this.f91160g = new h(this, resources.getStringArray(2130903061), f91147n0);
        resources.getDrawable(2131231329);
        resources.getDrawable(2131231328);
        this.I = resources.getDrawable(2131231337);
        this.J = resources.getDrawable(2131231338);
        this.K = resources.getDrawable(2131231336);
        this.O = resources.getDrawable(2131231342);
        this.P = resources.getDrawable(2131231341);
        resources.getString(2132017814);
        resources.getString(2132017813);
        this.L = resources.getString(2132017824);
        this.M = resources.getString(2132017825);
        this.N = resources.getString(2132017823);
        this.S = resources.getString(2132017831);
        this.T = resources.getString(2132017830);
        sVar.g((ViewGroup) findViewById(2131427985), true);
        sVar.g(viewFindViewById9, true);
        sVar.g(viewFindViewById8, true);
        sVar.g(viewFindViewById6, true);
        sVar.g(viewFindViewById7, true);
        sVar.g(imageView5, false);
        sVar.g(imageView, false);
        sVar.g(viewFindViewById10, false);
        sVar.g(imageView4, false);
        addOnLayoutChangeListener(new bd.a(this, 3));
    }

    public final boolean a(KeyEvent keyEvent) {
        int keyCode = keyEvent.getKeyCode();
        l1 l1Var = this.f91151b0;
        if (l1Var == null || !(keyCode == 90 || keyCode == 89 || keyCode == 85 || keyCode == 79 || keyCode == 126 || keyCode == 127 || keyCode == 87 || keyCode == 88)) {
            return false;
        }
        if (keyEvent.getAction() == 0) {
            if (keyCode == 90) {
                if (((a0) l1Var).T() != 4) {
                    u1 u1Var = (u1) l1Var;
                    a0 a0Var = (a0) u1Var;
                    a0Var.s0();
                    u1Var.y(a0Var.f54703v);
                }
            } else if (keyCode == 89) {
                u1 u1Var2 = (u1) l1Var;
                a0 a0Var2 = (a0) u1Var2;
                a0Var2.s0();
                u1Var2.y(-a0Var2.f54702u);
            } else if (keyEvent.getRepeatCount() == 0) {
                if (keyCode == 79 || keyCode == 85) {
                    a0 a0Var3 = (a0) l1Var;
                    int iT = a0Var3.T();
                    if (iT == 1 || iT == 4 || !a0Var3.S()) {
                        int iT2 = a0Var3.T();
                        if (iT2 == 1) {
                            a0Var3.b0();
                        } else if (iT2 == 4) {
                            int iL = a0Var3.L();
                            a0Var3.s0();
                            a0Var3.f0(-9223372036854775807L, iL, false);
                        }
                        a0Var3.j0(true);
                    } else {
                        a0Var3.j0(false);
                    }
                } else if (keyCode == 87) {
                    ((u1) l1Var).x();
                } else if (keyCode == 88) {
                    ((u1) l1Var).z();
                } else if (keyCode == 126) {
                    a0 a0Var4 = (a0) l1Var;
                    int iT3 = a0Var4.T();
                    if (iT3 == 1) {
                        a0Var4.b0();
                    } else if (iT3 == 4) {
                        int iL2 = a0Var4.L();
                        a0Var4.s0();
                        a0Var4.f0(-9223372036854775807L, iL2, false);
                    }
                    a0Var4.j0(true);
                } else if (keyCode == 127) {
                    ((a0) ((u1) l1Var)).j0(false);
                }
            }
        }
        return true;
    }

    public final void b(m1 m1Var, View view) {
        this.f91156e.setAdapter(m1Var);
        o();
        this.f91173m0 = false;
        PopupWindow popupWindow = this.f91168k;
        popupWindow.dismiss();
        this.f91173m0 = true;
        int width = getWidth() - popupWindow.getWidth();
        int i5 = this.f91170l;
        popupWindow.showAsDropDown(view, width - i5, (-popupWindow.getHeight()) - i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0033  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00da  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final r2 c(b2 b2Var, int i5) throws Resources.NotFoundException {
        v0 v0Var;
        a2 a2Var;
        String strE;
        String strB;
        int i11 = 4;
        w20.e.e(4, "initialCapacity");
        Object[] objArrCopyOf = new Object[4];
        v0 v0Var2 = b2Var.f54719a;
        int i12 = 0;
        int i13 = 0;
        while (i12 < v0Var2.size()) {
            a2 a2Var2 = (a2) v0Var2.get(i12);
            if (a2Var2.f54709b.f57657c == i5) {
                int i14 = 0;
                while (i14 < a2Var2.f54708a) {
                    if (a2Var2.f54711d[i14] != i11) {
                        v0Var = v0Var2;
                        a2Var = a2Var2;
                    } else {
                        k0 k0Var = a2Var2.f54709b.f57658d[i14];
                        int i15 = k0Var.f54875d;
                        int i16 = k0Var.f54879h;
                        if ((i15 & 2) == 0) {
                            d0 d0Var = this.f91166j;
                            Resources resources = (Resources) d0Var.f88562b;
                            Resources resources2 = (Resources) d0Var.f88562b;
                            String str = k0Var.f54883l;
                            int i17 = k0Var.f54894y;
                            v0Var = v0Var2;
                            int i18 = k0Var.f54887r;
                            int i19 = i13;
                            int i21 = k0Var.f54886q;
                            a2Var = a2Var2;
                            String str2 = k0Var.f54880i;
                            int iF = wf.j.f(str);
                            if (iF == -1) {
                                String str3 = null;
                                if (str2 != null) {
                                    String[] strArrSplit = TextUtils.isEmpty(str2) ? new String[0] : str2.trim().split("(\\s*,\\s*)", -1);
                                    int length = strArrSplit.length;
                                    String[] strArr = strArrSplit;
                                    for (int i22 = 0; i22 < length; i22++) {
                                        strB = wf.j.b(strArr[i22]);
                                        if (strB != null && wf.j.i(strB)) {
                                            break;
                                        }
                                    }
                                    strB = null;
                                    if (strB == null) {
                                        if (str2 != null) {
                                            String[] strArrSplit2 = TextUtils.isEmpty(str2) ? new String[0] : str2.trim().split("(\\s*,\\s*)", -1);
                                            int length2 = strArrSplit2.length;
                                            int i23 = 0;
                                            while (true) {
                                                if (i23 >= length2) {
                                                    break;
                                                }
                                                String strB2 = wf.j.b(strArrSplit2[i23]);
                                                if (strB2 != null && wf.j.g(strB2)) {
                                                    str3 = strB2;
                                                    break;
                                                }
                                                i23++;
                                            }
                                        }
                                        if (str3 == null) {
                                            iF = (i21 == -1 && i18 == -1) ? (i17 == -1 && k0Var.f54895z == -1) ? -1 : 1 : 2;
                                        }
                                    }
                                } else {
                                    strB = null;
                                    if (strB == null) {
                                    }
                                }
                            }
                            String string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            if (iF == 2) {
                                String strG = d0Var.g(k0Var);
                                String string2 = (i21 == -1 || i18 == -1) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : resources.getString(2132017847, Integer.valueOf(i21), Integer.valueOf(i18));
                                if (i16 != -1) {
                                    string = resources2.getString(2132017845, Float.valueOf(i16 / 1000000.0f));
                                }
                                strE = d0Var.B(strG, string2, string);
                            } else if (iF == 1) {
                                String strE2 = d0Var.e(k0Var);
                                String string3 = (i17 == -1 || i17 < 1) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : i17 != 1 ? i17 != 2 ? (i17 == 6 || i17 == 7) ? resources.getString(2132017859) : i17 != 8 ? resources.getString(2132017858) : resources.getString(2132017860) : resources.getString(2132017857) : resources.getString(2132017846);
                                if (i16 != -1) {
                                    string = resources2.getString(2132017845, Float.valueOf(i16 / 1000000.0f));
                                }
                                strE = d0Var.B(strE2, string3, string);
                            } else {
                                strE = d0Var.e(k0Var);
                            }
                            if (strE.length() == 0) {
                                strE = resources.getString(2132017861);
                            }
                            l lVar = new l(b2Var, i12, i14, strE);
                            i13 = i19 + 1;
                            if (objArrCopyOf.length < i13) {
                                objArrCopyOf = Arrays.copyOf(objArrCopyOf, rg.m.c(objArrCopyOf.length, i13));
                            }
                            objArrCopyOf[i19] = lVar;
                        }
                    }
                    i14++;
                    v0Var2 = v0Var;
                    a2Var2 = a2Var;
                    i11 = 4;
                }
            }
            i12++;
            v0Var2 = v0Var2;
            i11 = 4;
        }
        return v0.k(i13, objArrCopyOf);
    }

    public final void d() {
        s sVar = this.f91148a;
        int i5 = sVar.f91219z;
        if (i5 == 3 || i5 == 2) {
            return;
        }
        sVar.e();
        if (!sVar.C) {
            sVar.h(2);
        } else if (sVar.f91219z == 1) {
            sVar.f91208m.start();
        } else {
            sVar.n.start();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return a(keyEvent) || super.dispatchKeyEvent(keyEvent);
    }

    public final boolean e() {
        s sVar = this.f91148a;
        return sVar.f91219z == 0 && sVar.f91196a.f();
    }

    public final boolean f() {
        return getVisibility() == 0;
    }

    public final void g(l1 l1Var) {
        wf.a.i(Looper.myLooper() == Looper.getMainLooper());
        wf.a.e(l1Var == null || ((a0) l1Var).f54700s == Looper.getMainLooper());
        l1 l1Var2 = this.f91151b0;
        if (l1Var2 == l1Var) {
            return;
        }
        g gVar = this.f91152c;
        if (l1Var2 != null) {
            ((a0) l1Var2).d0(gVar);
        }
        this.f91151b0 = l1Var;
        if (l1Var != null) {
            wf.h hVar = ((a0) l1Var).f54694l;
            gVar.getClass();
            hVar.a(gVar);
        }
        h();
    }

    public final void h() {
        k();
        j();
        n();
        p();
        r();
        l();
        q();
    }

    public final void i(View view, boolean z11) {
        if (view == null) {
            return;
        }
        view.setEnabled(z11);
        view.setAlpha(z11 ? this.Q : this.R);
    }

    public final void j() {
        boolean zT;
        boolean zT2;
        boolean zT3;
        boolean zT4;
        boolean zT5;
        long j11;
        long j12;
        if (f() && this.f91153c0) {
            l1 l1Var = this.f91151b0;
            if (l1Var != null) {
                u1 u1Var = (u1) l1Var;
                zT = u1Var.t(5);
                zT3 = u1Var.t(7);
                zT4 = u1Var.t(11);
                zT5 = u1Var.t(12);
                zT2 = u1Var.t(9);
            } else {
                zT = false;
                zT2 = false;
                zT3 = false;
                zT4 = false;
                zT5 = false;
            }
            Resources resources = this.f91150b;
            View view = this.f91175q;
            if (zT4) {
                l1 l1Var2 = this.f91151b0;
                if (l1Var2 != null) {
                    a0 a0Var = (a0) l1Var2;
                    a0Var.s0();
                    j12 = a0Var.f54702u;
                } else {
                    j12 = 5000;
                }
                int i5 = (int) (j12 / 1000);
                TextView textView = this.f91177s;
                if (textView != null) {
                    textView.setText(String.valueOf(i5));
                }
                if (view != null) {
                    view.setContentDescription(resources.getQuantityString(2131886083, i5, Integer.valueOf(i5)));
                }
            }
            View view2 = this.f91174p;
            if (zT5) {
                l1 l1Var3 = this.f91151b0;
                if (l1Var3 != null) {
                    a0 a0Var2 = (a0) l1Var3;
                    a0Var2.s0();
                    j11 = a0Var2.f54703v;
                } else {
                    j11 = 15000;
                }
                int i11 = (int) (j11 / 1000);
                TextView textView2 = this.f91176r;
                if (textView2 != null) {
                    textView2.setText(String.valueOf(i11));
                }
                if (view2 != null) {
                    view2.setContentDescription(resources.getQuantityString(2131886082, i11, Integer.valueOf(i11)));
                }
            }
            i(this.f91172m, zT3);
            i(view, zT4);
            i(view2, zT5);
            i(this.n, zT2);
            w wVar = this.C;
            if (wVar != null) {
                ((d) wVar).setEnabled(zT);
            }
        }
    }

    public final void k() {
        View view;
        if (f() && this.f91153c0 && (view = this.o) != null) {
            l1 l1Var = this.f91151b0;
            Resources resources = this.f91150b;
            if (l1Var == null || ((a0) l1Var).T() == 4 || ((a0) this.f91151b0).T() == 1 || !((a0) this.f91151b0).S()) {
                ((ImageView) view).setImageDrawable(resources.getDrawable(2131231334));
                view.setContentDescription(resources.getString(2132017820));
            } else {
                ((ImageView) view).setImageDrawable(resources.getDrawable(2131231333));
                view.setContentDescription(resources.getString(2132017819));
            }
        }
    }

    public final void l() {
        l1 l1Var = this.f91151b0;
        if (l1Var == null) {
            return;
        }
        a0 a0Var = (a0) l1Var;
        a0Var.s0();
        float f11 = a0Var.f54691j0.n.f54797a;
        float f12 = Float.MAX_VALUE;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            h hVar = this.f91160g;
            float[] fArr = hVar.f91131b;
            if (i5 >= fArr.length) {
                hVar.f91132c = i11;
                this.f91158f.f91139b[0] = hVar.f91130a[i11];
                return;
            } else {
                float fAbs = Math.abs(f11 - fArr[i5]);
                if (fAbs < f12) {
                    i11 = i5;
                    f12 = fAbs;
                }
                i5++;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x012d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void m() {
        long j11;
        long jI;
        long j12;
        long jF;
        if (f() && this.f91153c0) {
            l1 l1Var = this.f91151b0;
            if (l1Var != null) {
                a0 a0Var = (a0) l1Var;
                jI = a0Var.I() + this.f91171l0;
                long j13 = this.f91171l0;
                a0Var.s0();
                if (a0Var.f54691j0.f54764a.p()) {
                    jF = a0Var.f54695l0;
                } else {
                    f1 f1Var = a0Var.f54691j0;
                    if (f1Var.f54774k.f57643d != f1Var.f54765b.f57643d) {
                        jF = wf.v.F(f1Var.f54764a.m(a0Var.L(), (y1) a0Var.f13368a, 0L).f55110m);
                    } else {
                        long j14 = f1Var.f54777p;
                        if (a0Var.f54691j0.f54774k.a()) {
                            f1 f1Var2 = a0Var.f54691j0;
                            x1 x1VarG = f1Var2.f54764a.g(f1Var2.f54774k.f57640a, a0Var.n);
                            long jD = x1VarG.d(a0Var.f54691j0.f54774k.f57641b);
                            j14 = jD == Long.MIN_VALUE ? x1VarG.f55078d : jD;
                        }
                        f1 f1Var3 = a0Var.f54691j0;
                        z1 z1Var = f1Var3.f54764a;
                        Object obj = f1Var3.f54774k.f57640a;
                        x1 x1Var = a0Var.n;
                        z1Var.g(obj, x1Var);
                        jF = wf.v.F(j14 + x1Var.f55079e);
                    }
                }
                j11 = j13 + jF;
            } else {
                j11 = 0;
                jI = 0;
            }
            TextView textView = this.B;
            if (textView != null && !this.f91155d0) {
                textView.setText(wf.v.r(this.D, this.E, jI));
            }
            w wVar = this.C;
            if (wVar != null) {
                d dVar = (d) wVar;
                if (dVar.K != jI) {
                    dVar.K = jI;
                    dVar.setContentDescription(wf.v.r(dVar.f91118u, dVar.f91119v, jI));
                    dVar.g();
                }
                d dVar2 = (d) this.C;
                if (dVar2.L != j11) {
                    dVar2.L = j11;
                    dVar2.g();
                }
            }
            removeCallbacks(this.H);
            int iT = l1Var == null ? 1 : ((a0) l1Var).T();
            if (l1Var != null) {
                a0 a0Var2 = (a0) ((u1) l1Var);
                if (a0Var2.T() == 3 && a0Var2.S()) {
                    a0Var2.s0();
                    if (a0Var2.f54691j0.f54776m == 0) {
                        w wVar2 = this.C;
                        if (wVar2 != null) {
                            d dVar3 = (d) wVar2;
                            int iWidth = (int) (dVar3.f91101b.width() / dVar3.f91123z);
                            if (iWidth != 0) {
                                long j15 = dVar3.J;
                                j12 = (j15 == 0 || j15 == -9223372036854775807L) ? Long.MAX_VALUE : j15 / iWidth;
                            }
                        } else {
                            j12 = 1000;
                        }
                        long jMin = Math.min(j12, 1000 - (jI % 1000));
                        a0 a0Var3 = (a0) l1Var;
                        a0Var3.s0();
                        float f11 = a0Var3.f54691j0.n.f54797a;
                        postDelayed(this.H, wf.v.i(f11 > 0.0f ? (long) (jMin / f11) : 1000L, this.f91159f0, 1000L));
                        return;
                    }
                }
            }
            if (iT == 4 || iT == 1) {
                return;
            }
            postDelayed(this.H, 1000L);
        }
    }

    public final void n() {
        ImageView imageView;
        if (f() && this.f91153c0 && (imageView = this.f91178t) != null) {
            if (this.f91161g0 == 0) {
                i(imageView, false);
                return;
            }
            l1 l1Var = this.f91151b0;
            String str = this.L;
            Drawable drawable = this.I;
            if (l1Var == null) {
                i(imageView, false);
                imageView.setImageDrawable(drawable);
                imageView.setContentDescription(str);
                return;
            }
            i(imageView, true);
            a0 a0Var = (a0) l1Var;
            a0Var.s0();
            int i5 = a0Var.F;
            if (i5 == 0) {
                imageView.setImageDrawable(drawable);
                imageView.setContentDescription(str);
            } else if (i5 == 1) {
                imageView.setImageDrawable(this.J);
                imageView.setContentDescription(this.M);
            } else {
                if (i5 != 2) {
                    return;
                }
                imageView.setImageDrawable(this.K);
                imageView.setContentDescription(this.N);
            }
        }
    }

    public final void o() {
        RecyclerView recyclerView = this.f91156e;
        recyclerView.measure(0, 0);
        int width = getWidth();
        int i5 = this.f91170l;
        int iMin = Math.min(recyclerView.getMeasuredWidth(), width - (i5 * 2));
        PopupWindow popupWindow = this.f91168k;
        popupWindow.setWidth(iMin);
        popupWindow.setHeight(Math.min(getHeight() - (i5 * 2), recyclerView.getMeasuredHeight()));
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        s sVar = this.f91148a;
        sVar.f91196a.addOnLayoutChangeListener(sVar.f91217x);
        this.f91153c0 = true;
        if (e()) {
            sVar.f();
        }
        h();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        s sVar = this.f91148a;
        sVar.f91196a.removeOnLayoutChangeListener(sVar.f91217x);
        this.f91153c0 = false;
        removeCallbacks(this.H);
        sVar.e();
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        View view = this.f91148a.f91197b;
        if (view != null) {
            view.layout(0, 0, i12 - i5, i13 - i11);
        }
    }

    public final void p() {
        ImageView imageView;
        if (f() && this.f91153c0 && (imageView = this.f91179u) != null) {
            l1 l1Var = this.f91151b0;
            if (!this.f91148a.f91218y.contains(imageView)) {
                i(imageView, false);
                return;
            }
            String str = this.T;
            Drawable drawable = this.P;
            if (l1Var == null) {
                i(imageView, false);
                imageView.setImageDrawable(drawable);
                imageView.setContentDescription(str);
                return;
            }
            i(imageView, true);
            a0 a0Var = (a0) l1Var;
            a0Var.s0();
            if (a0Var.G) {
                drawable = this.O;
            }
            imageView.setImageDrawable(drawable);
            a0Var.s0();
            if (a0Var.G) {
                str = this.S;
            }
            imageView.setContentDescription(str);
        }
    }

    public final void q() {
        long j11;
        int i5;
        boolean z11;
        long j12;
        int i11;
        int i12;
        boolean z12;
        l1 l1Var = this.f91151b0;
        if (l1Var == null) {
            return;
        }
        long j13 = 0;
        this.f91171l0 = 0L;
        a0 a0Var = (a0) l1Var;
        z1 z1VarO = a0Var.O();
        long j14 = -9223372036854775807L;
        boolean z13 = false;
        if (z1VarO.p()) {
            j11 = -9223372036854775807L;
            i5 = 0;
        } else {
            int iL = a0Var.L();
            int i13 = iL;
            long j15 = 0;
            i5 = 0;
            while (i13 <= iL) {
                if (i13 == iL) {
                    this.f91171l0 = wf.v.F(j15);
                }
                y1 y1Var = this.G;
                z1VarO.n(i13, y1Var);
                if (y1Var.f55110m == j14) {
                    break;
                }
                int i14 = y1Var.n;
                while (i14 <= y1Var.o) {
                    x1 x1Var = this.F;
                    z1VarO.f(i14, x1Var, z13);
                    long j16 = j13;
                    hf.b bVar = x1Var.f55081g;
                    int i15 = bVar.f59851d;
                    int i16 = bVar.f59848a;
                    while (i15 < i16) {
                        long jD = x1Var.d(i15);
                        if (jD == Long.MIN_VALUE) {
                            j12 = j14;
                            long j17 = x1Var.f55078d;
                            if (j17 != j12) {
                                jD = j17;
                            }
                            i11 = iL;
                            i12 = i16;
                            i15++;
                            j14 = j12;
                            iL = i11;
                            i16 = i12;
                        } else {
                            j12 = j14;
                        }
                        long j18 = jD + x1Var.f55079e;
                        if (j18 >= j16) {
                            long[] jArr = this.f91163h0;
                            if (i5 == jArr.length) {
                                int length = jArr.length == 0 ? 1 : jArr.length * 2;
                                this.f91163h0 = Arrays.copyOf(jArr, length);
                                this.f91165i0 = Arrays.copyOf(this.f91165i0, length);
                            }
                            this.f91163h0[i5] = wf.v.F(j15 + j18);
                            boolean[] zArr = this.f91165i0;
                            hf.a aVarA = x1Var.f55081g.a(i15);
                            int i17 = aVarA.f59838b;
                            if (i17 == -1) {
                                i11 = iL;
                                i12 = i16;
                                z12 = true;
                            } else {
                                int i18 = 0;
                                while (i18 < i17) {
                                    i11 = iL;
                                    int i19 = aVarA.f59841e[i18];
                                    i12 = i16;
                                    if (i19 == 0 || i19 == 1) {
                                        z12 = true;
                                        break;
                                    } else {
                                        i18++;
                                        iL = i11;
                                        i16 = i12;
                                    }
                                }
                                i11 = iL;
                                i12 = i16;
                                z12 = false;
                            }
                            zArr[i5] = !z12;
                            i5++;
                        } else {
                            i11 = iL;
                            i12 = i16;
                        }
                        i15++;
                        j14 = j12;
                        iL = i11;
                        i16 = i12;
                    }
                    i14++;
                    j13 = j16;
                    z13 = false;
                }
                j15 += y1Var.f55110m;
                i13++;
                j13 = j13;
                iL = iL;
                z13 = false;
            }
            j11 = j14;
            j13 = j15;
        }
        long jF = wf.v.F(j13);
        TextView textView = this.A;
        if (textView != null) {
            textView.setText(wf.v.r(this.D, this.E, jF));
        }
        w wVar = this.C;
        if (wVar != null) {
            d dVar = (d) wVar;
            if (dVar.J == jF) {
                z11 = true;
            } else {
                dVar.J = jF;
                if (dVar.H && jF == j11) {
                    z11 = true;
                    dVar.f(true);
                } else {
                    z11 = true;
                }
                dVar.g();
            }
            long[] jArr2 = this.f91167j0;
            int length2 = jArr2.length;
            int i21 = i5 + length2;
            long[] jArr3 = this.f91163h0;
            if (i21 > jArr3.length) {
                this.f91163h0 = Arrays.copyOf(jArr3, i21);
                this.f91165i0 = Arrays.copyOf(this.f91165i0, i21);
            }
            System.arraycopy(jArr2, 0, this.f91163h0, i5, length2);
            System.arraycopy(this.f91169k0, 0, this.f91165i0, i5, length2);
            long[] jArr4 = this.f91163h0;
            boolean[] zArr2 = this.f91165i0;
            wf.a.e((i21 == 0 || !(jArr4 == null || zArr2 == null)) ? z11 : false);
            dVar.M = i21;
            dVar.N = jArr4;
            dVar.O = zArr2;
            dVar.g();
        }
        m();
    }

    public final void r() {
        f fVar = this.f91162h;
        fVar.getClass();
        List list = Collections.EMPTY_LIST;
        fVar.f91125a = list;
        f fVar2 = this.f91164i;
        fVar2.getClass();
        fVar2.f91125a = list;
        l1 l1Var = this.f91151b0;
        ImageView imageView = this.f91181w;
        if (l1Var != null && ((u1) l1Var).t(30) && ((u1) this.f91151b0).t(29)) {
            b2 b2VarP = ((a0) this.f91151b0).P();
            r2 r2VarC = c(b2VarP, 1);
            fVar2.f91125a = r2VarC;
            m mVar = fVar2.f91128d;
            l1 l1Var2 = mVar.f91151b0;
            j jVar = mVar.f91158f;
            l1Var2.getClass();
            tf.h hVarV = ((a0) l1Var2).V();
            if (!r2VarC.isEmpty()) {
                if (fVar2.b(hVarV)) {
                    int i5 = 0;
                    while (true) {
                        if (i5 >= r2VarC.f96009d) {
                            break;
                        }
                        l lVar = (l) r2VarC.get(i5);
                        if (lVar.f91144a.f54712e[lVar.f91145b]) {
                            jVar.f91139b[1] = lVar.f91146c;
                            break;
                        }
                        i5++;
                    }
                } else {
                    jVar.f91139b[1] = mVar.getResources().getString(2132017852);
                }
            } else {
                jVar.f91139b[1] = mVar.getResources().getString(2132017853);
            }
            s sVar = this.f91148a;
            if (imageView == null) {
                sVar.getClass();
            } else if (sVar.f91218y.contains(imageView)) {
                fVar.c(c(b2VarP, 3));
            }
            fVar.c(r2.f96007e);
        }
        i(imageView, fVar.getItemCount() > 0);
    }
}
