.class public final Ll/vc80;
.super Ll/uhw;
.source "SourceFile"


# instance fields
.field private final c:[B

.field private final d:I

.field private final e:I

.field private final f:I

.field private final g:I


# direct methods
.method public constructor <init>([BIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0, p6, p7}, Ll/uhw;-><init>(II)V

    .line 2
    .line 3
    .line 4
    add-int/2addr p6, p4

    .line 5
    if-gt p6, p2, :cond_0

    .line 6
    .line 7
    add-int/2addr p7, p5

    .line 8
    if-gt p7, p3, :cond_0

    .line 9
    .line 10
    iput-object p1, p0, Ll/vc80;->c:[B

    .line 11
    .line 12
    iput p2, p0, Ll/vc80;->d:I

    .line 13
    .line 14
    iput p3, p0, Ll/vc80;->e:I

    .line 15
    .line 16
    iput p4, p0, Ll/vc80;->f:I

    .line 17
    .line 18
    iput p5, p0, Ll/vc80;->g:I

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "Crop rectangle does not fit within image data."

    .line 22
    .line 23
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    throw p0
.end method


# virtual methods
.method public b()[B
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/uhw;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/uhw;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Ll/vc80;->d:I

    .line 10
    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    iget v3, p0, Ll/vc80;->e:I

    .line 14
    .line 15
    if-ne v1, v3, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/vc80;->c:[B

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    mul-int v3, v0, v1

    .line 21
    .line 22
    new-array v4, v3, [B

    .line 23
    .line 24
    iget v5, p0, Ll/vc80;->g:I

    .line 25
    .line 26
    mul-int/2addr v5, v2

    .line 27
    iget v6, p0, Ll/vc80;->f:I

    .line 28
    .line 29
    add-int/2addr v5, v6

    .line 30
    iget-object v6, p0, Ll/vc80;->c:[B

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    if-ne v0, v2, :cond_1

    .line 34
    .line 35
    invoke-static {v6, v5, v4, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    return-object v4

    .line 39
    :cond_1
    :goto_0
    if-ge v7, v1, :cond_2

    .line 40
    .line 41
    mul-int v2, v7, v0

    .line 42
    .line 43
    invoke-static {v6, v5, v4, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    iget v2, p0, Ll/vc80;->d:I

    .line 47
    .line 48
    add-int/2addr v5, v2

    .line 49
    add-int/lit8 v7, v7, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    return-object v4
.end method

.method public c(I[B)[B
    .locals 2

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uhw;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/uhw;->d()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    array-length v1, p2

    .line 16
    if-ge v1, v0, :cond_1

    .line 17
    .line 18
    :cond_0
    new-array p2, v0, [B

    .line 19
    .line 20
    :cond_1
    iget v1, p0, Ll/vc80;->g:I

    .line 21
    .line 22
    add-int/2addr p1, v1

    .line 23
    iget v1, p0, Ll/vc80;->d:I

    .line 24
    .line 25
    mul-int/2addr p1, v1

    .line 26
    iget v1, p0, Ll/vc80;->f:I

    .line 27
    .line 28
    add-int/2addr p1, v1

    .line 29
    iget-object p0, p0, Ll/vc80;->c:[B

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-static {p0, p1, p2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    return-object p2

    .line 36
    :cond_2
    const-string p0, "Requested row is outside the image: "

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public g()Landroid/graphics/Bitmap;
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/uhw;->d()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p0}, Ll/uhw;->a()I

    .line 6
    .line 7
    .line 8
    move-result v7

    .line 9
    mul-int v0, v3, v7

    .line 10
    .line 11
    new-array v1, v0, [I

    .line 12
    .line 13
    iget-object v0, p0, Ll/vc80;->c:[B

    .line 14
    .line 15
    iget v2, p0, Ll/vc80;->g:I

    .line 16
    .line 17
    iget v4, p0, Ll/vc80;->d:I

    .line 18
    .line 19
    mul-int/2addr v2, v4

    .line 20
    iget v4, p0, Ll/vc80;->f:I

    .line 21
    .line 22
    add-int/2addr v2, v4

    .line 23
    const/4 v4, 0x0

    .line 24
    move v5, v4

    .line 25
    :goto_0
    if-ge v5, v7, :cond_1

    .line 26
    .line 27
    mul-int v6, v5, v3

    .line 28
    .line 29
    move v8, v4

    .line 30
    :goto_1
    if-ge v8, v3, :cond_0

    .line 31
    .line 32
    add-int v9, v2, v8

    .line 33
    .line 34
    aget-byte v9, v0, v9

    .line 35
    .line 36
    and-int/lit16 v9, v9, 0xff

    .line 37
    .line 38
    add-int v10, v6, v8

    .line 39
    .line 40
    const v11, 0x10101

    .line 41
    .line 42
    .line 43
    mul-int/2addr v9, v11

    .line 44
    const/high16 v11, -0x1000000

    .line 45
    .line 46
    or-int/2addr v9, v11

    .line 47
    aput v9, v1, v10

    .line 48
    .line 49
    add-int/lit8 v8, v8, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_0
    iget v6, p0, Ll/vc80;->d:I

    .line 53
    .line 54
    add-int/2addr v2, v6

    .line 55
    add-int/lit8 v5, v5, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 59
    .line 60
    invoke-static {v3, v7, p0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v4, 0x0

    .line 65
    const/4 v5, 0x0

    .line 66
    const/4 v2, 0x0

    .line 67
    move v6, v3

    .line 68
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method
