package b00;

import com.instabridge.ai.chat.util.CitationMarkdownTransform;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.text.MatchResult;

/* loaded from: classes4.dex */
public final /* synthetic */ class m0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16405a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f16406b;

    public /* synthetic */ m0(int i5, List list) {
        this.f16405a = i5;
        this.f16406b = list;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16405a) {
            case 0:
                return ((u10.e0) ((Pair) this.f16406b.get(((Integer) obj).intValue())).f71683a).f90373a;
            case 1:
                return CitationMarkdownTransform.rewriteCitations$lambda$1(this.f16406b, (String) obj);
            case 2:
                return CitationMarkdownTransform.rewriteCitations$lambda$1$lambda$0(this.f16406b, (String) obj);
            default:
                return CitationMarkdownTransform.rewriteCitationSegment$lambda$2(this.f16406b, (MatchResult) obj);
        }
    }
}
