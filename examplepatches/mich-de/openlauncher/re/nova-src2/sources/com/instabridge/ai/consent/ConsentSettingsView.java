package com.instabridge.ai.consent;

import android.app.AppOpsManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build;
import android.os.Process;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.widget.SwitchCompat;
import b70.k;
import com.instabridge.ai.auth.AiAuthManager;
import com.instabridge.ai.auth.AiConsentMutationResult;
import com.instabridge.ai.auth.ConsentStatus;
import com.instabridge.ai.consent.ConsentSettingsView;
import e1.s0;
import fk.t;
import fo.d;
import io.i;
import io.j;
import io.l;
import io.m;
import io.n;
import io.o;
import io.p;
import j.c;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/instabridge/ai/consent/ConsentSettingsView;", "Landroid/widget/LinearLayout;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ConsentSettingsView extends LinearLayout {
    public static final /* synthetic */ int o = 0;

    /* renamed from: a, reason: collision with root package name */
    public final SwitchCompat f35501a;

    /* renamed from: b, reason: collision with root package name */
    public final LinearLayout f35502b;

    /* renamed from: c, reason: collision with root package name */
    public final LinearLayout f35503c;

    /* renamed from: d, reason: collision with root package name */
    public final TextView f35504d;

    /* renamed from: e, reason: collision with root package name */
    public final TextView f35505e;

    /* renamed from: f, reason: collision with root package name */
    public Object f35506f;

    /* renamed from: g, reason: collision with root package name */
    public final LinkedHashSet f35507g;

    /* renamed from: h, reason: collision with root package name */
    public j0 f35508h;

    /* renamed from: i, reason: collision with root package name */
    public c f35509i;

    /* renamed from: j, reason: collision with root package name */
    public c f35510j;

    /* renamed from: k, reason: collision with root package name */
    public p f35511k;

    /* renamed from: l, reason: collision with root package name */
    public SwitchCompat f35512l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f35513m;
    public boolean n;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ConsentSettingsView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4);
        Intrinsics.g(context, "context");
    }

    public final void a(boolean z11) throws Resources.NotFoundException {
        p pVar = this.f35511k;
        if (pVar == null) {
            return;
        }
        SwitchCompat switchCompat = this.f35512l;
        this.f35511k = null;
        this.f35512l = null;
        if (z11) {
            this.f35507g.add(pVar);
            if (this.n) {
                i(pVar, true);
                return;
            }
            return;
        }
        if (switchCompat != null) {
            switchCompat.setOnCheckedChangeListener(null);
        }
        if (switchCompat != null) {
            switchCompat.setChecked(false);
        }
        if (switchCompat != null) {
            switchCompat.setOnCheckedChangeListener(new i(this, pVar, switchCompat, 0));
        }
    }

    public final void b() throws Resources.NotFoundException {
        p pVar = this.f35511k;
        if (pVar == null) {
            return;
        }
        SwitchCompat switchCompat = this.f35512l;
        this.f35511k = null;
        this.f35512l = null;
        if (e()) {
            this.f35507g.add(pVar);
            if (this.n) {
                i(pVar, true);
                return;
            }
            return;
        }
        if (switchCompat != null) {
            switchCompat.setOnCheckedChangeListener(null);
        }
        if (switchCompat != null) {
            switchCompat.setChecked(false);
        }
        if (switchCompat != null) {
            switchCompat.setOnCheckedChangeListener(new i(this, pVar, switchCompat, 0));
        }
    }

    public final void c(p pVar, boolean z11, SwitchCompat switchCompat) {
        if (this.f35513m) {
            return;
        }
        LinkedHashSet linkedHashSet = this.f35507g;
        if (!z11) {
            linkedHashSet.remove(pVar);
            if (this.n) {
                i(pVar, false);
                return;
            }
            return;
        }
        String strA = pVar.a(d.c().f55436a);
        if (strA == null) {
            linkedHashSet.add(pVar);
            if (this.n) {
                i(pVar, true);
                return;
            }
            return;
        }
        String str = d.c().f55436a;
        boolean z12 = pVar.f66719c;
        if (o.f66704a[pVar.ordinal()] == 1 && str.equalsIgnoreCase("nova")) {
            z12 = false;
        }
        if (!z12) {
            c cVar = this.f35509i;
            if (cVar != null) {
                this.f35511k = pVar;
                this.f35512l = switchCompat;
                cVar.a(strA, null);
                return;
            } else {
                linkedHashSet.add(pVar);
                if (this.n) {
                    i(pVar, true);
                    return;
                }
                return;
            }
        }
        if (e()) {
            linkedHashSet.add(pVar);
            if (this.n) {
                i(pVar, true);
                return;
            }
            return;
        }
        c cVar2 = this.f35510j;
        if (cVar2 == null) {
            switchCompat.setChecked(false);
            return;
        }
        this.f35511k = pVar;
        this.f35512l = switchCompat;
        cVar2.a(new Intent("android.settings.USAGE_ACCESS_SETTINGS"), null);
    }

    /* JADX WARN: Type inference failed for: r11v1, types: [java.lang.Object, java.util.List] */
    public final void d(j0 j0Var, c cVar, c cVar2) {
        Object objL;
        this.f35508h = j0Var;
        this.f35509i = cVar;
        this.f35510j = cVar2;
        if (d.j()) {
            br.c cVar3 = p.f66705f;
            String str = d.c().f55436a;
            cVar3.getClass();
            objL = br.c.l(str);
        } else {
            Log.w("ConsentSettingsView", "initialize: InstaAI not initialized — rendering empty consent view");
            objL = EmptyList.f71733a;
        }
        this.f35506f = objL;
        this.f35501a.setOnCheckedChangeListener(new j(this, 1));
        final int i5 = 0;
        this.f35504d.setOnClickListener(new View.OnClickListener(this) { // from class: io.k

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ConsentSettingsView f66538b;

            {
                this.f66538b = this;
            }

            /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.List] */
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                j0 j0Var2;
                j0 j0Var3;
                switch (i5) {
                    case 0:
                        ConsentSettingsView consentSettingsView = this.f66538b;
                        ?? r02 = consentSettingsView.f35506f;
                        Continuation continuation = null;
                        if (r02 == 0) {
                            Intrinsics.m("categories");
                            throw null;
                        }
                        Iterator it = r02.iterator();
                        while (it.hasNext()) {
                            consentSettingsView.f35507g.add((p) it.next());
                        }
                        consentSettingsView.h();
                        if (consentSettingsView.n && (j0Var2 = consentSettingsView.f35508h) != null) {
                            m0.t(j0Var2, null, null, new s0(consentSettingsView, true, continuation, 1), 3);
                            return;
                        }
                        return;
                    default:
                        ConsentSettingsView consentSettingsView2 = this.f66538b;
                        consentSettingsView2.f35507g.clear();
                        consentSettingsView2.h();
                        if (consentSettingsView2.n && (j0Var3 = consentSettingsView2.f35508h) != null) {
                            m0.t(j0Var3, null, null, new s0(consentSettingsView2, false, null, 1), 3);
                            return;
                        }
                        return;
                }
            }
        });
        final int i11 = 1;
        this.f35505e.setOnClickListener(new View.OnClickListener(this) { // from class: io.k

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ConsentSettingsView f66538b;

            {
                this.f66538b = this;
            }

            /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.List] */
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                j0 j0Var2;
                j0 j0Var3;
                switch (i11) {
                    case 0:
                        ConsentSettingsView consentSettingsView = this.f66538b;
                        ?? r02 = consentSettingsView.f35506f;
                        Continuation continuation = null;
                        if (r02 == 0) {
                            Intrinsics.m("categories");
                            throw null;
                        }
                        Iterator it = r02.iterator();
                        while (it.hasNext()) {
                            consentSettingsView.f35507g.add((p) it.next());
                        }
                        consentSettingsView.h();
                        if (consentSettingsView.n && (j0Var2 = consentSettingsView.f35508h) != null) {
                            m0.t(j0Var2, null, null, new s0(consentSettingsView, true, continuation, 1), 3);
                            return;
                        }
                        return;
                    default:
                        ConsentSettingsView consentSettingsView2 = this.f66538b;
                        consentSettingsView2.f35507g.clear();
                        consentSettingsView2.h();
                        if (consentSettingsView2.n && (j0Var3 = consentSettingsView2.f35508h) != null) {
                            m0.t(j0Var3, null, null, new s0(consentSettingsView2, false, null, 1), 3);
                            return;
                        }
                        return;
                }
            }
        });
        LinearLayout linearLayout = this.f35503c;
        linearLayout.removeAllViews();
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(getContext());
        ?? r11 = this.f35506f;
        if (r11 == 0) {
            Intrinsics.m("categories");
            throw null;
        }
        for (p pVar : r11) {
            View viewInflate = layoutInflaterFrom.inflate(2131623991, (ViewGroup) linearLayout, false);
            ImageView imageView = (ImageView) viewInflate.findViewById(2131429051);
            TextView textView = (TextView) viewInflate.findViewById(2131429053);
            TextView textView2 = (TextView) viewInflate.findViewById(2131429050);
            SwitchCompat switchCompat = (SwitchCompat) viewInflate.findViewById(2131429054);
            int i12 = 2131231065;
            switch (pVar.ordinal()) {
                case 0:
                    i12 = 2131231070;
                    break;
                case 1:
                case 5:
                case 10:
                    break;
                case 2:
                    i12 = 2131231071;
                    break;
                case 3:
                    i12 = 2131231068;
                    break;
                case 4:
                    i12 = 2131231073;
                    break;
                case 6:
                    i12 = 2131231072;
                    break;
                case 7:
                    i12 = 2131231066;
                    break;
                case 8:
                    i12 = 2131231067;
                    break;
                case 9:
                    i12 = 2131231069;
                    break;
                case 11:
                    i12 = 2131231074;
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            imageView.setImageResource(i12);
            int i13 = 2132017278;
            switch (pVar.ordinal()) {
                case 0:
                    i13 = 2132017280;
                    break;
                case 1:
                case 5:
                case 10:
                    break;
                case 2:
                    i13 = 2132017282;
                    break;
                case 3:
                    i13 = 2132017274;
                    break;
                case 4:
                    i13 = 2132017286;
                    break;
                case 6:
                    i13 = 2132017284;
                    break;
                case 7:
                    i13 = 2132017270;
                    break;
                case 8:
                    i13 = 2132017272;
                    break;
                case 9:
                    i13 = 2132017276;
                    break;
                case 11:
                    i13 = 2132017268;
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            textView.setText(i13);
            int i14 = 2132017279;
            switch (pVar.ordinal()) {
                case 0:
                    i14 = 2132017281;
                    break;
                case 1:
                case 5:
                case 10:
                    break;
                case 2:
                    i14 = 2132017283;
                    break;
                case 3:
                    i14 = 2132017275;
                    break;
                case 4:
                    i14 = 2132017287;
                    break;
                case 6:
                    i14 = 2132017285;
                    break;
                case 7:
                    i14 = 2132017271;
                    break;
                case 8:
                    i14 = 2132017273;
                    break;
                case 9:
                    i14 = 2132017277;
                    break;
                case 11:
                    i14 = 2132017269;
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            textView2.setText(i14);
            switchCompat.setChecked(this.f35507g.contains(pVar));
            switchCompat.setOnCheckedChangeListener(new i(this, pVar, switchCompat, 2));
            viewInflate.setOnClickListener(new t(switchCompat, 13));
            viewInflate.setTag(pVar);
            linearLayout.addView(viewInflate);
        }
    }

    public final boolean e() {
        try {
            Object systemService = getContext().getSystemService("appops");
            AppOpsManager appOpsManager = systemService instanceof AppOpsManager ? (AppOpsManager) systemService : null;
            if (appOpsManager == null) {
                return false;
            }
            return (Build.VERSION.SDK_INT >= 29 ? appOpsManager.unsafeCheckOpNoThrow("android:get_usage_stats", Process.myUid(), getContext().getPackageName()) : appOpsManager.checkOpNoThrow("android:get_usage_stats", Process.myUid(), getContext().getPackageName())) == 0;
        } catch (Exception unused) {
            return false;
        }
    }

    /* JADX WARN: Type inference failed for: r4v1, types: [java.lang.Object, java.util.List] */
    public final void f() {
        ConsentStatus consentSnapshot = d.a().getConsentSnapshot();
        boolean zB = consentSnapshot != null ? Intrinsics.b(consentSnapshot.getGlobalEnabled(), Boolean.TRUE) : false;
        SwitchCompat switchCompat = this.f35501a;
        switchCompat.setOnCheckedChangeListener(null);
        switchCompat.setChecked(zB);
        switchCompat.setOnCheckedChangeListener(new j(this, 0));
        LinkedHashSet linkedHashSet = this.f35507g;
        linkedHashSet.clear();
        ?? r42 = this.f35506f;
        if (r42 == 0) {
            Intrinsics.m("categories");
            throw null;
        }
        for (p pVar : r42) {
            if (d.a().isCategoryConsentEnabled(pVar.name())) {
                linkedHashSet.add(pVar);
            }
        }
        this.f35502b.setVisibility(zB ? 0 : 8);
        h();
    }

    public final void g(boolean z11) {
        if (this.f35513m) {
            return;
        }
        if (!this.n) {
            this.f35502b.setVisibility(z11 ? 0 : 8);
            return;
        }
        this.f35513m = true;
        j0 j0Var = this.f35508h;
        if (j0Var != null) {
            m0.t(j0Var, null, null, new l(z11, this, null), 3);
        }
    }

    public final void h() {
        LinearLayout linearLayout = this.f35503c;
        int childCount = linearLayout.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = linearLayout.getChildAt(i5);
            Object tag = childAt.getTag();
            p pVar = tag instanceof p ? (p) tag : null;
            if (pVar != null) {
                SwitchCompat switchCompat = (SwitchCompat) childAt.findViewById(2131429054);
                switchCompat.setOnCheckedChangeListener(null);
                switchCompat.setChecked(this.f35507g.contains(pVar));
                switchCompat.setOnCheckedChangeListener(new i(this, pVar, switchCompat, 1));
            }
        }
    }

    public final void i(p pVar, boolean z11) {
        j0 j0Var = this.f35508h;
        if (j0Var != null) {
            m0.t(j0Var, null, null, new m(pVar, z11, this, null), 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(boolean z11, ContinuationImpl continuationImpl) {
        n nVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f66700v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f66700v = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object obj = nVar.f66698t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f66700v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                Object obj2 = this.f35506f;
                if (obj2 == null) {
                    Intrinsics.m("categories");
                    throw null;
                }
                Iterable iterable = (Iterable) obj2;
                int iD0 = k.d0(b70.c.u0(iterable, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                for (Object obj3 : iterable) {
                    linkedHashMap.put(obj3, Boolean.valueOf(this.f35507g.contains((p) obj3)));
                }
                AiAuthManager aiAuthManagerA = d.a();
                nVar.f66700v = 1;
                if (aiAuthManagerA.saveAppVisibleCategoryConsent(linkedHashMap, z11, nVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return new AiConsentMutationResult(true, d.a().getAiAccessDecision(), null, null, 12, null);
        } catch (Exception e3) {
            return new AiConsentMutationResult(false, d.a().getAiAccessDecision(), null, e3.getMessage(), 4, null);
        }
    }

    public ConsentSettingsView(Context context, AttributeSet attributeSet, int i5) {
        super(context, (i5 & 2) != 0 ? null : attributeSet, 0);
        this.f35507g = new LinkedHashSet();
        this.n = true;
        LayoutInflater.from(context).inflate(2131623990, (ViewGroup) this, true);
        View viewFindViewById = findViewById(2131428314);
        Intrinsics.f(viewFindViewById, "findViewById(...)");
        this.f35501a = (SwitchCompat) viewFindViewById;
        View viewFindViewById2 = findViewById(2131428533);
        Intrinsics.f(viewFindViewById2, "findViewById(...)");
        this.f35502b = (LinearLayout) viewFindViewById2;
        View viewFindViewById3 = findViewById(2131429052);
        Intrinsics.f(viewFindViewById3, "findViewById(...)");
        this.f35503c = (LinearLayout) viewFindViewById3;
        View viewFindViewById4 = findViewById(2131427475);
        Intrinsics.f(viewFindViewById4, "findViewById(...)");
        this.f35504d = (TextView) viewFindViewById4;
        View viewFindViewById5 = findViewById(2131427474);
        Intrinsics.f(viewFindViewById5, "findViewById(...)");
        this.f35505e = (TextView) viewFindViewById5;
    }
}
