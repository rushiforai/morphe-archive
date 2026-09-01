package defpackage;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'zza' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByRegister(EnumVisitor.java:395)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:324)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n4g {
    public static final n4g[] b;
    public static final /* synthetic */ n4g[] c;
    public static final n4g zzA;
    public static final n4g zzB;
    public static final n4g zzC;
    public static final n4g zzD;
    public static final n4g zzE;
    public static final n4g zzF;
    public static final n4g zzG;
    public static final n4g zzH;
    public static final n4g zzI;
    public static final n4g zzJ;
    public static final n4g zzK;
    public static final n4g zzL;
    public static final n4g zzM;
    public static final n4g zzN;
    public static final n4g zzO;
    public static final n4g zzP;
    public static final n4g zzQ;
    public static final n4g zzR;
    public static final n4g zzS;
    public static final n4g zzT;
    public static final n4g zzU;
    public static final n4g zzV;
    public static final n4g zzW;
    public static final n4g zzX;
    public static final n4g zzY;
    public static final n4g zza;
    public static final n4g zzb;
    public static final n4g zzc;
    public static final n4g zzd;
    public static final n4g zze;
    public static final n4g zzf;
    public static final n4g zzg;
    public static final n4g zzh;
    public static final n4g zzi;
    public static final n4g zzj;
    public static final n4g zzk;
    public static final n4g zzl;
    public static final n4g zzm;
    public static final n4g zzn;
    public static final n4g zzo;
    public static final n4g zzp;
    public static final n4g zzq;
    public static final n4g zzr;
    public static final n4g zzs;
    public static final n4g zzt;
    public static final n4g zzu;
    public static final n4g zzv;
    public static final n4g zzw;
    public static final n4g zzx;
    public static final n4g zzy;
    public static final n4g zzz;
    public final int a;

    static {
        z5g z5gVar = z5g.DOUBLE;
        n4g n4gVar = new n4g("DOUBLE", 0, 0, 1, z5gVar);
        zza = n4gVar;
        z5g z5gVar2 = z5g.FLOAT;
        n4g n4gVar2 = new n4g("FLOAT", 1, 1, 1, z5gVar2);
        zzb = n4gVar2;
        z5g z5gVar3 = z5g.LONG;
        n4g n4gVar3 = new n4g("INT64", 2, 2, 1, z5gVar3);
        zzc = n4gVar3;
        n4g n4gVar4 = new n4g("UINT64", 3, 3, 1, z5gVar3);
        zzd = n4gVar4;
        z5g z5gVar4 = z5g.INT;
        n4g n4gVar5 = new n4g("INT32", 4, 4, 1, z5gVar4);
        zze = n4gVar5;
        n4g n4gVar6 = new n4g("FIXED64", 5, 5, 1, z5gVar3);
        zzf = n4gVar6;
        n4g n4gVar7 = new n4g("FIXED32", 6, 6, 1, z5gVar4);
        zzg = n4gVar7;
        z5g z5gVar5 = z5g.BOOLEAN;
        n4g n4gVar8 = new n4g("BOOL", 7, 7, 1, z5gVar5);
        zzh = n4gVar8;
        z5g z5gVar6 = z5g.STRING;
        n4g n4gVar9 = new n4g("STRING", 8, 8, 1, z5gVar6);
        zzi = n4gVar9;
        z5g z5gVar7 = z5g.MESSAGE;
        n4g n4gVar10 = new n4g("MESSAGE", 9, 9, 1, z5gVar7);
        zzj = n4gVar10;
        z5g z5gVar8 = z5g.BYTE_STRING;
        n4g n4gVar11 = new n4g("BYTES", 10, 10, 1, z5gVar8);
        zzk = n4gVar11;
        n4g n4gVar12 = new n4g("UINT32", 11, 11, 1, z5gVar4);
        zzl = n4gVar12;
        z5g z5gVar9 = z5g.ENUM;
        n4g n4gVar13 = new n4g("ENUM", 12, 12, 1, z5gVar9);
        zzm = n4gVar13;
        n4g n4gVar14 = new n4g("SFIXED32", 13, 13, 1, z5gVar4);
        zzn = n4gVar14;
        n4g n4gVar15 = new n4g("SFIXED64", 14, 14, 1, z5gVar3);
        zzo = n4gVar15;
        n4g n4gVar16 = new n4g("SINT32", 15, 15, 1, z5gVar4);
        zzp = n4gVar16;
        n4g n4gVar17 = new n4g("SINT64", 16, 16, 1, z5gVar3);
        zzq = n4gVar17;
        n4g n4gVar18 = new n4g("GROUP", 17, 17, 1, z5gVar7);
        zzr = n4gVar18;
        n4g n4gVar19 = new n4g("DOUBLE_LIST", 18, 18, 2, z5gVar);
        zzs = n4gVar19;
        n4g n4gVar20 = new n4g("FLOAT_LIST", 19, 19, 2, z5gVar2);
        zzt = n4gVar20;
        n4g n4gVar21 = new n4g("INT64_LIST", 20, 20, 2, z5gVar3);
        zzu = n4gVar21;
        n4g n4gVar22 = new n4g("UINT64_LIST", 21, 21, 2, z5gVar3);
        zzv = n4gVar22;
        n4g n4gVar23 = new n4g("INT32_LIST", 22, 22, 2, z5gVar4);
        zzw = n4gVar23;
        n4g n4gVar24 = new n4g("FIXED64_LIST", 23, 23, 2, z5gVar3);
        zzx = n4gVar24;
        n4g n4gVar25 = new n4g("FIXED32_LIST", 24, 24, 2, z5gVar4);
        zzy = n4gVar25;
        n4g n4gVar26 = new n4g("BOOL_LIST", 25, 25, 2, z5gVar5);
        zzz = n4gVar26;
        n4g n4gVar27 = new n4g("STRING_LIST", 26, 26, 2, z5gVar6);
        zzA = n4gVar27;
        n4g n4gVar28 = new n4g("MESSAGE_LIST", 27, 27, 2, z5gVar7);
        zzB = n4gVar28;
        n4g n4gVar29 = new n4g("BYTES_LIST", 28, 28, 2, z5gVar8);
        zzC = n4gVar29;
        n4g n4gVar30 = new n4g("UINT32_LIST", 29, 29, 2, z5gVar4);
        zzD = n4gVar30;
        n4g n4gVar31 = new n4g("ENUM_LIST", 30, 30, 2, z5gVar9);
        zzE = n4gVar31;
        n4g n4gVar32 = new n4g("SFIXED32_LIST", 31, 31, 2, z5gVar4);
        zzF = n4gVar32;
        n4g n4gVar33 = new n4g("SFIXED64_LIST", 32, 32, 2, z5gVar3);
        zzG = n4gVar33;
        n4g n4gVar34 = new n4g("SINT32_LIST", 33, 33, 2, z5gVar4);
        zzH = n4gVar34;
        n4g n4gVar35 = new n4g("SINT64_LIST", 34, 34, 2, z5gVar3);
        zzI = n4gVar35;
        n4g n4gVar36 = new n4g("DOUBLE_LIST_PACKED", 35, 35, 3, z5gVar);
        zzJ = n4gVar36;
        n4g n4gVar37 = new n4g("FLOAT_LIST_PACKED", 36, 36, 3, z5gVar2);
        zzK = n4gVar37;
        n4g n4gVar38 = new n4g("INT64_LIST_PACKED", 37, 37, 3, z5gVar3);
        zzL = n4gVar38;
        n4g n4gVar39 = new n4g("UINT64_LIST_PACKED", 38, 38, 3, z5gVar3);
        zzM = n4gVar39;
        n4g n4gVar40 = new n4g("INT32_LIST_PACKED", 39, 39, 3, z5gVar4);
        zzN = n4gVar40;
        n4g n4gVar41 = new n4g("FIXED64_LIST_PACKED", 40, 40, 3, z5gVar3);
        zzO = n4gVar41;
        n4g n4gVar42 = new n4g("FIXED32_LIST_PACKED", 41, 41, 3, z5gVar4);
        zzP = n4gVar42;
        n4g n4gVar43 = new n4g("BOOL_LIST_PACKED", 42, 42, 3, z5gVar5);
        zzQ = n4gVar43;
        n4g n4gVar44 = new n4g("UINT32_LIST_PACKED", 43, 43, 3, z5gVar4);
        zzR = n4gVar44;
        n4g n4gVar45 = new n4g("ENUM_LIST_PACKED", 44, 44, 3, z5gVar9);
        zzS = n4gVar45;
        n4g n4gVar46 = new n4g("SFIXED32_LIST_PACKED", 45, 45, 3, z5gVar4);
        zzT = n4gVar46;
        n4g n4gVar47 = new n4g("SFIXED64_LIST_PACKED", 46, 46, 3, z5gVar3);
        zzU = n4gVar47;
        n4g n4gVar48 = new n4g("SINT32_LIST_PACKED", 47, 47, 3, z5gVar4);
        zzV = n4gVar48;
        n4g n4gVar49 = new n4g("SINT64_LIST_PACKED", 48, 48, 3, z5gVar3);
        zzW = n4gVar49;
        n4g n4gVar50 = new n4g("GROUP_LIST", 49, 49, 2, z5gVar7);
        zzX = n4gVar50;
        n4g n4gVar51 = new n4g("MAP", 50, 50, 4, z5g.VOID);
        zzY = n4gVar51;
        c = new n4g[]{n4gVar, n4gVar2, n4gVar3, n4gVar4, n4gVar5, n4gVar6, n4gVar7, n4gVar8, n4gVar9, n4gVar10, n4gVar11, n4gVar12, n4gVar13, n4gVar14, n4gVar15, n4gVar16, n4gVar17, n4gVar18, n4gVar19, n4gVar20, n4gVar21, n4gVar22, n4gVar23, n4gVar24, n4gVar25, n4gVar26, n4gVar27, n4gVar28, n4gVar29, n4gVar30, n4gVar31, n4gVar32, n4gVar33, n4gVar34, n4gVar35, n4gVar36, n4gVar37, n4gVar38, n4gVar39, n4gVar40, n4gVar41, n4gVar42, n4gVar43, n4gVar44, n4gVar45, n4gVar46, n4gVar47, n4gVar48, n4gVar49, n4gVar50, n4gVar51};
        n4g[] n4gVarArrValues = values();
        b = new n4g[n4gVarArrValues.length];
        for (n4g n4gVar52 : n4gVarArrValues) {
            b[n4gVar52.a] = n4gVar52;
        }
    }

    public n4g(String str, int i, int i2, int i3, z5g z5gVar) {
        this.a = i2;
        int i4 = i3 - 1;
        if (i4 == 1 || i4 == 3) {
            z5gVar.zza();
        }
        if (i3 == 1) {
            z5g z5gVar2 = z5g.VOID;
            z5gVar.ordinal();
        }
    }

    public static n4g[] values() {
        return (n4g[]) c.clone();
    }

    public final int zza() {
        return this.a;
    }
}
