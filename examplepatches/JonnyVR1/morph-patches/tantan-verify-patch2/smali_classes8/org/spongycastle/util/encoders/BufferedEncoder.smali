.class public Lorg/spongycastle/util/encoders/BufferedEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected buf:[B

.field protected bufOff:I

.field protected translator:Lorg/spongycastle/util/encoders/Translator;


# direct methods
.method public constructor <init>(Lorg/spongycastle/util/encoders/Translator;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->translator:Lorg/spongycastle/util/encoders/Translator;

    .line 5
    .line 6
    invoke-interface {p1}, Lorg/spongycastle/util/encoders/Translator;->getEncodedBlockSize()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    rem-int p1, p2, p1

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    new-array p1, p2, [B

    .line 15
    .line 16
    iput-object p1, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->buf:[B

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "buffer size not multiple of input block size"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    throw p0
.end method


# virtual methods
.method public processByte(B[BI)I
    .locals 7

    .line 1
    iget-object v1, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->buf:[B

    .line 2
    .line 3
    iget v0, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 4
    .line 5
    add-int/lit8 v2, v0, 0x1

    .line 6
    .line 7
    iput v2, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 8
    .line 9
    aput-byte p1, v1, v0

    .line 10
    .line 11
    array-length p1, v1

    .line 12
    const/4 v6, 0x0

    .line 13
    if-ne v2, p1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->translator:Lorg/spongycastle/util/encoders/Translator;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    array-length v3, v1

    .line 19
    move-object v4, p2

    .line 20
    move v5, p3

    .line 21
    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/util/encoders/Translator;->encode([BII[BI)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput v6, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 26
    .line 27
    return p1

    .line 28
    :cond_0
    return v6
.end method

.method public processBytes([BII[BI)I
    .locals 10

    .line 1
    if-ltz p3, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->buf:[B

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    iget v2, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 7
    .line 8
    sub-int/2addr v1, v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-le p3, v1, :cond_0

    .line 11
    .line 12
    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    iget-object v4, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->translator:Lorg/spongycastle/util/encoders/Translator;

    .line 16
    .line 17
    iget-object v5, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->buf:[B

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    array-length v7, v5

    .line 21
    move-object v8, p4

    .line 22
    move v9, p5

    .line 23
    invoke-interface/range {v4 .. v9}, Lorg/spongycastle/util/encoders/Translator;->encode([BII[BI)I

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    iput v3, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 28
    .line 29
    sub-int/2addr p3, v1

    .line 30
    add-int v6, p2, v1

    .line 31
    .line 32
    add-int/2addr v9, p4

    .line 33
    iget-object p2, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->buf:[B

    .line 34
    .line 35
    array-length p2, p2

    .line 36
    rem-int p2, p3, p2

    .line 37
    .line 38
    sub-int v7, p3, p2

    .line 39
    .line 40
    iget-object v4, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->translator:Lorg/spongycastle/util/encoders/Translator;

    .line 41
    .line 42
    move-object v5, p1

    .line 43
    invoke-interface/range {v4 .. v9}, Lorg/spongycastle/util/encoders/Translator;->encode([BII[BI)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int v3, p4, p1

    .line 48
    .line 49
    sub-int/2addr p3, v7

    .line 50
    add-int p2, v6, v7

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move-object v5, p1

    .line 54
    :goto_0
    if-eqz p3, :cond_1

    .line 55
    .line 56
    iget-object p1, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->buf:[B

    .line 57
    .line 58
    iget p4, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 59
    .line 60
    invoke-static {v5, p2, p1, p4, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    iget p1, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 64
    .line 65
    add-int/2addr p1, p3

    .line 66
    iput p1, p0, Lorg/spongycastle/util/encoders/BufferedEncoder;->bufOff:I

    .line 67
    .line 68
    :cond_1
    return v3

    .line 69
    :cond_2
    const-string p0, "Can\'t have a negative input length!"

    .line 70
    .line 71
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return p0
.end method
