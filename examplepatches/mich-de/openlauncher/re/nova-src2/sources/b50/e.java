package b50;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class e {
    public static /* synthetic */ String a(int i5) {
        if (i5 == 1) {
            return "Installed";
        }
        if (i5 == 2) {
            return "NotInstalled";
        }
        throw null;
    }

    public static /* synthetic */ String b(int i5) {
        return i5 != 1 ? i5 != 2 ? AbstractJsonLexerKt.NULL : "NotInstalled" : "Installed";
    }

    public static /* synthetic */ int c(String str) {
        if (str == null) {
            throw new NullPointerException("Name is null");
        }
        if (str.equals("Installed")) {
            return 1;
        }
        if (str.equals("NotInstalled")) {
            return 2;
        }
        throw new IllegalArgumentException("No enum constant io.branch.search.ui.EntityAdState.".concat(str));
    }
}
