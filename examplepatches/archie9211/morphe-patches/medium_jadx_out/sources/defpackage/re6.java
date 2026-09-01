package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class re6 {
    public static final LinkedHashSet a = qo7.w(jzb.w("Collection", "toArray()[Ljava/lang/Object;", "toArray([Ljava/lang/Object;)[Ljava/lang/Object;"), "java/lang/annotation/Annotation.annotationType()Ljava/lang/Class;");
    public static final LinkedHashSet b;
    public static final LinkedHashSet c;
    public static final LinkedHashSet d;
    public static final LinkedHashSet e;
    public static final LinkedHashSet f;
    public static final LinkedHashSet g;

    static {
        List<pf6> listR = d46.R(pf6.BOOLEAN, pf6.CHAR);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (pf6 pf6Var : listR) {
            String strB = pf6Var.getWrapperFqName().a.g().b();
            strB.getClass();
            String[] strArr = {pf6Var.getJavaKeywordName() + "Value()" + pf6Var.getDesc()};
            String strConcat = "java/lang/".concat(strB);
            String[] strArr2 = (String[]) Arrays.copyOf(strArr, 1);
            LinkedHashSet linkedHashSet2 = new LinkedHashSet();
            for (String str : strArr2) {
                linkedHashSet2.add(strConcat + '.' + str);
            }
            bu1.n0(linkedHashSet2, linkedHashSet);
        }
        b = qo7.v(qo7.v(qo7.v(qo7.v(qo7.v(qo7.v(linkedHashSet, jzb.w("List", "sort(Ljava/util/Comparator;)V", "reversed()Ljava/util/List;")), jzb.u("String", "codePointAt(I)I", "codePointBefore(I)I", "codePointCount(II)I", "compareToIgnoreCase(Ljava/lang/String;)I", "concat(Ljava/lang/String;)Ljava/lang/String;", "contains(Ljava/lang/CharSequence;)Z", "contentEquals(Ljava/lang/CharSequence;)Z", "contentEquals(Ljava/lang/StringBuffer;)Z", "endsWith(Ljava/lang/String;)Z", "equalsIgnoreCase(Ljava/lang/String;)Z", "getBytes()[B", "getBytes(II[BI)V", "getBytes(Ljava/lang/String;)[B", "getBytes(Ljava/nio/charset/Charset;)[B", "getChars(II[CI)V", "indexOf(I)I", "indexOf(II)I", "indexOf(Ljava/lang/String;)I", "indexOf(Ljava/lang/String;I)I", "intern()Ljava/lang/String;", "isEmpty()Z", "lastIndexOf(I)I", "lastIndexOf(II)I", "lastIndexOf(Ljava/lang/String;)I", "lastIndexOf(Ljava/lang/String;I)I", "matches(Ljava/lang/String;)Z", "offsetByCodePoints(II)I", "regionMatches(ILjava/lang/String;II)Z", "regionMatches(ZILjava/lang/String;II)Z", "replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", "replace(CC)Ljava/lang/String;", "replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", "replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;", "split(Ljava/lang/String;I)[Ljava/lang/String;", "split(Ljava/lang/String;)[Ljava/lang/String;", "startsWith(Ljava/lang/String;I)Z", "startsWith(Ljava/lang/String;)Z", "substring(II)Ljava/lang/String;", "substring(I)Ljava/lang/String;", "toCharArray()[C", "toLowerCase()Ljava/lang/String;", "toLowerCase(Ljava/util/Locale;)Ljava/lang/String;", "toUpperCase()Ljava/lang/String;", "toUpperCase(Ljava/util/Locale;)Ljava/lang/String;", "trim()Ljava/lang/String;", "isBlank()Z", "lines()Ljava/util/stream/Stream;", "repeat(I)Ljava/lang/String;")), jzb.u("Double", "isInfinite()Z", "isNaN()Z")), jzb.u("Float", "isInfinite()Z", "isNaN()Z")), jzb.u("Enum", "getDeclaringClass()Ljava/lang/Class;", "finalize()V")), jzb.u("CharSequence", "isEmpty()Z"));
        c = jzb.w("List", "getFirst()Ljava/lang/Object;", "getLast()Ljava/lang/Object;");
        LinkedHashSet linkedHashSetV = qo7.v(qo7.v(qo7.v(jzb.u("CharSequence", "codePoints()Ljava/util/stream/IntStream;", "chars()Ljava/util/stream/IntStream;"), jzb.w("Iterator", "forEachRemaining(Ljava/util/function/Consumer;)V")), jzb.u("Iterable", "forEach(Ljava/util/function/Consumer;)V", "spliterator()Ljava/util/Spliterator;")), jzb.u("Throwable", "setStackTrace([Ljava/lang/StackTraceElement;)V", "fillInStackTrace()Ljava/lang/Throwable;", "getLocalizedMessage()Ljava/lang/String;", "printStackTrace()V", "printStackTrace(Ljava/io/PrintStream;)V", "printStackTrace(Ljava/io/PrintWriter;)V", "getStackTrace()[Ljava/lang/StackTraceElement;", "initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;", "getSuppressed()[Ljava/lang/Throwable;", "addSuppressed(Ljava/lang/Throwable;)V"));
        String str2 = MaAxRJinch.VzONQnSSjX;
        String str3 = mBTDfueQiGWRV.ULRsnm;
        d = qo7.v(qo7.v(qo7.v(linkedHashSetV, jzb.w("Collection", "spliterator()Ljava/util/Spliterator;", "parallelStream()Ljava/util/stream/Stream;", str2, str3)), jzb.w("List", "replaceAll(Ljava/util/function/UnaryOperator;)V", "addFirst(Ljava/lang/Object;)V", "addLast(Ljava/lang/Object;)V", "removeFirst()Ljava/lang/Object;", "removeLast()Ljava/lang/Object;")), jzb.w("Map", "getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "forEach(Ljava/util/function/BiConsumer;)V", "replaceAll(Ljava/util/function/BiFunction;)V", "merge(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", "computeIfPresent(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", "putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z", "replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;", "compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;"));
        e = qo7.v(qo7.v(jzb.w("Collection", str3), jzb.w("List", "replaceAll(Ljava/util/function/UnaryOperator;)V", "sort(Ljava/util/Comparator;)V", "addFirst(Ljava/lang/Object;)V", "addLast(Ljava/lang/Object;)V", "removeFirst()Ljava/lang/Object;", "removeLast()Ljava/lang/Object;")), jzb.w("Map", "computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;", "computeIfPresent(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", "compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", "merge(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", "putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "remove(Ljava/lang/Object;Ljava/lang/Object;)Z", "replaceAll(Ljava/util/function/BiFunction;)V", "replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"));
        pf6 pf6Var2 = pf6.BYTE;
        List listR2 = d46.R(pf6.BOOLEAN, pf6Var2, pf6.DOUBLE, pf6.FLOAT, pf6Var2, pf6.INT, pf6.LONG, pf6.SHORT);
        LinkedHashSet linkedHashSet3 = new LinkedHashSet();
        Iterator it2 = listR2.iterator();
        while (it2.hasNext()) {
            String strB2 = ((pf6) it2.next()).getWrapperFqName().a.g().b();
            strB2.getClass();
            String[] strArrH = jzb.h("Ljava/lang/String;");
            bu1.n0(jzb.u(strB2, (String[]) Arrays.copyOf(strArrH, strArrH.length)), linkedHashSet3);
        }
        String[] strArrH2 = jzb.h("D");
        LinkedHashSet linkedHashSetV2 = qo7.v(linkedHashSet3, jzb.u("Float", (String[]) Arrays.copyOf(strArrH2, strArrH2.length)));
        String[] strArrH3 = jzb.h("[C", peNPu.ehswTeMIY, "[III", "[BIILjava/lang/String;", "[BIILjava/nio/charset/Charset;", "[BLjava/lang/String;", "[BLjava/nio/charset/Charset;", "[BII", "[B", nGxjfIr.KKzCyi, "Ljava/lang/StringBuilder;");
        f = qo7.v(linkedHashSetV2, jzb.u("String", (String[]) Arrays.copyOf(strArrH3, strArrH3.length)));
        String[] strArrH4 = jzb.h("Ljava/lang/String;Ljava/lang/Throwable;ZZ");
        g = jzb.u("Throwable", (String[]) Arrays.copyOf(strArrH4, strArrH4.length));
    }
}
