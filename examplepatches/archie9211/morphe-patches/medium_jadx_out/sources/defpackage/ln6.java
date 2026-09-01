package defpackage;

import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ln6 {
    public static final ln6 ANNOTATION_CLASS;
    public static final ln6 ANONYMOUS_FUNCTION;
    public static final ln6 BACKING_FIELD;
    public static final ln6 CLASS;
    public static final ln6 CLASS_ONLY;
    public static final ln6 COMPANION_OBJECT;
    public static final ln6 CONSTRUCTOR;
    public static final kn6 Companion;
    public static final ln6 DESTRUCTURING_DECLARATION;
    public static final ln6 ENUM_CLASS;
    public static final ln6 ENUM_ENTRY;
    public static final ln6 EXPRESSION;
    public static final ln6 FIELD;
    public static final ln6 FILE;
    public static final ln6 FUNCTION;
    public static final ln6 INITIALIZER;
    public static final ln6 INTERFACE;
    public static final ln6 LAMBDA_EXPRESSION;
    public static final ln6 LOCAL_CLASS;
    public static final ln6 LOCAL_FUNCTION;
    public static final ln6 LOCAL_VARIABLE;
    public static final ln6 MEMBER_FUNCTION;
    public static final ln6 MEMBER_PROPERTY;
    public static final ln6 MEMBER_PROPERTY_WITHOUT_FIELD_OR_DELEGATE;
    public static final ln6 MEMBER_PROPERTY_WITH_BACKING_FIELD;
    public static final ln6 MEMBER_PROPERTY_WITH_DELEGATE;
    public static final ln6 OBJECT;
    public static final ln6 OBJECT_LITERAL;
    public static final ln6 PROPERTY;
    public static final ln6 PROPERTY_GETTER;
    public static final ln6 PROPERTY_PARAMETER;
    public static final ln6 PROPERTY_SETTER;
    public static final ln6 STANDALONE_OBJECT;
    public static final ln6 STAR_PROJECTION;
    public static final ln6 TOP_LEVEL_FUNCTION;
    public static final ln6 TOP_LEVEL_PROPERTY;
    public static final ln6 TOP_LEVEL_PROPERTY_WITHOUT_FIELD_OR_DELEGATE;
    public static final ln6 TOP_LEVEL_PROPERTY_WITH_BACKING_FIELD;
    public static final ln6 TOP_LEVEL_PROPERTY_WITH_DELEGATE;
    public static final ln6 TYPE;
    public static final ln6 TYPEALIAS;
    public static final ln6 TYPE_PARAMETER;
    public static final ln6 TYPE_PROJECTION;
    public static final ln6 VALUE_PARAMETER;
    public static final HashMap b;
    public static final /* synthetic */ ln6[] c;
    public static final /* synthetic */ i04 d;
    public final boolean a;

    public ln6(int i, String str, boolean z) {
        this.a = z;
    }

    public static g04 getEntries() {
        return d;
    }

    public static ln6 valueOf(String str) {
        return (ln6) Enum.valueOf(ln6.class, str);
    }

    public static ln6[] values() {
        return (ln6[]) c.clone();
    }

    static {
        ln6 ln6Var = new ln6(0, "CLASS", true);
        CLASS = ln6Var;
        ln6 ln6Var2 = new ln6(1, "ANNOTATION_CLASS", true);
        ANNOTATION_CLASS = ln6Var2;
        ln6 ln6Var3 = new ln6(2, "TYPE_PARAMETER", false);
        TYPE_PARAMETER = ln6Var3;
        ln6 ln6Var4 = new ln6(3, "PROPERTY", true);
        PROPERTY = ln6Var4;
        ln6 ln6Var5 = new ln6(4, "FIELD", true);
        FIELD = ln6Var5;
        ln6 ln6Var6 = new ln6(5, "LOCAL_VARIABLE", true);
        LOCAL_VARIABLE = ln6Var6;
        ln6 ln6Var7 = new ln6(6, "VALUE_PARAMETER", true);
        VALUE_PARAMETER = ln6Var7;
        ln6 ln6Var8 = new ln6(7, "CONSTRUCTOR", true);
        CONSTRUCTOR = ln6Var8;
        ln6 ln6Var9 = new ln6(8, "FUNCTION", true);
        FUNCTION = ln6Var9;
        ln6 ln6Var10 = new ln6(9, "PROPERTY_GETTER", true);
        PROPERTY_GETTER = ln6Var10;
        ln6 ln6Var11 = new ln6(10, "PROPERTY_SETTER", true);
        PROPERTY_SETTER = ln6Var11;
        ln6 ln6Var12 = new ln6(11, CredentialProviderBaseController.TYPE_TAG, false);
        TYPE = ln6Var12;
        ln6 ln6Var13 = new ln6(12, "EXPRESSION", false);
        EXPRESSION = ln6Var13;
        ln6 ln6Var14 = new ln6(13, "FILE", false);
        FILE = ln6Var14;
        ln6 ln6Var15 = new ln6(14, "TYPEALIAS", false);
        TYPEALIAS = ln6Var15;
        ln6 ln6Var16 = new ln6(15, "TYPE_PROJECTION", false);
        TYPE_PROJECTION = ln6Var16;
        ln6 ln6Var17 = new ln6(16, "STAR_PROJECTION", false);
        STAR_PROJECTION = ln6Var17;
        ln6 ln6Var18 = new ln6(17, "PROPERTY_PARAMETER", false);
        PROPERTY_PARAMETER = ln6Var18;
        ln6 ln6Var19 = new ln6(18, ZVsviyDAr.sjvDH, false);
        CLASS_ONLY = ln6Var19;
        ln6 ln6Var20 = new ln6(19, "OBJECT", false);
        OBJECT = ln6Var20;
        ln6 ln6Var21 = new ln6(20, "STANDALONE_OBJECT", false);
        STANDALONE_OBJECT = ln6Var21;
        ln6 ln6Var22 = new ln6(21, "COMPANION_OBJECT", false);
        COMPANION_OBJECT = ln6Var22;
        ln6 ln6Var23 = new ln6(22, "INTERFACE", false);
        INTERFACE = ln6Var23;
        ln6 ln6Var24 = new ln6(23, "ENUM_CLASS", false);
        ENUM_CLASS = ln6Var24;
        ln6 ln6Var25 = new ln6(24, "ENUM_ENTRY", false);
        ENUM_ENTRY = ln6Var25;
        ln6 ln6Var26 = new ln6(25, "LOCAL_CLASS", false);
        LOCAL_CLASS = ln6Var26;
        ln6 ln6Var27 = new ln6(26, "LOCAL_FUNCTION", false);
        LOCAL_FUNCTION = ln6Var27;
        ln6 ln6Var28 = new ln6(27, "MEMBER_FUNCTION", false);
        MEMBER_FUNCTION = ln6Var28;
        ln6 ln6Var29 = new ln6(28, "TOP_LEVEL_FUNCTION", false);
        TOP_LEVEL_FUNCTION = ln6Var29;
        ln6 ln6Var30 = new ln6(29, "MEMBER_PROPERTY", false);
        MEMBER_PROPERTY = ln6Var30;
        ln6 ln6Var31 = new ln6(30, "MEMBER_PROPERTY_WITH_BACKING_FIELD", false);
        MEMBER_PROPERTY_WITH_BACKING_FIELD = ln6Var31;
        ln6 ln6Var32 = new ln6(31, "MEMBER_PROPERTY_WITH_DELEGATE", false);
        MEMBER_PROPERTY_WITH_DELEGATE = ln6Var32;
        ln6 ln6Var33 = new ln6(32, "MEMBER_PROPERTY_WITHOUT_FIELD_OR_DELEGATE", false);
        MEMBER_PROPERTY_WITHOUT_FIELD_OR_DELEGATE = ln6Var33;
        ln6 ln6Var34 = new ln6(33, "TOP_LEVEL_PROPERTY", false);
        TOP_LEVEL_PROPERTY = ln6Var34;
        ln6 ln6Var35 = new ln6(34, "TOP_LEVEL_PROPERTY_WITH_BACKING_FIELD", false);
        TOP_LEVEL_PROPERTY_WITH_BACKING_FIELD = ln6Var35;
        ln6 ln6Var36 = new ln6(35, "TOP_LEVEL_PROPERTY_WITH_DELEGATE", false);
        TOP_LEVEL_PROPERTY_WITH_DELEGATE = ln6Var36;
        ln6 ln6Var37 = new ln6(36, "TOP_LEVEL_PROPERTY_WITHOUT_FIELD_OR_DELEGATE", false);
        TOP_LEVEL_PROPERTY_WITHOUT_FIELD_OR_DELEGATE = ln6Var37;
        ln6 ln6Var38 = new ln6(37, "BACKING_FIELD", true);
        BACKING_FIELD = ln6Var38;
        ln6 ln6Var39 = new ln6(38, "INITIALIZER", false);
        INITIALIZER = ln6Var39;
        ln6 ln6Var40 = new ln6(39, "DESTRUCTURING_DECLARATION", false);
        DESTRUCTURING_DECLARATION = ln6Var40;
        ln6 ln6Var41 = new ln6(40, "LAMBDA_EXPRESSION", false);
        LAMBDA_EXPRESSION = ln6Var41;
        ln6 ln6Var42 = new ln6(41, "ANONYMOUS_FUNCTION", false);
        ANONYMOUS_FUNCTION = ln6Var42;
        ln6 ln6Var43 = new ln6(42, "OBJECT_LITERAL", false);
        OBJECT_LITERAL = ln6Var43;
        ln6[] ln6VarArr = {ln6Var, ln6Var2, ln6Var3, ln6Var4, ln6Var5, ln6Var6, ln6Var7, ln6Var8, ln6Var9, ln6Var10, ln6Var11, ln6Var12, ln6Var13, ln6Var14, ln6Var15, ln6Var16, ln6Var17, ln6Var18, ln6Var19, ln6Var20, ln6Var21, ln6Var22, ln6Var23, ln6Var24, ln6Var25, ln6Var26, ln6Var27, ln6Var28, ln6Var29, ln6Var30, ln6Var31, ln6Var32, ln6Var33, ln6Var34, ln6Var35, ln6Var36, ln6Var37, ln6Var38, ln6Var39, ln6Var40, ln6Var41, ln6Var42, ln6Var43};
        c = ln6VarArr;
        d = new i04(ln6VarArr);
        Companion = new kn6();
        b = new HashMap();
        k1 k1Var = (k1) getEntries();
        k1Var.getClass();
        h1 h1Var = new h1(0, k1Var);
        while (h1Var.hasNext()) {
            ln6 ln6Var44 = (ln6) h1Var.next();
            b.put(ln6Var44.name(), ln6Var44);
        }
        g04 entries = getEntries();
        ArrayList arrayList = new ArrayList();
        for (Object obj : entries) {
            if (((ln6) obj).a) {
                arrayList.add(obj);
            }
        }
        bu1.q1(arrayList);
        bu1.q1(getEntries());
        ln6 ln6Var45 = CLASS;
        d46.R(ANNOTATION_CLASS, ln6Var45);
        d46.R(LOCAL_CLASS, ln6Var45);
        d46.R(CLASS_ONLY, ln6Var45);
        ln6 ln6Var46 = OBJECT;
        d46.R(COMPANION_OBJECT, ln6Var46, ln6Var45);
        d46.R(STANDALONE_OBJECT, ln6Var46, ln6Var45);
        d46.R(INTERFACE, ln6Var45);
        d46.R(ENUM_CLASS, ln6Var45);
        ln6 ln6Var47 = PROPERTY;
        ln6 ln6Var48 = FIELD;
        d46.R(ENUM_ENTRY, ln6Var47, ln6Var48);
        ln6 ln6Var49 = PROPERTY_SETTER;
        d46.Q(ln6Var49);
        ln6 ln6Var50 = PROPERTY_GETTER;
        d46.Q(ln6Var50);
        d46.Q(FUNCTION);
        ln6 ln6Var51 = FILE;
        d46.Q(ln6Var51);
        gy gyVar = gy.CONSTRUCTOR_PARAMETER;
        ln6 ln6Var52 = VALUE_PARAMETER;
        ei7.Q(new f09(gyVar, ln6Var52), new f09(gy.FIELD, ln6Var48), new f09(gy.PROPERTY, ln6Var47), new f09(gy.FILE, ln6Var51), new f09(gy.PROPERTY_GETTER, ln6Var50), new f09(gy.PROPERTY_SETTER, ln6Var49), new f09(gy.RECEIVER, ln6Var52), new f09(gy.SETTER_PARAMETER, ln6Var52), new f09(gy.PROPERTY_DELEGATE_FIELD, ln6Var48));
    }
}
