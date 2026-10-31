package vj;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.view.View;
import android.view.animation.PathInterpolator;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import ps.l;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final TimeInterpolator f92786a;

    /* renamed from: b, reason: collision with root package name */
    public final View f92787b;

    /* renamed from: c, reason: collision with root package name */
    public final int f92788c;

    /* renamed from: d, reason: collision with root package name */
    public final int f92789d;

    /* renamed from: e, reason: collision with root package name */
    public final int f92790e;

    /* renamed from: f, reason: collision with root package name */
    public g.b f92791f;

    public a(View view) {
        this.f92787b = view;
        Context context = view.getContext();
        this.f92786a = l.r(context, 2130969718, new PathInterpolator(0.0f, 0.0f, 0.0f, 1.0f));
        this.f92788c = l.q(context, 2130969701, 300);
        this.f92789d = l.q(context, 2130969706, PerAppFeatureCatalog.MAX_TOOLS);
        this.f92790e = l.q(context, 2130969705, 100);
    }
}
