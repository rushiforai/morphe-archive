.class public Lorg/spongycastle/crypto/tls/UseSRTPData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected mki:[B

.field protected protectionProfiles:[I


# direct methods
.method public constructor <init>([I[B)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    array-length v1, p1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-lt v1, v2, :cond_2

    .line 10
    .line 11
    array-length v1, p1

    .line 12
    const v2, 0x8000

    .line 13
    .line 14
    .line 15
    if-ge v1, v2, :cond_2

    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    sget-object p2, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    array-length v1, p2

    .line 23
    const/16 v2, 0xff

    .line 24
    .line 25
    if-gt v1, v2, :cond_1

    .line 26
    .line 27
    :goto_0
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->protectionProfiles:[I

    .line 28
    .line 29
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->mki:[B

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const-string p0, "\'mki\' cannot be longer than 255 bytes"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw v0

    .line 38
    :cond_2
    const-string p0, "\'protectionProfiles\' must have length from 1 to (2^15 - 1)"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw v0
.end method


# virtual methods
.method public getMki()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->mki:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtectionProfiles()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->protectionProfiles:[I

    .line 2
    .line 3
    return-object p0
.end method
