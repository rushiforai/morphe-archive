package r10;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.NovaLauncher;

/* loaded from: classes.dex */
public class x1 extends o1 {

    /* renamed from: d, reason: collision with root package name */
    public final Intent f85311d;

    /* renamed from: e, reason: collision with root package name */
    public final ComponentKey f85312e;

    public /* synthetic */ x1(String str, Uri uri, pp.b0 b0Var, Intent intent) {
        this(str, uri, b0Var, intent, null);
    }

    @Override // r10.o1
    public final void a(NovaLauncher novaLauncher, View view) {
        Intent intent = this.f85311d;
        if (intent == null) {
            return;
        }
        try {
            novaLauncher.q0(view, intent, null);
        } catch (ActivityNotFoundException unused) {
            com.google.android.gms.internal.consent_sdk.k0.w(novaLauncher, 2132017222, 0).show();
        }
    }

    public x1(String str, Uri uri, pp.b0 b0Var, Intent intent, ComponentKey componentKey) {
        super(str, uri, b0Var);
        this.f85311d = intent;
        this.f85312e = componentKey;
    }
}
