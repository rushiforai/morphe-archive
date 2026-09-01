package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bwa {
    public static final bwa INTERNAL_ERROR;
    public static final bwa INVALID_ACTION;
    public static final bwa INVALID_KEYTYPE;
    public static final bwa INVALID_PACKAGE_NAME;
    public static final bwa INVALID_SITEKEY;
    public static final bwa INVALID_TIMEOUT;
    public static final bwa NETWORK_ERROR;
    public static final bwa NO_NETWORK_FOUND;
    public static final bwa UNKNOWN_ERROR;
    public static final /* synthetic */ bwa[] c;
    public static final /* synthetic */ i04 d;
    public final int a;
    public final String b;

    static {
        bwa bwaVar = new bwa("UNKNOWN_ERROR", 0, 0, "Unknown Error");
        UNKNOWN_ERROR = bwaVar;
        bwa bwaVar2 = new bwa("NETWORK_ERROR", 1, 1, "Network Error");
        NETWORK_ERROR = bwaVar2;
        bwa bwaVar3 = new bwa("INVALID_SITEKEY", 2, 2, "Site key invalid");
        INVALID_SITEKEY = bwaVar3;
        bwa bwaVar4 = new bwa("INVALID_KEYTYPE", 3, 3, "Key type invalid");
        INVALID_KEYTYPE = bwaVar4;
        bwa bwaVar5 = new bwa("INVALID_PACKAGE_NAME", 4, 4, "Package name not allowed");
        INVALID_PACKAGE_NAME = bwaVar5;
        bwa bwaVar6 = new bwa("INVALID_ACTION", 5, 5, "Invalid action name, may only include alphanumeric characters like [A-Z], [a-z], [0-9], / and _. Do not include user-specific information");
        INVALID_ACTION = bwaVar6;
        bwa bwaVar7 = new bwa("INVALID_TIMEOUT", 6, 6, "Invalid timeout, minimum value is 5_000L milliseconds");
        INVALID_TIMEOUT = bwaVar7;
        bwa bwaVar8 = new bwa("NO_NETWORK_FOUND", 7, 7, "No network found on device");
        NO_NETWORK_FOUND = bwaVar8;
        bwa bwaVar9 = new bwa("INTERNAL_ERROR", 8, 100, "Internal Error");
        INTERNAL_ERROR = bwaVar9;
        bwa[] bwaVarArr = {bwaVar, bwaVar2, bwaVar3, bwaVar4, bwaVar5, bwaVar6, bwaVar7, bwaVar8, bwaVar9};
        c = bwaVarArr;
        d = new i04(bwaVarArr);
    }

    public bwa(String str, int i, int i2, String str2) {
        this.a = i2;
        this.b = str2;
    }

    public static g04 getEntries() {
        return d;
    }

    public static bwa valueOf(String str) {
        return (bwa) Enum.valueOf(bwa.class, str);
    }

    public static bwa[] values() {
        return (bwa[]) c.clone();
    }

    public final int getErrorCode() {
        return this.a;
    }

    public final String getErrorMessage() {
        return this.b;
    }
}
