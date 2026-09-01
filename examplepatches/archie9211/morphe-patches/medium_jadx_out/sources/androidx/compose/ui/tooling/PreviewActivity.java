package androidx.compose.ui.tooling;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import defpackage.in6;
import defpackage.muc;
import defpackage.mz1;
import defpackage.q60;
import defpackage.se9;
import defpackage.xy1;
import defpackage.ygf;
import defpackage.yy1;
import java.lang.reflect.Constructor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class PreviewActivity extends xy1 {
    public static final /* synthetic */ int b = 0;
    public final String a = "PreviewActivity";

    @Override // defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        String stringExtra;
        Class<?> cls;
        super.onCreate(bundle);
        int i = getApplicationInfo().flags & 2;
        String str = this.a;
        if (i == 0) {
            Log.d(str, "Application is not debuggable. Compose Preview not allowed.");
            finish();
            return;
        }
        Intent intent = getIntent();
        if (intent == null || (stringExtra = intent.getStringExtra("composable")) == null) {
            return;
        }
        Log.d(str, "PreviewActivity has composable ".concat(stringExtra));
        String strW0 = muc.w0(stringExtra, '.');
        String strT0 = muc.t0('.', stringExtra, stringExtra);
        String stringExtra2 = getIntent().getStringExtra("parameterProviderClassName");
        if (stringExtra2 == null) {
            Log.d(str, "Previewing '" + strT0 + "' without a parameter provider.");
            yy1.a(this, new mz1(new q60(strW0, strT0, 2), true, -840626948));
            return;
        }
        Log.d(str, "Previewing '" + strT0 + "' with parameter provider: '" + stringExtra2 + '\'');
        try {
            cls = Class.forName(stringExtra2);
        } catch (ClassNotFoundException e) {
            Log.e("PreviewLogger", "Unable to find PreviewProvider '" + stringExtra2 + '\'', e);
            cls = null;
        }
        getIntent().getIntExtra("parameterProviderIndex", -1);
        int i2 = 0;
        if (cls == null) {
            yy1.a(this, new mz1(new se9(strW0, strT0, new Object[0], 6), true, -1901447514));
            return;
        }
        try {
            Constructor<?>[] constructors = cls.getConstructors();
            int length = constructors.length;
            Constructor<?> constructor = null;
            boolean z = false;
            while (true) {
                if (i2 < length) {
                    Constructor<?> constructor2 = constructors[i2];
                    if (constructor2.getParameterTypes().length == 0) {
                        if (z) {
                            break;
                        }
                        constructor = constructor2;
                        z = true;
                    }
                    i2++;
                } else if (!z) {
                }
            }
            constructor = null;
            if (constructor == null) {
                throw new IllegalArgumentException("PreviewParameterProvider constructor can not have parameters");
            }
            constructor.setAccessible(true);
            constructor.newInstance(null).getClass();
            throw new ClassCastException();
        } catch (in6 unused) {
            ygf.f("Deploying Compose Previews with PreviewParameterProvider arguments requires adding a dependency to the kotlin-reflect library.\nConsider adding 'debugImplementation \"org.jetbrains.kotlin:kotlin-reflect:$kotlin_version\"' to the module's build.gradle.");
        }
    }
}
