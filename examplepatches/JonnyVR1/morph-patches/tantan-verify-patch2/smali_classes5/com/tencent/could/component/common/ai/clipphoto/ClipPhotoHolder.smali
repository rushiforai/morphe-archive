.class public Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final COMPASS_IMAGE_MAX_SIZE:I = 0x400

.field public static final REQUEST_CODE_CLIP_PHOTO:I = 0xbb8

.field public static final REQUEST_CODE_SELECT_PHOTO:I = 0x7d0

.field public static final TAG:Ljava/lang/String; = "ClipPhotoHolder"


# instance fields
.field public cacheCropFile:Ljava/io/File;

.field public compassImageSize:I

.field public compressLevel:I

.field public isNeedClip:Z

.field public isReturnOnlyUri:Z

.field public listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

.field public minPhotoSize:Landroid/graphics/Point;

.field public uriTempFile:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->isReturnOnlyUri:Z

    .line 6
    .line 7
    const/16 v0, 0x400

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compassImageSize:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressLevel:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->minPhotoSize:Landroid/graphics/Point;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;)Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->uriTempFile:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Landroid/app/Activity;)[B
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressFromBitMapDoNotNeedCheckDegree(Landroid/app/Activity;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$200(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Landroid/app/Activity;)[B
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressFromBitMapCheckDegree(Landroid/app/Activity;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$300(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendClipDismissPhotoError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendSelectImageStr(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->cacheCropFile:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method private compressFromBitMapCheckDegree(Landroid/app/Activity;)[B
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->uriTempFile:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/tencent/could/component/common/ai/utils/ImageCompressUtils;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tencent/could/component/common/ai/utils/ImageCompressUtils;->getBitmapDegree(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->minPhotoSize:Landroid/graphics/Point;

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    const/16 v2, 0x5a

    .line 24
    .line 25
    if-eq v0, v2, :cond_1

    .line 26
    .line 27
    const/16 v2, 0x10e

    .line 28
    .line 29
    if-ne v0, v2, :cond_2

    .line 30
    .line 31
    :cond_1
    new-instance v1, Landroid/graphics/Point;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->minPhotoSize:Landroid/graphics/Point;

    .line 34
    .line 35
    iget v3, v2, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 38
    .line 39
    invoke-direct {v1, v3, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->uriTempFile:Landroid/net/Uri;

    .line 43
    .line 44
    iget v3, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressLevel:I

    .line 45
    .line 46
    invoke-static {p1, v2, v3, v1}, Lcom/tencent/could/component/common/ai/utils/ImageCompressUtils;->createBitMapByUri(Landroid/content/Context;Landroid/net/Uri;ILandroid/graphics/Point;)Landroid/graphics/Bitmap;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {p1, v0}, Lcom/tencent/could/component/common/ai/utils/ImageCompressUtils;->rotateBitmapByDegree(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compassImageSize:I

    .line 55
    .line 56
    iget p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressLevel:I

    .line 57
    .line 58
    invoke-static {p1, v0, p0}, Lcom/tencent/could/component/common/ai/utils/ImageCompressUtils;->compressBitmap(Landroid/graphics/Bitmap;II)[B

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 65
    .line 66
    .line 67
    :cond_3
    return-object p0
.end method

.method private compressFromBitMapDoNotNeedCheckDegree(Landroid/app/Activity;)[B
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->uriTempFile:Landroid/net/Uri;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressLevel:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->minPhotoSize:Landroid/graphics/Point;

    .line 6
    .line 7
    invoke-static {p1, v0, v1, v2}, Lcom/tencent/could/component/common/ai/utils/ImageCompressUtils;->createBitMapByUri(Landroid/content/Context;Landroid/net/Uri;ILandroid/graphics/Point;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compassImageSize:I

    .line 12
    .line 13
    iget p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressLevel:I

    .line 14
    .line 15
    invoke-static {p1, v0, p0}, Lcom/tencent/could/component/common/ai/utils/ImageCompressUtils;->compressBitmap(Landroid/graphics/Bitmap;II)[B

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p0
.end method

.method private dealWithAfterClipPhoto(Landroid/app/Activity;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;->doStartCompressImage()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;->getInstance()Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;

    .line 13
    .line 14
    invoke-direct {v1, p0, p2, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder$1;-><init>(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;ZLandroid/app/Activity;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;->addWork(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private dealWithSelectPhotos(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 5

    .line 1
    const-string v0, "ClipPhotoHolder"

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const-string p1, "user cancel select photo!"

    .line 6
    .line 7
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendClipDismissPhotoError(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-boolean v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->isNeedClip:Z

    .line 15
    .line 16
    if-nez v1, :cond_2

    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->isReturnOnlyUri:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {v0, p0}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;->getSelectPhotoUri(Landroid/net/Uri;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendOnlySelectPhoto(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    const/4 v1, 0x1

    .line 39
    invoke-static {p1, v1}, Lcom/tencent/could/component/common/ai/clipphoto/FileUtils;->createImageFile(Landroid/content/Context;Z)Ljava/io/File;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput-object v2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->cacheCropFile:Ljava/io/File;

    .line 44
    .line 45
    if-eqz v2, :cond_4

    .line 46
    .line 47
    new-instance v2, Landroid/content/Intent;

    .line 48
    .line 49
    const-string v3, "com.android.camera.action.CROP"

    .line 50
    .line 51
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    const/4 v3, 0x2

    .line 58
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    const-string v3, "crop"

    .line 62
    .line 63
    const-string v4, "true"

    .line 64
    .line 65
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    const-string v3, "scale "

    .line 69
    .line 70
    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    const-string v1, "return-data"

    .line 74
    .line 75
    const/4 v3, 0x0

    .line 76
    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const-string v3, "outputFormat"

    .line 86
    .line 87
    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const-string v3, "image/*"

    .line 95
    .line 96
    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 97
    .line 98
    .line 99
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 100
    .line 101
    const/16 v3, 0x1e

    .line 102
    .line 103
    const-string v4, "output"

    .line 104
    .line 105
    if-lt v1, v3, :cond_3

    .line 106
    .line 107
    sget-object v1, Lcom/tencent/could/component/common/ai/clipphoto/FileUtils;->uri:Landroid/net/Uri;

    .line 108
    .line 109
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->uriTempFile:Landroid/net/Uri;

    .line 110
    .line 111
    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_3
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->cacheCropFile:Ljava/io/File;

    .line 116
    .line 117
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->uriTempFile:Landroid/net/Uri;

    .line 122
    .line 123
    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 124
    .line 125
    .line 126
    :goto_0
    const/16 v1, 0xbb8

    .line 127
    .line 128
    :try_start_0
    invoke-virtual {p1, v2, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :catch_0
    move-exception v1

    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string v3, "start clip error: "

    .line 136
    .line 137
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendOnlySelectPhoto(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_4
    const-string v1, "cacheCropFile is null!"

    .line 159
    .line 160
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendOnlySelectPhoto(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method private sendClipDismissPhotoError(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;->sendClipPhotoError(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private sendOnlySelectPhoto(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->uriTempFile:Landroid/net/Uri;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->dealWithAfterClipPhoto(Landroid/app/Activity;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private sendSelectImageStr(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;->sendBitmapWithBase64(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 3

    .line 1
    const-string v0, "ClipPhotoHolder"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "onActivityResult: activity is null"

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/16 v1, 0x7d0

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-ne p2, v1, :cond_2

    .line 15
    .line 16
    if-ne p3, v2, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p1, p4}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->dealWithSelectPhotos(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "select photo error code: "

    .line 25
    .line 26
    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    invoke-static {v0, p4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    new-instance p4, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    invoke-direct {p0, p4}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendClipDismissPhotoError(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_0
    const/16 p4, 0xbb8

    .line 55
    .line 56
    if-ne p2, p4, :cond_4

    .line 57
    .line 58
    if-ne p3, v2, :cond_3

    .line 59
    .line 60
    const/4 p2, 0x1

    .line 61
    invoke-direct {p0, p1, p2}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->dealWithAfterClipPhoto(Landroid/app/Activity;Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string p2, "clip error code: "

    .line 68
    .line 69
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    new-instance p1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendClipDismissPhotoError(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_4
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setClipPhotoEventListener(Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->listener:Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoEventListener;

    .line 2
    .line 3
    return-void
.end method

.method public setCompressImageSize(Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->minPhotoSize:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method public setCompressLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compressLevel:I

    .line 2
    .line 3
    return-void
.end method

.method public setReturnOnlyUri(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->isReturnOnlyUri:Z

    .line 2
    .line 3
    return-void
.end method

.method public startSelectAlbum(Landroid/app/Activity;Z)V
    .locals 1

    const/16 v0, 0x400

    .line 41
    invoke-virtual {p0, p1, p2, v0}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->startSelectAlbum(Landroid/app/Activity;ZI)V

    return-void
.end method

.method public startSelectAlbum(Landroid/app/Activity;ZI)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "ClipPhotoHolder"

    .line 4
    .line 5
    const-string p2, "start activity is null!"

    .line 6
    .line 7
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    const-string p1, "activity is null"

    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->sendClipDismissPhotoError(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput p3, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->compassImageSize:I

    .line 17
    .line 18
    iput-boolean p2, p0, Lcom/tencent/could/component/common/ai/clipphoto/ClipPhotoHolder;->isNeedClip:Z

    .line 19
    .line 20
    new-instance p0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string p2, "android.intent.action.PICK"

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    const-string p2, "image/*"

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    const/16 p2, 0x7d0

    .line 36
    .line 37
    invoke-virtual {p1, p0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
