package kotlin.text;

import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import k5.d;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/Regex;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class Regex implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final Companion f72026b = new Companion(0);

    /* renamed from: a, reason: collision with root package name */
    public final Pattern f72027a;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/Regex$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    public Regex(String pattern) {
        Intrinsics.g(pattern, "pattern");
        Pattern patternCompile = Pattern.compile(pattern);
        Intrinsics.f(patternCompile, "compile(...)");
        this.f72027a = patternCompile;
    }

    public static q70.b d(Regex regex, CharSequence input) {
        regex.getClass();
        Intrinsics.g(input, "input");
        if (input.length() >= 0) {
            return new q70.b(new d(28, regex, input), r70.d.f85611d);
        }
        StringBuilder sbJ = u4.j(0, "Start index out of bounds: ", ", input length: ");
        sbJ.append(input.length());
        throw new IndexOutOfBoundsException(sbJ.toString());
    }

    public final boolean a(String input) {
        Intrinsics.g(input, "input");
        return this.f72027a.matcher(input).find();
    }

    public final b b(CharSequence input) {
        Intrinsics.g(input, "input");
        Matcher matcher = this.f72027a.matcher(input);
        Intrinsics.f(matcher, "matcher(...)");
        if (matcher.find(0)) {
            return new b(matcher, input);
        }
        return null;
    }

    public final b e(CharSequence input) {
        Intrinsics.g(input, "input");
        Matcher matcher = this.f72027a.matcher(input);
        Intrinsics.f(matcher, "matcher(...)");
        if (matcher.matches()) {
            return new b(matcher, input);
        }
        return null;
    }

    public final boolean f(CharSequence input) {
        Intrinsics.g(input, "input");
        return this.f72027a.matcher(input).matches();
    }

    public final String g(CharSequence input, Function1 transform) {
        Intrinsics.g(input, "input");
        Intrinsics.g(transform, "transform");
        b bVarB = b(input);
        if (bVarB == null) {
            return input.toString();
        }
        int length = input.length();
        StringBuilder sb2 = new StringBuilder(length);
        int i5 = 0;
        do {
            sb2.append(input, i5, bVarB.b().f71906a);
            sb2.append((CharSequence) transform.invoke(bVarB));
            i5 = bVarB.b().f71907b + 1;
            bVarB = bVarB.next();
            if (i5 >= length) {
                break;
            }
        } while (bVarB != null);
        if (i5 < length) {
            sb2.append(input, i5, length);
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public final String h(String replacement, CharSequence input) {
        Intrinsics.g(input, "input");
        Intrinsics.g(replacement, "replacement");
        String strReplaceAll = this.f72027a.matcher(input).replaceAll(replacement);
        Intrinsics.f(strReplaceAll, "replaceAll(...)");
        return strReplaceAll;
    }

    public final List i(int i5, String input) {
        Intrinsics.g(input, "input");
        r70.k.f1(i5);
        Matcher matcher = this.f72027a.matcher(input);
        if (i5 == 1 || !matcher.find()) {
            return ul.b.P(input.toString());
        }
        int i11 = 10;
        if (i5 > 0 && i5 <= 10) {
            i11 = i5;
        }
        ArrayList arrayList = new ArrayList(i11);
        int i12 = i5 - 1;
        int iEnd = 0;
        do {
            arrayList.add(input.subSequence(iEnd, matcher.start()).toString());
            iEnd = matcher.end();
            if (i12 >= 0 && arrayList.size() == i12) {
                break;
            }
        } while (matcher.find());
        arrayList.add(input.subSequence(iEnd, input.length()).toString());
        return arrayList;
    }

    public final String toString() {
        String string = this.f72027a.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public Regex(String pattern, int i5) {
        RegexOption[] regexOptionArr = RegexOption.f72028c;
        Intrinsics.g(pattern, "pattern");
        f72026b.getClass();
        Pattern patternCompile = Pattern.compile(pattern, 66);
        Intrinsics.f(patternCompile, "compile(...)");
        this.f72027a = patternCompile;
    }
}
