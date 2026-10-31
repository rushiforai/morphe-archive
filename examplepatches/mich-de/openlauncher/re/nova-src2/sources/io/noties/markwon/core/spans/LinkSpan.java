package io.noties.markwon.core.spans;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.URLSpan;
import android.util.Log;
import android.view.View;
import br.c;
import i60.f;

/* loaded from: classes4.dex */
public class LinkSpan extends URLSpan {

    /* renamed from: a, reason: collision with root package name */
    public final f f66701a;

    /* renamed from: b, reason: collision with root package name */
    public final String f66702b;

    /* renamed from: c, reason: collision with root package name */
    public final c f66703c;

    public LinkSpan(f fVar, String str, c cVar) {
        super(str);
        this.f66701a = fVar;
        this.f66702b = str;
        this.f66703c = cVar;
    }

    @Override // android.text.style.URLSpan, android.text.style.ClickableSpan
    public final void onClick(View view) {
        this.f66703c.getClass();
        String str = this.f66702b;
        Uri uriBuild = Uri.parse(str);
        if (TextUtils.isEmpty(uriBuild.getScheme())) {
            uriBuild = uriBuild.buildUpon().scheme("https").build();
        }
        Context context = view.getContext();
        Intent intent = new Intent("android.intent.action.VIEW", uriBuild);
        intent.putExtra("com.android.browser.application_id", context.getPackageName());
        try {
            context.startActivity(intent);
        } catch (ActivityNotFoundException unused) {
            Log.w("LinkResolverDef", "Actvity was not found for the link: '" + str + "'");
        }
    }

    @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        this.f66701a.getClass();
        textPaint.setUnderlineText(true);
        textPaint.setColor(textPaint.linkColor);
    }
}
