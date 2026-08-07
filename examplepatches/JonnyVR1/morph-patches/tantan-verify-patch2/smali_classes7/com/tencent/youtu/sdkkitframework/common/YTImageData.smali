.class public Lcom/tencent/youtu/sdkkitframework/common/YTImageData;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String; = "YTImageData"

.field public static final synthetic b:Z = true


# instance fields
.field public checksum:Ljava/lang/String;

.field public height:I

.field public imgData:[B

.field public imgDataBase64:Ljava/lang/String;

.field public timeStamp:J

.field public width:I


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 14
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 15
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgDataBase64:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 5
    .line 6
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 7
    .line 8
    iput p3, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a([B)[I
    .locals 9

    .line 1
    array-length p0, p1

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :cond_0
    rem-int/lit8 v0, p0, 0x3

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move v0, v2

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    move v0, v1

    .line 15
    :goto_0
    div-int/lit8 p0, p0, 0x3

    .line 16
    .line 17
    add-int/2addr p0, v0

    .line 18
    new-array v3, p0, [I

    .line 19
    .line 20
    const/high16 v4, 0xff0000

    .line 21
    .line 22
    const v5, 0xff00

    .line 23
    .line 24
    .line 25
    const/high16 v6, -0x1000000

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    :goto_1
    if-ge v1, p0, :cond_2

    .line 30
    .line 31
    mul-int/lit8 v0, v1, 0x3

    .line 32
    .line 33
    aget-byte v2, p1, v0

    .line 34
    .line 35
    and-int/lit16 v2, v2, 0xff

    .line 36
    .line 37
    add-int/lit8 v7, v0, 0x1

    .line 38
    .line 39
    aget-byte v7, p1, v7

    .line 40
    .line 41
    shl-int/lit8 v7, v7, 0x8

    .line 42
    .line 43
    and-int/2addr v7, v5

    .line 44
    or-int/2addr v2, v7

    .line 45
    add-int/lit8 v0, v0, 0x2

    .line 46
    .line 47
    aget-byte v0, p1, v0

    .line 48
    .line 49
    shl-int/lit8 v0, v0, 0x10

    .line 50
    .line 51
    and-int/2addr v0, v4

    .line 52
    or-int/2addr v0, v2

    .line 53
    or-int/2addr v0, v6

    .line 54
    aput v0, v3, v1

    .line 55
    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    return-object v3

    .line 60
    :cond_3
    :goto_2
    add-int/lit8 v0, p0, -0x1

    .line 61
    .line 62
    if-ge v1, v0, :cond_4

    .line 63
    .line 64
    mul-int/lit8 v0, v1, 0x3

    .line 65
    .line 66
    aget-byte v7, p1, v0

    .line 67
    .line 68
    and-int/lit16 v7, v7, 0xff

    .line 69
    .line 70
    add-int/lit8 v8, v0, 0x1

    .line 71
    .line 72
    aget-byte v8, p1, v8

    .line 73
    .line 74
    shl-int/lit8 v8, v8, 0x8

    .line 75
    .line 76
    and-int/2addr v8, v5

    .line 77
    or-int/2addr v7, v8

    .line 78
    add-int/lit8 v0, v0, 0x2

    .line 79
    .line 80
    aget-byte v0, p1, v0

    .line 81
    .line 82
    shl-int/lit8 v0, v0, 0x10

    .line 83
    .line 84
    and-int/2addr v0, v4

    .line 85
    or-int/2addr v0, v7

    .line 86
    or-int/2addr v0, v6

    .line 87
    aput v0, v3, v1

    .line 88
    .line 89
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_4
    aput v6, v3, v0

    .line 93
    .line 94
    return-object v3
.end method

.method public bgr2Bitmap()Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->a([B)[I

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-boolean v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->b:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    iget v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 20
    .line 21
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 22
    .line 23
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    move v4, v3

    .line 27
    invoke-static/range {v1 .. v6}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public bgr2JPEG()[B
    .locals 1

    const/16 v0, 0x64

    .line 65
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->bgr2JPEG(I)[B

    move-result-object p0

    return-object p0
.end method

.method public bgr2JPEG(I)[B
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 2
    .line 3
    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [B

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->a([B)[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-boolean v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->b:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    iget v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 26
    .line 27
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 28
    .line 29
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    move v4, v3

    .line 33
    invoke-static/range {v1 .. v6}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 40
    .line 41
    .line 42
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 43
    .line 44
    invoke-virtual {p0, v1, p1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :try_start_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    return-object p0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    move-object p1, v0

    .line 57
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->a:Ljava/lang/String;

    .line 58
    .line 59
    const-string v1, "close error"

    .line 60
    .line 61
    invoke-static {v0, v1, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-object p0
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 7
    .line 8
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, [B

    .line 13
    .line 14
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 15
    .line 16
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 17
    .line 18
    iput v1, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 19
    .line 20
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 21
    .line 22
    iput p0, v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 23
    .line 24
    return-object v0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getImgData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setImgData([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 2
    .line 3
    return-void
.end method

.method public toJSON()Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "img"

    .line 7
    .line 8
    :try_start_0
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    const-string v1, "checksum"

    .line 14
    .line 15
    :try_start_1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->checksum:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->a:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "video data tojson error"

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Lorg/json/JSONObject;

    .line 30
    .line 31
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public toJSON64Img()Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "img"

    .line 7
    .line 8
    :try_start_0
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgDataBase64:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    const-string v1, "checksum"

    .line 14
    .line 15
    :try_start_1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->checksum:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->a:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "video data tojson error"

    .line 25
    .line 26
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Lorg/json/JSONObject;

    .line 30
    .line 31
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ImageData{imgDataSize="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 9
    .line 10
    array-length v1, v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", width="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, ", height="

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const/16 p0, 0x7d

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public writeImg2LocalDisk(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p2, p3}, Lcom/tencent/youtu/sdkkitframework/common/FileUtils;->createFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p2, Ljava/io/FileOutputStream;

    .line 6
    .line 7
    invoke-direct {p2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 11
    .line 12
    const/16 p3, 0x64

    .line 13
    .line 14
    invoke-virtual {p1, p0, p3, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_1
    move-exception p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 31
    .line 32
    .line 33
    :goto_0
    return-void
.end method

.method public yuv2Bitmap()Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/YuvImage;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 4
    .line 5
    iget v3, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 6
    .line 7
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 8
    .line 9
    const/16 v2, 0x11

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    invoke-direct/range {v0 .. v5}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v1, Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/YuvImage;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v0}, Landroid/graphics/YuvImage;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 32
    .line 33
    .line 34
    const/16 v2, 0x5f

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2, p0}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-static {v0, v4, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :try_start_0
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    return-object v1

    .line 55
    :catch_0
    move-exception v0

    .line 56
    move-object p0, v0

    .line 57
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->a:Ljava/lang/String;

    .line 58
    .line 59
    const-string v2, "close error"

    .line 60
    .line 61
    invoke-static {v0, v2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-object v1
.end method
