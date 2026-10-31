package c4;

import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import p1.m0;

/* loaded from: classes.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f19598a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f19599b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f19600c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f19601d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f19602e;

    public g0(int i5, boolean z11) {
        this.f19598a = i5;
        this.f19599b = z11;
        this.f19600c = true;
        this.f19601d = true;
        this.f19602e = true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g0)) {
            return false;
        }
        g0 g0Var = (g0) obj;
        return this.f19598a == g0Var.f19598a && this.f19599b == g0Var.f19599b && this.f19600c == g0Var.f19600c && this.f19601d == g0Var.f19601d && this.f19602e == g0Var.f19602e;
    }

    public final int hashCode() {
        return Boolean.hashCode(false) + c9.f(c9.f(c9.f(c9.f(this.f19598a * 31, 31, this.f19599b), 31, this.f19600c), 31, this.f19601d), 31, this.f19602e);
    }

    public g0(int i5) {
        this((i5 & 1) == 0, h0.f19604a, true);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public g0(boolean z11, h0 h0Var, boolean z12) {
        m0 m0Var = p.f19625a;
        int i5 = !z11 ? 262152 : SQLiteDatabase.OPEN_PRIVATECACHE;
        i5 = h0Var == h0.f19605b ? i5 | UserMetadata.MAX_INTERNAL_KEY_SIZE : i5;
        this(z12 ? i5 : i5 | EventBridgeChannel.QUEUE_CAPACITY, h0Var == h0.f19604a);
    }
}
