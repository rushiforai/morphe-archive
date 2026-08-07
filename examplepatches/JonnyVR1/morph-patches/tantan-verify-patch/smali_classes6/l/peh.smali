.class public Ll/peh;
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

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)Ljava/util/ArrayList;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v0, 0x1

    .line 19
    if-ne p0, v0, :cond_2

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 29
    .line 30
    const-string v1, "raw"

    .line 31
    .line 32
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Media;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_1

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 77
    .line 78
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 82
    .line 83
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->clearAllSelectedMedia()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->addSelectedMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_1
    return-object p1
.end method

.method public static synthetic h(Ll/peh;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peh;->n(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic i(Ll/peh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/peh;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Ljava/util/ArrayList;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isVideoSelected()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object p0, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

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
    return v2

    .line 39
    :cond_0
    iget p2, p3, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 40
    .line 41
    const/4 p3, 0x5

    .line 42
    if-ne p2, p3, :cond_1

    .line 43
    .line 44
    const-string p2, "immersion"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const-string p2, ""

    .line 48
    .line 49
    :goto_0
    invoke-static {p1, p0, p2}, Ll/cmc0;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Video;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isImageSelected()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2, p3}, Ll/peh;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_1
    return v2

    .line 63
    :cond_4
    return v1
.end method

.method public j(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 16
    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;",
            ")",
            "Lrx/c<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/neh;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Ll/neh;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->croppedMap:Ljava/util/Map;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->g(Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0, p2}, Ll/peh;->k(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/meh;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2, p3}, Ll/meh;-><init>(Ll/peh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Ljava/util/ArrayList;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    move-object v1, p0

    .line 13
    move-object v2, p1

    .line 14
    move-object v5, p2

    .line 15
    move-object v6, p3

    .line 16
    move-object v3, p4

    .line 17
    invoke-virtual/range {v1 .. v6}, Ll/peh;->p(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/Boolean;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/peh;->o(Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/data/MediaMeta;->new_()Lcom/p1/mobile/putong/data/MediaMeta;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p1, "video"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "photo"

    .line 15
    .line 16
    :goto_0
    iput-object p1, v0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 17
    .line 18
    const-string p1, "upload"

    .line 19
    .line 20
    iput-object p1, v0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 21
    .line 22
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z

    .line 23
    .line 24
    return-void
.end method

.method public p(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/Boolean;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;",
            "Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/peh;->j(Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance p3, Ll/oeh;

    .line 11
    .line 12
    invoke-direct {p3, p0}, Ll/oeh;-><init>(Ll/peh;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    iget p0, p5, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 19
    .line 20
    const/16 p3, 0x8

    .line 21
    .line 22
    if-ne p0, p3, :cond_1

    .line 23
    .line 24
    iget-wide p3, p5, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->jsBridgeTimestamp:J

    .line 25
    .line 26
    invoke-static {p3, p4, p2}, Ll/xl70;->j(JLjava/util/ArrayList;)V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget-object p0, p4, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    const-string p3, ""

    .line 37
    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    iget-object p0, p4, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedFolder:Ll/ewi;

    .line 41
    .line 42
    iget-object p0, p0, Ll/ewi;->b:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    move-object p0, p3

    .line 46
    :goto_0
    iget p4, p5, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 47
    .line 48
    const/4 p5, 0x5

    .line 49
    if-ne p4, p5, :cond_3

    .line 50
    .line 51
    const-string p3, "immersion"

    .line 52
    .line 53
    :cond_3
    const/4 p4, 0x0

    .line 54
    invoke-static {p1, p2, p0, p4, p3}, Ll/cn40;->s0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;ZLjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 58
    .line 59
    .line 60
    return-void
.end method
