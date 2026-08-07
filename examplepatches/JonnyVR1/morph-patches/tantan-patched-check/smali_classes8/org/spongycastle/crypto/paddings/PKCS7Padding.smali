.class public Lorg/spongycastle/crypto/paddings/PKCS7Padding;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/paddings/BlockCipherPadding;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addPadding([BI)I
    .locals 1

    .line 1
    array-length p0, p1

    .line 2
    sub-int/2addr p0, p2

    .line 3
    int-to-byte p0, p0

    .line 4
    :goto_0
    array-length v0, p1

    .line 5
    if-ge p2, v0, :cond_0

    .line 6
    .line 7
    aput-byte p0, p1, p2

    .line 8
    .line 9
    add-int/lit8 p2, p2, 0x1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return p0
.end method

.method public getPaddingName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "PKCS7"

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Ljava/security/SecureRandom;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    return-void
.end method

.method public padCount([B)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x1

    .line 3
    sub-int/2addr p0, v0

    .line 4
    aget-byte p0, p1, p0

    .line 5
    .line 6
    and-int/lit16 p0, p0, 0xff

    .line 7
    .line 8
    int-to-byte v1, p0

    .line 9
    array-length v2, p1

    .line 10
    const/4 v3, 0x0

    .line 11
    if-le p0, v2, :cond_0

    .line 12
    .line 13
    move v2, v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v2, v3

    .line 16
    :goto_0
    if-nez p0, :cond_1

    .line 17
    .line 18
    move v4, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move v4, v3

    .line 21
    :goto_1
    or-int/2addr v2, v4

    .line 22
    move v4, v3

    .line 23
    :goto_2
    array-length v5, p1

    .line 24
    if-ge v4, v5, :cond_4

    .line 25
    .line 26
    array-length v5, p1

    .line 27
    sub-int/2addr v5, v4

    .line 28
    if-gt v5, p0, :cond_2

    .line 29
    .line 30
    move v5, v0

    .line 31
    goto :goto_3

    .line 32
    :cond_2
    move v5, v3

    .line 33
    :goto_3
    aget-byte v6, p1, v4

    .line 34
    .line 35
    if-eq v6, v1, :cond_3

    .line 36
    .line 37
    move v6, v0

    .line 38
    goto :goto_4

    .line 39
    :cond_3
    move v6, v3

    .line 40
    :goto_4
    and-int/2addr v5, v6

    .line 41
    or-int/2addr v2, v5

    .line 42
    add-int/lit8 v4, v4, 0x1

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_4
    if-nez v2, :cond_5

    .line 46
    .line 47
    return p0

    .line 48
    :cond_5
    const-string p0, "pad block corrupted"

    .line 49
    .line 50
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return v3
.end method
