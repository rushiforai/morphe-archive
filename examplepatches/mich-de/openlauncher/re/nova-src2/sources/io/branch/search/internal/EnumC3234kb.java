package io.branch.search.internal;

import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.kb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public enum EnumC3234kb {
    SETUP,
    TEARDOWN;


    @NotNull
    public static final a Companion = new a();

    /* renamed from: io.branch.search.internal.kb$a */
    public static final class a {
        @NotNull
        public static EnumC3234kb a(@NotNull String type) {
            Intrinsics.g(type, "type");
            Locale ROOT = Locale.ROOT;
            Intrinsics.f(ROOT, "ROOT");
            String lowerCase = type.toLowerCase(ROOT);
            Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(locale)");
            if (lowerCase.equals("setup")) {
                return EnumC3234kb.SETUP;
            }
            if (lowerCase.equals("teardown")) {
                return EnumC3234kb.TEARDOWN;
            }
            throw new IllegalStateException("Unknown QueryPhase ".concat(type));
        }
    }
}
