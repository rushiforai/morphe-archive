.class public final Lorg/spongycastle/crypto/params/KDFCounterParameters;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationParameters;


# instance fields
.field private fixedInputDataCounterPrefix:[B

.field private fixedInputDataCounterSuffix:[B

.field private ki:[B

.field private r:I


# direct methods
.method public constructor <init>([B[BI)V
    .locals 1

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, v0, p2, p3}, Lorg/spongycastle/crypto/params/KDFCounterParameters;-><init>([B[B[BI)V

    return-void
.end method

.method public constructor <init>([B[B[BI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->ki:[B

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    new-array p2, p1, [B

    .line 17
    .line 18
    iput-object p2, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->fixedInputDataCounterPrefix:[B

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iput-object p2, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->fixedInputDataCounterPrefix:[B

    .line 26
    .line 27
    :goto_0
    if-nez p3, :cond_1

    .line 28
    .line 29
    new-array p1, p1, [B

    .line 30
    .line 31
    iput-object p1, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->fixedInputDataCounterSuffix:[B

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-static {p3}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->fixedInputDataCounterSuffix:[B

    .line 39
    .line 40
    :goto_1
    const/16 p1, 0x8

    .line 41
    .line 42
    if-eq p4, p1, :cond_3

    .line 43
    .line 44
    const/16 p1, 0x10

    .line 45
    .line 46
    if-eq p4, p1, :cond_3

    .line 47
    .line 48
    const/16 p1, 0x18

    .line 49
    .line 50
    if-eq p4, p1, :cond_3

    .line 51
    .line 52
    const/16 p1, 0x20

    .line 53
    .line 54
    if-ne p4, p1, :cond_2

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_2
    const-string p0, "Length of counter should be 8, 16, 24 or 32"

    .line 58
    .line 59
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw v0

    .line 63
    :cond_3
    :goto_2
    iput p4, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->r:I

    .line 64
    .line 65
    return-void

    .line 66
    :cond_4
    const-string p0, "A KDF requires Ki (a seed) as input"

    .line 67
    .line 68
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw v0
.end method


# virtual methods
.method public getFixedInputData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->fixedInputDataCounterSuffix:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFixedInputDataCounterPrefix()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->fixedInputDataCounterPrefix:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFixedInputDataCounterSuffix()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->fixedInputDataCounterSuffix:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getKI()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->ki:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getR()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/KDFCounterParameters;->r:I

    .line 2
    .line 3
    return p0
.end method
