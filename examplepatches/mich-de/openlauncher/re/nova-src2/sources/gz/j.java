package gz;

import android.content.Context;
import android.graphics.drawable.Drawable;
import b.c0;
import b.c9;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class j {

    @NotNull
    public static final i Companion = new i();

    /* renamed from: f, reason: collision with root package name */
    public static final KSerializer[] f58650f = {null, EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.icontheme.IconPackType", e.values()), null, null, null};

    /* renamed from: g, reason: collision with root package name */
    public static final j f58651g = new j(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, e.f58645c, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false, null);

    /* renamed from: a, reason: collision with root package name */
    public final String f58652a;

    /* renamed from: b, reason: collision with root package name */
    public final e f58653b;

    /* renamed from: c, reason: collision with root package name */
    public final String f58654c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f58655d;

    /* renamed from: e, reason: collision with root package name */
    public final String f58656e;

    public /* synthetic */ j(int i5, String str, e eVar, String str2, boolean z11, String str3) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, h.f58649a.getDescriptor());
        }
        this.f58652a = str;
        this.f58653b = eVar;
        this.f58654c = str2;
        if ((i5 & 8) == 0) {
            this.f58655d = false;
        } else {
            this.f58655d = z11;
        }
        if ((i5 & 16) == 0) {
            this.f58656e = null;
        } else {
            this.f58656e = str3;
        }
    }

    public final Drawable a(Context context) {
        if (this.f58653b != e.f58645c) {
            try {
                return context.getApplicationContext().getPackageManager().getApplicationIcon(this.f58654c);
            } catch (Exception unused) {
                return null;
            }
        }
        if (Intrinsics.b(this.f58656e, "LOLLIPOP")) {
            return context.getDrawable(2131231607);
        }
        return null;
    }

    public final f b(Context context, int i5) {
        e eVar = e.f58645c;
        e eVar2 = this.f58653b;
        if (eVar2 == eVar && this.f58656e == null) {
            return c.f58642a;
        }
        int iOrdinal = eVar2.ordinal();
        if (iOrdinal == 0 || iOrdinal == 1 || iOrdinal == 2) {
            o oVar = new o(context, this.f58654c, i5, ((g30.b) g30.b.f57016l.h(context)).f57025i, this.f58655d);
            oVar.p();
            return oVar;
        }
        if (iOrdinal == 3) {
            return new a(context, this.f58654c);
        }
        if (iOrdinal == 4) {
            return r70.k.U0(this.f58652a) ? c.f58642a : k.f58657b;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f58652a, jVar.f58652a) && this.f58653b == jVar.f58653b && Intrinsics.b(this.f58654c, jVar.f58654c) && this.f58655d == jVar.f58655d && Intrinsics.b(this.f58656e, jVar.f58656e);
    }

    public final int hashCode() {
        int iF = c9.f(c0.e((this.f58653b.hashCode() + (this.f58652a.hashCode() * 31)) * 31, 31, this.f58654c), 31, this.f58655d);
        String str = this.f58656e;
        return iF + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IconThemeConfig(name=");
        sb2.append(this.f58652a);
        sb2.append(", type=");
        sb2.append(this.f58653b);
        sb2.append(", pkg=");
        a80.m.q(this.f58654c, ", usesWallpaperColor=", ", id=", sb2, this.f58655d);
        return c0.q(sb2, this.f58656e, ")");
    }

    public j(String str, e eVar, String str2, boolean z11, String str3) {
        this.f58652a = str;
        this.f58653b = eVar;
        this.f58654c = str2;
        this.f58655d = z11;
        this.f58656e = str3;
    }
}
