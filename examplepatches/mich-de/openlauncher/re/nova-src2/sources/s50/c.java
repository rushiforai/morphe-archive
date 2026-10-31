package s50;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f86679a;

    /* renamed from: b, reason: collision with root package name */
    public final int f86680b;

    public c(String content) {
        Intrinsics.g(content, "content");
        this.f86679a = content;
        int length = content.length();
        int lowerCase = 0;
        for (int i5 = 0; i5 < length; i5++) {
            lowerCase = (lowerCase * 31) + Character.toLowerCase(content.charAt(i5));
        }
        this.f86680b = lowerCase;
    }

    public final boolean equals(Object obj) {
        String str;
        c cVar = obj instanceof c ? (c) obj : null;
        return (cVar == null || (str = cVar.f86679a) == null || !str.equalsIgnoreCase(this.f86679a)) ? false : true;
    }

    public final int hashCode() {
        return this.f86680b;
    }

    public final String toString() {
        return this.f86679a;
    }
}
