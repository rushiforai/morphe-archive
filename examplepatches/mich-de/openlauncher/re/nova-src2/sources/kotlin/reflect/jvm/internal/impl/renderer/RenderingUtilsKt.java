package kotlin.reflect.jvm.internal.impl.renderer;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.name.FqNameUnsafe;
import kotlin.reflect.jvm.internal.impl.name.Name;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class RenderingUtilsKt {
    @NotNull
    public static final String render(@NotNull Name name) {
        Intrinsics.g(name, "<this>");
        if (!shouldBeEscaped(name)) {
            String strAsString = name.asString();
            Intrinsics.f(strAsString, "asString(...)");
            return strAsString;
        }
        StringBuilder sb2 = new StringBuilder();
        String strAsString2 = name.asString();
        Intrinsics.f(strAsString2, "asString(...)");
        sb2.append("`".concat(strAsString2));
        sb2.append('`');
        return sb2.toString();
    }

    @NotNull
    public static final String renderFqName(@NotNull List<Name> pathSegments) {
        Intrinsics.g(pathSegments, "pathSegments");
        StringBuilder sb2 = new StringBuilder();
        for (Name name : pathSegments) {
            if (sb2.length() > 0) {
                sb2.append(".");
            }
            sb2.append(render(name));
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @Nullable
    public static final String replacePrefixesInTypeRepresentations(@NotNull String lowerRendered, @NotNull String lowerPrefix, @NotNull String upperRendered, @NotNull String upperPrefix, @NotNull String foldedPrefix) {
        Intrinsics.g(lowerRendered, "lowerRendered");
        Intrinsics.g(lowerPrefix, "lowerPrefix");
        Intrinsics.g(upperRendered, "upperRendered");
        Intrinsics.g(upperPrefix, "upperPrefix");
        Intrinsics.g(foldedPrefix, "foldedPrefix");
        if (!j.I0(lowerRendered, lowerPrefix, false) || !j.I0(upperRendered, upperPrefix, false)) {
            return null;
        }
        String strSubstring = lowerRendered.substring(lowerPrefix.length());
        Intrinsics.f(strSubstring, "substring(...)");
        String strSubstring2 = upperRendered.substring(upperPrefix.length());
        Intrinsics.f(strSubstring2, "substring(...)");
        String strConcat = foldedPrefix.concat(strSubstring);
        if (strSubstring.equals(strSubstring2)) {
            return strConcat;
        }
        if (!typeStringsDifferOnlyInNullability(strSubstring, strSubstring2)) {
            return null;
        }
        return strConcat + '!';
    }

    private static final boolean shouldBeEscaped(Name name) {
        String strAsString = name.asString();
        Intrinsics.f(strAsString, "asString(...)");
        if (KeywordStringsGenerated.KEYWORDS.contains(strAsString)) {
            return true;
        }
        for (int i5 = 0; i5 < strAsString.length(); i5++) {
            char cCharAt = strAsString.charAt(i5);
            if (!Character.isLetterOrDigit(cCharAt) && cCharAt != '_') {
                return true;
            }
        }
        return strAsString.length() == 0 || !Character.isJavaIdentifierStart(strAsString.codePointAt(0));
    }

    public static final boolean typeStringsDifferOnlyInNullability(@NotNull String lower, @NotNull String upper) {
        Intrinsics.g(lower, "lower");
        Intrinsics.g(upper, "upper");
        if (lower.equals(j.F0(upper, "?", b.f42142b, false))) {
            return true;
        }
        if (j.A0(upper, "?", false) && Intrinsics.b(lower.concat("?"), upper)) {
            return true;
        }
        StringBuilder sb2 = new StringBuilder("(");
        sb2.append(lower);
        sb2.append(")?");
        return Intrinsics.b(sb2.toString(), upper);
    }

    @NotNull
    public static final String render(@NotNull FqNameUnsafe fqNameUnsafe) {
        Intrinsics.g(fqNameUnsafe, "<this>");
        List<Name> listPathSegments = fqNameUnsafe.pathSegments();
        Intrinsics.f(listPathSegments, "pathSegments(...)");
        return renderFqName(listPathSegments);
    }
}
