package a4;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import kotlin.PublishedApi;
import kotlin.jvm.functions.Function1;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public abstract class b {
    public static final ArrayList a(ArrayList arrayList) {
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj = arrayList.get(i5);
            if (obj != null) {
                arrayList2.add(obj);
            }
        }
        return arrayList2;
    }

    public static String b(List list, String str, Function1 function1, int i5) {
        if ((i5 & 1) != 0) {
            str = ", ";
        }
        int i11 = i5 & 2;
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String str3 = i11 != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : "[\n\t";
        if ((i5 & 4) == 0) {
            str2 = "\n]";
        }
        if ((i5 & 32) != 0) {
            function1 = null;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) str3);
        int size = list.size();
        int i12 = 0;
        for (int i13 = 0; i13 < size; i13++) {
            Object obj = list.get(i13);
            i12++;
            if (i12 > 1) {
                sb2.append((CharSequence) str);
            }
            if (function1 != null) {
                sb2.append((CharSequence) function1.invoke(obj));
            } else if (obj != null ? obj instanceof CharSequence : true) {
                sb2.append((CharSequence) obj);
            } else if (obj instanceof Character) {
                sb2.append(((Character) obj).charValue());
            } else {
                sb2.append((CharSequence) obj.toString());
            }
        }
        sb2.append((CharSequence) str2);
        return sb2.toString();
    }

    @PublishedApi
    @NotNull
    public static final Void c(@NotNull String str) {
        throw new NoSuchElementException(str);
    }

    @PublishedApi
    public static final void d(@NotNull String str) {
        throw new UnsupportedOperationException(str);
    }
}
