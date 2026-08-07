.class public abstract Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008 \u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002B\u0005\u00a2\u0006\u0002\u0010\u0003J \u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\u0005H\u0002J%\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000c\u001a\u00028\u00002\u0006\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\rJ\u001f\u0010\u000e\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000c\u001a\u00028\u00002\u0006\u0010\u000f\u001a\u00020\u0007H&\u00a2\u0006\u0002\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;",
        "T",
        "",
        "()V",
        "calculate",
        "",
        "options",
        "Landroid/graphics/BitmapFactory$Options;",
        "reqWidth",
        "reqHeight",
        "decodeBitmapFrom",
        "Landroid/graphics/Bitmap;",
        "data",
        "(Ljava/lang/Object;II)Landroid/graphics/Bitmap;",
        "onDecode",
        "ops",
        "(Ljava/lang/Object;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


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

.method private final calculate(Landroid/graphics/BitmapFactory$Options;II)I
    .locals 2

    .line 1
    iget p0, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/lang/Number;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/Number;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    const/4 v0, 0x1

    .line 38
    if-lez p3, :cond_2

    .line 39
    .line 40
    if-gtz p2, :cond_0

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    if-gt p1, p3, :cond_1

    .line 44
    .line 45
    if-le p0, p2, :cond_2

    .line 46
    .line 47
    :cond_1
    div-int/lit8 p1, p1, 0x2

    .line 48
    .line 49
    div-int/lit8 p0, p0, 0x2

    .line 50
    .line 51
    :goto_0
    div-int v1, p1, v0

    .line 52
    .line 53
    if-lt v1, p3, :cond_2

    .line 54
    .line 55
    div-int v1, p0, v0

    .line 56
    .line 57
    if-lt v1, p2, :cond_2

    .line 58
    .line 59
    mul-int/lit8 v0, v0, 0x2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    :goto_1
    return v0
.end method


# virtual methods
.method public final decodeBitmapFrom(Ljava/lang/Object;II)Landroid/graphics/Bitmap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-lez p2, :cond_0

    .line 9
    .line 10
    if-lez p3, :cond_0

    .line 11
    .line 12
    move v3, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v3, v2

    .line 15
    :goto_0
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;->onDecode(Ljava/lang/Object;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 22
    .line 23
    if-nez v4, :cond_1

    .line 24
    .line 25
    return-object v3

    .line 26
    :cond_1
    invoke-direct {p0, v0, p2, p3}, Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;->calculate(Landroid/graphics/BitmapFactory$Options;II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iput p2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 31
    .line 32
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 33
    .line 34
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 35
    .line 36
    sget-object p2, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;->Companion:Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Companion;

    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Companion;->get()Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget p3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 43
    .line 44
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 45
    .line 46
    mul-int/2addr p3, v1

    .line 47
    mul-int/lit8 p3, p3, 0x4

    .line 48
    .line 49
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 50
    .line 51
    div-int/2addr p3, v1

    .line 52
    invoke-virtual {p2, p3}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;->getReuseBitmap(I)Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    iput-object p2, v0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 57
    .line 58
    if-eqz p2, :cond_2

    .line 59
    .line 60
    :try_start_0
    invoke-virtual {p2, v2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {p0, p1, v0}, Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;->onDecode(Ljava/lang/Object;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 64
    .line 65
    .line 66
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    return-object p0

    .line 68
    :catch_0
    iget-object p2, v0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 69
    .line 70
    if-eqz p2, :cond_3

    .line 71
    .line 72
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->recycle()V

    .line 73
    .line 74
    .line 75
    :cond_3
    const/4 p2, 0x0

    .line 76
    iput-object p2, v0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 77
    .line 78
    invoke-virtual {p0, p1, v0}, Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;->onDecode(Ljava/lang/Object;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public abstract onDecode(Ljava/lang/Object;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .param p2    # Landroid/graphics/BitmapFactory$Options;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/graphics/BitmapFactory$Options;",
            ")",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method
