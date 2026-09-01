package defpackage;

import com.drew.imaging.riff.pvS.uuLAxLN;
import com.medium.android.admin.stagebranch.uG.peNPu;
import pushnotifications.SY.eoLmc;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'EF0' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class utf {
    public static final utf[] b;
    public static final /* synthetic */ utf[] c;
    public static final utf zza;
    public static final utf zzb;
    public final int a;

    /* JADX INFO: Fake field, exist only in values array */
    utf EF0;

    public utf(String str, int i, int i2, vtf vtfVar, euf eufVar) {
        this.a = i2;
        int iOrdinal = vtfVar.ordinal();
        if (iOrdinal == 1 || iOrdinal == 3) {
            eufVar.zza();
        }
        if (vtfVar == vtf.zza) {
            int i3 = ttf.a[eufVar.ordinal()];
        }
    }

    public static utf[] values() {
        return (utf[]) c.clone();
    }

    public final int zza() {
        return this.a;
    }

    static {
        vtf vtfVar = vtf.zza;
        euf eufVar = euf.DOUBLE;
        utf utfVar = new utf("DOUBLE", 0, 0, vtfVar, eufVar);
        euf eufVar2 = euf.zzd;
        utf utfVar2 = new utf("FLOAT", 1, 1, vtfVar, eufVar2);
        euf eufVar3 = euf.LONG;
        utf utfVar3 = new utf("INT64", 2, 2, vtfVar, eufVar3);
        utf utfVar4 = new utf("UINT64", 3, 3, vtfVar, eufVar3);
        euf eufVar4 = euf.INT;
        utf utfVar5 = new utf(eoLmc.VJIV, 4, 4, vtfVar, eufVar4);
        utf utfVar6 = new utf("FIXED64", 5, 5, vtfVar, eufVar3);
        utf utfVar7 = new utf("FIXED32", 6, 6, vtfVar, eufVar4);
        euf eufVar5 = euf.BOOLEAN;
        utf utfVar8 = new utf("BOOL", 7, 7, vtfVar, eufVar5);
        euf eufVar6 = euf.STRING;
        utf utfVar9 = new utf("STRING", 8, 8, vtfVar, eufVar6);
        euf eufVar7 = euf.MESSAGE;
        utf utfVar10 = new utf("MESSAGE", 9, 9, vtfVar, eufVar7);
        euf eufVar8 = euf.BYTE_STRING;
        utf utfVar11 = new utf("BYTES", 10, 10, vtfVar, eufVar8);
        utf utfVar12 = new utf("UINT32", 11, 11, vtfVar, eufVar4);
        euf eufVar9 = euf.ENUM;
        utf utfVar13 = new utf("ENUM", 12, 12, vtfVar, eufVar9);
        utf utfVar14 = new utf("SFIXED32", 13, 13, vtfVar, eufVar4);
        utf utfVar15 = new utf("SFIXED64", 14, 14, vtfVar, eufVar3);
        utf utfVar16 = new utf("SINT32", 15, 15, vtfVar, eufVar4);
        utf utfVar17 = new utf("SINT64", 16, 16, vtfVar, eufVar3);
        utf utfVar18 = new utf("GROUP", 17, 17, vtfVar, eufVar7);
        vtf vtfVar2 = vtf.zzb;
        utf utfVar19 = new utf("DOUBLE_LIST", 18, 18, vtfVar2, eufVar);
        utf utfVar20 = new utf("FLOAT_LIST", 19, 19, vtfVar2, eufVar2);
        utf utfVar21 = new utf("INT64_LIST", 20, 20, vtfVar2, eufVar3);
        utf utfVar22 = new utf("UINT64_LIST", 21, 21, vtfVar2, eufVar3);
        utf utfVar23 = new utf("INT32_LIST", 22, 22, vtfVar2, eufVar4);
        utf utfVar24 = new utf("FIXED64_LIST", 23, 23, vtfVar2, eufVar3);
        utf utfVar25 = new utf("FIXED32_LIST", 24, 24, vtfVar2, eufVar4);
        utf utfVar26 = new utf("BOOL_LIST", 25, 25, vtfVar2, eufVar5);
        utf utfVar27 = new utf("STRING_LIST", 26, 26, vtfVar2, eufVar6);
        utf utfVar28 = new utf("MESSAGE_LIST", 27, 27, vtfVar2, eufVar7);
        utf utfVar29 = new utf("BYTES_LIST", 28, 28, vtfVar2, eufVar8);
        utf utfVar30 = new utf("UINT32_LIST", 29, 29, vtfVar2, eufVar4);
        utf utfVar31 = new utf(peNPu.rgkl, 30, 30, vtfVar2, eufVar9);
        utf utfVar32 = new utf("SFIXED32_LIST", 31, 31, vtfVar2, eufVar4);
        utf utfVar33 = new utf("SFIXED64_LIST", 32, 32, vtfVar2, eufVar3);
        utf utfVar34 = new utf("SINT32_LIST", 33, 33, vtfVar2, eufVar4);
        utf utfVar35 = new utf("SINT64_LIST", 34, 34, vtfVar2, eufVar3);
        vtf vtfVar3 = vtf.zzc;
        utf utfVar36 = new utf("DOUBLE_LIST_PACKED", 35, 35, vtfVar3, eufVar);
        zza = utfVar36;
        utf utfVar37 = new utf("FLOAT_LIST_PACKED", 36, 36, vtfVar3, eufVar2);
        utf utfVar38 = new utf("INT64_LIST_PACKED", 37, 37, vtfVar3, eufVar3);
        utf utfVar39 = new utf("UINT64_LIST_PACKED", 38, 38, vtfVar3, eufVar3);
        utf utfVar40 = new utf("INT32_LIST_PACKED", 39, 39, vtfVar3, eufVar4);
        utf utfVar41 = new utf("FIXED64_LIST_PACKED", 40, 40, vtfVar3, eufVar3);
        utf utfVar42 = new utf("FIXED32_LIST_PACKED", 41, 41, vtfVar3, eufVar4);
        utf utfVar43 = new utf("BOOL_LIST_PACKED", 42, 42, vtfVar3, eufVar5);
        utf utfVar44 = new utf("UINT32_LIST_PACKED", 43, 43, vtfVar3, eufVar4);
        utf utfVar45 = new utf("ENUM_LIST_PACKED", 44, 44, vtfVar3, eufVar9);
        utf utfVar46 = new utf(uuLAxLN.LUtgqpnTzWP, 45, 45, vtfVar3, eufVar4);
        utf utfVar47 = new utf("SFIXED64_LIST_PACKED", 46, 46, vtfVar3, eufVar3);
        utf utfVar48 = new utf("SINT32_LIST_PACKED", 47, 47, vtfVar3, eufVar4);
        utf utfVar49 = new utf("SINT64_LIST_PACKED", 48, 48, vtfVar3, eufVar3);
        zzb = utfVar49;
        c = new utf[]{utfVar, utfVar2, utfVar3, utfVar4, utfVar5, utfVar6, utfVar7, utfVar8, utfVar9, utfVar10, utfVar11, utfVar12, utfVar13, utfVar14, utfVar15, utfVar16, utfVar17, utfVar18, utfVar19, utfVar20, utfVar21, utfVar22, utfVar23, utfVar24, utfVar25, utfVar26, utfVar27, utfVar28, utfVar29, utfVar30, utfVar31, utfVar32, utfVar33, utfVar34, utfVar35, utfVar36, utfVar37, utfVar38, utfVar39, utfVar40, utfVar41, utfVar42, utfVar43, utfVar44, utfVar45, utfVar46, utfVar47, utfVar48, utfVar49, new utf("GROUP_LIST", 49, 49, vtfVar2, eufVar7), new utf("MAP", 50, 50, vtf.zzd, euf.VOID)};
        utf[] utfVarArrValues = values();
        b = new utf[utfVarArrValues.length];
        for (utf utfVar50 : utfVarArrValues) {
            b[utfVar50.a] = utfVar50;
        }
    }
}
