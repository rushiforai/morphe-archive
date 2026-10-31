package com.teslacoilsw.launcher.ai;

import a5.a1;
import a5.q0;
import a80.e;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.contract.ActivityResultContracts$RequestPermission;
import androidx.activity.result.contract.ActivityResultContracts$StartActivityForResult;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import b.u4;
import b.z9;
import be.f;
import com.amplitude.core.events.Plan;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.button.MaterialButton;
import com.instabridge.ai.chat.model.BubbleContext;
import com.instabridge.ai.chat.ui.AiChatActivity;
import com.instabridge.ai.chat.ui.ConversationListView;
import com.instabridge.ai.chat.ui.v2.AiChatViewV2;
import com.instabridge.ai.protocol.Suggestion;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import com.teslacoilsw.launcher.onboarding.NovaPaywallActivity;
import cs.h;
import cy.d0;
import e00.j5;
import e1.s0;
import ex.i;
import fo.d;
import h6.c1;
import h6.g1;
import hv.z1;
import j.a;
import j.c;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.SourceDebugExtension;
import m.j;
import m.m;
import mc0.b;
import n0.w;
import ps.k;
import pu.q;
import r70.l;
import rl.g;
import t70.m0;
import t70.y0;
import tx.a0;
import tx.b0;
import tx.b4;
import tx.c0;
import tx.c2;
import tx.d1;
import tx.g2;
import tx.k2;
import tx.o;
import tx.p;
import tx.u;
import tx.v;
import tx.x;
import tx.y;
import vx.t;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lcom/teslacoilsw/launcher/ai/NovaAiChatActivity;", "Lm/m;", "<init>", "()V", "tx/x", "tx/r", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class NovaAiChatActivity extends m {
    public static final /* synthetic */ int C = 0;
    public BottomSheetBehavior A;
    public ConversationListView B;

    /* renamed from: p, reason: collision with root package name */
    public final c f45686p;

    /* renamed from: q, reason: collision with root package name */
    public h f45687q;

    /* renamed from: r, reason: collision with root package name */
    public final c f45688r;

    /* renamed from: s, reason: collision with root package name */
    public q f45689s;

    /* renamed from: t, reason: collision with root package name */
    public AiChatViewV2 f45690t;

    /* renamed from: u, reason: collision with root package name */
    public ImageButton f45691u;

    /* renamed from: v, reason: collision with root package name */
    public View f45692v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f45693w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f45694x;

    /* renamed from: y, reason: collision with root package name */
    public long f45695y;
    public final b4 o = new b4();

    /* renamed from: z, reason: collision with root package name */
    public String f45696z = "unknown";

    public NovaAiChatActivity() {
        final int i5 = 0;
        this.f45686p = registerForActivityResult(new ActivityResultContracts$StartActivityForResult(), new a(this) { // from class: tx.w

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ NovaAiChatActivity f90041b;

            {
                this.f90041b = this;
            }

            @Override // j.a
            public final void onActivityResult(Object obj) {
                switch (i5) {
                    case 0:
                        ActivityResult activityResult = (ActivityResult) obj;
                        a4.c(this.f90041b.o, activityResult.f13597a, activityResult.f13598b);
                        break;
                    default:
                        Boolean bool = (Boolean) obj;
                        bool.getClass();
                        NovaAiChatActivity novaAiChatActivity = this.f90041b;
                        cs.h hVar = novaAiChatActivity.f45687q;
                        if (hVar != null) {
                            hVar.invoke(bool);
                        }
                        novaAiChatActivity.f45687q = null;
                        break;
                }
            }
        });
        final int i11 = 1;
        this.f45688r = registerForActivityResult(new ActivityResultContracts$RequestPermission(), new a(this) { // from class: tx.w

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ NovaAiChatActivity f90041b;

            {
                this.f90041b = this;
            }

            @Override // j.a
            public final void onActivityResult(Object obj) {
                switch (i11) {
                    case 0:
                        ActivityResult activityResult = (ActivityResult) obj;
                        a4.c(this.f90041b.o, activityResult.f13597a, activityResult.f13598b);
                        break;
                    default:
                        Boolean bool = (Boolean) obj;
                        bool.getClass();
                        NovaAiChatActivity novaAiChatActivity = this.f90041b;
                        cs.h hVar = novaAiChatActivity.f45687q;
                        if (hVar != null) {
                            hVar.invoke(bool);
                        }
                        novaAiChatActivity.f45687q = null;
                        break;
                }
            }
        });
    }

    public static final void Z(NovaAiChatActivity novaAiChatActivity) {
        if (k.r() && !novaAiChatActivity.f45693w) {
            boolean z11 = true;
            novaAiChatActivity.f45693w = true;
            try {
                d1.f89690a.a(novaAiChatActivity);
                if (!d.j()) {
                    b bVar = mc0.d.f76206a;
                    bVar.r("NOVA_AI");
                    bVar.n("SDK not initialized after ensureInitialized — aborting chat setup", new Object[0]);
                    novaAiChatActivity.f45693w = false;
                    return;
                }
                boolean zHasExtra = novaAiChatActivity.getIntent().hasExtra(AiChatActivity.EXTRA_BUBBLE_CONTEXT);
                boolean zHasExtra2 = novaAiChatActivity.getIntent().hasExtra(AiChatActivity.EXTRA_QUERY);
                if (!zHasExtra && !zHasExtra2) {
                    z11 = false;
                }
                if (z11) {
                    novaAiChatActivity.f0();
                    novaAiChatActivity.e0();
                }
                m0.t(g1.e(novaAiChatActivity), null, null, new s0(novaAiChatActivity, z11, null, 2), 3);
            } catch (Exception e3) {
                b bVar2 = mc0.d.f76206a;
                bVar2.r("NOVA_AI");
                bVar2.f(e3, "ensureInitialized failed in chat", new Object[0]);
                novaAiChatActivity.f45693w = false;
            }
        }
    }

    public static final void a0(NovaAiChatActivity novaAiChatActivity) {
        c2 c2Var;
        g2 g2Var = g2.f89756a;
        if (g2.f89759d) {
            g2.f89759d = false;
            if (g2.f89757b.getValue() == null || (c2Var = (c2) g2.f89758c.getValue()) == null) {
                return;
            }
            j jVar = new j(novaAiChatActivity);
            jVar.f75297a.f75249f = g2.b(novaAiChatActivity, c2Var);
            jVar.setPositiveButton(2132018821, new z9(novaAiChatActivity, 5)).setNegativeButton(2132018824, null).c();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0054, code lost:
    
        if (t70.m0.y(r7, r2, r0) == r1) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007f, code lost:
    
        if (r7 != r1) goto L32;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r5v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b0(NovaAiChatActivity novaAiChatActivity, ContinuationImpl continuationImpl) throws Throwable {
        c0 c0Var;
        String str;
        String str2;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i5 = c0Var.f89675w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.f89675w = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(novaAiChatActivity, continuationImpl);
            }
        }
        Object objY = c0Var.f89673u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var.f89675w;
        int i12 = 2;
        String str3 = 0;
        str3 = 0;
        if (i11 != 0) {
            if (i11 == 1) {
                ResultKt.b(objY);
                return Unit.f71706a;
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            String str4 = c0Var.f89672t;
            ResultKt.b(objY);
            str2 = str4;
            if (!((Boolean) objY).booleanValue()) {
                b bVar = mc0.d.f76206a;
                bVar.r("NOVA_AI");
                bVar.n("Chat auth refresh did not complete — continuing with existing SDK session", new Object[0]);
                return Unit.f71706a;
            }
            String personId = d.a().getPersonId();
            if (personId != null && !r70.k.U0(personId)) {
                str3 = personId;
            }
            if (str2 != null && str3 != 0 && !str2.equals(str3)) {
                b bVar2 = mc0.d.f76206a;
                bVar2.r("NOVA_AI");
                bVar2.n("Chat auth person changed during refresh: %s -> %s", l.G1(8, str2), l.G1(8, str3));
            }
            return Unit.f71706a;
        }
        ResultKt.b(objY);
        k2 k2Var = k2.f89839a;
        if (k2.d()) {
            e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            y yVar = new y(novaAiChatActivity, str3, 3);
            c0Var.f89675w = 1;
        } else {
            String personId2 = d.a().getPersonId();
            if (personId2 != null) {
                boolean zU0 = r70.k.U0(personId2);
                str = personId2;
                if (zU0) {
                }
                e eVar2 = y0.f88884a;
                a80.d dVar2 = a80.d.f488c;
                j5 j5Var = new j5(i12, str3, 18);
                c0Var.f89672t = str;
                c0Var.f89675w = 2;
                objY = m0.y(dVar2, j5Var, c0Var);
                str2 = str;
            }
            str = null;
            e eVar22 = y0.f88884a;
            a80.d dVar22 = a80.d.f488c;
            j5 j5Var2 = new j5(i12, str3, 18);
            c0Var.f89672t = str;
            c0Var.f89675w = 2;
            objY = m0.y(dVar22, j5Var2, c0Var);
            str2 = str;
        }
        return coroutineSingletons;
    }

    public static final void c0(NovaAiChatActivity novaAiChatActivity, o oVar) {
        b bVar = mc0.d.f76206a;
        bVar.r("NOVA_AI");
        bVar.h("Chat not ready — routing, state=%s", oVar);
        int iOrdinal = oVar.ordinal();
        if (iOrdinal != 0) {
            if (iOrdinal == 1) {
                novaAiChatActivity.n0();
                return;
            }
            if (iOrdinal == 2) {
                Intent intent = new Intent(novaAiChatActivity, (Class<?>) NovaPaywallActivity.class);
                intent.addFlags(268435456);
                intent.putExtra("preselect_tier", "plus");
                intent.putExtra(Plan.AMP_PLAN_SOURCE, "chat_entitlement_required");
                intent.putExtra("ai_mode", true);
                novaAiChatActivity.startActivity(intent);
            } else {
                if (iOrdinal != 3) {
                    if (iOrdinal != 4) {
                        throw new NoWhenBranchMatchedException();
                    }
                    return;
                }
                novaAiChatActivity.startActivity(new Intent(novaAiChatActivity, (Class<?>) NovaAiSettingsActivity.class).putExtra("activation_mode", true).putExtra(Plan.AMP_PLAN_SOURCE, "chat_consent_required"));
            }
        }
        novaAiChatActivity.finish();
    }

    public static View h0(View view) {
        if (view.getTag() instanceof x) {
            return view;
        }
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View viewH0 = h0(viewGroup.getChildAt(i5));
            if (viewH0 != null) {
                return viewH0;
            }
        }
        return null;
    }

    public static String j0(String str, String str2) {
        String strM;
        if (r70.k.U0(str2) || str2.equals("unknown")) {
            str2 = null;
        }
        return (str2 == null || (strM = u4.m(str, "_", str2)) == null) ? str : strM;
    }

    public static String l0(Intent intent) {
        String stringExtra;
        String string = (intent == null || (stringExtra = intent.getStringExtra("com.teslacoilsw.launcher.ai.EXTRA_ENTRY_SOURCE")) == null) ? null : r70.k.u1(stringExtra).toString();
        if (string == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return string.length() > 0 ? string : intent == null ? "unknown" : intent.hasExtra(AiChatActivity.EXTRA_BUBBLE_CONTEXT) ? "insight" : intent.hasExtra(AiChatActivity.EXTRA_QUERY) ? "query" : intent.hasExtra(AiChatActivity.EXTRA_CONVERSATION_ID) ? "conversation" : "unknown";
    }

    public final MapBuilder d0(Map map) {
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("entry_source", this.f45696z);
        mapBuilder.putAll(map);
        return mapBuilder.b();
    }

    public final void e0() {
        AiChatViewV2 aiChatViewV2;
        if (this.f45694x || (aiChatViewV2 = this.f45690t) == null) {
            return;
        }
        this.f45694x = true;
        BubbleContext bubbleContext = (BubbleContext) i.z(getIntent(), AiChatActivity.EXTRA_BUBBLE_CONTEXT, BubbleContext.class);
        if (bubbleContext != null) {
            aiChatViewV2.continueFromBubble(bubbleContext);
            return;
        }
        String stringExtra = getIntent().getStringExtra(AiChatActivity.EXTRA_CONVERSATION_ID);
        if (stringExtra != null) {
            aiChatViewV2.loadConversation(stringExtra);
        }
        String stringExtra2 = getIntent().getStringExtra(AiChatActivity.EXTRA_QUERY);
        if (stringExtra2 != null) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            if (jElapsedRealtime - this.f45695y >= 1000) {
                this.f45695y = jElapsedRealtime;
                aiChatViewV2.sendMessage(stringExtra2);
            } else {
                b bVar = mc0.d.f76206a;
                bVar.r("NOVA_AI");
                bVar.n(c1.o(jElapsedRealtime - this.f45695y, "sendMessage debounced — ", "ms since last send"), new Object[0]);
            }
        }
    }

    public final void f0() {
        AiChatViewV2 aiChatViewV2 = this.f45690t;
        if (aiChatViewV2 == null) {
            return;
        }
        aiChatViewV2.setOnConversationUpdate(new v(this, 1));
        aiChatViewV2.setOnModelDisplayChanged(new z1(this, 23));
        aiChatViewV2.refreshModelDisplay();
        aiChatViewV2.setOnSuggestionClick(new v(this, 2));
        aiChatViewV2.setOnUpgradeRequested(new v(this, 3));
    }

    public final int g0(int i5) {
        return (int) TypedValue.applyDimension(1, i5, getResources().getDisplayMetrics());
    }

    public final void i0(Intent intent) {
        String strL0 = l0(intent);
        this.f45696z = strL0;
        zy.c cVar = zy.c.f98823a;
        Pair pair = new Pair("entry_source", strL0);
        boolean z11 = false;
        Pair pair2 = new Pair("has_query", Boolean.valueOf(intent != null && intent.hasExtra(AiChatActivity.EXTRA_QUERY)));
        Pair pair3 = new Pair("has_bubble_context", Boolean.valueOf(intent != null && intent.hasExtra(AiChatActivity.EXTRA_BUBBLE_CONTEXT)));
        if (intent != null && intent.hasExtra(AiChatActivity.EXTRA_CONVERSATION_ID)) {
            z11 = true;
        }
        zy.c.i("ai_chat_opened", MapsKt.j0(pair, pair2, pair3, new Pair("has_conversation_id", Boolean.valueOf(z11))));
    }

    public final void k0() {
        View view = this.f45692v;
        if (view == null) {
            return;
        }
        ViewParent parent = view.getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(view);
        }
        this.f45692v = null;
    }

    public final void m0() {
        if (this.f45694x) {
            Intent intent = getIntent();
            if (intent.hasExtra(AiChatActivity.EXTRA_QUERY) || intent.hasExtra(AiChatActivity.EXTRA_CONVERSATION_ID) || intent.hasExtra(AiChatActivity.EXTRA_BUBBLE_CONTEXT)) {
                return;
            }
        }
        AiChatViewV2 aiChatViewV2 = this.f45690t;
        if (aiChatViewV2 == null) {
            return;
        }
        List<String> listQ = ul.b.Q(getString(2132018783), getString(2132018784), getString(2132018785));
        ArrayList arrayList = new ArrayList(b70.c.u0(listQ, 10));
        for (String str : listQ) {
            arrayList.add(new Suggestion("prompt", str, null, null, str, null, null, 108, null));
        }
        aiChatViewV2.showInitialSuggestions(arrayList);
    }

    public final void n0() {
        if (this.f45692v != null) {
            return;
        }
        View viewInflate = getLayoutInflater().inflate(2131624283, (ViewGroup) null);
        ((MaterialButton) viewInflate.findViewById(2131428472)).setOnClickListener(new u(this, 0));
        addContentView(viewInflate, new ViewGroup.LayoutParams(-1, -1));
        g gVar = new g(14);
        WeakHashMap weakHashMap = a1.f250a;
        a5.s0.l(viewInflate, gVar);
        q0.c(viewInflate);
        this.f45692v = viewInflate;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) throws Resources.NotFoundException {
        super.onCreate(bundle);
        p.c(this);
        int iOrdinal = p.a().ordinal();
        if (iOrdinal == 0) {
            Toast.makeText(this, 2132018843, 0).show();
            finish();
            return;
        }
        if (iOrdinal == 1) {
            b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.n("Chat opened without session — will show sign-in overlay", new Object[0]);
            Unit unit = Unit.f71706a;
        } else {
            if (iOrdinal == 2) {
                b bVar2 = mc0.d.f76206a;
                bVar2.r("NOVA_AI");
                bVar2.n("Chat opened without Plus subscription — redirecting to paywall", new Object[0]);
                d0 d0Var = d0.f48442a;
                if (zy.c.d("enable_subscription_billing", true)) {
                    String strJ0 = j0("chat_no_sub", l0(getIntent()));
                    Intent intent = new Intent(this, (Class<?>) NovaPaywallActivity.class);
                    intent.addFlags(268435456);
                    intent.putExtra("preselect_tier", "plus");
                    intent.putExtra(Plan.AMP_PLAN_SOURCE, strJ0);
                    intent.putExtra("ai_mode", true);
                    startActivity(intent);
                }
                finish();
                return;
            }
            if (iOrdinal == 3) {
                b bVar3 = mc0.d.f76206a;
                bVar3.r("NOVA_AI");
                bVar3.n("Chat opened with consent unresolved — deferring to resolve step", new Object[0]);
                Unit unit2 = Unit.f71706a;
            } else {
                if (iOrdinal != 4) {
                    throw new NoWhenBranchMatchedException();
                }
                Unit unit3 = Unit.f71706a;
            }
        }
        try {
            d1.f89690a.a(this);
        } catch (Exception e3) {
            b bVar4 = mc0.d.f76206a;
            bVar4.r("NOVA_AI");
            bVar4.f(e3, "ensureInitialized failed in chat onCreate", new Object[0]);
        }
        if (!d.j()) {
            Toast.makeText(this, 2132018843, 0).show();
            finish();
            return;
        }
        i0(getIntent());
        q qVar = new q(this, (Continuation) null, 28);
        this.f45689s = qVar;
        d.f55484x = qVar;
        CoordinatorLayout coordinatorLayout = new CoordinatorLayout(this, null);
        coordinatorLayout.setBackgroundColor(getColor(2131099703));
        setContentView(coordinatorLayout);
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        l4.e eVar = new l4.e(-1, -1);
        ((ViewGroup.MarginLayoutParams) eVar).bottomMargin = g0(72);
        Unit unit4 = Unit.f71706a;
        coordinatorLayout.addView(linearLayout, eVar);
        LinearLayout linearLayout2 = new LinearLayout(this);
        linearLayout2.setOrientation(0);
        linearLayout2.setGravity(16);
        linearLayout2.setPadding(g0(4), 0, g0(16), 0);
        linearLayout2.addView(new View(this), new LinearLayout.LayoutParams(g0(8), g0(40)));
        if (d.c().f55443h) {
            ImageView imageView = new ImageView(this);
            imageView.setImageDrawable(getDrawable(2131231092));
            ImageView.ScaleType scaleType = ImageView.ScaleType.CENTER_INSIDE;
            imageView.setScaleType(scaleType);
            imageView.setColorFilter(getColor(2131099730));
            TextView textView = new TextView(this);
            textView.setTextColor(getColor(2131099730));
            textView.setTextSize(13.0f);
            textView.setMaxLines(1);
            textView.setEllipsize(TextUtils.TruncateAt.END);
            textView.setTypeface(Typeface.DEFAULT_BOLD);
            textView.setText(getString(2132017325));
            ImageView imageView2 = new ImageView(this);
            imageView2.setImageDrawable(getDrawable(2131231062));
            imageView2.setScaleType(scaleType);
            imageView2.setColorFilter(getColor(2131099730));
            imageView2.setAlpha(0.6f);
            LinearLayout linearLayout3 = new LinearLayout(this);
            linearLayout3.setOrientation(0);
            linearLayout3.setGravity(16);
            linearLayout3.setPadding(g0(10), 0, g0(8), 0);
            linearLayout3.setBackground(getDrawable(2131231097));
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(g0(14), g0(14));
            layoutParams.setMarginEnd(g0(5));
            linearLayout3.addView(imageView, layoutParams);
            linearLayout3.addView(textView, new LinearLayout.LayoutParams(-2, -2));
            LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(g0(12), g0(12));
            layoutParams2.setMarginStart(g0(3));
            linearLayout3.addView(imageView2, layoutParams2);
            LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, g0(32));
            layoutParams3.setMarginStart(g0(4));
            layoutParams3.setMarginEnd(g0(10));
            linearLayout2.addView(linearLayout3, layoutParams3);
            linearLayout3.setOnClickListener(null);
            linearLayout2.setTag(new x(textView, imageView, imageView2, linearLayout3));
        }
        linearLayout2.addView(new View(this), new LinearLayout.LayoutParams(0, 0, 1.0f));
        ImageButton imageButton = new ImageButton(this);
        imageButton.setImageDrawable(getDrawable(2131231090));
        imageButton.setScaleType(ImageView.ScaleType.CENTER);
        TypedValue typedValue = new TypedValue();
        getTheme().resolveAttribute(16843868, typedValue, true);
        imageButton.setBackgroundResource(typedValue.resourceId);
        imageButton.setContentDescription(getString(2132017295));
        imageButton.setVisibility(8);
        this.f45691u = imageButton;
        linearLayout2.addView(imageButton, new LinearLayout.LayoutParams(g0(40), g0(40)));
        imageButton.setOnClickListener(new u(this, 2));
        linearLayout.addView(linearLayout2, new LinearLayout.LayoutParams(-1, g0(48)));
        FrameLayout frameLayout = new FrameLayout(this);
        linearLayout.addView(frameLayout, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        LinearLayout linearLayout4 = new LinearLayout(this);
        linearLayout4.setOrientation(1);
        linearLayout4.setPadding(g0(20), g0(10), g0(20), g0(14));
        linearLayout4.setClickable(true);
        linearLayout4.setFocusable(true);
        View view = new View(this);
        view.setBackground(getDrawable(2131232038));
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(g0(36), g0(4));
        layoutParams4.gravity = 1;
        layoutParams4.bottomMargin = g0(12);
        linearLayout4.addView(view, layoutParams4);
        LinearLayout linearLayout5 = new LinearLayout(this);
        linearLayout5.setOrientation(0);
        linearLayout5.setGravity(16);
        TextView textView2 = new TextView(this);
        textView2.setText("Recent chats");
        textView2.setTextSize(16.0f);
        textView2.setTextColor(getColor(2131099741));
        textView2.setTypeface(null, 1);
        textView2.setLetterSpacing(-0.02f);
        textView2.setMaxLines(1);
        textView2.setEllipsize(TextUtils.TruncateAt.END);
        textView2.setIncludeFontPadding(false);
        linearLayout5.addView(textView2, new LinearLayout.LayoutParams(0, -2, 1.0f));
        LinearLayout linearLayout6 = new LinearLayout(this);
        linearLayout6.setOrientation(0);
        linearLayout6.setGravity(16);
        linearLayout6.setPadding(g0(12), g0(8), g0(12), g0(8));
        linearLayout6.setBackground(getDrawable(2131232036));
        linearLayout6.setClickable(true);
        linearLayout6.setFocusable(true);
        ImageView imageView3 = new ImageView(this);
        imageView3.setImageResource(2131232041);
        int color = getColor(2131099741);
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        imageView3.setColorFilter(color, mode);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(g0(12), g0(12));
        layoutParams5.setMarginEnd(g0(6));
        linearLayout6.addView(imageView3, layoutParams5);
        TextView textView3 = new TextView(this);
        textView3.setText(getString(2132017293));
        textView3.setTextColor(getColor(2131099741));
        textView3.setTextSize(12.0f);
        textView3.setTypeface(null, 1);
        textView3.setLetterSpacing(-0.01f);
        textView3.setIncludeFontPadding(false);
        linearLayout6.addView(textView3);
        linearLayout6.setOnClickListener(new u(this, 3));
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams6.setMarginStart(g0(12));
        linearLayout5.addView(linearLayout6, layoutParams6);
        linearLayout4.addView(linearLayout5, new LinearLayout.LayoutParams(-1, -2));
        linearLayout4.setOnClickListener(new u(this, 4));
        LinearLayout linearLayout7 = new LinearLayout(this);
        linearLayout7.setOrientation(1);
        linearLayout7.setBackground(getDrawable(2131232037));
        BottomSheetBehavior bottomSheetBehavior = new BottomSheetBehavior();
        bottomSheetBehavior.G(true);
        bottomSheetBehavior.I(g0(72));
        bottomSheetBehavior.H(false);
        bottomSheetBehavior.J = false;
        l4.e eVar2 = new l4.e(-1, (int) (getResources().getDisplayMetrics().heightPixels * 0.68f));
        eVar2.b(bottomSheetBehavior);
        linearLayout7.setLayoutParams(eVar2);
        this.A = bottomSheetBehavior;
        linearLayout7.addView(linearLayout4, new LinearLayout.LayoutParams(-1, g0(72)));
        LinearLayout linearLayout8 = new LinearLayout(this);
        linearLayout8.setOrientation(1);
        LinearLayout linearLayout9 = new LinearLayout(this);
        linearLayout9.setOrientation(0);
        linearLayout9.setGravity(16);
        linearLayout9.setPadding(g0(20), 0, g0(20), 0);
        linearLayout9.setClickable(true);
        linearLayout9.setFocusable(true);
        TypedValue typedValue2 = new TypedValue();
        getTheme().resolveAttribute(16843534, typedValue2, true);
        linearLayout9.setBackgroundResource(typedValue2.resourceId);
        LinearLayout linearLayout10 = new LinearLayout(this);
        linearLayout10.setOrientation(1);
        TextView textView4 = new TextView(this);
        textView4.setText("Settings");
        textView4.setTextColor(getColor(2131099741));
        textView4.setTextSize(15.0f);
        textView4.setIncludeFontPadding(false);
        TextView textView5 = new TextView(this);
        textView5.setText("Permissions, account, data sharing");
        textView5.setTextColor(Color.parseColor("#73FAFAFA"));
        textView5.setTextSize(12.0f);
        textView5.setIncludeFontPadding(false);
        linearLayout10.addView(textView4, new LinearLayout.LayoutParams(-2, -2));
        LinearLayout.LayoutParams layoutParams7 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams7.topMargin = g0(2);
        linearLayout10.addView(textView5, layoutParams7);
        linearLayout9.addView(linearLayout10, new LinearLayout.LayoutParams(0, -2, 1.0f));
        ImageView imageView4 = new ImageView(this);
        imageView4.setImageResource(2131232040);
        imageView4.setColorFilter(Color.parseColor("#73FAFAFA"), mode);
        linearLayout9.addView(imageView4, new LinearLayout.LayoutParams(g0(16), g0(16)));
        linearLayout9.setOnClickListener(new u(this, 1));
        linearLayout8.addView(linearLayout9, new LinearLayout.LayoutParams(-1, g0(64)));
        TextView textView6 = new TextView(this);
        textView6.setText("RECENTS");
        textView6.setTextColor(Color.parseColor("#73FAFAFA"));
        textView6.setTextSize(11.0f);
        textView6.setTypeface(null, 1);
        textView6.setLetterSpacing(0.06f);
        textView6.setAllCaps(true);
        textView6.setPadding(g0(20), g0(18), g0(20), g0(8));
        textView6.setIncludeFontPadding(false);
        linearLayout8.addView(textView6, new LinearLayout.LayoutParams(-1, -2));
        ConversationListView conversationListView = new ConversationListView(this, null, 0, 6, null);
        conversationListView.setOnConversationClick(new v(this, 0));
        conversationListView.setOnNewChatClick(new w(this, 21));
        this.B = conversationListView;
        linearLayout8.addView(conversationListView, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        linearLayout7.addView(linearLayout8, new LinearLayout.LayoutParams(-1, -1));
        coordinatorLayout.addView(linearLayout7);
        bottomSheetBehavior.J(4);
        d00.c cVar = new d00.c(this, 0 == true ? 1 : 0, 4);
        getOnBackPressedDispatcher().a(this, cVar);
        BottomSheetBehavior bottomSheetBehavior2 = this.A;
        if (bottomSheetBehavior2 != null) {
            a0 a0Var = new a0(cVar, this);
            ArrayList arrayList = bottomSheetBehavior2.W;
            if (!arrayList.contains(a0Var)) {
                arrayList.add(a0Var);
            }
        }
        f fVar = new f(11, linearLayout, this, linearLayout4);
        WeakHashMap weakHashMap = a1.f250a;
        a5.s0.l(coordinatorLayout, fVar);
        q0.c(coordinatorLayout);
        AiChatViewV2 aiChatViewV2 = new AiChatViewV2(this, null, 0, 6, null);
        this.f45690t = aiChatViewV2;
        frameLayout.addView(aiChatViewV2, new FrameLayout.LayoutParams(-1, -1));
        m0.t(g1.e(this), null, null, new b0(this, null, 0), 3);
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        if (d.f55484x == this.f45689s) {
            d.f55484x = null;
        }
        this.f45689s = null;
        this.f45687q = null;
        AiChatViewV2 aiChatViewV2 = this.f45690t;
        if (aiChatViewV2 != null) {
            aiChatViewV2.setOnConversationUpdate(null);
        }
        AiChatViewV2 aiChatViewV22 = this.f45690t;
        if (aiChatViewV22 != null) {
            aiChatViewV22.setOnModelDisplayChanged(null);
        }
        AiChatViewV2 aiChatViewV23 = this.f45690t;
        if (aiChatViewV23 != null) {
            aiChatViewV23.setOnUpgradeRequested(null);
        }
        AiChatViewV2 aiChatViewV24 = this.f45690t;
        if (aiChatViewV24 != null) {
            aiChatViewV24.setOnSuggestionClick(null);
        }
        k0();
        this.f45690t = null;
        this.f45691u = null;
    }

    @Override // g.o, android.app.Activity
    public final void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        boolean z11 = intent.hasExtra(AiChatActivity.EXTRA_QUERY) || intent.hasExtra(AiChatActivity.EXTRA_CONVERSATION_ID) || intent.hasExtra(AiChatActivity.EXTRA_BUBBLE_CONTEXT);
        if (z11 || intent.hasExtra("com.teslacoilsw.launcher.ai.EXTRA_ENTRY_SOURCE")) {
            i0(intent);
        }
        if (z11) {
            this.f45694x = false;
            AiChatViewV2 aiChatViewV2 = this.f45690t;
            if (aiChatViewV2 != null) {
                aiChatViewV2.newConversation();
            }
            ImageButton imageButton = this.f45691u;
            if (imageButton != null) {
                imageButton.setVisibility(8);
            }
            e0();
        }
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onPause() {
        super.onPause();
        t tVar = t.f93370a;
        t.f93385r = false;
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onResume() {
        super.onResume();
        p6.f.M(this, "chat");
        boolean z11 = ((cy.d) d0.f48451j.getValue()).f48441b;
        if ((p6.f.Q() ? p6.f.z() : p6.f.y()) != null && z11) {
            yx.b.f97678a.e("nova_ai_session_replay_sample_rate", 0.0d);
        }
        t tVar = t.f93370a;
        t.f93385r = true;
        m0.t(g1.e(this), null, null, new b0(this, null, 1), 3);
    }
}
