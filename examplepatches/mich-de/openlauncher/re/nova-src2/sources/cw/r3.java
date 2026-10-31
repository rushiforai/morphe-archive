package cw;

import android.content.ComponentName;
import android.content.Context;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.payments.StripeBrowserLauncherActivity;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.util.HashMap;
import kotlin.NotImplementedError;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.Regex;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.json.Json;
import ninja.sesame.lib.bridge.v1.ActionCategory;

/* loaded from: classes4.dex */
public final /* synthetic */ class r3 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48289a;

    public /* synthetic */ r3(int i5) {
        this.f48289a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = 0;
        switch (this.f48289a) {
            case 0:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.ui.core.elements.PlaceholderSpec.PlaceholderField", t3.values(), new String[]{PendingUpgradeStore.KEY_NAME, ActionCategory.EMAIL, "phone", "billing_address", "billing_address_without_country", "sepa_mandate", "unknown"}, new Annotation[][]{null, null, null, null, null, null, null}, null);
            case 1:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.ui.core.elements.TranslationId", s4.values(), new String[]{"upe.labels.ideal.bank", "upe.labels.p24.bank", "upe.labels.eps.bank", "upe.labels.fpx.bank", "address.label.name", "upe.labels.name.onAccount"}, new Annotation[][]{null, null, null, null, null, null}, null);
            case 2:
                return new Regex("[a-zA-Z0-9.\\-_]{2,256}@[a-zA-Z]{2,64}");
            case 3:
                try {
                    StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
                    KSerializer serializer = BuiltinSerializersKt.MapSerializer(BuiltinSerializersKt.serializer(stringCompanionObject), BuiltinSerializersKt.serializer(stringCompanionObject));
                    HashMap mapB = cx.a.b();
                    Json json = ax.b.f15734a;
                    Intrinsics.g(serializer, "serializer");
                    return ax.b.f15734a.encodeToString(serializer, mapB);
                } catch (IOException unused) {
                    return "{}";
                }
            case 4:
                d00.y yVar = d00.y.f48721a;
                ((p1.s2) d00.y.f48726f).setValue(d00.q.f48707a);
                return Unit.f71706a;
            case 5:
                throw new NotImplementedError(0);
            case 6:
                int i11 = d20.z.f48941a;
                return Boolean.FALSE;
            case 7:
                return Unit.f71706a;
            case 8:
                return EnumsKt.createSimpleEnumSerializer("rdl.PackageEventType", db0.j0.values());
            case 9:
                int i12 = StripeBrowserLauncherActivity.f44244p;
                return new du.t(i5);
            case 10:
                return Unit.f71706a;
            case 11:
                return Unit.f71706a;
            case 12:
                return Unit.f71706a;
            case 13:
                return new e0.a2(0);
            case 14:
                return Unit.f71706a;
            case 15:
                return androidx.compose.runtime.d.k(null);
            case 16:
                return Unit.f71706a;
            case 17:
                Context context = mx.g0.f77088a;
                mx.g0.b();
                return Unit.f71706a;
            case 18:
                throw new RuntimeException("fail");
            case 19:
                throw new IllegalStateException("Intentional Crash");
            case 20:
                System.exit(0);
                throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
            case 21:
                a80.e eVar = t70.y0.f88884a;
                return a80.d.f488c;
            case 22:
                p1.m0 m0Var = e10.d1.f51464a;
                return null;
            case 23:
                ComponentName componentName = SettingsActivity.f45966y;
                mc0.d.f76206a.m("TOOD requireRestart ondemand", new Object[0]);
                return Unit.f71706a;
            case 24:
                return Unit.f71706a;
            case 25:
                return Integer.valueOf(w20.e.k(128));
            case 26:
                return Long.valueOf(System.currentTimeMillis());
            case 27:
                return f1.u0.d(0L, 0L, 0L, 0L, 0L, 0L, 4095);
            case 28:
                p1.m0 m0Var2 = f1.a1.f53382a;
                return Float.valueOf(1.0f);
            default:
                p1.z2 z2Var = f1.a2.f53383a;
                return f1.j1.f53679a;
        }
    }
}
