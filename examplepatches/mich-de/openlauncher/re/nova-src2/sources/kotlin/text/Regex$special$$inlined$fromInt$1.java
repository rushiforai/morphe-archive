package kotlin.text;

import kotlin.Metadata;
import kotlin.jvm.functions.Function1;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class Regex$special$$inlined$fromInt$1 implements Function1<RegexOption, Boolean> {
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        RegexOption regexOption = (RegexOption) ((r70.b) ((Enum) obj));
        int i5 = regexOption.f72030b;
        return Boolean.valueOf(regexOption.f72029a == 0);
    }
}
