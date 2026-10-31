package kotlin.text;

import java.util.List;
import java.util.regex.Matcher;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public final class b implements MatchResult {

    /* renamed from: a, reason: collision with root package name */
    public final Matcher f72033a;

    /* renamed from: b, reason: collision with root package name */
    public final CharSequence f72034b;

    /* renamed from: c, reason: collision with root package name */
    public final MatcherMatchResult$groups$1 f72035c;

    /* renamed from: d, reason: collision with root package name */
    public MatcherMatchResult$groupValues$1 f72036d;

    public b(Matcher matcher, CharSequence input) {
        Intrinsics.g(input, "input");
        this.f72033a = matcher;
        this.f72034b = input;
        this.f72035c = new MatcherMatchResult$groups$1(this);
    }

    @Override // kotlin.text.MatchResult
    public final List a() {
        if (this.f72036d == null) {
            this.f72036d = new MatcherMatchResult$groupValues$1(this);
        }
        MatcherMatchResult$groupValues$1 matcherMatchResult$groupValues$1 = this.f72036d;
        Intrinsics.d(matcherMatchResult$groupValues$1);
        return matcherMatchResult$groupValues$1;
    }

    @Override // kotlin.text.MatchResult
    public final IntRange b() {
        Matcher matcher = this.f72033a;
        return kotlin.ranges.a.m0(matcher.start(), matcher.end());
    }

    @Override // kotlin.text.MatchResult
    public final MatcherMatchResult$groups$1 c() {
        return this.f72035c;
    }

    @Override // kotlin.text.MatchResult
    public final String getValue() {
        String strGroup = this.f72033a.group();
        Intrinsics.f(strGroup, "group(...)");
        return strGroup;
    }

    @Override // kotlin.text.MatchResult
    public final b next() {
        Matcher matcher = this.f72033a;
        int iEnd = matcher.end() + (matcher.end() == matcher.start() ? 1 : 0);
        CharSequence charSequence = this.f72034b;
        if (iEnd > charSequence.length()) {
            return null;
        }
        Matcher matcher2 = matcher.pattern().matcher(charSequence);
        Intrinsics.f(matcher2, "matcher(...)");
        if (matcher2.find(iEnd)) {
            return new b(matcher2, charSequence);
        }
        return null;
    }
}
