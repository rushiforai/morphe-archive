package b6;

import android.animation.ValueAnimator;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.compose.ui.node.LayoutNode;
import androidx.preference.EditTextPreference;
import androidx.preference.Preference;
import androidx.webkit.WebViewStartUpResult;
import b.c0;
import cl.k0;
import com.android.launcher3.shortcuts.DeepShortcutView;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.tasks.Task;
import com.teslacoilsw.launcher.CustomIcon;
import com.teslacoilsw.launcher.EditShortcutFloatingView;
import com.teslacoilsw.launcher.EditShortcutSavedState;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import com.teslacoilsw.launcher.popup.SimplePopupView;
import com.teslacoilsw.launcher.preferences.fancyprefs.RequiresPrimeSwitchCompat;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;
import com.teslacoilsw.launcher.util.NamedIntent;
import com.teslacoilsw.launcher.widget.NovaCheckBox;
import d10.m;
import e10.a3;
import e10.g2;
import e10.y2;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executors;
import ke.l;
import ke.s;
import kl.q0;
import kotlin.coroutines.Continuation;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import kw.s3;
import m90.z;
import mx.o;
import mx.v;
import o7.g0;
import o9.l2;
import o9.n1;
import okhttp3.internal.publicsuffix.PublicSuffixDatabase;
import org.json.JSONException;
import org.json.JSONObject;
import r10.t0;
import r70.k;
import sp.h0;
import sp.p;
import sp.r0;
import sx.n;
import t5.d0;
import t70.m0;
import xk.l0;
import xk.r2;
import xk.v0;

/* loaded from: classes2.dex */
public final class e implements g60.a, k6.b, k0.h, l, WebViewStartUpResult, fi.c, r6.c, s60.c, sp.a, u60.c {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ e f17567b = new e(18);

    /* renamed from: c, reason: collision with root package name */
    public static e f17568c;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17569a;

    public /* synthetic */ e(int i5) {
        this.f17569a = i5;
    }

    public static final String c(byte[] bArr, byte[][] bArr2, int i5) {
        int i11;
        boolean z11;
        int i12;
        int i13;
        byte[] bArr3 = PublicSuffixDatabase.f80492e;
        int length = bArr.length;
        int i14 = 0;
        while (i14 < length) {
            int i15 = (i14 + length) / 2;
            while (i15 > -1 && bArr[i15] != 10) {
                i15--;
            }
            int i16 = i15 + 1;
            int i17 = 1;
            while (true) {
                i11 = i16 + i17;
                if (bArr[i11] == 10) {
                    break;
                }
                i17++;
            }
            int i18 = i11 - i16;
            int i19 = i5;
            boolean z12 = false;
            int i21 = 0;
            int i22 = 0;
            while (true) {
                if (z12) {
                    i12 = 46;
                    z11 = false;
                } else {
                    byte b11 = bArr2[i19][i21];
                    byte[] bArr4 = y80.c.f96853a;
                    int i23 = b11 & 255;
                    z11 = z12;
                    i12 = i23;
                }
                byte b12 = bArr[i16 + i22];
                byte[] bArr5 = y80.c.f96853a;
                i13 = i12 - (b12 & 255);
                if (i13 != 0) {
                    break;
                }
                i22++;
                i21++;
                if (i22 == i18) {
                    break;
                }
                if (bArr2[i19].length != i21) {
                    z12 = z11;
                } else {
                    if (i19 == bArr2.length - 1) {
                        break;
                    }
                    i19++;
                    i21 = -1;
                    z12 = true;
                }
            }
            if (i13 >= 0) {
                if (i13 <= 0) {
                    int i24 = i18 - i22;
                    int length2 = bArr2[i19].length - i21;
                    int length3 = bArr2.length;
                    for (int i25 = i19 + 1; i25 < length3; i25++) {
                        length2 += bArr2[i25].length;
                    }
                    if (length2 >= i24) {
                        if (length2 <= i24) {
                            Charset UTF_8 = StandardCharsets.UTF_8;
                            Intrinsics.f(UTF_8, "UTF_8");
                            return new String(bArr, i16, i18, UTF_8);
                        }
                    }
                }
                i14 = i11 + 1;
            }
            length = i15;
        }
        return null;
    }

