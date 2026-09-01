package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class d93 {
    public static final /* synthetic */ int a = 0;

    static {
        new y05("kotlin.jvm.JvmName");
    }

    public static /* synthetic */ void a(int i) {
        String str;
        int i2;
        switch (i) {
            case 4:
            case 7:
            case 9:
            case 10:
            case 12:
            case 22:
            case 40:
            case 42:
            case 43:
            case 47:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 59:
            case 61:
            case 62:
            case 64:
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
            case 75:
            case 82:
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
            case 85:
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
            case 93:
            case 95:
                str = "@NotNull method %s.%s must not return null";
                break;
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 4:
            case 7:
            case 9:
            case 10:
            case 12:
            case 22:
            case 40:
            case 42:
            case 43:
            case 47:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 59:
            case 61:
            case 62:
            case 64:
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
            case 75:
            case 82:
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
            case 85:
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
            case 93:
            case 95:
                i2 = 2;
                break;
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 5:
            case 6:
            case 8:
            case 11:
            case 13:
            case 14:
            case 15:
            case 21:
            case 23:
            case 24:
            case 34:
            case 35:
            case 36:
            case 57:
            case 58:
            case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
            case 63:
            case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
            case 94:
                objArr[0] = "descriptor";
                break;
            case 4:
            case 7:
            case 9:
            case 10:
            case 12:
            case 22:
            case 40:
            case 42:
            case 43:
            case 47:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 59:
            case 61:
            case 62:
            case 64:
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
            case 75:
            case 82:
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
            case 85:
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
            case 93:
            case 95:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/resolve/DescriptorUtils";
                break;
            case 16:
                objArr[0] = "first";
                break;
            case 17:
                objArr[0] = "second";
                break;
            case 18:
            case 19:
                objArr[0] = "aClass";
                break;
            case 20:
                objArr[0] = "kotlinType";
                break;
            case 25:
                objArr[0] = "declarationDescriptor";
                break;
            case 26:
            case 28:
                objArr[0] = "subClass";
                break;
            case 27:
            case 29:
            case 33:
                objArr[0] = "superClass";
                break;
            case 30:
            case 32:
            case 45:
            case 66:
                objArr[0] = "type";
                break;
            case 31:
                objArr[0] = "other";
                break;
            case 37:
                objArr[0] = "classKind";
                break;
            case 38:
            case 39:
            case 41:
            case 44:
            case 48:
            case 54:
            case 67:
            case 68:
            case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
            case 76:
            case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                objArr[0] = "classDescriptor";
                break;
            case 46:
                objArr[0] = "typeConstructor";
                break;
            case 55:
                objArr[0] = "innerClassName";
                break;
            case 56:
                objArr[0] = "location";
                break;
            case 65:
                objArr[0] = "variable";
                break;
            case 70:
                objArr[0] = "f";
                break;
            case 72:
                objArr[0] = "current";
                break;
            case 73:
                objArr[0] = "result";
                break;
            case 74:
                objArr[0] = "memberDescriptor";
                break;
            case 78:
            case 79:
            case 80:
                objArr[0] = "annotated";
                break;
            case 84:
            case 86:
            case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
            case 91:
                objArr[0] = "scope";
                break;
            case 87:
            case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
            case 92:
                objArr[0] = "name";
                break;
            default:
                objArr[0] = "containingDeclaration";
                break;
        }
        switch (i) {
            case 4:
                objArr[1] = "getFqNameSafe";
                break;
            case 7:
                objArr[1] = "getFqNameUnsafe";
                break;
            case 9:
            case 10:
                objArr[1] = "getFqNameFromTopLevelClass";
                break;
            case 12:
                objArr[1] = "getClassIdForNonLocalClass";
                break;
            case 22:
                objArr[1] = "getContainingModule";
                break;
            case 40:
                objArr[1] = "getSuperclassDescriptors";
                break;
            case 42:
            case 43:
                objArr[1] = "getSuperClassType";
                break;
            case 47:
                objArr[1] = "getClassDescriptorForTypeConstructor";
                break;
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
                objArr[1] = "getDefaultConstructorVisibility";
                break;
            case 59:
                objArr[1] = "unwrapFakeOverride";
                break;
            case 61:
            case 62:
                objArr[1] = "unwrapSubstitutionOverride";
                break;
            case 64:
                objArr[1] = "unwrapFakeOverrideToAnyDeclaration";
                break;
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                objArr[1] = "getAllOverriddenDescriptors";
                break;
            case 75:
                objArr[1] = "getAllOverriddenDeclarations";
                break;
            case 82:
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                objArr[1] = "getContainingSourceFile";
                break;
            case 85:
                objArr[1] = "getAllDescriptors";
                break;
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                objArr[1] = "getFunctionByName";
                break;
            case 93:
                objArr[1] = "getPropertyByName";
                break;
            case 95:
                objArr[1] = "getDirectMember";
                break;
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/resolve/DescriptorUtils";
                break;
        }
        switch (i) {
            case 1:
                objArr[2] = "isLocal";
                break;
            case 2:
                objArr[2] = "getFqName";
                break;
            case 3:
                objArr[2] = "getFqNameSafe";
                break;
            case 4:
            case 7:
            case 9:
            case 10:
            case 12:
            case 22:
            case 40:
            case 42:
            case 43:
            case 47:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 59:
            case 61:
            case 62:
            case 64:
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
            case 75:
            case 82:
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
            case 85:
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
            case 93:
            case 95:
                break;
            case 5:
                objArr[2] = "getFqNameSafeIfPossible";
                break;
            case 6:
                objArr[2] = "getFqNameUnsafe";
                break;
            case 8:
                objArr[2] = "getFqNameFromTopLevelClass";
                break;
            case 11:
                objArr[2] = "getClassIdForNonLocalClass";
                break;
            case 13:
                objArr[2] = "isExtension";
                break;
            case 14:
                objArr[2] = "isOverride";
                break;
            case 15:
                objArr[2] = "isStaticDeclaration";
                break;
            case 16:
            case 17:
                objArr[2] = "areInSameModule";
                break;
            case 18:
            case 19:
                objArr[2] = "getParentOfType";
                break;
            case 20:
            case 23:
                objArr[2] = "getContainingModuleOrNull";
                break;
            case 21:
                objArr[2] = "getContainingModule";
                break;
            case 24:
                objArr[2] = "getContainingClass";
                break;
            case 25:
                objArr[2] = "isAncestor";
                break;
            case 26:
            case 27:
                objArr[2] = "isDirectSubclass";
                break;
            case 28:
            case 29:
                objArr[2] = "isSubclass";
                break;
            case 30:
            case 31:
                objArr[2] = "isSameClass";
                break;
            case 32:
            case 33:
                objArr[2] = "isSubtypeOfClass";
                break;
            case 34:
                objArr[2] = "isAnonymousObject";
                break;
            case 35:
                objArr[2] = "isAnonymousFunction";
                break;
            case 36:
                objArr[2] = "isEnumEntry";
                break;
            case 37:
                objArr[2] = "isKindOf";
                break;
            case 38:
                objArr[2] = "hasAbstractMembers";
                break;
            case 39:
                objArr[2] = "getSuperclassDescriptors";
                break;
            case 41:
                objArr[2] = "getSuperClassType";
                break;
            case 44:
                objArr[2] = "getSuperClassDescriptor";
                break;
            case 45:
                objArr[2] = "getClassDescriptorForType";
                break;
            case 46:
                objArr[2] = "getClassDescriptorForTypeConstructor";
                break;
            case 48:
                objArr[2] = "getDefaultConstructorVisibility";
                break;
            case 54:
            case 55:
            case 56:
                objArr[2] = "getInnerClassByName";
                break;
            case 57:
                objArr[2] = "isStaticNestedClass";
                break;
            case 58:
                objArr[2] = "unwrapFakeOverride";
                break;
            case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                objArr[2] = "unwrapSubstitutionOverride";
                break;
            case 63:
                objArr[2] = "unwrapFakeOverrideToAnyDeclaration";
                break;
            case 65:
            case 66:
                objArr[2] = "shouldRecordInitializerForProperty";
                break;
            case 67:
                objArr[2] = "classCanHaveAbstractFakeOverride";
                break;
            case 68:
                objArr[2] = "classCanHaveAbstractDeclaration";
                break;
            case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                objArr[2] = "classCanHaveOpenMembers";
                break;
            case 70:
                objArr[2] = "getAllOverriddenDescriptors";
                break;
            case 72:
            case 73:
                objArr[2] = "collectAllOverriddenDescriptors";
                break;
            case 74:
                objArr[2] = "getAllOverriddenDeclarations";
                break;
            case 76:
                objArr[2] = "isSingletonOrAnonymousObject";
                break;
            case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                objArr[2] = "canHaveDeclaredConstructors";
                break;
            case 78:
                objArr[2] = "getJvmName";
                break;
            case 79:
                objArr[2] = "findJvmNameAnnotation";
                break;
            case 80:
                objArr[2] = "hasJvmNameAnnotation";
                break;
            case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
                objArr[2] = "getContainingSourceFile";
                break;
            case 84:
                objArr[2] = "getAllDescriptors";
                break;
            case 86:
            case 87:
                objArr[2] = "getFunctionByName";
                break;
            case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
            case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                objArr[2] = "getFunctionByNameOrNull";
                break;
            case 91:
            case 92:
                objArr[2] = "getPropertyByName";
                break;
            case 94:
                objArr[2] = "getDirectMember";
                break;
            default:
                objArr[2] = "getDispatchReceiverParameterIfNeeded";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 4:
            case 7:
            case 9:
            case 10:
            case 12:
            case 22:
            case 40:
            case 42:
            case 43:
            case 47:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 59:
            case 61:
            case 62:
            case 64:
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
            case 75:
            case 82:
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
            case 85:
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
            case 93:
            case 95:
                throw new IllegalStateException(str2);
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    public static void b(c41 c41Var, LinkedHashSet linkedHashSet) {
        if (c41Var == null) {
            a(72);
            throw null;
        }
        if (linkedHashSet.contains(c41Var)) {
            return;
        }
        Iterator it2 = c41Var.x0().i().iterator();
        while (it2.hasNext()) {
            c41 c41VarX0 = ((c41) it2.next()).x0();
            b(c41VarX0, linkedHashSet);
            linkedHashSet.add(c41VarX0);
        }
    }

    public static y28 c(mn6 mn6Var) {
        if (mn6Var == null) {
            a(45);
            throw null;
        }
        zvd zvdVarJ0 = mn6Var.j0();
        if (zvdVarJ0 == null) {
            a(46);
            throw null;
        }
        y28 y28Var = (y28) zvdVarJ0.a();
        if (y28Var != null) {
            return y28Var;
        }
        a(47);
        throw null;
    }

    public static b38 d(yv2 yv2Var) {
        if (yv2Var == null) {
            a(21);
            throw null;
        }
        b38 b38VarE = e(yv2Var);
        if (b38VarE != null) {
            return b38VarE;
        }
        a(22);
        throw null;
    }

    public static b38 e(yv2 yv2Var) {
        if (yv2Var == null) {
            a(23);
            throw null;
        }
        while (yv2Var != null) {
            if (yv2Var instanceof b38) {
                return (b38) yv2Var;
            }
            if (yv2Var instanceof rv6) {
                return ((rv6) yv2Var).d;
            }
            yv2Var = yv2Var.h();
        }
        return null;
    }

    public static no3 f(yv2 yv2Var) {
        no3 no3Var = no3.h;
        if (yv2Var == null) {
            a(81);
            throw null;
        }
        if (yv2Var instanceof x4a) {
            yv2Var = ((x4a) yv2Var).i;
        }
        if (yv2Var instanceof aw2) {
            ((aw2) yv2Var).d().getClass();
        }
        return no3Var;
    }

    public static z05 g(yv2 yv2Var) {
        if (yv2Var != null) {
            y05 y05VarH = h(yv2Var);
            return y05VarH != null ? y05VarH.a : g(yv2Var.h()).a(yv2Var.getName());
        }
        a(2);
        throw null;
    }

    public static y05 h(yv2 yv2Var) {
        if (yv2Var == null) {
            a(5);
            throw null;
        }
        if ((yv2Var instanceof b38) || l24.f(yv2Var)) {
            return y05.c;
        }
        if (yv2Var instanceof rv6) {
            return ((rv6) yv2Var).e;
        }
        if (yv2Var instanceof wx8) {
            return ((xx8) ((wx8) yv2Var)).f;
        }
        return null;
    }

    public static yv2 i(yv2 yv2Var, Class cls, boolean z) {
        if (yv2Var == null) {
            return null;
        }
        if (z) {
            yv2Var = yv2Var.h();
        }
        while (yv2Var != null) {
            if (cls.isInstance(yv2Var)) {
                return yv2Var;
            }
            yv2Var = yv2Var.h();
        }
        return null;
    }

    public static y28 j(y28 y28Var) {
        if (y28Var == null) {
            a(44);
            throw null;
        }
        Iterator it2 = y28Var.n().b().iterator();
        while (it2.hasNext()) {
            y28 y28VarC = c((mn6) it2.next());
            if (y28VarC.b0() != qn1.INTERFACE) {
                return y28VarC;
            }
        }
        return null;
    }

    public static boolean k(yv2 yv2Var) {
        return m(yv2Var, qn1.CLASS) && yv2Var.getName().equals(olc.a);
    }

    public static boolean l(yv2 yv2Var) {
        return m(yv2Var, qn1.OBJECT) && ((y28) yv2Var).q0();
    }

    public static boolean m(yv2 yv2Var, qn1 qn1Var) {
        if (qn1Var != null) {
            return (yv2Var instanceof y28) && ((y28) yv2Var).b0() == qn1Var;
        }
        a(37);
        throw null;
    }

    public static boolean n(yv2 yv2Var) {
        if (yv2Var == null) {
            a(1);
            throw null;
        }
        while (yv2Var != null) {
            if (k(yv2Var) || ((yv2Var instanceof dw2) && ((dw2) yv2Var).getVisibility() == h93.f)) {
                return true;
            }
            yv2Var = yv2Var.h();
        }
        return false;
    }

    public static boolean o(mn6 mn6Var, yv2 yv2Var) {
        if (mn6Var == null) {
            a(30);
            throw null;
        }
        if (yv2Var == null) {
            a(31);
            throw null;
        }
        co1 co1VarA = mn6Var.j0().a();
        if (co1VarA == null) {
            return false;
        }
        yv2 yv2VarX0 = co1VarA.x0();
        return (yv2VarX0 instanceof co1) && (yv2Var instanceof co1) && ((co1) yv2Var).n().equals(((co1) yv2VarX0).n());
    }

    public static boolean p(yv2 yv2Var) {
        return (m(yv2Var, qn1.CLASS) || m(yv2Var, qn1.INTERFACE)) && ((y28) yv2Var).o() == c28.SEALED;
    }

    public static boolean q(mn6 mn6Var, yv2 yv2Var) {
        if (mn6Var == null) {
            a(32);
            throw null;
        }
        if (yv2Var == null) {
            a(33);
            throw null;
        }
        if (o(mn6Var, yv2Var)) {
            return true;
        }
        Iterator it2 = mn6Var.j0().b().iterator();
        while (it2.hasNext()) {
            if (q((mn6) it2.next(), yv2Var)) {
                return true;
            }
        }
        return false;
    }

    public static boolean r(yv2 yv2Var) {
        return yv2Var != null && (yv2Var.h() instanceof wx8);
    }

    public static f41 s(f41 f41Var) {
        while (f41Var.j() == e41.FAKE_OVERRIDE) {
            Collection collectionI = f41Var.i();
            if (collectionI.isEmpty()) {
                ik4.o("Fake override should have at least one overridden descriptor: ", f41Var);
                return null;
            }
            f41Var = (f41) collectionI.iterator().next();
        }
        return f41Var;
    }
}
