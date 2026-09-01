package defpackage;

import android.app.PendingIntent;
import android.net.Uri;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import com.medium.android.core.navigation.s;
import com.medium.android.donkey.main.MainActivity;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class we7 extends ClickableSpan {
    public final /* synthetic */ MainActivity a;
    public final /* synthetic */ SourceParameter b;

    public we7(MainActivity mainActivity, SourceParameter sourceParameter) {
        this.a = mainActivity;
        this.b = sourceParameter;
    }

    @Override // android.text.style.ClickableSpan
    public final void onClick(View view) throws PendingIntent.CanceledException {
        view.getClass();
        MainActivity mainActivity = this.a;
        s sVarT = mainActivity.t();
        if (mainActivity.j == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarT).g(mainActivity, Uri.parse(i03.y), gp7.u(this.b));
    }

    @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        textPaint.getClass();
        super.updateDrawState(textPaint);
        textPaint.setColor(-1);
        textPaint.setUnderlineText(true);
    }
}
