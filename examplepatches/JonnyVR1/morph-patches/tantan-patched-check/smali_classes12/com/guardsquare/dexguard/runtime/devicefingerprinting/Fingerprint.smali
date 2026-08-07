.class public Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static ˋ:I = 0x1

.field private static ˏ:I


# instance fields
.field private final ˎ:[B

.field private final ॱ:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>([BZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˎ:[B

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ॱ:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public asBytes()[B
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˋ:I

    .line 2
    .line 3
    or-int/lit8 v1, v0, 0x35

    .line 4
    .line 5
    shl-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    xor-int/lit8 v0, v0, 0x35

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    rem-int/lit16 v1, v1, 0x80

    .line 11
    .line 12
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˏ:I

    .line 13
    .line 14
    iget-object p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˎ:[B

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x19

    .line 17
    .line 18
    rem-int/lit16 v0, v1, 0x80

    .line 19
    .line 20
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˋ:I

    .line 21
    .line 22
    rem-int/lit8 v1, v1, 0x2

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    throw p0
.end method

.method public isValid()Z
    .locals 2

    .line 1
    sget v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˋ:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x73

    .line 4
    .line 5
    rem-int/lit16 v0, v0, 0x80

    .line 6
    .line 7
    sput v0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˏ:I

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ॱ:Z

    .line 10
    .line 11
    and-int/lit8 v1, v0, 0x21

    .line 12
    .line 13
    or-int/lit8 v0, v0, 0x21

    .line 14
    .line 15
    add-int/2addr v1, v0

    .line 16
    rem-int/lit16 v1, v1, 0x80

    .line 17
    .line 18
    sput v1, Lcom/guardsquare/dexguard/runtime/devicefingerprinting/Fingerprint;->ˋ:I

    .line 19
    .line 20
    return p0
.end method
