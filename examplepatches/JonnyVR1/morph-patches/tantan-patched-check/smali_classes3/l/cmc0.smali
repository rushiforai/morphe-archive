.class public Ll/cmc0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Media;)Landroid/content/Intent;
    .locals 1

    .line 1
    instance-of v0, p3, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->H2(Landroid/content/Context;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->g(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxVideoSelectCount()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->f(I)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->j(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->c()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->e()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->a()Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->H2(Landroid/content/Context;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->j(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->g(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->f(I)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->e()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolderPath:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->d()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->a()Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 2

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
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/high16 v1, 0x42700000    # 60.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    sub-int/2addr v0, v1

    .line 23
    const v1, 0x3f4ccccd    # 0.8f

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p1, v1, v0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FIZ)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/16 p2, 0x6000

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->croppedMap:Ljava/util/Map;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->c(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {p3}, Ll/oki;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 20
    .line 21
    invoke-static {p3, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 22
    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->imageCropProportion:F

    .line 25
    .line 26
    const/16 v1, 0x6000

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    iget p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->imageCropWidth:I

    .line 31
    .line 32
    iget-boolean p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->croppingNewStyle:Z

    .line 33
    .line 34
    invoke-static {p0, p3, v0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FIZ)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->imageCropWidth:I

    .line 43
    .line 44
    invoke-static {p0, p3, v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->m2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FI)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Video;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 2
    .line 3
    const v1, 0x482fc800    # 180000.0f

    .line 4
    .line 5
    .line 6
    cmpl-float v1, v0, v1

    .line 7
    .line 8
    if-gtz v1, :cond_1

    .line 9
    .line 10
    const v1, 0x453b8000    # 3000.0f

    .line 11
    .line 12
    .line 13
    cmpg-float v0, v0, v1

    .line 14
    .line 15
    if-gez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 19
    .line 20
    invoke-interface {v0, p0, p1, p2}, Ll/bn5;->B5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Video;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    sget p0, Lcom/p1/mobile/putong/common/R$string;->U:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
