package pp;

import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable(with = y.class)
/* loaded from: classes.dex */
public abstract class u {

    @NotNull
    public static final s Companion = new s();

    /* renamed from: a, reason: collision with root package name */
    public final String f82775a;

    /* renamed from: b, reason: collision with root package name */
    public final int f82776b;

    public u(String str, int i5) {
        this.f82775a = str;
        this.f82776b = i5;
    }
}
