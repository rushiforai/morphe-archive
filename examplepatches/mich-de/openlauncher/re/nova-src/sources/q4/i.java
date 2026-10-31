package q4;

import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final ColorStateList f83633a;

    /* renamed from: b, reason: collision with root package name */
    public final Configuration f83634b;

    /* renamed from: c, reason: collision with root package name */
    public final int f83635c;

    public i(ColorStateList colorStateList, Configuration configuration, Resources.Theme theme) {
        this.f83633a = colorStateList;
        this.f83634b = configuration;
        this.f83635c = theme == null ? 0 : theme.hashCode();
    }
}
