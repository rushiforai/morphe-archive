package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.util.Xml;
import com.medium.reader.R;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import org.xmlpull.v1.XmlPullParserException;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class scb {
    public static scb i;
    public WeakHashMap a;
    public aec b;
    public xkc c;
    public final WeakHashMap d = new WeakHashMap(0);
    public TypedValue e;
    public boolean f;
    public nig g;
    public static final PorterDuff.Mode h = PorterDuff.Mode.SRC_IN;
    public static final qcb j = new qcb(6);

    public static synchronized scb d() {
        try {
            if (i == null) {
                scb scbVar = new scb();
                i = scbVar;
                j(scbVar);
            }
        } catch (Throwable th) {
            throw th;
        }
        return i;
    }

    public static synchronized PorterDuffColorFilter h(int i2, PorterDuff.Mode mode) {
        PorterDuffColorFilter porterDuffColorFilter;
        qcb qcbVar = j;
        qcbVar.getClass();
        int i3 = (31 + i2) * 31;
        porterDuffColorFilter = (PorterDuffColorFilter) qcbVar.h(Integer.valueOf(mode.hashCode() + i3));
        if (porterDuffColorFilter == null) {
            porterDuffColorFilter = new PorterDuffColorFilter(i2, mode);
        }
        return porterDuffColorFilter;
    }

    public static void o(Drawable drawable, i42 i42Var, int[] iArr) {
        int[] state = drawable.getState();
        if (drawable.mutate() != drawable) {
            Log.d("ResourceManagerInternal", "Mutated drawable is not the same instance as the input.");
            return;
        }
        if ((drawable instanceof LayerDrawable) && drawable.isStateful()) {
            drawable.setState(new int[0]);
            drawable.setState(state);
        }
        boolean z = i42Var.b;
        if (z || i42Var.a) {
            PorterDuffColorFilter porterDuffColorFilterH = null;
            ColorStateList colorStateList = z ? (ColorStateList) i42Var.c : null;
            PorterDuff.Mode mode = i42Var.a ? (PorterDuff.Mode) i42Var.d : h;
            if (colorStateList != null && mode != null) {
                porterDuffColorFilterH = h(colorStateList.getColorForState(iArr, 0), mode);
            }
            drawable.setColorFilter(porterDuffColorFilterH);
        } else {
            drawable.clearColorFilter();
        }
        if (Build.VERSION.SDK_INT <= 23) {
            drawable.invalidateSelf();
        }
    }

    public final void a(String str, rcb rcbVar) {
        aec aecVar = this.b;
        if (aecVar == null) {
            aecVar = new aec(0);
            this.b = aecVar;
        }
        aecVar.put(str, rcbVar);
    }

    public final synchronized void b(Context context, long j2, Drawable drawable) {
        try {
            Drawable.ConstantState constantState = drawable.getConstantState();
            if (constantState != null) {
                ab7 ab7Var = (ab7) this.d.get(context);
                if (ab7Var == null) {
                    ab7Var = new ab7((Object) null);
                    this.d.put(context, ab7Var);
                }
                ab7Var.i(j2, new WeakReference(constantState));
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public final Drawable c(Context context, int i2) {
        TypedValue typedValue = this.e;
        if (typedValue == null) {
            typedValue = new TypedValue();
            this.e = typedValue;
        }
        context.getResources().getValue(i2, typedValue, true);
        long j2 = (((long) typedValue.assetCookie) << 32) | ((long) typedValue.data);
        Drawable drawableE = e(context, j2);
        if (drawableE != null) {
            return drawableE;
        }
        LayerDrawable layerDrawableM = null;
        if (this.g != null) {
            if (i2 == R.drawable.abc_cab_background_top_material) {
                layerDrawableM = new LayerDrawable(new Drawable[]{f(context, R.drawable.abc_cab_background_internal_bg), f(context, 2131230777)});
            } else if (i2 == R.drawable.abc_ratingbar_material) {
                layerDrawableM = nig.m(this, context, R.dimen.abc_star_big);
            } else if (i2 == R.drawable.abc_ratingbar_indicator_material) {
                layerDrawableM = nig.m(this, context, R.dimen.abc_star_medium);
            } else if (i2 == R.drawable.abc_ratingbar_small_material) {
                layerDrawableM = nig.m(this, context, R.dimen.abc_star_small);
            }
        }
        if (layerDrawableM != null) {
            layerDrawableM.setChangingConfigurations(typedValue.changingConfigurations);
            b(context, j2, layerDrawableM);
        }
        return layerDrawableM;
    }

    public final synchronized Drawable e(Context context, long j2) {
        ab7 ab7Var = (ab7) this.d.get(context);
        if (ab7Var == null) {
            return null;
        }
        WeakReference weakReference = (WeakReference) ab7Var.d(j2);
        if (weakReference != null) {
            Drawable.ConstantState constantState = (Drawable.ConstantState) weakReference.get();
            if (constantState != null) {
                return constantState.newDrawable(context.getResources());
            }
            ab7Var.j(j2);
        }
        return null;
    }

    public final synchronized Drawable f(Context context, int i2) {
        return g(context, i2, false);
    }

    public final synchronized Drawable g(Context context, int i2, boolean z) {
        Drawable drawableK;
        try {
            if (!this.f) {
                this.f = true;
                Drawable drawableF = f(context, R.drawable.abc_vector_test);
                if (drawableF == null || (!(drawableF instanceof cre) && !"android.graphics.drawable.VectorDrawable".equals(drawableF.getClass().getName()))) {
                    this.f = false;
                    throw new IllegalStateException("This app has been built with an incorrect configuration. Please configure your build for VectorDrawableCompat.");
                }
            }
            drawableK = k(context, i2);
            if (drawableK == null) {
                drawableK = c(context, i2);
            }
            if (drawableK == null) {
                drawableK = context.getDrawable(i2);
            }
            if (drawableK != null) {
                drawableK = n(context, i2, z, drawableK);
            }
            if (drawableK != null) {
                lm3.a(drawableK);
            }
        } catch (Throwable th) {
            throw th;
        }
        return drawableK;
    }

    public final synchronized ColorStateList i(Context context, int i2) {
        ColorStateList colorStateList;
        xkc xkcVar;
        WeakHashMap weakHashMap = this.a;
        ColorStateList colorStateListN = null;
        colorStateList = (weakHashMap == null || (xkcVar = (xkc) weakHashMap.get(context)) == null) ? null : (ColorStateList) s42.L(xkcVar, i2);
        if (colorStateList == null) {
            nig nigVar = this.g;
            if (nigVar != null) {
                colorStateListN = nigVar.n(context, i2);
            }
            if (colorStateListN != null) {
                WeakHashMap weakHashMap2 = this.a;
                if (weakHashMap2 == null) {
                    weakHashMap2 = new WeakHashMap();
                    this.a = weakHashMap2;
                }
                xkc xkcVar2 = (xkc) weakHashMap2.get(context);
                if (xkcVar2 == null) {
                    xkcVar2 = new xkc(0);
                    this.a.put(context, xkcVar2);
                }
                xkcVar2.a(i2, colorStateListN);
            }
            colorStateList = colorStateListN;
        }
        return colorStateList;
    }

    public final Drawable k(Context context, int i2) {
        int next;
        aec aecVar = this.b;
        if (aecVar == null || aecVar.isEmpty()) {
            return null;
        }
        xkc xkcVar = this.c;
        if (xkcVar != null) {
            String str = (String) s42.L(xkcVar, i2);
            if ("appcompat_skip_skip".equals(str)) {
                return null;
            }
            if (str != null && this.b.get(str) == null) {
                return null;
            }
        } else {
            this.c = new xkc(0);
        }
        TypedValue typedValue = this.e;
        if (typedValue == null) {
            typedValue = new TypedValue();
            this.e = typedValue;
        }
        Resources resources = context.getResources();
        resources.getValue(i2, typedValue, true);
        long j2 = (((long) typedValue.assetCookie) << 32) | ((long) typedValue.data);
        Drawable drawableE = e(context, j2);
        if (drawableE != null) {
            return drawableE;
        }
        CharSequence charSequence = typedValue.string;
        if (charSequence != null && charSequence.toString().endsWith(".xml")) {
            try {
                XmlResourceParser xml = resources.getXml(i2);
                AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(xml);
                do {
                    next = xml.next();
                    if (next == 2) {
                        break;
                    }
                } while (next != 1);
                if (next != 2) {
                    throw new XmlPullParserException("No start tag found");
                }
                String name = xml.getName();
                this.c.a(i2, name);
                rcb rcbVar = (rcb) this.b.get(name);
                if (rcbVar != null) {
                    drawableE = rcbVar.a(context, xml, attributeSetAsAttributeSet, context.getTheme());
                }
                if (drawableE != null) {
                    drawableE.setChangingConfigurations(typedValue.changingConfigurations);
                    b(context, j2, drawableE);
                }
            } catch (Exception e) {
                Log.e("ResourceManagerInternal", "Exception while inflating drawable", e);
            }
        }
        if (drawableE == null) {
            this.c.a(i2, "appcompat_skip_skip");
        }
        return drawableE;
    }

    public final synchronized void l(Context context) {
        ab7 ab7Var = (ab7) this.d.get(context);
        if (ab7Var != null) {
            ab7Var.b();
        }
    }

    public final synchronized void m(nig nigVar) {
        this.g = nigVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.drawable.Drawable n(android.content.Context r9, int r10, boolean r11, android.graphics.drawable.Drawable r12) {
        /*
            Method dump skipped, instruction units count: 261
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.scb.n(android.content.Context, int, boolean, android.graphics.drawable.Drawable):android.graphics.drawable.Drawable");
    }

    public static void j(scb scbVar) {
        if (Build.VERSION.SDK_INT < 24) {
            scbVar.a(gYpYQDQkhfs.ntwX, new rcb(3));
            scbVar.a("animated-vector", new rcb(2));
            scbVar.a("animated-selector", new rcb(1));
            scbVar.a("drawable", new rcb(0));
        }
    }
}
