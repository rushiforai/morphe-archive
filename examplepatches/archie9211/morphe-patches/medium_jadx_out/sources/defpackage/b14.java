package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b14 {
    public static final b14 CANCEL;
    public static final b14 COMPRESSION_ERROR;
    public static final b14 CONNECT_ERROR;
    public static final x04 Companion;
    public static final b14 ENHANCE_YOUR_CALM;
    public static final b14 FLOW_CONTROL_ERROR;
    public static final b14 FRAME_SIZE_ERROR;
    public static final b14 HTTP_1_1_REQUIRED;
    public static final b14 INADEQUATE_SECURITY;
    public static final b14 INTERNAL_ERROR;
    public static final b14 NO_ERROR;
    public static final b14 PROTOCOL_ERROR;
    public static final b14 REFUSED_STREAM;
    public static final b14 SETTINGS_TIMEOUT;
    public static final b14 STREAM_CLOSED;
    public static final /* synthetic */ b14[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        b14 b14Var = new b14("NO_ERROR", 0, 0);
        NO_ERROR = b14Var;
        b14 b14Var2 = new b14("PROTOCOL_ERROR", 1, 1);
        PROTOCOL_ERROR = b14Var2;
        b14 b14Var3 = new b14("INTERNAL_ERROR", 2, 2);
        INTERNAL_ERROR = b14Var3;
        b14 b14Var4 = new b14("FLOW_CONTROL_ERROR", 3, 3);
        FLOW_CONTROL_ERROR = b14Var4;
        b14 b14Var5 = new b14("SETTINGS_TIMEOUT", 4, 4);
        SETTINGS_TIMEOUT = b14Var5;
        b14 b14Var6 = new b14("STREAM_CLOSED", 5, 5);
        STREAM_CLOSED = b14Var6;
        b14 b14Var7 = new b14("FRAME_SIZE_ERROR", 6, 6);
        FRAME_SIZE_ERROR = b14Var7;
        b14 b14Var8 = new b14("REFUSED_STREAM", 7, 7);
        REFUSED_STREAM = b14Var8;
        b14 b14Var9 = new b14("CANCEL", 8, 8);
        CANCEL = b14Var9;
        b14 b14Var10 = new b14("COMPRESSION_ERROR", 9, 9);
        COMPRESSION_ERROR = b14Var10;
        b14 b14Var11 = new b14("CONNECT_ERROR", 10, 10);
        CONNECT_ERROR = b14Var11;
        b14 b14Var12 = new b14("ENHANCE_YOUR_CALM", 11, 11);
        ENHANCE_YOUR_CALM = b14Var12;
        b14 b14Var13 = new b14("INADEQUATE_SECURITY", 12, 12);
        INADEQUATE_SECURITY = b14Var13;
        b14 b14Var14 = new b14("HTTP_1_1_REQUIRED", 13, 13);
        HTTP_1_1_REQUIRED = b14Var14;
        b14[] b14VarArr = {b14Var, b14Var2, b14Var3, b14Var4, b14Var5, b14Var6, b14Var7, b14Var8, b14Var9, b14Var10, b14Var11, b14Var12, b14Var13, b14Var14};
        b = b14VarArr;
        c = new i04(b14VarArr);
        Companion = new x04();
    }

    public b14(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static b14 valueOf(String str) {
        return (b14) Enum.valueOf(b14.class, str);
    }

    public static b14[] values() {
        return (b14[]) b.clone();
    }

    public final int getHttpCode() {
        return this.a;
    }
}
