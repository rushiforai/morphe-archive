package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import com.medium.reader.R;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class nig implements xig, rx, cy, f66, vyf {
    public final Object a;
    public final Object b;
    public final Object c;
    public final Object d;
    public Object e;
    public Object f;

    public nig() {
        this.a = new int[]{2131230836, 2131230834, 2131230760};
        this.b = new int[]{2131230784, R.drawable.abc_seekbar_tick_mark_material, R.drawable.abc_ic_menu_share_mtrl_alpha, R.drawable.abc_ic_menu_copy_mtrl_am_alpha, R.drawable.abc_ic_menu_cut_mtrl_alpha, R.drawable.abc_ic_menu_selectall_mtrl_alpha, R.drawable.abc_ic_menu_paste_mtrl_am_alpha};
        this.c = new int[]{2131230833, 2131230835, 2131230777, R.drawable.abc_text_cursor_material, 2131230830, 2131230831, 2131230832};
        this.d = new int[]{2131230809, R.drawable.abc_cab_background_internal_bg, 2131230808};
        this.e = new int[]{R.drawable.abc_tab_indicator_material, R.drawable.abc_textfield_search_material};
        this.f = new int[]{R.drawable.abc_btn_check_material, R.drawable.abc_btn_radio_material, R.drawable.abc_btn_check_material_anim, R.drawable.abc_btn_radio_material_anim};
    }

    public static void E(Drawable drawable, int i, PorterDuff.Mode mode) {
        PorterDuffColorFilter porterDuffColorFilterH;
        Drawable drawableMutate = drawable.mutate();
        if (mode == null) {
            mode = j20.b;
        }
        PorterDuff.Mode mode2 = j20.b;
        synchronized (j20.class) {
            porterDuffColorFilterH = scb.h(i, mode);
        }
        drawableMutate.setColorFilter(porterDuffColorFilterH);
    }

    public static int H(d66 d66Var) {
        int i = zsb.b[d66Var.ordinal()];
        if (i == 1) {
            return 2;
        }
        if (i == 2) {
            return 3;
        }
        if (i == 3) {
            return 4;
        }
        if (i == 4) {
            return 5;
        }
        if (i == 5) {
            return 6;
        }
        ygf.a();
        return 0;
    }

    public static nig I(String str, hsf hsfVar, zrg zrgVar, ntg ntgVar, Integer num) throws GeneralSecurityException {
        if (ntgVar == ntg.RAW) {
            if (num != null) {
                ygf.l("Keys with output prefix type raw should not have an id requirement.");
                return null;
            }
        } else if (num == null) {
            ygf.l("Keys with output prefix type different from raw should have an id requirement.");
            return null;
        }
        return new nig(str, ejg.a(str), hsfVar, zrgVar, ntgVar, num);
    }

    public static boolean a(int i, int[] iArr) {
        for (int i2 : iArr) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    public static ColorStateList g(Context context, int i) {
        int iC = wkd.c(context, R.attr.colorControlHighlight);
        return new ColorStateList(new int[][]{wkd.b, wkd.d, wkd.c, wkd.f}, new int[]{wkd.b(context, R.attr.colorButtonNormal), rv1.b(iC, i), rv1.b(iC, i), i});
    }

    public static /* synthetic */ List k(nig nigVar, j7a j7aVar, gv7 gv7Var, Boolean bool, boolean z, int i) {
        boolean z2 = (i & 4) == 0;
        if ((i & 16) != 0) {
            bool = null;
        }
        return nigVar.j(j7aVar, gv7Var, z2, false, bool, (i & 32) != 0 ? false : z);
    }

    public static gv7 l(q1 q1Var, p98 p98Var, wjc wjcVar, hx hxVar, boolean z) {
        p98Var.getClass();
        hxVar.getClass();
        if (q1Var instanceof n5a) {
            q74 q74Var = hg6.a;
            jf6 jf6VarA = hg6.a((n5a) q1Var, p98Var, wjcVar);
            if (jf6VarA != null) {
                return en7.v(jf6VarA);
            }
        } else if (q1Var instanceof a6a) {
            q74 q74Var2 = hg6.a;
            jf6 jf6VarC = hg6.c((a6a) q1Var, p98Var, wjcVar);
            if (jf6VarC != null) {
                return en7.v(jf6VarC);
            }
        } else if (q1Var instanceof i6a) {
            o75 o75Var = gg6.d;
            o75Var.getClass();
            ag6 ag6Var = (ag6) il7.z((l75) q1Var, o75Var);
            if (ag6Var != null) {
                int i = c0.a[hxVar.ordinal()];
                if (i != 1) {
                    if (i == 2) {
                        if ((ag6Var.b & 8) != 8) {
                            return null;
                        }
                        yf6 yf6Var = ag6Var.f;
                        yf6Var.getClass();
                        return new gv7(p98Var.getString(yf6Var.c).concat(p98Var.getString(yf6Var.d)));
                    }
                    if (i == 3) {
                        return gsa.i0((i6a) q1Var, p98Var, wjcVar, true, true, z);
                    }
                } else if (ag6Var.g()) {
                    yf6 yf6Var2 = ag6Var.e;
                    yf6Var2.getClass();
                    return new gv7(p98Var.getString(yf6Var2.c).concat(p98Var.getString(yf6Var2.d)));
                }
            }
        }
        return null;
    }

    public static LayerDrawable m(scb scbVar, Context context, int i) {
        BitmapDrawable bitmapDrawable;
        BitmapDrawable bitmapDrawable2;
        BitmapDrawable bitmapDrawable3;
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(i);
        Drawable drawableF = scbVar.f(context, R.drawable.abc_star_black_48dp);
        Drawable drawableF2 = scbVar.f(context, R.drawable.abc_star_half_black_48dp);
        if ((drawableF instanceof BitmapDrawable) && drawableF.getIntrinsicWidth() == dimensionPixelSize && drawableF.getIntrinsicHeight() == dimensionPixelSize) {
            bitmapDrawable = (BitmapDrawable) drawableF;
            bitmapDrawable2 = new BitmapDrawable(bitmapDrawable.getBitmap());
        } else {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(dimensionPixelSize, dimensionPixelSize, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            drawableF.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
            drawableF.draw(canvas);
            bitmapDrawable = new BitmapDrawable(bitmapCreateBitmap);
            bitmapDrawable2 = new BitmapDrawable(bitmapCreateBitmap);
        }
        bitmapDrawable2.setTileModeX(Shader.TileMode.REPEAT);
        if ((drawableF2 instanceof BitmapDrawable) && drawableF2.getIntrinsicWidth() == dimensionPixelSize && drawableF2.getIntrinsicHeight() == dimensionPixelSize) {
            bitmapDrawable3 = (BitmapDrawable) drawableF2;
        } else {
            Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(dimensionPixelSize, dimensionPixelSize, Bitmap.Config.ARGB_8888);
            Canvas canvas2 = new Canvas(bitmapCreateBitmap2);
            drawableF2.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
            drawableF2.draw(canvas2);
            bitmapDrawable3 = new BitmapDrawable(bitmapCreateBitmap2);
        }
        LayerDrawable layerDrawable = new LayerDrawable(new Drawable[]{bitmapDrawable, bitmapDrawable3, bitmapDrawable2});
        layerDrawable.setId(0, android.R.id.background);
        layerDrawable.setId(1, android.R.id.secondaryProgress);
        layerDrawable.setId(2, android.R.id.progress);
        return layerDrawable;
    }

    public void A(d66 d66Var, List list, m45 m45Var, Throwable th, boolean z, Map map) {
        d66Var.getClass();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            y(d66Var, (e66) it2.next(), m45Var, th, z);
        }
    }

    public void B(rz5 rz5Var, d66 d66Var, m45 m45Var, Throwable th, boolean z, LinkedHashSet linkedHashSet) {
        int iH = H(d66Var);
        rz5Var.getClass();
        if (iH >= uu2.c) {
            String strR = (String) m45Var.invoke();
            l66 l66Var = (l66) this.a;
            String name = l66Var != null ? l66Var.getName() : null;
            if (name != null) {
                strR = lv8.r("[", name, "]: ", strR);
            }
            if (z) {
                if (linkedHashSet.contains(strR)) {
                    return;
                } else {
                    linkedHashSet.add(strR);
                }
            }
            int iH2 = H(d66Var);
            strR.getClass();
            if (iH2 >= uu2.c) {
                Log.println(iH2, "Datadog", strR);
                if (th != null) {
                    Log.println(iH2, "Datadog", Log.getStackTraceString(th));
                }
            }
        }
    }

    @Override // defpackage.cy
    public List C(j7a j7aVar, q1 q1Var, hx hxVar) {
        hxVar.getClass();
        return u(j7aVar, q1Var, hxVar, q1Var instanceof a6a ? ((a6a) q1Var).o.size() : q1Var instanceof i6a ? ((i6a) q1Var).o.size() : 0);
    }

    @Override // defpackage.cy
    public List F(j7a j7aVar, i6a i6aVar) {
        return v(j7aVar, i6aVar, b0.BACKING_FIELD);
    }

    public jrg G(String str, String str2, Bundle bundle) {
        int i;
        try {
            D(str, str2, bundle);
            rmb rmbVar = (rmb) this.c;
            bf3 bf3Var = bf3.e;
            u11 u11Var = rmbVar.c;
            if (u11Var.p() < 12000000) {
                return u11Var.u() != 0 ? rmbVar.a(bundle).g(bf3Var, new zjf(rmbVar, 15, bundle)) : vp7.w(new IOException("MISSING_INSTANCEID_SERVICE"));
            }
            opg opgVarD = opg.d(rmbVar.b);
            synchronized (opgVarD) {
                i = opgVarD.a;
                opgVarD.a = i + 1;
            }
            return opgVarD.i(new ojg(i, 1, bundle, 1)).f(bf3Var, wz7.j);
        } catch (InterruptedException | ExecutionException e) {
            return vp7.w(e);
        }
    }

    @Override // defpackage.cy
    public List J(j7a j7aVar, q1 q1Var, hx hxVar) {
        hxVar.getClass();
        if (hxVar == hx.PROPERTY) {
            return v(j7aVar, (i6a) q1Var, b0.PROPERTY);
        }
        gv7 gv7VarL = l(q1Var, j7aVar.a, j7aVar.b, hxVar, false);
        return gv7VarL == null ? ey3.a : k(this, j7aVar, gv7VarL, null, false, 60);
    }

    @Override // defpackage.cy
    public ArrayList Q(h7a h7aVar) {
        h7aVar.getClass();
        jkc jkcVar = h7aVar.c;
        hn6 hn6Var = jkcVar instanceof hn6 ? (hn6) jkcVar : null;
        h1b h1bVar = hn6Var != null ? hn6Var.a : null;
        if (h1bVar == null) {
            lg8.w("Class for loading annotations is not found: ", h7aVar.f.a());
            return null;
        }
        ArrayList arrayList = new ArrayList(1);
        Annotation[] declaredAnnotations = h1bVar.a.getDeclaredAnnotations();
        declaredAnnotations.getClass();
        for (Annotation annotation : declaredAnnotations) {
            annotation.getClass();
            Class clsT = vx0.T(vx0.P(annotation));
            jz1 jz1VarS = s(e0b.a(clsT), new d0b(annotation), arrayList);
            if (jz1VarS != null) {
                en7.O(jz1VarS, annotation, clsT);
            }
        }
        return arrayList;
    }

    @Override // defpackage.vyf
    public wcg b(long j, jrf jrfVar) {
        return new wcg(65, new m0(this, j, jrfVar, (n92) null, 8), null);
    }

    @Override // defpackage.vyf
    public ycg c(String str, String str2) {
        return new ycg(new ya2(this, str, str2, null, 3));
    }

    @Override // defpackage.rx
    public Object d(j7a j7aVar, i6a i6aVar, mn6 mn6Var) {
        return t(j7aVar, i6aVar, hx.PROPERTY_GETTER, mn6Var, a0.b);
    }

    @Override // defpackage.vyf
    public wcg e(String str, String str2, arf arfVar, long j) {
        return new wcg(66, new yxf(this, str, str2, arfVar, j, null), null);
    }

    @Override // defpackage.cy
    public List f(j7a j7aVar, i6a i6aVar) {
        return v(j7aVar, i6aVar, b0.DELEGATE_FIELD);
    }

    public jrg h(jrg jrgVar) {
        return jrgVar.f(new b70(1), new ik4(this));
    }

    @Override // defpackage.cy
    public ArrayList i(s6a s6aVar, p98 p98Var) {
        s6aVar.getClass();
        p98Var.getClass();
        Object objI = s6aVar.i(gg6.f);
        objI.getClass();
        Iterable<h5a> iterable = (Iterable) objI;
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        for (h5a h5aVar : iterable) {
            h5aVar.getClass();
            arrayList.add(((lig) this.e).s(h5aVar, p98Var));
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List j(defpackage.j7a r9, defpackage.gv7 r10, boolean r11, boolean r12, java.lang.Boolean r13, boolean r14) {
        /*
            r8 = this;
            java.lang.Object r0 = r8.a
            r6 = r0
            zm7 r6 = (defpackage.zm7) r6
            java.lang.Object r0 = r8.f
            r7 = r0
            zz7 r7 = (defpackage.zz7) r7
            r1 = r9
            r2 = r11
            r3 = r12
            r4 = r13
            r5 = r14
            h1b r9 = defpackage.f49.E(r1, r2, r3, r4, r5, r6, r7)
            if (r9 != 0) goto L2d
            boolean r9 = r1 instanceof defpackage.h7a
            r11 = 0
            if (r9 == 0) goto L2c
            r9 = r1
            h7a r9 = (defpackage.h7a) r9
            jkc r9 = r9.c
            boolean r12 = r9 instanceof defpackage.hn6
            if (r12 == 0) goto L26
            hn6 r9 = (defpackage.hn6) r9
            goto L27
        L26:
            r9 = r11
        L27:
            if (r9 == 0) goto L2c
            h1b r9 = r9.a
            goto L2d
        L2c:
            r9 = r11
        L2d:
            if (r9 != 0) goto L30
            goto L44
        L30:
            java.lang.Object r8 = r8.b
            r67 r8 = (defpackage.r67) r8
            java.lang.Object r8 = r8.invoke(r9)
            my r8 = (defpackage.my) r8
            java.util.HashMap r8 = r8.a
            java.lang.Object r8 = r8.get(r10)
            java.util.List r8 = (java.util.List) r8
            if (r8 != 0) goto L46
        L44:
            ey3 r8 = defpackage.ey3.a
        L46:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nig.j(j7a, gv7, boolean, boolean, java.lang.Boolean, boolean):java.util.List");
    }

    public ColorStateList n(Context context, int i) {
        if (i == R.drawable.abc_edit_text_material) {
            return nm.l(context, R.color.abc_tint_edittext);
        }
        if (i == 2131230826) {
            return nm.l(context, R.color.abc_tint_switch_track);
        }
        if (i != R.drawable.abc_switch_thumb_material) {
            if (i == R.drawable.abc_btn_default_mtrl_shape) {
                return g(context, wkd.c(context, R.attr.colorButtonNormal));
            }
            if (i == R.drawable.abc_btn_borderless_material) {
                return g(context, 0);
            }
            if (i == R.drawable.abc_btn_colored_material) {
                return g(context, wkd.c(context, R.attr.colorAccent));
            }
            if (i == 2131230821 || i == R.drawable.abc_spinner_textfield_background_material) {
                return nm.l(context, R.color.abc_tint_spinner);
            }
            if (a(i, (int[]) this.b)) {
                return wkd.d(context, R.attr.colorControlNormal);
            }
            if (a(i, (int[]) this.e)) {
                return nm.l(context, R.color.abc_tint_default);
            }
            if (a(i, (int[]) this.f)) {
                return nm.l(context, R.color.abc_tint_btn_checkable);
            }
            if (i == R.drawable.abc_seekbar_thumb_material) {
                return nm.l(context, R.color.abc_tint_seek_thumb);
            }
            return null;
        }
        int[][] iArr = new int[3][];
        int[] iArr2 = new int[3];
        ColorStateList colorStateListD = wkd.d(context, R.attr.colorSwitchThumbNormal);
        if (colorStateListD == null || !colorStateListD.isStateful()) {
            iArr[0] = wkd.b;
            iArr2[0] = wkd.b(context, R.attr.colorSwitchThumbNormal);
            iArr[1] = wkd.e;
            iArr2[1] = wkd.c(context, R.attr.colorControlActivated);
            iArr[2] = wkd.f;
            iArr2[2] = wkd.c(context, R.attr.colorSwitchThumbNormal);
        } else {
            int[] iArr3 = wkd.b;
            iArr[0] = iArr3;
            iArr2[0] = colorStateListD.getColorForState(iArr3, 0);
            iArr[1] = wkd.e;
            iArr2[1] = wkd.c(context, R.attr.colorControlActivated);
            iArr[2] = wkd.f;
            iArr2[2] = colorStateListD.getDefaultColor();
        }
        return new ColorStateList(iArr, iArr2);
    }

    @Override // defpackage.cy
    public List o(j7a j7aVar, q1 q1Var, hx hxVar, int i, a7a a7aVar) {
        hxVar.getClass();
        return u(j7aVar, q1Var, hxVar, i);
    }

    public boolean p(mn1 mn1Var) {
        h1b h1bVarH0;
        if (mn1Var.e() != null && g76.L(mn1Var.f().b(), "Container") && (h1bVarH0 = flb.h0((zm7) this.a, mn1Var, (zz7) this.f)) != null) {
            LinkedHashSet linkedHashSet = nlc.a;
            Annotation[] declaredAnnotations = h1bVarH0.a.getDeclaredAnnotations();
            declaredAnnotations.getClass();
            boolean z = false;
            for (Annotation annotation : declaredAnnotations) {
                annotation.getClass();
                if (e0b.a(vx0.T(vx0.P(annotation))).equals(ce6.b)) {
                    z = true;
                }
            }
            if (z) {
                return true;
            }
        }
        return false;
    }

    public jz1 q(mn1 mn1Var, jkc jkcVar, List list) {
        return new jz1(this, d46.H((c38) this.c, mn1Var, (n0c) this.d), mn1Var, list, jkcVar);
    }

    @Override // defpackage.rx
    public Object r(j7a j7aVar, i6a i6aVar, mn6 mn6Var) {
        return t(j7aVar, i6aVar, hx.PROPERTY, mn6Var, a0.c);
    }

    public jz1 s(mn1 mn1Var, d0b d0bVar, List list) {
        if (nlc.a.contains(mn1Var)) {
            return null;
        }
        return q(mn1Var, d0bVar, list);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0036  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object t(defpackage.j7a r10, defpackage.i6a r11, defpackage.hx r12, defpackage.mn6 r13, defpackage.b55 r14) {
        /*
            r9 = this;
            xl4 r0 = defpackage.cm4.B
            int r1 = r11.d
            java.lang.Boolean r5 = r0.d(r1)
            boolean r6 = defpackage.hg6.d(r11)
            java.lang.Object r0 = r9.a
            r7 = r0
            zm7 r7 = (defpackage.zm7) r7
            java.lang.Object r0 = r9.f
            r8 = r0
            zz7 r8 = (defpackage.zz7) r8
            r3 = 1
            r4 = 1
            r2 = r10
            h1b r10 = defpackage.f49.E(r2, r3, r4, r5, r6, r7, r8)
            r0 = 0
            if (r10 != 0) goto L37
            boolean r10 = r2 instanceof defpackage.h7a
            if (r10 == 0) goto L36
            r10 = r2
            h7a r10 = (defpackage.h7a) r10
            jkc r10 = r10.c
            boolean r1 = r10 instanceof defpackage.hn6
            if (r1 == 0) goto L30
            hn6 r10 = (defpackage.hn6) r10
            goto L31
        L30:
            r10 = r0
        L31:
            if (r10 == 0) goto L36
            h1b r10 = r10.a
            goto L37
        L36:
            r10 = r0
        L37:
            if (r10 != 0) goto L3a
            goto L68
        L3a:
            ym6 r1 = r10.b
            java.lang.Object r1 = r1.e
            zz7 r1 = (defpackage.zz7) r1
            zz7 r3 = defpackage.w93.e
            r3.getClass()
            int r4 = r3.b
            int r5 = r3.c
            int r3 = r3.d
            boolean r1 = r1.a(r4, r5, r3)
            p98 r3 = r2.a
            wjc r2 = r2.b
            gv7 r11 = l(r11, r3, r2, r12, r1)
            if (r11 != 0) goto L5a
            goto L68
        L5a:
            java.lang.Object r9 = r9.b
            r67 r9 = (defpackage.r67) r9
            java.lang.Object r9 = r9.invoke(r10)
            java.lang.Object r9 = r14.invoke(r9, r11)
            if (r9 != 0) goto L69
        L68:
            return r0
        L69:
            boolean r10 = defpackage.v2e.a(r13)
            if (r10 == 0) goto Lc1
            f52 r9 = (defpackage.f52) r9
            boolean r10 = r9 instanceof defpackage.i21
            if (r10 == 0) goto L85
            yyd r10 = new yyd
            i21 r9 = (defpackage.i21) r9
            java.lang.Object r9 = r9.a
            java.lang.Number r9 = (java.lang.Number) r9
            byte r9 = r9.byteValue()
            r10.<init>(r9)
            return r10
        L85:
            boolean r10 = r9 instanceof defpackage.k8c
            if (r10 == 0) goto L99
            yyd r10 = new yyd
            k8c r9 = (defpackage.k8c) r9
            java.lang.Object r9 = r9.a
            java.lang.Number r9 = (java.lang.Number) r9
            short r9 = r9.shortValue()
            r10.<init>(r9)
            return r10
        L99:
            boolean r10 = r9 instanceof defpackage.u46
            if (r10 == 0) goto Lad
            yyd r10 = new yyd
            u46 r9 = (defpackage.u46) r9
            java.lang.Object r9 = r9.a
            java.lang.Number r9 = (java.lang.Number) r9
            int r9 = r9.intValue()
            r10.<init>(r9)
            return r10
        Lad:
            boolean r10 = r9 instanceof defpackage.bb7
            if (r10 == 0) goto Lc1
            yyd r10 = new yyd
            bb7 r9 = (defpackage.bb7) r9
            java.lang.Object r9 = r9.a
            java.lang.Number r9 = (java.lang.Number) r9
            long r11 = r9.longValue()
            r10.<init>(r11)
            return r10
        Lc1:
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nig.t(j7a, i6a, hx, mn6, b55):java.lang.Object");
    }

    public List u(j7a j7aVar, q1 q1Var, hx hxVar, int i) {
        gv7 gv7VarL = l(q1Var, j7aVar.a, j7aVar.b, hxVar, false);
        if (gv7VarL == null) {
            return ey3.a;
        }
        return k(this, j7aVar, new gv7(gv7VarL.a + '@' + i), null, false, 60);
    }

    public List v(j7a j7aVar, i6a i6aVar, b0 b0Var) {
        wjc wjcVar = j7aVar.b;
        Boolean boolF = cm4.B.d(i6aVar.d);
        boolean zD = hg6.d(i6aVar);
        b0 b0Var2 = b0.PROPERTY;
        p98 p98Var = j7aVar.a;
        if (b0Var == b0Var2) {
            gv7 gv7VarI0 = gsa.i0(i6aVar, p98Var, wjcVar, (40 & 8) == 0, (40 & 16) == 0, true);
            if (gv7VarI0 != null) {
                return k(this, j7aVar, gv7VarI0, boolF, zD, 8);
            }
        } else {
            gv7 gv7VarI02 = gsa.i0(i6aVar, p98Var, wjcVar, (40 & 8) == 0, (40 & 16) == 0, true);
            if (gv7VarI02 != null) {
                if (muc.Q(gv7VarI02.a, "$delegate", false) == (b0Var == b0.DELEGATE_FIELD)) {
                    return j(j7aVar, gv7VarI02, true, true, boolF, zD);
                }
            }
        }
        return ey3.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0035  */
    @Override // defpackage.cy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List w(defpackage.j7a r7, defpackage.q1 r8, defpackage.hx r9, int r10, defpackage.a7a r11) {
        /*
            r6 = this;
            r9.getClass()
            boolean r11 = r8 instanceof defpackage.a6a
            r0 = 0
            if (r11 == 0) goto L12
            r1 = r8
            a6a r1 = (defpackage.a6a) r1
            java.util.List r1 = r1.o
            int r1 = r1.size()
            goto L21
        L12:
            boolean r1 = r8 instanceof defpackage.i6a
            if (r1 == 0) goto L20
            r1 = r8
            i6a r1 = (defpackage.i6a) r1
            java.util.List r1 = r1.o
            int r1 = r1.size()
            goto L21
        L20:
            r1 = r0
        L21:
            r2 = 64
            r3 = 32
            r4 = 1
            if (r11 == 0) goto L37
            r11 = r8
            a6a r11 = (defpackage.a6a) r11
            int r11 = r11.c
            r5 = r11 & 32
            if (r5 != r3) goto L32
            goto L35
        L32:
            r11 = r11 & r2
            if (r11 != r2) goto L5d
        L35:
            r0 = r4
            goto L5d
        L37:
            boolean r11 = r8 instanceof defpackage.i6a
            if (r11 == 0) goto L49
            r11 = r8
            i6a r11 = (defpackage.i6a) r11
            int r11 = r11.c
            r5 = r11 & 32
            if (r5 != r3) goto L45
            goto L48
        L45:
            r11 = r11 & r2
            if (r11 != r2) goto L5d
        L48:
            goto L35
        L49:
            boolean r11 = r8 instanceof defpackage.n5a
            if (r11 == 0) goto L64
            r11 = r7
            h7a r11 = (defpackage.h7a) r11
            j5a r2 = r11.g
            j5a r3 = defpackage.j5a.ENUM_CLASS
            if (r2 != r3) goto L58
            r0 = 2
            goto L5d
        L58:
            boolean r11 = r11.h
            if (r11 == 0) goto L5d
            goto L35
        L5d:
            int r1 = r1 + r0
            int r1 = r1 + r10
            java.util.List r6 = r6.u(r7, r8, r9, r1)
            return r6
        L64:
            java.lang.UnsupportedOperationException r6 = new java.lang.UnsupportedOperationException
            java.lang.Class r7 = r8.getClass()
            java.lang.StringBuilder r8 = new java.lang.StringBuilder
            java.lang.String r9 = "Unsupported message: "
            r8.<init>(r9)
            r8.append(r7)
            java.lang.String r7 = r8.toString()
            r6.<init>(r7)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nig.w(j7a, q1, hx, int, a7a):java.util.List");
    }

    @Override // defpackage.cy
    public ArrayList x(x6a x6aVar, p98 p98Var) {
        x6aVar.getClass();
        p98Var.getClass();
        Object objI = x6aVar.i(gg6.h);
        objI.getClass();
        Iterable<h5a> iterable = (Iterable) objI;
        ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
        for (h5a h5aVar : iterable) {
            h5aVar.getClass();
            arrayList.add(((lig) this.e).s(h5aVar, p98Var));
        }
        return arrayList;
    }

    public void y(d66 d66Var, e66 e66Var, m45 m45Var, Throwable th, boolean z) {
        ysb feature;
        n66 n66Var;
        d66Var.getClass();
        e66Var.getClass();
        m45Var.getClass();
        int i = zsb.a[e66Var.ordinal()];
        if (i == 1) {
            B((rz5) this.b, d66Var, m45Var, th, z, (LinkedHashSet) this.d);
            return;
        }
        if (i == 2) {
            rz5 rz5Var = (rz5) this.c;
            if (rz5Var != null) {
                B(rz5Var, d66Var, m45Var, th, z, (LinkedHashSet) this.e);
                return;
            }
            return;
        }
        if (i != 3) {
            return;
        }
        LinkedHashSet linkedHashSet = (LinkedHashSet) this.f;
        l66 l66Var = (l66) this.a;
        if (l66Var == null || (feature = l66Var.getFeature("rum")) == null) {
            return;
        }
        String str = (String) m45Var.invoke();
        if (z) {
            if (linkedHashSet.contains(str)) {
                return;
            } else {
                linkedHashSet.add(str);
            }
        }
        if (d66Var == d66.ERROR || d66Var == d66.WARN || th != null) {
            str.getClass();
            n66Var = new n66();
        } else {
            str.getClass();
            n66Var = new n66();
        }
        feature.a(n66Var);
    }

    @Override // defpackage.cy
    public List z(j7a j7aVar, v5a v5aVar) {
        j7aVar.getClass();
        return k(this, j7aVar, new gv7(ev6.r('#', j7aVar.a.getString(v5aVar.d), sn1.b(((h7a) j7aVar).f.b()))), null, false, 60);
    }

    public void D(String str, String str2, Bundle bundle) {
        int i;
        String strEncodeToString;
        bj5 bj5VarA;
        PackageInfo packageInfoE;
        bundle.putString("scope", str2);
        bundle.putString("sender", str);
        bundle.putString("subtype", str);
        xj4 xj4Var = (xj4) this.a;
        xj4Var.a();
        bundle.putString("gmp_app_id", xj4Var.c.b);
        e4 e4Var = (e4) this.b;
        synchronized (e4Var) {
            try {
                if (e4Var.c == 0 && (packageInfoE = e4Var.e("com.google.android.gms")) != null) {
                    e4Var.c = packageInfoE.versionCode;
                }
                i = e4Var.c;
            } finally {
            }
        }
        bundle.putString("gmsv", Integer.toString(i));
        bundle.putString("osv", Integer.toString(Build.VERSION.SDK_INT));
        bundle.putString("app_ver", ((e4) this.b).b());
        bundle.putString("app_ver_name", ((e4) this.b).c());
        xj4 xj4Var2 = (xj4) this.a;
        xj4Var2.a();
        try {
            strEncodeToString = Base64.encodeToString(MessageDigest.getInstance("SHA-1").digest(xj4Var2.b.getBytes()), 11);
        } catch (NoSuchAlgorithmException unused) {
            strEncodeToString = "[HASH-ERROR]";
        }
        bundle.putString("firebase-app-name-hash", strEncodeToString);
        try {
            String str3 = ((qj0) vp7.h(((gk4) ((hk4) this.f)).e())).a;
            if (TextUtils.isEmpty(str3)) {
                Log.w("FirebaseMessaging", dpBiLjNeNsiASg.flE);
            } else {
                bundle.putString("Goog-Firebase-Installations-Auth", str3);
            }
        } catch (InterruptedException e) {
            e = e;
            Log.e("FirebaseMessaging", "Failed to get FIS auth token", e);
        } catch (ExecutionException e2) {
            e = e2;
            Log.e("FirebaseMessaging", "Failed to get FIS auth token", e);
        }
        bundle.putString("appid", (String) vp7.h(((gk4) ((hk4) this.f)).d()));
        bundle.putString("cliv", "fcm-25.0.2");
        cj5 cj5Var = (cj5) ((h8a) this.e).get();
        e33 e33Var = (e33) ((h8a) this.d).get();
        if (cj5Var == null || e33Var == null || (bj5VarA = ((fz2) cj5Var).a()) == bj5.NONE) {
            return;
        }
        bundle.putString("Firebase-Client-Log-Type", Integer.toString(bj5VarA.getCode()));
        bundle.putString("Firebase-Client", e33Var.a());
    }

    public nig(eoc eocVar, nec necVar, deg degVar, vwa vwaVar, uz5 uz5Var) {
        this.a = eocVar;
        this.b = necVar;
        this.c = degVar;
        this.d = vwaVar;
        this.f = uz5Var;
        this.e = new a98();
    }

    public nig(String str, qvg qvgVar, hsf hsfVar, zrg zrgVar, ntg ntgVar, Integer num) {
        this.a = str;
        this.b = qvgVar;
        this.c = hsfVar;
        this.d = zrgVar;
        this.e = ntgVar;
        this.f = num;
    }

    public nig(c38 c38Var, n0c n0cVar, x67 x67Var, zm7 zm7Var) {
        this.a = zm7Var;
        this.b = x67Var.b(new z(0, this));
        this.c = c38Var;
        this.d = n0cVar;
        this.e = new lig(c38Var, n0cVar);
        this.f = zz7.g;
    }

    public nig(l66 l66Var) {
        b18 b18Var = b18.j;
        this.a = l66Var;
        this.b = (rz5) b18Var.invoke();
        this.c = null;
        this.d = new LinkedHashSet();
        this.e = new LinkedHashSet();
        this.f = new LinkedHashSet();
    }

    public nig(nec necVar, prf prfVar, tag tagVar, uz5 uz5Var, v60 v60Var) {
        this.a = necVar;
        this.b = prfVar;
        this.c = tagVar;
        this.f = uz5Var;
        this.d = v60Var;
    }

    public nig(xj4 xj4Var, e4 e4Var, h8a h8aVar, h8a h8aVar2, hk4 hk4Var) {
        xj4Var.a();
        rmb rmbVar = new rmb(xj4Var.a);
        this.a = xj4Var;
        this.b = e4Var;
        this.c = rmbVar;
        this.d = h8aVar;
        this.e = h8aVar2;
        this.f = hk4Var;
    }
}
