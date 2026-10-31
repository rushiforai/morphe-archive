package k30;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.location.LocationManager;
import android.text.Editable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import androidx.fragment.app.m0;
import com.afollestad.materialdialogs.internal.MDRootLayout;
import com.instabridge.ai.chat.ui.t0;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import e10.y2;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import t70.r1;
import t70.y0;

/* loaded from: classes4.dex */
public final class r {
    public static final c a(a40.q qVar) {
        String str;
        String str2;
        String str3 = qVar.f226a;
        a40.h hVar = qVar.f230e;
        String str4 = qVar.f227b;
        if (str4.length() <= 0 && (str2 = qVar.f228c) != null) {
            str4 = str2;
        }
        a40.h hVar2 = qVar.f229d;
        String str5 = hVar2.f202a;
        String str6 = hVar2.f202a;
        if (Intrinsics.b(str5, "US") || Intrinsics.b(str6, "CA")) {
            str = hVar.f202a;
        } else if (hVar.f203b.length() > 0 || (str = hVar.f204c) == null) {
            str = hVar.f203b;
        }
        return new c(str3, str4, str, str6);
    }

    public static void b(final m0 m0Var, t70.j0 j0Var, w20.l lVar) {
        d9.f fVar = new d9.f(m0Var);
        fVar.r(2132020354);
        fVar.f(2131624310, false);
        fVar.o(2132019022);
        d9.j jVar = new d9.j(fVar);
        int i5 = f10.d.R;
        ex.i.P(jVar);
        MDRootLayout mDRootLayout = jVar.f49060a;
        View viewFindViewById = mDRootLayout.findViewById(2131428286);
        Intrinsics.e(viewFindViewById, "null cannot be cast to non-null type android.widget.Button");
        Button button = (Button) viewFindViewById;
        View viewFindViewById2 = mDRootLayout.findViewById(2131428543);
        viewFindViewById2.setOnClickListener(new fk.t(lVar, 14));
        button.setOnClickListener(new t0(m0Var, j0Var, lVar, button, viewFindViewById2, 3));
        c(lVar, m0Var, button, viewFindViewById2);
        final j jVar2 = new j(lVar, m0Var, button, viewFindViewById2);
        jVar.f49061b = new DialogInterface.OnShowListener() { // from class: k30.h
            @Override // android.content.DialogInterface.OnShowListener
            public final void onShow(DialogInterface dialogInterface) {
                m0Var.getLifecycle().a(jVar2);
            }
        };
        jVar.setOnDismissListener(new e10.i(m0Var, jVar2, 1));
        jVar.show();
    }

    public static final void c(w20.l lVar, g.o oVar, Button button, View view) {
        Drawable drawableMutate;
        y2.f51877a.getClass();
        c cVar = (c) y2.C1().l();
        c.Companion.getClass();
        int i5 = 8;
        if (!Intrinsics.b(cVar, c.f70909h)) {
            Drawable[] compoundDrawablesRelative = button.getCompoundDrawablesRelative();
            button.setCompoundDrawablesRelative(null, compoundDrawablesRelative[1], compoundDrawablesRelative[2], compoundDrawablesRelative[3]);
            button.setText(cVar.a());
            view.setVisibility(8);
            return;
        }
        boolean zA = lVar.a(oVar);
        Drawable[] compoundDrawablesRelative2 = button.getCompoundDrawablesRelative();
        if (zA) {
            Drawable drawable = oVar.getDrawable(2131231478);
            Intrinsics.d(drawable);
            drawableMutate = drawable.mutate();
        } else {
            Drawable drawable2 = oVar.getDrawable(2131231505);
            Intrinsics.d(drawable2);
            drawableMutate = drawable2.mutate();
        }
        drawableMutate.setTint(aa.p.b(oVar, 16842806));
        drawableMutate.setBounds(0, 0, drawableMutate.getIntrinsicWidth(), drawableMutate.getIntrinsicHeight());
        button.setCompoundDrawablesRelative(drawableMutate, compoundDrawablesRelative2[1], compoundDrawablesRelative2[2], compoundDrawablesRelative2[3]);
        button.setText(oVar.getString(2132017526));
        if (!zA && lVar.b(oVar)) {
            i5 = 0;
        }
        view.setVisibility(i5);
    }

