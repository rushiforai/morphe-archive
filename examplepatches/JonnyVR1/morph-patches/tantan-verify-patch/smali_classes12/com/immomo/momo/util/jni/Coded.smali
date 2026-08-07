.class public Lcom/immomo/momo/util/jni/Coded;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ENC_OUTPUT_TYPE_AES_DEC:I = 0x2

.field public static final ENC_OUTPUT_TYPE_AES_ENC:I = 0x1

.field public static final ENC_OUTPUT_TYPE_ECDH_SHARED_SECRET:I = 0x3

.field public static final ENC_OUTPUT_TYPE_GROUP_CURVE192:I = 0x5

.field public static final ENC_OUTPUT_TYPE_KEY_CURVE192:I = 0x7

.field public static final ENC_OUTPUT_TYPE_PUBLIC_KEY_CURVE192:I = 0x6

.field public static final ENC_OUTPUT_TYPE_SHA1_OUTPUT:I = 0x4

.field private static final SHA_DIGEST_LENGTH:I = 0x14

.field private static instance:Lcom/immomo/momo/util/jni/Coded;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-boolean v0, Ll/m1;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/k0f;->a()Ll/vsl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "testcoded"

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ll/vsl;->loadLibrary(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/k0f;->a()Ll/vsl;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "mmcrypto"

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ll/vsl;->loadLibrary(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/k0f;->a()Ll/vsl;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "mmssl"

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/vsl;->loadLibrary(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/k0f;->a()Ll/vsl;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "coded"

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ll/vsl;->loadLibrary(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/k0f;->a()Ll/vsl;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "coded_jni"

    .line 47
    .line 48
    invoke-interface {v0, v1}, Ll/vsl;->loadLibrary(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native g234cpu43xc([BI[BII)I
.end method


# virtual methods
.method public native a49kdEba83h([BI[BI[B)I
.end method

.method public native a9ehcDdu3j8([BI[BI[B)I
.end method

.method public native bsuh37Dhjaw([B[B)I
.end method

.method public native c789Sju7G87([B[BI[B)I
.end method

.method public native csjh7OhLe86(II)I
.end method

.method public native g7673Shg3P9(II)[B
.end method

.method public native ggug8Shj3S0(II)[B
.end method

.method public native s729dS782nGoo([B[BII)I
.end method

.method public native sdbyecbu37x([B[B[BI)I
.end method
