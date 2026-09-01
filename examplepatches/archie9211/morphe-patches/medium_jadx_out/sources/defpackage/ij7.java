package defpackage;

import java.util.List;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ij7 {
    public final Matcher a;
    public final CharSequence b;
    public final hj7 c;
    public gj7 d;

    public ij7(Matcher matcher, CharSequence charSequence) {
        charSequence.getClass();
        this.a = matcher;
        this.b = charSequence;
        this.c = new hj7(0, this);
    }

    public final List a() {
        gj7 gj7Var = this.d;
        if (gj7Var != null) {
            return gj7Var;
        }
        gj7 gj7Var2 = new gj7(this);
        this.d = gj7Var2;
        return gj7Var2;
    }

    public final n46 b() {
        Matcher matcher = this.a;
        return iq7.W(matcher.start(), matcher.end());
    }

    public final ij7 c() {
        Matcher matcher = this.a;
        int iEnd = matcher.end() + (matcher.end() == matcher.start() ? 1 : 0);
        CharSequence charSequence = this.b;
        if (iEnd > charSequence.length()) {
            return null;
        }
        Matcher matcher2 = matcher.pattern().matcher(charSequence);
        matcher2.getClass();
        return ep7.r(matcher2, iEnd, charSequence);
    }
}