    public static d9.j d(final Context context, final t70.j0 j0Var, final w20.l lVar) {
        a40.a aVar = a40.b.f189a;
        Locale locale = Locale.getDefault();
        aVar.getClass();
        final String strA = a40.a.a(locale);
        d9.f fVar = new d9.f(context);
        fVar.r(2132020354);
        fVar.f(2131624311, false);
        final d9.j jVar = new d9.j(fVar);
        MDRootLayout mDRootLayout = jVar.f49060a;
        View viewFindViewById = mDRootLayout.findViewById(2131428232);
        Intrinsics.e(viewFindViewById, "null cannot be cast to non-null type android.widget.EditText");
        final EditText editText = (EditText) viewFindViewById;
        View viewFindViewById2 = mDRootLayout.findViewById(2131428703);
        Intrinsics.e(viewFindViewById2, "null cannot be cast to non-null type android.view.ViewGroup");
        final ViewGroup viewGroup = (ViewGroup) viewFindViewById2;
        h0 h0Var = h0.f70974r;
        final h0 h0VarP = lm.e.p(context);
        final LayoutInflater layoutInflaterFrom = LayoutInflater.from(context);
        final Ref.ObjectRef objectRef = new Ref.ObjectRef();
        y2.f51877a.getClass();
        final c cVar = (c) y2.C1().l();
        final String str = cVar.f70910a;
        final boolean zB = lVar.b(context);
        final File file = new File(context.getFilesDir(), "weather_autocomplete_history");
        final Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
        final ArrayList arrayList = new ArrayList();
        a80.e eVar = y0.f88884a;
        objectRef2.f71863a = t70.m0.t(j0Var, a80.d.f488c, null, new l(file, arrayList, editText, objectRef, zB, j0Var, viewGroup, layoutInflaterFrom, lVar, context, cVar, str, jVar, objectRef2, h0VarP, strA, null), 2);
        editText.addTextChangedListener(new m(objectRef, zB, arrayList, j0Var, viewGroup, layoutInflaterFrom, lVar, context, cVar, str, jVar, objectRef2, h0VarP, strA, file));
        editText.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: k30.f
            @Override // android.widget.TextView.OnEditorActionListener
            public final boolean onEditorAction(TextView textView, int i5, KeyEvent keyEvent) {
                String string;
                if (i5 != 3) {
                    return false;
                }
                Editable text = editText.getText();
                if (text == null || (string = text.toString()) == null) {
                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                r.f(objectRef, zB, arrayList, j0Var, viewGroup, layoutInflaterFrom, lVar, context, cVar, str, jVar, objectRef2, h0VarP, strA, file, string, true);
                return false;
            }
        });
        f(objectRef, zB, arrayList, j0Var, viewGroup, layoutInflaterFrom, lVar, context, cVar, str, jVar, objectRef2, h0VarP, strA, file, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);
        int i5 = f10.d.R;
        ex.i.P(jVar);
        jVar.show();
        return jVar;
    }

    public static final void e(ViewGroup viewGroup, LayoutInflater layoutInflater, final w20.l lVar, final Context context, c cVar, String str, final d9.j jVar, final t70.j0 j0Var, final Ref.ObjectRef objectRef, final h0 h0Var, final String str2, final ArrayList arrayList, final File file, ArrayList arrayList2) {
        Iterator it = arrayList2.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            c cVar2 = (c) it.next();
            int i11 = i5 + 1;
            FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) viewGroup.getChildAt(i5);
            if (fancyPrefCheckableView == null) {
                View viewInflate = layoutInflater.inflate(2131624128, viewGroup, false);
                Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView");
                fancyPrefCheckableView = (FancyPrefCheckableView) viewInflate;
                viewGroup.addView(fancyPrefCheckableView);
                fancyPrefCheckableView.setOnClickListener(new View.OnClickListener() { // from class: k30.g
                    @Override // android.view.View.OnClickListener
                    public final void onClick(View view) {
                        c cVar3 = (c) view.getTag();
                        Context context2 = context;
                        d9.j jVar2 = jVar;
                        if (cVar3 != null) {
                            a80.e eVar = y0.f88884a;
                            t70.m0.t(j0Var, a80.d.f488c, null, new o(objectRef, h0Var, cVar3, str2, context2, arrayList, file, jVar2, null), 2);
                            return;
                        }
                        y2.f51877a.getClass();
                        y2.C1().a();
                        Context context3 = view.getContext();
                        w20.l lVar2 = lVar;
                        if (!lVar2.a(context3)) {
                            lVar2.c();
                        }
                        h0 h0Var2 = h0.f70974r;
                        h0 h0VarP = lm.e.p(context2);
                        x.Companion.getClass();
                        h0VarP.f70981g = x.f71082l;
                        h0VarP.f();
                        jVar2.dismiss();
                    }
                });
            }
            fancyPrefCheckableView.setTag(cVar2);
            fancyPrefCheckableView.setVisibility(0);
            if (cVar2 == null) {
                boolean zA = lVar.a(context);
                c.Companion.getClass();
                fancyPrefCheckableView.h(cVar.equals(c.f70909h) && zA, false);
                fancyPrefCheckableView.z(2131231478);
                fancyPrefCheckableView.D(context.getString(2132017526));
                if (zA) {
                    fancyPrefCheckableView.C(null);
                } else {
                    fancyPrefCheckableView.C(fancyPrefCheckableView.getContext().getString(2132019102));
                }
                fancyPrefCheckableView.setOnLongClickListener(null);
            } else {
                String str3 = cVar2.f70913d;
                String str4 = cVar2.f70912c;
                String str5 = cVar2.f70911b;
                fancyPrefCheckableView.h(Intrinsics.b(str, cVar2.f70910a), false);
                fancyPrefCheckableView.D(str5);
                if (Intrinsics.b(str4, str5)) {
                    fancyPrefCheckableView.C(str3);
                } else {
                    fancyPrefCheckableView.C(str4 + ", " + str3);
                }
                fancyPrefCheckableView.z(0);
                fancyPrefCheckableView.setOnLongClickListener(null);
            }
            i5 = i11;
        }
        int childCount = viewGroup.getChildCount();
        while (i5 < childCount) {
            viewGroup.getChildAt(i5).setVisibility(8);
            i5++;
        }
    }

    public static final void f(Ref.ObjectRef objectRef, boolean z11, ArrayList arrayList, t70.j0 j0Var, ViewGroup viewGroup, LayoutInflater layoutInflater, w20.l lVar, Context context, c cVar, String str, d9.j jVar, Ref.ObjectRef objectRef2, h0 h0Var, String str2, File file, String str3, boolean z12) {
        r1 r1Var = (r1) objectRef.f71863a;
        if (r1Var != null) {
            r1Var.c(null);
        }
        if (str3.length() != 0) {
            if (str3.length() >= 3) {
                objectRef.f71863a = t70.m0.t(j0Var, null, null, new q(z12, str3, h0Var, str2, viewGroup, layoutInflater, lVar, context, cVar, str, jVar, j0Var, objectRef2, arrayList, file, null), 3);
            }
        } else {
            ArrayList arrayList2 = new ArrayList();
            if (z11) {
                arrayList2.add(0, null);
            }
            arrayList2.addAll(arrayList);
            e(viewGroup, layoutInflater, lVar, context, cVar, str, jVar, j0Var, objectRef2, h0Var, str2, arrayList, file, arrayList2);
        }
    }

    public static void g(g.o oVar) {
        LocationManager locationManager = (LocationManager) oVar.getSystemService(LocationManager.class);
        if (locationManager.isProviderEnabled("gps") || locationManager.isProviderEnabled("network")) {
            return;
        }
        d9.f fVar = new d9.f(oVar);
        fVar.d(2132020101);
        fVar.i(2132018732);
        fVar.o(2132019022);
        fVar.f49051r = new e(oVar, 0);
        d9.j jVar = new d9.j(fVar);
        int i5 = f10.d.R;
        ex.i.P(jVar);
        jVar.show();
    }
}
