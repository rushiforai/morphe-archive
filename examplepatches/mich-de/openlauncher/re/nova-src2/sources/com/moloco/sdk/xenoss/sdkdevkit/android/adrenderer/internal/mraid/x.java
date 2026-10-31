package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.StaticAdActivity;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.m;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.o;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.B;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.y;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.o;
import com.stripe.android.ui.core.elements.EmptyFormSpec;
import com.stripe.android.ui.core.elements.OTPSpec;
import cw.a3;
import cw.d2;
import cw.i0;
import java.lang.annotation.Annotation;
import java.util.LinkedHashMap;
import java.util.Set;
import kotlin.jvm.functions.Function0;
import kotlin.text.Regex;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.ObjectSerializer;
import ninja.sesame.lib.bridge.v1.ActionCategory;

/* loaded from: classes4.dex */
public final /* synthetic */ class x implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39251a;

    public /* synthetic */ x(int i5) {
        this.f39251a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f39251a) {
            case 0:
                return k.q();
            case 1:
                return StaticAdActivity.b.a();
            case 2:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.errors.g.b();
            case 3:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.e.a();
            case 4:
                return m.a.a();
            case 5:
                return n.a.a();
            case 6:
                return o.a.a();
            case 7:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.a();
            case 8:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.n.a();
            case 9:
                return B.b();
            case 10:
                return B.c();
            case 11:
                return e.a.a();
            case 12:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.g.a();
            case 13:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.l.a();
            case 14:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.v.a();
            case 15:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.x.a();
            case 16:
                return y.a();
            case 17:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.l.a();
            case 18:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.l.b();
            case 19:
                return o.a.a();
            case 20:
                return com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.a();
            case 21:
                Set set = ct.n.f47863a;
                int iD0 = b70.k.d0(b70.c.u0(set, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                for (Object obj : set) {
                    linkedHashMap.put(((ct.j) obj).getType().f43655a, obj);
                }
                return linkedHashMap;
            case 22:
                return new Regex("^[0-9]{6}$");
            case 23:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.ui.core.elements.Capitalization", i0.values(), new String[]{"none", "characters", "words", "sentences"}, new Annotation[][]{null, null, null, null}, null);
            case 24:
                return androidx.compose.runtime.d.k(null);
            case 25:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 26:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.ui.core.elements.DisplayField", d2.values(), new String[]{"country"}, new Annotation[][]{null}, null);
            case 27:
                return new ObjectSerializer("com.stripe.android.ui.core.elements.EmptyFormSpec", EmptyFormSpec.INSTANCE, new Annotation[0]);
            case 28:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.ui.core.elements.KeyboardType", a3.values(), new String[]{"text", "ascii", "number", "phone", "uri", ActionCategory.EMAIL, "password", "number_password"}, new Annotation[][]{null, null, null, null, null, null, null, null}, null);
            default:
                return new ObjectSerializer("com.stripe.android.ui.core.elements.OTPSpec", OTPSpec.INSTANCE, new Annotation[0]);
        }
    }
}
