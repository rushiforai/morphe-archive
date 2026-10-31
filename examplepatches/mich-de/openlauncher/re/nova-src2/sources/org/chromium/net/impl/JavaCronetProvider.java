package org.chromium.net.impl;

import android.content.Context;
import java.util.Arrays;
import java.util.Collections;
import org.chromium.net.CronetEngine;
import org.chromium.net.CronetProvider;
import org.chromium.net.ExperimentalCronetEngine;
import r90.f;
import r90.g;
import s90.e0;
import s90.j0;

/* loaded from: classes5.dex */
public class JavaCronetProvider extends CronetProvider {
    public JavaCronetProvider(Context context) {
        super(context);
    }

    @Override // org.chromium.net.CronetProvider
    public final CronetEngine.Builder createBuilder() {
        if (HttpEngineNativeProvider.a()) {
            Context context = this.mContext;
            g gVar = (g) Collections.unmodifiableMap(f.a(context, ImplVersion.getCronetVersion(), false, e0.c(context).getBoolean("android.net.http.EnableTelemetry", false)).f59486a).get("Cronet_ForceHttpEngineInFallback");
            if (gVar != null) {
                gVar.b(1);
                if (((Boolean) gVar.f85751a).booleanValue()) {
                    return new HttpEngineNativeProvider(this.mContext).createBuilder();
                }
            }
        }
        return new ExperimentalCronetEngine.Builder(new j0(this.mContext));
    }

    public final boolean equals(Object obj) {
        if (obj != this) {
            return (obj instanceof JavaCronetProvider) && this.mContext.equals(((JavaCronetProvider) obj).mContext);
        }
        return true;
    }

    @Override // org.chromium.net.CronetProvider
    public final String getName() {
        return CronetProvider.PROVIDER_NAME_FALLBACK;
    }

    @Override // org.chromium.net.CronetProvider
    public final String getVersion() {
        return ImplVersion.getCronetVersion();
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{JavaCronetProvider.class, this.mContext});
    }

    @Override // org.chromium.net.CronetProvider
    public final boolean isEnabled() {
        return true;
    }
}
