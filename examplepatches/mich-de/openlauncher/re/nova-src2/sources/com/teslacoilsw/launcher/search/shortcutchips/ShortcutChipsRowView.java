package com.teslacoilsw.launcher.search.shortcutchips;

import android.annotation.TargetApi;
import android.content.Context;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import androidx.compose.runtime.d;
import androidx.compose.ui.platform.ComposeView;
import androidx.room.c;
import b.q3;
import b20.b0;
import bh.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.NovaLauncher;
import d20.f;
import e10.h4;
import e10.y2;
import e10.z2;
import ey.t;
import ey.u;
import f20.n;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import o9.j0;
import o9.k;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import p1.e1;
import r10.n0;
import r10.o0;
import t70.m0;
import t70.y0;
import uy.d0;
import uy.s;
import w70.i2;
import w70.u1;
import x1.e;
import y70.o;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u001d\b\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\u000e²\u0006\u0012\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\n0\t8\nX\u008a\u0084\u0002²\u0006\u0012\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\t8\nX\u008a\u0084\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/search/shortcutchips/ShortcutChipsRowView;", "Ld20/f;", "Lo9/j0;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", b.f42142b, "Lcom/teslacoilsw/launcher/search/hero/c;", "shortcuts", "Ley/u;", "contextualSuggestions", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@TargetApi(28)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ShortcutChipsRowView extends f implements j0 {

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ int f46266l = 0;

    /* renamed from: f, reason: collision with root package name */
    public final NovaLauncher f46267f;

    /* renamed from: g, reason: collision with root package name */
    public final i2 f46268g;

    /* renamed from: h, reason: collision with root package name */
    public final i2 f46269h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f46270i;

    /* renamed from: j, reason: collision with root package name */
    public final b0 f46271j;

    /* renamed from: k, reason: collision with root package name */
    public final e1 f46272k;

    @JvmOverloads
    public ShortcutChipsRowView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        EmptyList emptyList = EmptyList.f71733a;
        this.f46268g = u1.c(emptyList);
        this.f46269h = u1.c(emptyList);
        y2.f51877a.getClass();
        this.f46270i = ((Boolean) y2.P().l()).booleanValue();
        this.f46272k = d.k(null);
        NovaLauncher novaLauncher = (NovaLauncher) k.Y(context);
        this.f46267f = novaLauncher;
        this.f46271j = new b0(novaLauncher);
        setVisibility(this.f46270i ? 0 : 8);
        ComposeView composeView = new ComposeView(context, null, 0, 6, null);
        addView(composeView, new FrameLayout.LayoutParams(-1, -1));
        composeView.setContent(new e(new h4(1, this, context), true, 1220897024));
    }

    @Override // q9.v
    /* renamed from: a, reason: from getter */
    public final boolean getF46270i() {
        return this.f46270i;
    }

    @Override // d20.f, q9.v
    public final void g(mx.j0 j0Var) {
    }

    @Override // q9.v
    public final int getExpectedHeight() {
        if (getVisibility() == 8) {
            return 0;
        }
        return g.M(this.f46267f, 40);
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0062, code lost:
    
        if (t70.m0.y(r14, r3, r0) == r1) goto L25;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v11, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v7, types: [kotlin.collections.EmptyList] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(ContinuationImpl continuationImpl) throws Throwable {
        n nVar;
        ShortcutChipsRowView shortcutChipsRowView;
        Object arrayList;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f54292w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f54292w = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object objY = nVar.f54290u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f54292w;
        int i12 = 2;
        if (i11 == 0) {
            ResultKt.b(objY);
            y2.f51877a.getClass();
            Continuation continuation = null;
            if (((Boolean) y2.P().l()).booleanValue()) {
                a80.e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                q3 q3Var = new q3(i12, continuation, i12);
                nVar.f54289t = this;
                nVar.f54292w = 2;
                objY = m0.y(dVar, q3Var, nVar);
                if (objY != coroutineSingletons) {
                    shortcutChipsRowView = this;
                    List list = (List) objY;
                    i2 i2Var = shortcutChipsRowView.f46269h;
                    y2.f51877a.getClass();
                    if (!((Boolean) y2.V().l()).booleanValue()) {
                    }
                    i2Var.j(arrayList);
                    shortcutChipsRowView.f46268g.j(list);
                    if (!shortcutChipsRowView.f46270i) {
                    }
                    return Unit.f71706a;
                }
            } else {
                a80.e eVar2 = y0.f88884a;
                u70.d dVar2 = o.f96819a;
                c cVar = new c(this, continuation, 26);
                nVar.f54292w = 1;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objY);
            return Unit.f71706a;
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        shortcutChipsRowView = nVar.f54289t;
        ResultKt.b(objY);
        List list2 = (List) objY;
        i2 i2Var2 = shortcutChipsRowView.f46269h;
        y2.f51877a.getClass();
        if (!((Boolean) y2.V().l()).booleanValue()) {
            d0 d0Var = d0.f91699e;
            if (d0Var.f91704d) {
                x7.e eVarN = d0Var.n();
                ArrayList arrayList2 = new ArrayList();
                for (y30.b bVar : y30.b.values()) {
                    s sVar = (s) ((EnumMap) eVarN.f95130a).get(bVar);
                    if (sVar != null) {
                        int i13 = sVar.f91757i.f91684b.f97766c;
                        if (!sVar.d() && !x7.f.I(sVar.f91756h.f68417a, 256) && i13 >= 3) {
                            arrayList2.add(sVar);
                        }
                    }
                }
                arrayList = new ArrayList(b70.c.u0(arrayList2, 10));
                Iterator it = arrayList2.iterator();
                while (it.hasNext()) {
                    s sVar2 = (s) it.next();
                    t tVar = u.f53184a;
                    String string = shortcutChipsRowView.getContext().getString(2132017241, sVar2.f91749a);
                    Uri uriD = o0.d(z2.v(2131231710, "com.teslacoilsw.launcher"), n0.f85193c);
                    f20.k kVar = new f20.k(shortcutChipsRowView, sVar2);
                    tVar.getClass();
                    arrayList.add(t.a(string, uriD, kVar));
                }
            } else {
                arrayList = EmptyList.f71733a;
            }
        }
        i2Var2.j(arrayList);
        shortcutChipsRowView.f46268g.j(list2);
        if (!shortcutChipsRowView.f46270i) {
            shortcutChipsRowView.f46270i = true;
            shortcutChipsRowView.setVisibility(0);
        }
        return Unit.f71706a;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, View.MeasureSpec.makeMeasureSpec(getExpectedHeight(), 1073741824));
    }
}
