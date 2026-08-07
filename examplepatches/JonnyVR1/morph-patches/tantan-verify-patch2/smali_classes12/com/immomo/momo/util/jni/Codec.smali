.class public Lcom/immomo/momo/util/jni/Codec;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static _bits:I = 0x0

.field private static _bytes:I = 0x0

.field private static _numDigits:I = 0x0

.field private static acct:Ljava/lang/String; = null

.field private static final emu_str:Ljava/lang/String; = "android+momo+"

.field private static hacc:Ljava/lang/String;

.field private static mccc:Ljava/lang/String;

.field private static pacc:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Ll/k0f;->a()Ll/vsl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "mjni"

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/vsl;->loadLibrary(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "momoenc"

    .line 20
    .line 21
    const-string v2, "loadLibrary :%b"

    .line 22
    .line 23
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    sput-object v0, Lcom/immomo/momo/util/jni/Codec;->hacc:Ljava/lang/String;

    .line 28
    .line 29
    sput-object v0, Lcom/immomo/momo/util/jni/Codec;->pacc:Ljava/lang/String;

    .line 30
    .line 31
    sput-object v0, Lcom/immomo/momo/util/jni/Codec;->acct:Ljava/lang/String;

    .line 32
    .line 33
    sput-object v0, Lcom/immomo/momo/util/jni/Codec;->mccc:Ljava/lang/String;

    .line 34
    .line 35
    const/16 v0, 0x80

    .line 36
    .line 37
    sput v0, Lcom/immomo/momo/util/jni/Codec;->_bits:I

    .line 38
    .line 39
    div-int/lit8 v0, v0, 0x8

    .line 40
    .line 41
    sput v0, Lcom/immomo/momo/util/jni/Codec;->_bytes:I

    .line 42
    .line 43
    div-int/lit8 v0, v0, 0x8

    .line 44
    .line 45
    sput v0, Lcom/immomo/momo/util/jni/Codec;->_numDigits:I

    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native Dse()Ljava/lang/String;
.end method

.method public static native aaa()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native acct()Ljava/lang/String;
.end method

.method private static native aec([BII)[B
.end method

.method public static native bbb()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method private static native bd3ms(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native coo()Ljava/lang/String;
.end method

.method public static native dbu()Ljava/lang/String;
.end method

.method public static native ddd(Ljava/lang/Object;)Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native dde()Ljava/lang/String;
.end method

.method public static native dm()Ljava/lang/String;
.end method

.method public static native dma()Ljava/lang/String;
.end method

.method public static native dmo()Ljava/lang/String;
.end method

.method public static native dr()Ljava/lang/String;
.end method

.method public static native ds()Ljava/lang/String;
.end method

.method public static native du()Ljava/lang/String;
.end method

.method public static native eee()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native eferfer43rwfe(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native em()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native etr968ww()Ljava/lang/String;
.end method

.method public static native ewfer45te()[Ljava/lang/String;
.end method

.method public static native ewfet4fwesdegrhrtr(Ljava/lang/Object;II)I
.end method

.method public static native fff()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native gdwititwie(Ljava/lang/Object;I)[B
.end method

.method public static native generate([B[B)Z
.end method

.method public static native ggg()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native gvk()Ljava/lang/String;
.end method

.method public static native hacc()Ljava/lang/String;
.end method

.method public static native hewsdrwe(I)Ljava/lang/String;
.end method

.method public static native hfdwefher()Ljava/lang/String;
.end method

.method public static native hhh()I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native iii()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native iiou(I)Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method private static native isEmulator()Z
.end method

.method public static native jjj(Ljava/lang/Object;)Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native kjlagfyutsb45(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
.end method

.method public static native kkk()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native kwiwek(I)Ljava/lang/String;
.end method

.method public static native lll()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native loiwq(I)Ljava/lang/String;
.end method

.method public static native lsn()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method private static native lueo19(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native lwjey(I)Ljava/lang/String;
.end method

.method public static native mccc()Ljava/lang/String;
.end method

.method public static native mksi18sjmmig(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native mm()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method private static native mmacc([BII)[B
.end method

.method public static native mmm()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native mmsdwaa(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)[B
.end method

.method public static native njaei(Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public static native nnn()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native ooo()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native opq()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native oqhyn(Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public static native pacc()Ljava/lang/String;
.end method

.method public static native ppp()Ljava/lang/String;
.end method

.method public static native qqq()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native rrr()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native rscccc()Ljava/lang/String;
.end method

.method public static native saa()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native sdfe3434w()[Ljava/lang/String;
.end method

.method public static native sdwwewfe22qasf()Ljava/lang/String;
.end method

.method public static native secret([B[B[BI)I
.end method

.method public static native signature([B[B[BI)I
.end method

.method public static native sss()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native sssl()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native uuu()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public static native verifySignature([B[B[BI)Z
.end method

.method public static native wfer68()Ljava/lang/String;
.end method

.method public static native wfergfe(I)Ljava/lang/String;
.end method

.method public static native wfertreg4s(I)Ljava/lang/String;
.end method

.method public static native xkdkas(JLjava/lang/String;Landroid/content/Context;)[B
.end method

.method public static native xxilss()Ljava/lang/String;
.end method

.method public static native xxmmlloopp()I
.end method

.method public static native xxx()Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
