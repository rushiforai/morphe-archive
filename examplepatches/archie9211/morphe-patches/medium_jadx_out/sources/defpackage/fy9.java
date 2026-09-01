package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class fy9 {
    public static final y96 a = new y96(vl8.NULLABLE, false);
    public static final y96 b;
    public static final y96 c;
    public static final LinkedHashMap d;

    static {
        vl8 vl8Var = vl8.NOT_NULL;
        b = new y96(vl8Var, false);
        c = new y96(vl8Var, true);
        String strConcat = "java/lang/".concat(pUlNWdybf.jqeVut);
        String strConcat2 = "java/util/function/".concat("Predicate");
        String strConcat3 = "java/util/function/".concat("Function");
        String strConcat4 = "java/util/function/".concat("Consumer");
        String strConcat5 = "java/util/function/".concat("BiFunction");
        String strConcat6 = "java/util/function/".concat("BiConsumer");
        String strConcat7 = "java/util/function/".concat("UnaryOperator");
        String strConcat8 = "java/util/".concat("stream/Stream");
        String strConcat9 = "java/util/".concat("Optional");
        ct2 ct2Var = new ct2(4, false);
        new mya(ct2Var, "java/util/".concat("Iterator")).q("forEachRemaining", null, new by9(strConcat4, 0));
        new mya(ct2Var, "java/lang/".concat("Iterable")).q("spliterator", null, new cy9(0));
        mya myaVar = new mya(ct2Var, "java/util/".concat("Collection"));
        myaVar.q("removeIf", null, new by9(strConcat2, 17));
        myaVar.q("stream", null, new by9(strConcat8, 26));
        myaVar.q("parallelStream", null, new ey9(strConcat8, 1));
        mya myaVar2 = new mya(ct2Var, "java/util/".concat("List"));
        myaVar2.q("replaceAll", null, new ey9(strConcat7, 2));
        myaVar2.q("addFirst", "2.1", new ey9(strConcat, 3));
        myaVar2.q("addLast", "2.1", new ey9(strConcat, 4));
        myaVar2.q("removeFirst", "2.1", new ey9(strConcat, 5));
        myaVar2.q("removeLast", "2.1", new ey9(strConcat, 6));
        mya myaVar3 = new mya(ct2Var, "java/util/".concat("LinkedList"));
        myaVar3.q("addFirst", "2.1", new by9(strConcat, 1));
        myaVar3.q("addLast", "2.1", new by9(strConcat, 2));
        myaVar3.q("removeFirst", "2.1", new by9(strConcat, 3));
        myaVar3.q("removeLast", "2.1", new by9(strConcat, 4));
        mya myaVar4 = new mya(ct2Var, "java/util/".concat("LinkedHashSet"));
        myaVar4.q("addFirst", "2.2", new by9(strConcat, 5));
        myaVar4.q("addLast", "2.2", new by9(strConcat, 6));
        myaVar4.q("removeFirst", "2.2", new by9(strConcat, 7));
        myaVar4.q("removeLast", "2.2", new by9(strConcat, 8));
        myaVar4.q("getFirst", "2.2", new by9(strConcat, 9));
        myaVar4.q("getLast", "2.2", new by9(strConcat, 10));
        mya myaVar5 = new mya(ct2Var, "java/util/".concat("Map"));
        myaVar5.q("forEach", null, new by9(strConcat6, 11));
        myaVar5.q("putIfAbsent", null, new by9(strConcat, 12));
        myaVar5.q("replace", null, new by9(strConcat, 13));
        myaVar5.q("replace", null, new by9(strConcat, 14));
        myaVar5.q("replaceAll", null, new by9(strConcat5, 15));
        myaVar5.q("compute", null, new dy9(strConcat, strConcat5, 0));
        myaVar5.q("computeIfAbsent", null, new dy9(strConcat, strConcat3, 1));
        myaVar5.q("computeIfPresent", null, new dy9(strConcat, strConcat5, 2));
        myaVar5.q("merge", null, new dy9(strConcat, strConcat5, 3));
        mya myaVar6 = new mya(ct2Var, "java/util/".concat("LinkedHashMap"));
        myaVar6.q("putFirst", "2.2", new by9(strConcat, 16));
        myaVar6.q("putLast", "2.2", new by9(strConcat, 18));
        mya myaVar7 = new mya(ct2Var, strConcat9);
        myaVar7.q("empty", null, new by9(strConcat9, 19));
        myaVar7.q("of", null, new dy9(strConcat, strConcat9, 4));
        myaVar7.q("ofNullable", null, new dy9(strConcat, strConcat9, 5));
        myaVar7.q("get", null, new by9(strConcat, 20));
        myaVar7.q("ifPresent", null, new by9(strConcat4, 21));
        new mya(ct2Var, "java/lang/".concat("ref/Reference")).q("get", null, new by9(strConcat, 22));
        new mya(ct2Var, strConcat2).q("test", null, new by9(strConcat, 23));
        new mya(ct2Var, "java/util/function/".concat("BiPredicate")).q("test", null, new by9(strConcat, 24));
        new mya(ct2Var, strConcat4).q("accept", null, new by9(strConcat, 25));
        new mya(ct2Var, strConcat6).q("accept", null, new by9(strConcat, 27));
        new mya(ct2Var, strConcat3).q("apply", null, new by9(strConcat, 28));
        new mya(ct2Var, strConcat5).q("apply", null, new by9(strConcat, 29));
        new mya(ct2Var, "java/util/function/".concat("Supplier")).q("get", null, new ey9(strConcat, 0));
        d = ct2Var.a;
    }
}
