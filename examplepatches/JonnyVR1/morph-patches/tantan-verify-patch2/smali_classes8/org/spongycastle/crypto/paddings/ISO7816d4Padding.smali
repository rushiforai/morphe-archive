.class public Lorg/spongycastle/crypto/paddings/ISO7816d4Padding;
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
    const/16 v0, -0x80

    .line 4
    .line 5
    aput-byte v0, p1, p2

    .line 6
    .line 7
    :goto_0
    add-int/lit8 p2, p2, 0x1

    .line 8
    .line 9
    array-length v0, p1

    .line 10
    if-ge p2, v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    aput-byte v0, p1, p2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return p0
.end method

.method public getPaddingName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ISO7816-4"

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    array-length p0, p1

    .line 2
    add-int/lit8 p0, p0, -0x1

    .line 3
    .line 4
    :goto_0
    if-lez p0, :cond_0

    .line 5
    .line 6
    aget-byte v0, p1, p0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    add-int/lit8 p0, p0, -0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    aget-byte v0, p1, p0

    .line 14
    .line 15
    const/16 v1, -0x80

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    array-length p1, p1

    .line 20
    sub-int/2addr p1, p0

    .line 21
    return p1

    .line 22
    :cond_1
    const-string p0, "pad block corrupted"

    .line 23
    .line 24
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return p0
.end method
