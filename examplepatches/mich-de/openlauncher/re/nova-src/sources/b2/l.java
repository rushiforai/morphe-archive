package b2;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class l extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public static final l f17016j = new l(2);

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        String str = (String) obj;
        s sVar = (s) obj2;
        if (str.length() == 0) {
            return sVar.toString();
        }
        return str + ", " + sVar;
    }
}
