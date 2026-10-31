package kotlin.reflect.jvm.internal.impl.name;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class FqNamesUtilKt {

    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[State.values().length];
            try {
                iArr[State.BEGINNING.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[State.AFTER_DOT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[State.MIDDLE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @Nullable
    public static final <V> V findValueForMostSpecificFqname(@NotNull FqName fqName, @NotNull Map<FqName, ? extends V> values) {
        Object next;
        Intrinsics.g(fqName, "<this>");
        Intrinsics.g(values, "values");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<FqName, ? extends V> entry : values.entrySet()) {
            FqName key = entry.getKey();
            if (fqName.equals(key) || isChildOf(fqName, key)) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        if (linkedHashMap.isEmpty()) {
            linkedHashMap = null;
        }
        if (linkedHashMap == null) {
            return null;
        }
        Iterator it = linkedHashMap.entrySet().iterator();
        if (it.hasNext()) {
            next = it.next();
            if (it.hasNext()) {
                int length = tail((FqName) ((Map.Entry) next).getKey(), fqName).asString().length();
                do {
                    Object next2 = it.next();
                    int length2 = tail((FqName) ((Map.Entry) next2).getKey(), fqName).asString().length();
                    if (length > length2) {
                        next = next2;
                        length = length2;
                    }
                } while (it.hasNext());
            }
        } else {
            next = null;
        }
        Map.Entry entry2 = (Map.Entry) next;
        if (entry2 != null) {
            return (V) entry2.getValue();
        }
        return null;
    }

    public static final boolean isChildOf(@NotNull FqName fqName, @NotNull FqName packageName) {
        Intrinsics.g(fqName, "<this>");
        Intrinsics.g(packageName, "packageName");
        return Intrinsics.b(parentOrNull(fqName), packageName);
    }

    public static final boolean isSubpackageOf(@NotNull FqName fqName, @NotNull FqName packageName) {
        Intrinsics.g(fqName, "<this>");
        Intrinsics.g(packageName, "packageName");
        if (fqName.equals(packageName) || packageName.isRoot()) {
            return true;
        }
        String strAsString = fqName.asString();
        Intrinsics.f(strAsString, "asString(...)");
        String strAsString2 = packageName.asString();
        Intrinsics.f(strAsString2, "asString(...)");
        return isSubpackageOf(strAsString, strAsString2);
    }

    public static final boolean isValidJavaFqName(@Nullable String str) {
        if (str == null) {
            return false;
        }
        State state = State.BEGINNING;
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            int i11 = WhenMappings.$EnumSwitchMapping$0[state.ordinal()];
            if (i11 == 1 || i11 == 2) {
                if (!Character.isJavaIdentifierStart(cCharAt)) {
                    return false;
                }
                state = State.MIDDLE;
            } else if (i11 != 3) {
                continue;
            } else if (cCharAt == '.') {
                state = State.AFTER_DOT;
            } else if (!Character.isJavaIdentifierPart(cCharAt)) {
                return false;
            }
        }
        return state != State.AFTER_DOT;
    }

    @Nullable
    public static final FqName parentOrNull(@NotNull FqName fqName) {
        Intrinsics.g(fqName, "<this>");
        if (fqName.isRoot()) {
            return null;
        }
        return fqName.parent();
    }

    @NotNull
    public static final FqName tail(@NotNull FqName fqName, @NotNull FqName prefix) {
        Intrinsics.g(fqName, "<this>");
        Intrinsics.g(prefix, "prefix");
        if (!isSubpackageOf(fqName, prefix) || prefix.isRoot()) {
            return fqName;
        }
        if (fqName.equals(prefix)) {
            FqName ROOT = FqName.ROOT;
            Intrinsics.f(ROOT, "ROOT");
            return ROOT;
        }
        String strAsString = fqName.asString();
        Intrinsics.f(strAsString, "asString(...)");
        String strSubstring = strAsString.substring(prefix.asString().length() + 1);
        Intrinsics.f(strSubstring, "substring(...)");
        return new FqName(strSubstring);
    }

    private static final boolean isSubpackageOf(String str, String str2) {
        return j.I0(str, str2, false) && str.charAt(str2.length()) == '.';
    }
}
