package kotlin.reflect.jvm.internal.impl.name;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class SpecialNames {

    @JvmField
    @NotNull
    public static final Name ANONYMOUS;

    @JvmField
    @NotNull
    public static final Name ARRAY;

    @JvmField
    @NotNull
    public static final Name DEFAULT_NAME_FOR_COMPANION_OBJECT;

    @JvmField
    @NotNull
    public static final Name DESTRUCT;

    @JvmField
    @NotNull
    public static final Name ENUM_GET_ENTRIES;

    @JvmField
    @NotNull
    public static final Name IMPLICIT_SET_PARAMETER;

    @JvmField
    @NotNull
    public static final Name INIT;

    @NotNull
    public static final SpecialNames INSTANCE = new SpecialNames();

    @JvmField
    @NotNull
    public static final Name ITERATOR;

    @JvmField
    @NotNull
    public static final Name LOCAL;

    @JvmField
    @NotNull
    public static final Name NO_NAME_PROVIDED;

    @JvmField
    @NotNull
    public static final Name RECEIVER;

    @JvmField
    @NotNull
    public static final Name ROOT_PACKAGE;

    @JvmField
    @NotNull
    public static final Name SAFE_IDENTIFIER_FOR_NO_NAME;

    @JvmField
    @NotNull
    public static final Name THIS;

    @JvmField
    @NotNull
    public static final Name UNARY;

    @JvmField
    @NotNull
    public static final Name UNDERSCORE_FOR_UNUSED_VAR;

    static {
        Name nameSpecial = Name.special("<no name provided>");
        Intrinsics.f(nameSpecial, "special(...)");
        NO_NAME_PROVIDED = nameSpecial;
        Name nameSpecial2 = Name.special("<root package>");
        Intrinsics.f(nameSpecial2, "special(...)");
        ROOT_PACKAGE = nameSpecial2;
        Name nameIdentifier = Name.identifier(k.O);
        Intrinsics.f(nameIdentifier, "identifier(...)");
        DEFAULT_NAME_FOR_COMPANION_OBJECT = nameIdentifier;
        Name nameIdentifier2 = Name.identifier("no_name_in_PSI_3d19d79d_1ba9_4cd0_b7f5_b46aa3cd5d40");
        Intrinsics.f(nameIdentifier2, "identifier(...)");
        SAFE_IDENTIFIER_FOR_NO_NAME = nameIdentifier2;
        Name nameSpecial3 = Name.special("<anonymous>");
        Intrinsics.f(nameSpecial3, "special(...)");
        ANONYMOUS = nameSpecial3;
        Name nameSpecial4 = Name.special("<unary>");
        Intrinsics.f(nameSpecial4, "special(...)");
        UNARY = nameSpecial4;
        Name nameSpecial5 = Name.special("<this>");
        Intrinsics.f(nameSpecial5, "special(...)");
        THIS = nameSpecial5;
        Name nameSpecial6 = Name.special("<init>");
        Intrinsics.f(nameSpecial6, "special(...)");
        INIT = nameSpecial6;
        Name nameSpecial7 = Name.special("<iterator>");
        Intrinsics.f(nameSpecial7, "special(...)");
        ITERATOR = nameSpecial7;
        Name nameSpecial8 = Name.special("<destruct>");
        Intrinsics.f(nameSpecial8, "special(...)");
        DESTRUCT = nameSpecial8;
        Name nameSpecial9 = Name.special("<local>");
        Intrinsics.f(nameSpecial9, "special(...)");
        LOCAL = nameSpecial9;
        Name nameSpecial10 = Name.special("<unused var>");
        Intrinsics.f(nameSpecial10, "special(...)");
        UNDERSCORE_FOR_UNUSED_VAR = nameSpecial10;
        Name nameSpecial11 = Name.special("<set-?>");
        Intrinsics.f(nameSpecial11, "special(...)");
        IMPLICIT_SET_PARAMETER = nameSpecial11;
        Name nameSpecial12 = Name.special("<array>");
        Intrinsics.f(nameSpecial12, "special(...)");
        ARRAY = nameSpecial12;
        Name nameSpecial13 = Name.special("<receiver>");
        Intrinsics.f(nameSpecial13, "special(...)");
        RECEIVER = nameSpecial13;
        Name nameSpecial14 = Name.special("<get-entries>");
        Intrinsics.f(nameSpecial14, "special(...)");
        ENUM_GET_ENTRIES = nameSpecial14;
    }

    private SpecialNames() {
    }

    @JvmStatic
    @NotNull
    public static final Name safeIdentifier(@Nullable Name name) {
        return (name == null || name.isSpecial()) ? SAFE_IDENTIFIER_FOR_NO_NAME : name;
    }

    public final boolean isSafeIdentifier(@NotNull Name name) {
        Intrinsics.g(name, "name");
        String strAsString = name.asString();
        Intrinsics.f(strAsString, "asString(...)");
        return strAsString.length() > 0 && !name.isSpecial();
    }
}
