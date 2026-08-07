.class public Ll/pjh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s0y;


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


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
    .locals 2

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_5

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isVideoSelected()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz p0, :cond_3

    .line 16
    .line 17
    iget-object p0, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 26
    .line 27
    invoke-static {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->f(Lcom/p1/mobile/putong/data/Dimension;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    const-string p0, "\u89c6\u9891\u5206\u8fa8\u7387\u8fc7\u9ad8\uff0c\u6682\u4e0d\u652f\u6301"

    .line 34
    .line 35
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return v1

    .line 39
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 40
    .line 41
    const p3, 0x453b8000    # 3000.0f

    .line 42
    .line 43
    .line 44
    cmpg-float p3, p2, p3

    .line 45
    .line 46
    if-gez p3, :cond_1

    .line 47
    .line 48
    const-string p0, "\u8be5\u89c6\u9891\u957f\u5ea6\u4e0d\u652f\u6301\u4e0a\u4f20"

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/high16 p3, 0x467a0000    # 16000.0f

    .line 55
    .line 56
    cmpg-float p2, p2, p3

    .line 57
    .line 58
    const-string p3, "my_states"

    .line 59
    .line 60
    if-gez p2, :cond_2

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p1, p0, v0, p3}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditAct;->a2(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-static {p1, p0, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->L2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isImageSelected()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_4

    .line 85
    .line 86
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getSelectedImage()Lcom/p1/mobile/putong/data/Picture;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p1, p2, p3, p0}, Ll/cmc0;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Picture;)V

    .line 91
    .line 92
    .line 93
    :cond_4
    :goto_0
    return v1

    .line 94
    :cond_5
    return v0
.end method

.method public b(Landroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method
