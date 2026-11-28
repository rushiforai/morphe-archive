.class Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
.super Ljava/lang/Object;
.source "ExifInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/exifinterface/media/ExifInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExifAttribute"
.end annotation


# static fields
.field public static final BYTES_OFFSET_UNKNOWN:J = -0x1L


# instance fields
.field public final bytes:[B

.field public final bytesOffset:J

.field public final format:I

.field public final numberOfComponents:I


# direct methods
.method constructor <init>(IIJ[B)V
    .registers 6

    .line 3260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3261
    iput p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->format:I

    .line 3262
    iput p2, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    .line 3263
    iput-wide p3, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytesOffset:J

    .line 3264
    iput-object p5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    return-void
.end method

.method constructor <init>(II[B)V
    .registers 10

    const-wide/16 v3, -0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v5, p3

    .line 3257
    invoke-direct/range {v0 .. v5}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(IIJ[B)V

    return-void
.end method

.method public static createByte(Ljava/lang/String;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 6

    .line 3307
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x31

    if-gt v2, v4, :cond_0

    .line 3308
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    sub-int/2addr p0, v3

    int-to-byte p0, p0

    new-array v2, v1, [B

    aput-byte p0, v2, v0

    .line 3309
    new-instance p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    invoke-direct {p0, v1, v1, v2}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object p0

    .line 3311
    :cond_0
    # getter for: Landroidx/exifinterface/media/ExifInterface;->ASCII:Ljava/nio/charset/Charset;
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$100()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 3312
    new-instance v0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    array-length v2, p0

    invoke-direct {v0, v1, v2, p0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object v0
.end method

.method public static createDouble([DLjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 7

    .line 3348
    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$000()[I

    move-result-object v0

    const/16 v1, 0xc

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    .line 3347
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 3349
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3350
    array-length p1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    aget-wide v3, p0, v2

    .line 3351
    invoke-virtual {v0, v3, v4}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3353
    :cond_0
    new-instance p1, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    array-length p0, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-direct {p1, v1, p0, v0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object p1
.end method

.method public static createSLong([ILjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 6

    .line 3297
    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$000()[I

    move-result-object v0

    const/16 v1, 0x9

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    .line 3296
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 3298
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3299
    array-length p1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    aget v3, p0, v2

    .line 3300
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3302
    :cond_0
    new-instance p1, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    array-length p0, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-direct {p1, v1, p0, v0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object p1
.end method

.method public static createSRational([Landroidx/exifinterface/media/ExifInterface$Rational;Ljava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 8

    .line 3337
    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$000()[I

    move-result-object v0

    const/16 v1, 0xa

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    .line 3336
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 3338
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3339
    array-length p1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    aget-object v3, p0, v2

    .line 3340
    iget-wide v4, v3, Landroidx/exifinterface/media/ExifInterface$Rational;->numerator:J

    long-to-int v4, v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 3341
    iget-wide v3, v3, Landroidx/exifinterface/media/ExifInterface$Rational;->denominator:J

    long-to-int v3, v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3343
    :cond_0
    new-instance p1, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    array-length p0, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-direct {p1, v1, p0, v0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object p1
.end method

.method public static createString(Ljava/lang/String;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 4

    .line 3316
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    # getter for: Landroidx/exifinterface/media/ExifInterface;->ASCII:Ljava/nio/charset/Charset;
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$100()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 3317
    new-instance v0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    const/4 v1, 0x2

    array-length v2, p0

    invoke-direct {v0, v1, v2, p0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object v0
.end method

.method public static createULong(JLjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 5

    const/4 v0, 0x1

    .line 3292
    new-array v0, v0, [J

    const/4 v1, 0x0

    aput-wide p0, v0, v1

    invoke-static {v0, p2}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->createULong([JLjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    move-result-object p0

    return-object p0
.end method

.method public static createULong([JLjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 7

    .line 3283
    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$000()[I

    move-result-object v0

    const/4 v1, 0x4

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    .line 3282
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 3284
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3285
    array-length p1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    aget-wide v3, p0, v2

    long-to-int v3, v3

    .line 3286
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3288
    :cond_0
    new-instance p1, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    array-length p0, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-direct {p1, v1, p0, v0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object p1
.end method

.method public static createURational(Landroidx/exifinterface/media/ExifInterface$Rational;Ljava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 4

    const/4 v0, 0x1

    .line 3332
    new-array v0, v0, [Landroidx/exifinterface/media/ExifInterface$Rational;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0, p1}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->createURational([Landroidx/exifinterface/media/ExifInterface$Rational;Ljava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    move-result-object p0

    return-object p0
.end method

.method public static createURational([Landroidx/exifinterface/media/ExifInterface$Rational;Ljava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 8

    .line 3322
    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$000()[I

    move-result-object v0

    const/4 v1, 0x5

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    .line 3321
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 3323
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3324
    array-length p1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    aget-object v3, p0, v2

    .line 3325
    iget-wide v4, v3, Landroidx/exifinterface/media/ExifInterface$Rational;->numerator:J

    long-to-int v4, v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 3326
    iget-wide v3, v3, Landroidx/exifinterface/media/ExifInterface$Rational;->denominator:J

    long-to-int v3, v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3328
    :cond_0
    new-instance p1, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    array-length p0, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-direct {p1, v1, p0, v0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object p1
.end method

.method public static createUShort(ILjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 2

    .line 3278
    filled-new-array {p0}, [I

    move-result-object p0

    invoke-static {p0, p1}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->createUShort([ILjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    move-result-object p0

    return-object p0
.end method

.method public static createUShort([ILjava/nio/ByteOrder;)Landroidx/exifinterface/media/ExifInterface$ExifAttribute;
    .registers 6

    .line 3269
    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$000()[I

    move-result-object v0

    const/4 v1, 0x3

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    .line 3268
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 3270
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3271
    array-length p1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    aget v3, p0, v2

    int-to-short v3, v3

    .line 3272
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3274
    :cond_0
    new-instance p1, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;

    array-length p0, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-direct {p1, v1, p0, v0}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;-><init>(II[B)V

    return-object p1
.end method


# virtual methods
.method public getDoubleValue(Ljava/nio/ByteOrder;)D
    .registers 5

    .line 3484
    invoke-virtual {p0, p1}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_9

    .line 3488
    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 3489
    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    return-wide p0

    .line 3491
    :cond_0
    instance-of p1, p0, [J

    const/4 v0, 0x0

    const-string v1, "There are more than one component"

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    .line 3492
    check-cast p0, [J

    .line 3493
    array-length p1, p0

    if-ne p1, v2, :cond_1

    .line 3494
    aget-wide p0, p0, v0

    long-to-double p0, p0

    return-wide p0

    .line 3496
    :cond_1
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3498
    :cond_2
    instance-of p1, p0, [I

    if-eqz p1, :cond_4

    .line 3499
    check-cast p0, [I

    .line 3500
    array-length p1, p0

    if-ne p1, v2, :cond_3

    .line 3501
    aget p0, p0, v0

    int-to-double p0, p0

    return-wide p0

    .line 3503
    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3505
    :cond_4
    instance-of p1, p0, [D

    if-eqz p1, :cond_6

    .line 3506
    check-cast p0, [D

    .line 3507
    array-length p1, p0

    if-ne p1, v2, :cond_5

    .line 3508
    aget-wide p0, p0, v0

    return-wide p0

    .line 3510
    :cond_5
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3512
    :cond_6
    instance-of p1, p0, [Landroidx/exifinterface/media/ExifInterface$Rational;

    if-eqz p1, :cond_8

    .line 3513
    check-cast p0, [Landroidx/exifinterface/media/ExifInterface$Rational;

    .line 3514
    array-length p1, p0

    if-ne p1, v2, :cond_7

    .line 3515
    aget-object p0, p0, v0

    invoke-virtual {p0}, Landroidx/exifinterface/media/ExifInterface$Rational;->calculate()D

    move-result-wide p0

    return-wide p0

    .line 3517
    :cond_7
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3519
    :cond_8
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string p1, "Couldn\'t find a double value"

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3486
    :cond_9
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string p1, "NULL can\'t be converted to a double value"

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getIntValue(Ljava/nio/ByteOrder;)I
    .registers 5

    .line 3523
    invoke-virtual {p0, p1}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_5

    .line 3527
    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 3528
    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    .line 3530
    :cond_0
    instance-of p1, p0, [J

    const/4 v0, 0x0

    const-string v1, "There are more than one component"

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    .line 3531
    check-cast p0, [J

    .line 3532
    array-length p1, p0

    if-ne p1, v2, :cond_1

    .line 3533
    aget-wide p0, p0, v0

    long-to-int p0, p0

    return p0

    .line 3535
    :cond_1
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3537
    :cond_2
    instance-of p1, p0, [I

    if-eqz p1, :cond_4

    .line 3538
    check-cast p0, [I

    .line 3539
    array-length p1, p0

    if-ne p1, v2, :cond_3

    .line 3540
    aget p0, p0, v0

    return p0

    .line 3542
    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3544
    :cond_4
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string p1, "Couldn\'t find a integer value"

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3525
    :cond_5
    new-instance p0, Ljava/lang/NumberFormatException;

    const-string p1, "NULL can\'t be converted to a integer value"

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getStringValue(Ljava/nio/ByteOrder;)Ljava/lang/String;
    .registers 8

    .line 3548
    invoke-virtual {p0, p1}, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    if-nez p0, :cond_0

    return-object p1

    .line 3552
    :cond_0
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 3553
    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 3556
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3557
    instance-of v1, p0, [J

    const-string v2, ","

    const/4 v3, 0x0

    if-eqz v1, :cond_4

    .line 3558
    check-cast p0, [J

    .line 3559
    :cond_2
    :goto_0
    array-length p1, p0

    if-ge v3, p1, :cond_3

    .line 3560
    aget-wide v4, p0, v3

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    .line 3561
    array-length p1, p0

    if-eq v3, p1, :cond_2

    .line 3562
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 3565
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 3567
    :cond_4
    instance-of v1, p0, [I

    if-eqz v1, :cond_7

    .line 3568
    check-cast p0, [I

    .line 3569
    :cond_5
    :goto_1
    array-length p1, p0

    if-ge v3, p1, :cond_6

    .line 3570
    aget p1, p0, v3

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    .line 3571
    array-length p1, p0

    if-eq v3, p1, :cond_5

    .line 3572
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 3575
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 3577
    :cond_7
    instance-of v1, p0, [D

    if-eqz v1, :cond_a

    .line 3578
    check-cast p0, [D

    .line 3579
    :cond_8
    :goto_2
    array-length p1, p0

    if-ge v3, p1, :cond_9

    .line 3580
    aget-wide v4, p0, v3

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    .line 3581
    array-length p1, p0

    if-eq v3, p1, :cond_8

    .line 3582
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 3585
    :cond_9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 3587
    :cond_a
    instance-of v1, p0, [Landroidx/exifinterface/media/ExifInterface$Rational;

    if-eqz v1, :cond_d

    .line 3588
    check-cast p0, [Landroidx/exifinterface/media/ExifInterface$Rational;

    .line 3589
    :cond_b
    :goto_3
    array-length p1, p0

    if-ge v3, p1, :cond_c

    .line 3590
    aget-object p1, p0, v3

    iget-wide v4, p1, Landroidx/exifinterface/media/ExifInterface$Rational;->numerator:J

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p1, 0x2f

    .line 3591
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3592
    aget-object p1, p0, v3

    iget-wide v4, p1, Landroidx/exifinterface/media/ExifInterface$Rational;->denominator:J

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    .line 3593
    array-length p1, p0

    if-eq v3, p1, :cond_b

    .line 3594
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 3597
    :cond_c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_d
    return-object p1
.end method

.method getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;
    .registers 14

    .line 3362
    const-string v1, "IOException occurred while closing InputStream"

    const-string v2, "ExifInterface"

    const/4 v3, 0x0

    .line 3364
    :try_start_0
    new-instance v4, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;

    iget-object v0, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    invoke-direct {v4, v0}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3365
    :try_start_1
    invoke-virtual {v4, p1}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    .line 3366
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->format:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    .line 3475
    :try_start_2
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    return-object v3

    .line 3460
    :pswitch_0
    :try_start_3
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [D

    .line 3461
    :goto_0
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3462
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readDouble()D

    move-result-wide v5

    aput-wide v5, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3453
    :pswitch_1
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [D

    .line 3454
    :goto_1
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3455
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readFloat()F

    move-result v5

    float-to-double v5, v5

    aput-wide v5, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3444
    :pswitch_2
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [Landroidx/exifinterface/media/ExifInterface$Rational;

    .line 3445
    :goto_2
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3446
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v5

    int-to-long v7, v5

    .line 3447
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v5

    int-to-long v9, v5

    .line 3448
    new-instance v6, Landroidx/exifinterface/media/ExifInterface$Rational;

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Landroidx/exifinterface/media/ExifInterface$Rational;-><init>(JJLandroidx/exifinterface/media/ExifInterface$1;)V

    aput-object v6, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 3437
    :pswitch_3
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [I

    .line 3438
    :goto_3
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3439
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v5

    aput v5, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 3430
    :pswitch_4
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [I

    .line 3431
    :goto_4
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3432
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result v5

    aput v5, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 3421
    :pswitch_5
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [Landroidx/exifinterface/media/ExifInterface$Rational;

    .line 3422
    :goto_5
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3423
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedInt()J

    move-result-wide v7

    .line 3424
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedInt()J

    move-result-wide v9

    .line 3425
    new-instance v6, Landroidx/exifinterface/media/ExifInterface$Rational;

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Landroidx/exifinterface/media/ExifInterface$Rational;-><init>(JJLandroidx/exifinterface/media/ExifInterface$1;)V

    aput-object v6, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 3414
    :pswitch_6
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [J

    .line 3415
    :goto_6
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3416
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedInt()J

    move-result-wide v5

    aput-wide v5, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 3407
    :pswitch_7
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    new-array p1, p1, [I

    .line 3408
    :goto_7
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_5

    .line 3409
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v5

    aput v5, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 3378
    :pswitch_8
    iget p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    # getter for: Landroidx/exifinterface/media/ExifInterface;->EXIF_ASCII_PREFIX:[B
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$300()[B

    move-result-object v5

    array-length v5, v5

    if-lt p1, v5, :cond_1

    move p1, v0

    .line 3380
    :goto_8
    # getter for: Landroidx/exifinterface/media/ExifInterface;->EXIF_ASCII_PREFIX:[B
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$300()[B

    move-result-object v5

    array-length v5, v5

    if-ge p1, v5, :cond_0

    .line 3381
    iget-object v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    aget-byte v5, v5, p1

    # getter for: Landroidx/exifinterface/media/ExifInterface;->EXIF_ASCII_PREFIX:[B
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$300()[B

    move-result-object v6

    aget-byte v6, v6, p1

    if-ne v5, v6, :cond_1

    add-int/lit8 p1, p1, 0x1

    goto :goto_8

    .line 3387
    :cond_0
    # getter for: Landroidx/exifinterface/media/ExifInterface;->EXIF_ASCII_PREFIX:[B
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$300()[B

    move-result-object p1

    array-length v0, p1

    .line 3391
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3392
    :goto_9
    iget v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    if-ge v0, v5, :cond_3

    .line 3393
    iget-object v5, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    aget-byte v5, v5, v0

    if-eqz v5, :cond_3

    const/16 v6, 0x20

    if-lt v5, v6, :cond_2

    int-to-char v5, v5

    .line 3398
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_a

    :cond_2
    const/16 v5, 0x3f

    .line 3400
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 3404
    :cond_3
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 3475
    :try_start_4
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 3477
    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object p0

    .line 3370
    :pswitch_9
    :try_start_5
    iget-object p1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    array-length v5, p1

    const/4 v6, 0x1

    if-ne v5, v6, :cond_4

    aget-byte p1, p1, v0

    if-ltz p1, :cond_4

    if-gt p1, v6, :cond_4

    .line 3371
    new-instance p1, Ljava/lang/String;

    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    aget-byte p0, p0, v0

    add-int/lit8 p0, p0, 0x30

    int-to-char p0, p0

    new-array v5, v6, [C

    aput-char p0, v5, v0

    invoke-direct {p1, v5}, Ljava/lang/String;-><init>([C)V

    goto :goto_b

    .line 3373
    :cond_4
    new-instance p1, Ljava/lang/String;

    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    # getter for: Landroidx/exifinterface/media/ExifInterface;->ASCII:Ljava/nio/charset/Charset;
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$100()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 3475
    :cond_5
    :goto_b
    :try_start_6
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    return-object p1

    :catch_1
    move-exception v0

    move-object p0, v0

    .line 3477
    invoke-static {v2, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object p1

    :catch_2
    move-exception v0

    move-object p0, v0

    invoke-static {v2, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v3

    :catch_3
    move-exception v0

    move-object p0, v0

    goto :goto_c

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_e

    :catch_4
    move-exception v0

    move-object p0, v0

    move-object v4, v3

    .line 3470
    :goto_c
    :try_start_7
    const-string p1, "IOException occurred during reading a value"

    invoke-static {v2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-eqz v4, :cond_6

    .line 3475
    :try_start_8
    invoke-virtual {v4}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_d

    :catch_5
    move-exception v0

    move-object p0, v0

    .line 3477
    invoke-static {v2, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    :goto_d
    return-object v3

    :catchall_1
    move-exception v0

    move-object p0, v0

    move-object v3, v4

    :goto_e
    if-eqz v3, :cond_7

    .line 3475
    :try_start_9
    invoke-virtual {v3}, Landroidx/exifinterface/media/ExifInterface$ByteOrderedDataInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    goto :goto_f

    :catch_6
    move-exception v0

    move-object p1, v0

    .line 3477
    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3480
    :cond_7
    :goto_f
    throw p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_9
        :pswitch_8
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public size()I
    .registers 3

    .line 3603
    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$000()[I

    move-result-object v0

    iget v1, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->format:I

    aget v0, v0, v1

    iget p0, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->numberOfComponents:I

    mul-int/2addr v0, p0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 3358
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # getter for: Landroidx/exifinterface/media/ExifInterface;->IFD_FORMAT_NAMES:[Ljava/lang/String;
    invoke-static {}, Landroidx/exifinterface/media/ExifInterface;->access$200()[Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->format:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", data length:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroidx/exifinterface/media/ExifInterface$ExifAttribute;->bytes:[B

    array-length p0, p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
