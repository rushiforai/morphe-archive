.class public final Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationParameters;


# static fields
.field private static final UNUSED_R:I = 0x20


# instance fields
.field private final fixedInputData:[B

.field private final ki:[B

.field private final r:I

.field private final useCounter:Z


# direct methods
.method private constructor <init>([B[BIZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->ki:[B

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    new-array p1, p1, [B

    .line 17
    .line 18
    iput-object p1, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->fixedInputData:[B

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->fixedInputData:[B

    .line 26
    .line 27
    :goto_0
    const/16 p1, 0x8

    .line 28
    .line 29
    if-eq p3, p1, :cond_2

    .line 30
    .line 31
    const/16 p1, 0x10

    .line 32
    .line 33
    if-eq p3, p1, :cond_2

    .line 34
    .line 35
    const/16 p1, 0x18

    .line 36
    .line 37
    if-eq p3, p1, :cond_2

    .line 38
    .line 39
    const/16 p1, 0x20

    .line 40
    .line 41
    if-ne p3, p1, :cond_1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const-string p0, "Length of counter should be 8, 16, 24 or 32"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw v0

    .line 50
    :cond_2
    :goto_1
    iput p3, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->r:I

    .line 51
    .line 52
    iput-boolean p4, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->useCounter:Z

    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    const-string p0, "A KDF requires Ki (a seed) as input"

    .line 56
    .line 57
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw v0
.end method

.method public static createWithCounter([B[BI)Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p0, p1, p2, v1}, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;-><init>([B[BIZ)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static createWithoutCounter([B[B)Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;

    .line 2
    .line 3
    const/16 v1, 0x20

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, p0, p1, v1, v2}, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;-><init>([B[BIZ)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getFixedInputData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->fixedInputData:[B

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
    iget-object p0, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->ki:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getR()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public useCounter()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/crypto/params/KDFDoublePipelineIterationParameters;->useCounter:Z

    .line 2
    .line 3
    return p0
.end method
