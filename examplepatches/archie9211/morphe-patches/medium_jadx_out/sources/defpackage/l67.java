package defpackage;

import android.os.LocaleList;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l67 implements k67 {
    public final LocaleList a;

    public l67(Object obj) {
        this.a = (LocaleList) obj;
    }

    @Override // defpackage.k67
    public final String a() {
        return this.a.toLanguageTags();
    }

    @Override // defpackage.k67
    public final Object b() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        return this.a.equals(((k67) obj).b());
    }

    @Override // defpackage.k67
    public final Locale get(int i) {
        return this.a.get(i);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // defpackage.k67
    public final boolean isEmpty() {
        return this.a.isEmpty();
    }

    @Override // defpackage.k67
    public final int size() {
        return this.a.size();
    }

    public final String toString() {
        return this.a.toString();
    }
}
