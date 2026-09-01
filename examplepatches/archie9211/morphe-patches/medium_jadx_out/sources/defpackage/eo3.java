package defpackage;

import android.content.Context;
import android.content.res.Configuration;
import android.view.View;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eo3 extends View {
    public final /* synthetic */ ep0 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public eo3(ep0 ep0Var, Context context) {
        super(context);
        this.a = ep0Var;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) throws IOException {
        configuration.getClass();
        this.a.run();
    }
}
