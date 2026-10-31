package kotlin.ranges;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010\f\n\u0002\b\u0002\b\u0016\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/CharProgression;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public class CharProgression implements Iterable<Character>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final char f71898a;

    /* renamed from: b, reason: collision with root package name */
    public final char f71899b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71900c = 1;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/ranges/CharProgression$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
    }

    public CharProgression(char c11, char c12) {
        this.f71898a = c11;
        this.f71899b = (char) ProgressionUtilKt.a(c11, c12, 1);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof CharProgression)) {
            return false;
        }
        if (isEmpty() && ((CharProgression) obj).isEmpty()) {
            return true;
        }
        CharProgression charProgression = (CharProgression) obj;
        return this.f71898a == charProgression.f71898a && this.f71899b == charProgression.f71899b && this.f71900c == charProgression.f71900c;
    }

    public int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return (((this.f71898a * 31) + this.f71899b) * 31) + this.f71900c;
    }

    public boolean isEmpty() {
        int i5 = this.f71900c;
        char c11 = this.f71899b;
        char c12 = this.f71898a;
        return i5 > 0 ? Intrinsics.h(c12, c11) > 0 : Intrinsics.h(c12, c11) < 0;
    }

    @Override // java.lang.Iterable
    public final Iterator<Character> iterator() {
        return new CharProgressionIterator(this.f71898a, this.f71899b, this.f71900c);
    }

    public String toString() {
        StringBuilder sb2;
        char c11 = this.f71899b;
        char c12 = this.f71898a;
        int i5 = this.f71900c;
        if (i5 > 0) {
            sb2 = new StringBuilder();
            sb2.append(c12);
            sb2.append("..");
            sb2.append(c11);
            sb2.append(" step ");
            sb2.append(i5);
        } else {
            sb2 = new StringBuilder();
            sb2.append(c12);
            sb2.append(" downTo ");
            sb2.append(c11);
            sb2.append(" step ");
            sb2.append(-i5);
        }
        return sb2.toString();
    }
}
