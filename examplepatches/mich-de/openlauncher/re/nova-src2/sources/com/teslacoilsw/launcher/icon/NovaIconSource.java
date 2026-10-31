package com.teslacoilsw.launcher.icon;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import b.c0;
import e00.o3;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0001\u0002\u0082\u0001\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/launcher/icon/NovaIconSource;", "Landroid/os/Parcelable;", "cl/l0", "Lcom/teslacoilsw/launcher/icon/ColorIconSource;", "Lcom/teslacoilsw/launcher/icon/UriIconSource;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class NovaIconSource implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public static final o3 f45770a = new o3(18, (byte) 0);

    public final String b() {
        if (this instanceof ColorIconSource) {
            return c0.k("#", Integer.toHexString(((ColorIconSource) this).getF45764b()));
        }
        if (this instanceof UriIconSource) {
            return ((UriIconSource) this).f45774b.toString();
        }
        throw new NoWhenBranchMatchedException();
    }

    public abstract Drawable d(Context context);
}
