.class public Lcom/core/glcore/util/BitmapPrivateProtocolUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;,
        Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapContent;
    }
.end annotation


# static fields
.field private static final HEAD_SIZE:I = 0x14

.field private static final MAX_IMAGE_WIDTH:I = 0xa00


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

.method public static getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    .line 3
    .line 4
    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-static {v1}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getBitmapInfo(Ljava/io/FileInputStream;)Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget v2, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->dataSize:I

    .line 14
    .line 15
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    array-length v4, v4

    .line 28
    const/4 v5, 0x0

    .line 29
    invoke-virtual {v1, v3, v5, v4}, Ljava/io/FileInputStream;->read([BII)I

    .line 30
    .line 31
    .line 32
    invoke-static {}, Landroid/graphics/Bitmap$Config;->values()[Landroid/graphics/Bitmap$Config;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget v4, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->colorSpace:I

    .line 37
    .line 38
    if-ltz v4, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v4, v5

    .line 42
    :goto_0
    aget-object v3, v3, v4

    .line 43
    .line 44
    iget v4, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 45
    .line 46
    iget p0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 47
    .line 48
    invoke-static {v4, p0, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v2}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :catch_0
    move-exception p0

    .line 60
    goto :goto_2

    .line 61
    :cond_1
    move-object p0, v0

    .line 62
    :goto_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.method public static getBitmapContent(Ljava/lang/String;)Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapContent;
    .locals 7

    .line 1
    new-instance v0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapContent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapContent;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getBitmapInfo(Ljava/io/FileInputStream;)Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    iget v3, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->dataSize:I

    .line 19
    .line 20
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    array-length v5, v5

    .line 33
    const/4 v6, 0x0

    .line 34
    invoke-virtual {v2, v4, v6, v5}, Ljava/io/FileInputStream;->read([BII)I

    .line 35
    .line 36
    .line 37
    invoke-static {}, Landroid/graphics/Bitmap$Config;->values()[Landroid/graphics/Bitmap$Config;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iget v5, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->colorSpace:I

    .line 42
    .line 43
    if-ltz v5, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v5, v6

    .line 47
    :goto_0
    aget-object v4, v4, v5

    .line 48
    .line 49
    iget v5, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 50
    .line 51
    iget p0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 52
    .line 53
    invoke-static {v5, p0, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v3}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapContent;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v2, v1}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->readStringFromStream(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    if-eqz p0, :cond_1

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-lez v3, :cond_1

    .line 77
    .line 78
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    const-class v4, Ljava/util/HashMap;

    .line 83
    .line 84
    invoke-virtual {v3, p0, v4}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Ljava/util/HashMap;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapContent;->setExifMap(Ljava/util/HashMap;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :catch_0
    move-exception p0

    .line 95
    goto :goto_2

    .line 96
    :cond_1
    :goto_1
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    .line 99
    return-object v0

    .line 100
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    .line 102
    .line 103
    return-object v1
.end method

.method private static getBitmapInfo(Ljava/io/FileInputStream;)Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;
    .locals 5

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-array v0, v0, [B

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 7
    .line 8
    .line 9
    new-instance p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->setData([B)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->dataSize:I

    .line 18
    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget v2, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 22
    .line 23
    iget v3, p0, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    mul-int v4, v2, v3

    .line 26
    .line 27
    mul-int/lit8 v4, v4, 0x4

    .line 28
    .line 29
    if-eq v0, v4, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    if-ltz v2, :cond_2

    .line 33
    .line 34
    if-gez v3, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-object p0

    .line 38
    :cond_2
    :goto_0
    return-object v1

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_2

    .line 41
    :cond_3
    :goto_1
    return-object v1

    .line 42
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    return-object v1
.end method

.method private static getIntValueFromMap(Ljava/util/HashMap;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-lez p1, :cond_0

    .line 37
    .line 38
    new-instance p1, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_0
    return v0
.end method

.method public static readStringFromStream(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    goto :goto_2

    .line 14
    :catch_1
    move-exception p0

    .line 15
    goto :goto_3

    .line 16
    :cond_0
    :goto_0
    const-string p1, "utf-8"

    .line 17
    .line 18
    :cond_1
    new-instance v1, Ljava/io/BufferedReader;

    .line 19
    .line 20
    new-instance v2, Ljava/io/InputStreamReader;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ljava/lang/StringBuffer;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 31
    .line 32
    .line 33
    :goto_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 40
    .line 41
    .line 42
    const-string p1, "\n"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    return-object p0

    .line 53
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 54
    .line 55
    .line 56
    goto :goto_4

    .line 57
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 58
    .line 59
    .line 60
    :goto_4
    return-object v0
.end method

.method public static saveBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 318
    invoke-static {p0, p1, v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->saveBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/HashMap;)V

    return-void
.end method

.method public static saveBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/HashMap;)V
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    if-eqz v0, :cond_9

    .line 8
    .line 9
    if-eqz v1, :cond_9

    .line 10
    .line 11
    new-instance v3, Ljava/io/File;

    .line 12
    .line 13
    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 23
    .line 24
    .line 25
    :cond_0
    new-instance v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;

    .line 26
    .line 27
    invoke-direct {v3}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iput v4, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    iput v4, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-nez v4, :cond_1

    .line 47
    .line 48
    const/4 v4, -0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    :goto_0
    iput v4, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->colorSpace:I

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    mul-int/2addr v4, v5

    .line 65
    mul-int/lit8 v4, v4, 0x4

    .line 66
    .line 67
    iput v4, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->dataSize:I

    .line 68
    .line 69
    const-string v4, "PixelXDimension"

    .line 70
    .line 71
    invoke-static {v2, v4}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getIntValueFromMap(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    const-string v6, "PixelYDimension"

    .line 76
    .line 77
    invoke-static {v2, v6}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getIntValueFromMap(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    const-string v8, "ThumbnailImageWidth"

    .line 82
    .line 83
    invoke-static {v2, v8}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getIntValueFromMap(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    const-string v10, "ThumbnailImageLength"

    .line 88
    .line 89
    invoke-static {v2, v10}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getIntValueFromMap(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v11

    .line 93
    const-string v12, "ImageWidth"

    .line 94
    .line 95
    invoke-static {v2, v12}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getIntValueFromMap(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v13

    .line 99
    const-string v14, "ImageLength"

    .line 100
    .line 101
    invoke-static {v2, v14}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getIntValueFromMap(Ljava/util/HashMap;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v15

    .line 105
    move/from16 v16, v5

    .line 106
    .line 107
    iget v5, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 108
    .line 109
    move/from16 v17, v7

    .line 110
    .line 111
    if-ne v5, v13, :cond_2

    .line 112
    .line 113
    iget v7, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 114
    .line 115
    if-eq v7, v15, :cond_5

    .line 116
    .line 117
    :cond_2
    if-lez v15, :cond_5

    .line 118
    .line 119
    if-lez v15, :cond_5

    .line 120
    .line 121
    int-to-float v7, v13

    .line 122
    const/high16 v13, 0x3f800000    # 1.0f

    .line 123
    .line 124
    mul-float v18, v7, v13

    .line 125
    .line 126
    int-to-float v15, v15

    .line 127
    div-float v18, v18, v15

    .line 128
    .line 129
    int-to-float v15, v5

    .line 130
    mul-float/2addr v15, v13

    .line 131
    move/from16 v19, v13

    .line 132
    .line 133
    iget v13, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 134
    .line 135
    move/from16 v20, v7

    .line 136
    .line 137
    int-to-float v7, v13

    .line 138
    div-float/2addr v15, v7

    .line 139
    int-to-float v7, v9

    .line 140
    mul-float v7, v7, v19

    .line 141
    .line 142
    div-float v7, v7, v20

    .line 143
    .line 144
    move/from16 v19, v7

    .line 145
    .line 146
    int-to-float v7, v5

    .line 147
    mul-float v7, v7, v19

    .line 148
    .line 149
    float-to-int v7, v7

    .line 150
    move/from16 v20, v7

    .line 151
    .line 152
    int-to-float v7, v13

    .line 153
    mul-float v7, v7, v19

    .line 154
    .line 155
    float-to-int v7, v7

    .line 156
    if-lez v20, :cond_4

    .line 157
    .line 158
    if-lez v7, :cond_4

    .line 159
    .line 160
    if-gt v9, v5, :cond_3

    .line 161
    .line 162
    if-gt v11, v13, :cond_3

    .line 163
    .line 164
    cmpl-float v5, v18, v15

    .line 165
    .line 166
    if-eqz v5, :cond_4

    .line 167
    .line 168
    :cond_3
    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    invoke-virtual {v2, v8, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    invoke-virtual {v2, v10, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    :cond_4
    iget v5, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 183
    .line 184
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-virtual {v2, v12, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    iget v5, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 192
    .line 193
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-virtual {v2, v14, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    if-lez v17, :cond_5

    .line 201
    .line 202
    if-lez v16, :cond_5

    .line 203
    .line 204
    iget v5, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->width:I

    .line 205
    .line 206
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    iget v4, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->height:I

    .line 214
    .line 215
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v2, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    :cond_5
    if-eqz v2, :cond_6

    .line 223
    .line 224
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    if-lez v4, :cond_6

    .line 229
    .line 230
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    invoke-virtual {v4, v2}, Lcom/core/glcore/util/JsonUtil;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    goto :goto_1

    .line 239
    :cond_6
    const/4 v2, 0x0

    .line 240
    :goto_1
    if-eqz v2, :cond_7

    .line 241
    .line 242
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    array-length v4, v4

    .line 247
    iput v4, v3, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->exifSize:I

    .line 248
    .line 249
    :cond_7
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 250
    .line 251
    .line 252
    move-result v4

    .line 253
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 254
    .line 255
    .line 256
    move-result v5

    .line 257
    mul-int/2addr v4, v5

    .line 258
    mul-int/lit8 v4, v4, 0x4

    .line 259
    .line 260
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    invoke-virtual {v1, v4}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 265
    .line 266
    .line 267
    new-instance v1, Ljava/io/FileOutputStream;

    .line 268
    .line 269
    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v3}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil$BitmapInfo;->getBytes()[B

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 277
    .line 278
    .line 279
    const/4 v0, 0x0

    .line 280
    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 288
    .line 289
    .line 290
    if-eqz v2, :cond_8

    .line 291
    .line 292
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-lez v0, :cond_8

    .line 297
    .line 298
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 303
    .line 304
    .line 305
    :cond_8
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 309
    .line 310
    .line 311
    return-void

    .line 312
    :cond_9
    const-string v0, "Bitmap or path is null"

    .line 313
    .line 314
    invoke-static {v0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    return-void
.end method