    public static final boolean e(z zVar) {
        z zVar2 = n90.g.f78044e;
        return !r70.j.A0(zVar.b(), ".class", true);
    }

    public static final int h(String str) {
        Object obj = n.f87806d;
        Integer numU0 = r70.i.u0(k.a1(str, "t"));
        return numU0 != null ? numU0.intValue() : LayoutNode.NotPlacedPlaceOrder;
    }

    public static ft.c i(String str) {
        Object lowerCase;
        i70.a aVar = ft.c.f55916h;
        b70.a aVarF = c0.f(aVar, aVar);
        while (true) {
            lowerCase = null;
            if (!aVarF.hasNext()) {
                break;
            }
            Object next = aVarF.next();
            String str2 = ((ft.c) next).f55917a;
            if (str != null) {
                lowerCase = str.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
            }
            if (str2.equals(lowerCase)) {
                lowerCase = next;
                break;
            }
        }
        ft.c cVar = (ft.c) lowerCase;
        return cVar == null ? ft.c.f55914f : cVar;
    }

    public static LayoutInflater l(n1 n1Var) {
        Intrinsics.e(n1Var, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaLauncher");
        return LayoutInflater.from(((NovaLauncher) n1Var).i1());
    }

    /* JADX WARN: Removed duplicated region for block: B:135:0x0275  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x009a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static EditShortcutFloatingView m(NovaLauncher novaLauncher, ga.f fVar, EditShortcutSavedState editShortcutSavedState) {
        CustomIcon customIcon;
        CharSequence label;
        CharSequence charSequence;
        NamedIntent namedIntent;
        NamedIntent namedIntent2;
        boolean zF;
        iz.c cVar;
        int i5;
        Intent intent;
        ComponentName componentName;
        String strFlattenToShortString;
        Continuation continuation = null;
        if (editShortcutSavedState != null) {
            File file = new File(novaLauncher.getCacheDir(), "editShortcutNewIcon.dat");
            if (file.exists()) {
                Parcel parcelObtain = Parcel.obtain();
                try {
                    byte[] bArrR0 = FilesKt.r0(file);
                    parcelObtain.unmarshall(bArrR0, 0, bArrR0.length);
                    parcelObtain.setDataPosition(0);
                    customIcon = (CustomIcon) parcelObtain.readParcelable(CustomIcon.class.getClassLoader());
                } catch (Exception e3) {
                    e3.printStackTrace();
                } finally {
                    file.delete();
                    parcelObtain.recycle();
                }
            } else {
                customIcon = null;
            }
        }
        o9.a.M(novaLauncher, true, 7471102);
        novaLauncher.m();
        py.a aVar = novaLauncher.P0;
        if (aVar == null) {
            Intrinsics.m("dayNightMonoContext");
            throw null;
        }
        View viewInflate = LayoutInflater.from(aVar).inflate(2131624094, (ViewGroup) novaLauncher.P, false);
        Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.EditShortcutFloatingView");
        final EditShortcutFloatingView editShortcutFloatingView = (EditShortcutFloatingView) viewInflate;
        Drawable background = editShortcutFloatingView.getBackground();
        y2 y2Var = y2.f51877a;
        py.a aVar2 = novaLauncher.P0;
        if (aVar2 == null) {
            Intrinsics.m("dayNightMonoContext");
            throw null;
        }
        background.setTint(y2Var.g1(aVar2));
        novaLauncher.P.addView(editShortcutFloatingView);
        editShortcutFloatingView.f45606i = fVar;
        editShortcutFloatingView.n = customIcon;
        if (customIcon != null) {
            editShortcutFloatingView.f45610m = customIcon.f45597b;
        }
        Context context = editShortcutFloatingView.getContext();
        Intent intentD = fVar.d();
        if (intentD != null) {
            if (intentD.hasCategory("com.android.launcher3.DEEP_SHORTCUT")) {
                ShortcutKey shortcutKeyD = ShortcutKey.d(intentD, fVar.o);
                if (shortcutKeyD != null) {
                    ComponentName componentName2 = shortcutKeyD.f21251a;
                    ShortcutInfo shortcutInfoU = d0.p(context).u(shortcutKeyD.f21252b, componentName2.getPackageName(), componentName2.getClassName());
                    label = shortcutInfoU != null ? k0.D(shortcutInfoU) : null;
                }
            } else if (fVar.i() != null) {
                try {
                    LauncherActivityInfo launcherActivityInfoResolveActivity = ((LauncherApps) context.getSystemService(LauncherApps.class)).resolveActivity(intentD, fVar.o);
                    label = fVar instanceof ga.a ? launcherActivityInfoResolveActivity.getLabel() : editShortcutFloatingView.f45600c.f56217z.d(launcherActivityInfoResolveActivity);
                } catch (Exception e11) {
                    e11.printStackTrace();
                }
            } else if (!fVar.f57303q.b()) {
                label = fVar.f57300l;
            }
        }
        editShortcutFloatingView.f45603f = label;
        ArrayList arrayList = new ArrayList();
        CharSequence charSequence2 = editShortcutFloatingView.f45603f;
        if (charSequence2 != null) {
            arrayList.add(charSequence2);
        }
        if (!Intrinsics.b(fVar.f57300l, editShortcutFloatingView.f45603f)) {
            arrayList.add(fVar.f57300l);
        }
        editShortcutFloatingView.W().f92488k.setAdapter(new ArrayAdapter(editShortcutFloatingView.getContext(), 17367050, arrayList));
        editShortcutFloatingView.W().f92488k.setThreshold(1);
        editShortcutFloatingView.W().f92488k.requestFocus();
        AutoCompleteTextView autoCompleteTextView = editShortcutFloatingView.W().f92488k;
        if (editShortcutSavedState == null || (charSequence = editShortcutSavedState.f45619c) == null) {
            charSequence = fVar.f57300l;
        }
        autoCompleteTextView.setText(charSequence);
        editShortcutFloatingView.W().f92488k.dismissDropDown();
        editShortcutFloatingView.W().f92490m.setVisibility(8);
        boolean zE = lx.a.e(fVar);
        if (editShortcutSavedState == null || (namedIntent = editShortcutSavedState.f45621e) == null) {
            namedIntent = fVar.f57308v;
        }
        editShortcutFloatingView.f45604g = namedIntent;
        if (editShortcutSavedState == null || (namedIntent2 = editShortcutSavedState.f45622f) == null) {
            namedIntent2 = fVar.f57309w;
        }
        editShortcutFloatingView.f45605h = namedIntent2;
        editShortcutFloatingView.W().f92494s.setVisibility((zE || !(fVar instanceof ga.c)) ? 8 : 0);
        RequiresPrimeSwitchCompat requiresPrimeSwitchCompat = editShortcutFloatingView.W().f92494s;
        if (editShortcutSavedState != null) {
            zF = editShortcutSavedState.f45620d;
        } else {
            ga.c cVar2 = fVar instanceof ga.c ? (ga.c) fVar : null;
            zF = (cVar2 == null || (cVar = cVar2.f57303q) == null) ? false : cVar.f();
        }
        requiresPrimeSwitchCompat.h(zF, false);
        editShortcutFloatingView.W().f92495t.setVisibility(!zE ? 0 : 8);
        editShortcutFloatingView.W().f92496u.setVisibility(!zE ? 0 : 8);
        editShortcutFloatingView.W().f92492q.setVisibility(!zE ? 0 : 8);
        editShortcutFloatingView.W().f92493r.setVisibility(!zE ? 0 : 8);
        editShortcutFloatingView.f0();
        ComponentName componentNameI = fVar.i();
        ComponentKey componentKey = componentNameI != null ? new ComponentKey(componentNameI, fVar.o) : null;
        editShortcutFloatingView.f45607j = componentKey;
        if (componentKey == null || x7.f.L(componentKey.f21251a, componentKey.f21252b)) {
            editShortcutFloatingView.W().f92484g.setVisibility(8);
        } else {
            TextView textView = editShortcutFloatingView.W().f92484g;
            ComponentKey componentKey2 = editShortcutFloatingView.f45607j;
            textView.setText((componentKey2 == null || (componentName = componentKey2.f21251a) == null || (strFlattenToShortString = componentName.flattenToShortString()) == null) ? null : r70.j.F0(strFlattenToShortString, ".", "\u200b.", false));
        }
        ComponentKey componentKey3 = editShortcutFloatingView.f45607j;
        if (componentKey3 == null || x7.f.L(componentKey3.f21251a, componentKey3.f21252b)) {
            editShortcutFloatingView.W().f92491p.setVisibility(8);
            editShortcutFloatingView.W().o.setVisibility(8);
        } else {
            g2 g2Var = a3.f51435a;
            if (g2Var.f51555k) {
                g2Var.f51557m.getClass();
                if (!(fVar instanceof ga.j) || ((intent = ((ga.j) fVar).f57322x) != null && fg.a.F(intent))) {
                    editShortcutFloatingView.W().f92491p.setVisibility(0);
                    editShortcutFloatingView.W().o.setVisibility(0);
                }
            }
        }
        NovaCheckBox novaCheckBox = editShortcutFloatingView.W().f92483f;
        ga.f fVar2 = editShortcutFloatingView.f45606i;
        if (fVar2 == null) {
            Intrinsics.m("itemInfo");
            throw null;
        }
        if (fVar2.f57290b == 6) {
            i5 = 0;
        } else {
            if (!Intrinsics.b(fVar2.o, Process.myUserHandle())) {
                ga.f fVar3 = editShortcutFloatingView.f45606i;
                if (fVar3 == null) {
                    Intrinsics.m("itemInfo");
                    throw null;
                }
                if (!lx.a.e(fVar3)) {
                    ga.f fVar4 = editShortcutFloatingView.f45606i;
                    if (fVar4 == null) {
                        Intrinsics.m("itemInfo");
                        throw null;
                    }
                    if (fVar4.f57303q.a()) {
                    }
                }
                i5 = 0;
            }
            i5 = 8;
        }
        novaCheckBox.setVisibility(i5);
        NovaCheckBox novaCheckBox2 = editShortcutFloatingView.W().f92483f;
        if (editShortcutFloatingView.f45606i == null) {
            Intrinsics.m("itemInfo");
            throw null;
        }
        novaCheckBox2.h(!r5.f57303q.c(), false);
        NovaCheckBox novaCheckBox3 = editShortcutFloatingView.W().n;
        if (editShortcutFloatingView.f45606i == null) {
            Intrinsics.m("itemInfo");
            throw null;
        }
        novaCheckBox3.h(!r5.f57303q.d(), false);
        editShortcutFloatingView.f45608k = editShortcutSavedState != null ? editShortcutSavedState.f45618b : false;
        m0.t(editShortcutFloatingView.f45601d, null, null, new s3(fVar, editShortcutFloatingView, continuation, 13), 3);
        ga.f fVar5 = editShortcutFloatingView.f45606i;
        if (fVar5 == null) {
            Intrinsics.m("itemInfo");
            throw null;
        }
        if (lx.a.e(fVar5)) {
            v vVar = editShortcutFloatingView.f45613r;
            g2 g2Var2 = a3.f51435a;
            if (g2Var2.f51552h) {
                editShortcutFloatingView.W().f92482e.setVisibility(g2Var2.f51552h ? 0 : 8);
            }
            uy.d0 d0Var = uy.d0.f91699e;
            d0Var.getClass();
            editShortcutFloatingView.f45611p = new q0(d0Var);
            vVar.f77251a = editShortcutFloatingView.Y();
            editShortcutFloatingView.W().f92481d.setAdapter((ListAdapter) vVar);
            editShortcutFloatingView.W().f92481d.setOnItemClickListener(new o(editShortcutFloatingView, 0));
            editShortcutFloatingView.W().f92481d.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() { // from class: mx.p
                @Override // android.widget.AdapterView.OnItemLongClickListener
                public final boolean onItemLongClick(AdapterView adapterView, View view, int i11, long j11) {
                    int i12 = EditShortcutFloatingView.f45599v;
                    if (!view.isEnabled()) {
                        return false;
                    }
                    EditShortcutFloatingView editShortcutFloatingView2 = editShortcutFloatingView;
                    if (i11 >= editShortcutFloatingView2.f45613r.getCount()) {
                        return false;
                    }
                    Object itemAtPosition = editShortcutFloatingView2.W().f92481d.getItemAtPosition(i11);
                    Intrinsics.e(itemAtPosition, "null cannot be cast to non-null type com.teslacoilsw.launcher.drawer.drawergroups.DrawerGroup");
                    editShortcutFloatingView2.c0((uy.s) itemAtPosition);
                    return true;
                }
            });
        }
        editShortcutFloatingView.f79742a = true;
        return editShortcutFloatingView;
    }

    public static void p(NovaLauncher novaLauncher, NovaSearchBarView novaSearchBarView) {
        if (novaLauncher == null) {
            throw new IllegalStateException();
        }
        View viewInflate = l(novaLauncher).inflate(2131624380, (ViewGroup) novaLauncher.P, false);
        Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.popup.SimplePopupView<com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView>");
        SimplePopupView simplePopupView = (SimplePopupView) viewInflate;
        simplePopupView.o0(novaLauncher, novaSearchBarView);
        ArrayList arrayList = new ArrayList();
        ClipboardManager clipboardManager = (ClipboardManager) novaLauncher.getSystemService(ClipboardManager.class);
        ClipDescription primaryClipDescription = clipboardManager.getPrimaryClipDescription();
        if ((clipboardManager.hasPrimaryClip() && primaryClipDescription != null && primaryClipDescription.hasMimeType("text/plain")) || (primaryClipDescription != null && primaryClipDescription.hasMimeType("text/html"))) {
            arrayList.add(new d10.h(2132019044, 2131231520, new com.instabridge.ai.chat.ui.v2.j(2, novaLauncher, clipboardManager, simplePopupView)));
        }
        y2.f51877a.getClass();
        if (!y2.d()) {
            arrayList.add(new d10.h(2132017926, 2131231747, new com.instabridge.ai.chat.ui.v2.j(3, novaLauncher, novaSearchBarView, simplePopupView)));
            if (((novaSearchBarView instanceof NovaAppDrawerSearchBar) || Intrinsics.b(novaSearchBarView.getTag(), -151)) && !novaLauncher.t0(l2.o)) {
                arrayList.add(new d10.h(2132019391, 2131231870, new d10.k(novaLauncher, simplePopupView, 1)));
            }
        }
        if (arrayList.isEmpty()) {
            return;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            d10.h hVar = (d10.h) it.next();
            DeepShortcutView deepShortcutView = (DeepShortcutView) simplePopupView.e0(simplePopupView, 2131624433);
            deepShortcutView.f21244c.setBackgroundResource(hVar.f48830b);
            deepShortcutView.f21243b.setText(hVar.f48829a);
            deepShortcutView.setOnClickListener(hVar.f48831c);
        }
        simplePopupView.i0(simplePopupView.getChildCount());
    }

    public static void r(n1 n1Var, View view, List list, Point point, r10.i iVar, int i5) {
        int i11 = SimplePopupView.R;
        if ((i5 & 8) != 0) {
            point = null;
        }
        r10.i iVar2 = (i5 & 16) != 0 ? null : iVar;
        if (!(n1Var instanceof NovaLauncher)) {
            throw new IllegalStateException();
        }
        View viewInflate = l(n1Var).inflate(2131624380, (ViewGroup) ((NovaLauncher) n1Var).P, false);
        Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.popup.SimplePopupView<android.view.View>");
        SimplePopupView simplePopupView = (SimplePopupView) viewInflate;
        if (point != null) {
            simplePopupView.Q = point;
        }
        simplePopupView.o0(n1Var, view);
        List<t0> list2 = list;
        ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
        for (t0 t0Var : list2) {
            arrayList.add(new d10.h(t0Var.a(), t0Var.b(), new m(n1Var, simplePopupView, t0Var, iVar2, 0)));
        }
        if (arrayList.isEmpty()) {
            return;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            d10.h hVar = (d10.h) it.next();
            DeepShortcutView deepShortcutView = (DeepShortcutView) simplePopupView.e0(simplePopupView, 2131624433);
            deepShortcutView.f21244c.setBackgroundResource(hVar.f48830b);
            deepShortcutView.f21243b.setText(hVar.f48829a);
            deepShortcutView.setOnClickListener(hVar.f48831c);
        }
        simplePopupView.i0(simplePopupView.getChildCount());
    }

    @Override // s60.c
    public CharSequence b(String str, String str2) {
        return str2;
    }

    @Override // u60.c
    public boolean d(u60.j jVar) {
        return !"class-name".equals(jVar.f90659a);
    }

    @Override // r6.c
    public CharSequence f(Preference preference) {
        EditTextPreference editTextPreference = (EditTextPreference) preference;
        return TextUtils.isEmpty(editTextPreference.f14746m) ? editTextPreference.f14769a.getString(2132018740) : editTextPreference.f14746m;
    }

    @Override // g60.a
    public Object g(c60.d dVar) {
        return Integer.valueOf(dVar.J);
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public Long getMaxTimePerTaskInUiThreadMillis() {
        return null;
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public List getNonUiThreadBlockingStartUpLocations() {
        return null;
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public Long getTotalTimeInUiThreadMillis() {
        return null;
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public List getUiThreadBlockingStartUpLocations() {
        return null;
    }

    @Override // ke.l
    public void j(s sVar) {
    }

    @Override // k0.h
    public void k(y3.c cVar, int i5, int[] iArr, y3.n nVar, int[] iArr2) {
        k0.k.b(iArr, iArr2, false);
    }

    @Override // sp.a
    public boolean n(sp.m0 m0Var, int i5, String str) {
        if (i5 != 200) {
            p.b().getClass();
            sp.m0.a("e100");
            return false;
        }
        if (r0.l(str)) {
            p.b().getClass();
            sp.m0.a("e119");
            return false;
        }
        try {
            h0 h0Var = new h0(new JSONObject(str));
            p pVarB = p.b();
            pVarB.getClass();
            try {
                pVarB.f87645a = h0Var;
                try {
                    SharedPreferences.Editor editorEdit = m0Var.f87616a.getSharedPreferences("singular-pref-config-manager", 0).edit();
                    editorEdit.putString("config_manager_config", h0Var.f().toString());
                    editorEdit.commit();
                } catch (Throwable th2) {
                    r0.c(th2);
                }
                p.c(-1L);
            } catch (Throwable th3) {
                p pVar = p.f87644b;
                r0.c(th3);
            }
            Executors.newSingleThreadExecutor().execute(new g0(m0Var, 18));
            return true;
        } catch (JSONException e3) {
            int i11 = sp.d.f87572b;
            r0.c(e3);
            sp.m0.a("e101");
            p pVarB2 = p.b();
            r0.c(e3);
            pVarB2.getClass();
            sp.m0.a("e116");
            return false;
        }
    }

    @Override // ke.l
    public void o() {
    }

    @Override // ke.l
    public ke.v s(int i5, int i11) {
        return new ke.i();
    }

    @Override // fi.c
    public /* synthetic */ Object then(Task task) throws IOException {
        if (task.q()) {
            return (Bundle) task.m();
        }
        if (Log.isLoggable("Rpc", 3)) {
            task.l();
        }
        throw new IOException("SERVICE_NOT_AVAILABLE", task.l());
    }

    public String toString() {
        switch (this.f17569a) {
            case 12:
                return "AbsoluteArrangement#Left";
            default:
                return super.toString();
        }
    }

    public e(sp.d dVar) {
        this.f17569a = 24;
    }

    public e(int[] iArr, ValueAnimator valueAnimator) {
        this.f17569a = 27;
    }

    public e() {
        this.f17569a = 3;
        l0 l0Var = v0.f96030b;
        r2 r2Var = r2.f96007e;
    }
}
