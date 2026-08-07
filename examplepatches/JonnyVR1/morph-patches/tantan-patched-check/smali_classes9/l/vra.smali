.class public Ll/vra;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s0y;


# instance fields
.field public a:F

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/vra;->a:F

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/vra;->b:Ljava/util/ArrayList;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/vra;->a:F

    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->selectedIsVideo()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getSelectedVideo()Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 18
    .line 19
    iput v0, p0, Ll/vra;->a:F

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getSelectedVideo()Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/vra;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Media;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {p0, p2}, Ll/vra;->h(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getSelectedImage()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p1, p2, p3, p0}, Ll/cmc0;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Picture;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    return v1
.end method

.method public b(Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-string v0, "selected_origin_images"

    .line 2
    .line 3
    iget-object p0, p0, Ll/vra;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    const-string p3, "extra_images_just_back"

    .line 9
    .line 10
    invoke-virtual {p4, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :cond_0
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isVideoSelected()Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    if-nez p3, :cond_2

    .line 21
    .line 22
    iget p3, p0, Ll/vra;->a:F

    .line 23
    .line 24
    const/4 p4, 0x0

    .line 25
    cmpl-float p3, p3, p4

    .line 26
    .line 27
    if-lez p3, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2}, Ll/vra;->j(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    :goto_0
    iget-object p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Ll/vra;->k(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/vra;->a:F

    .line 2
    .line 3
    const/high16 p2, 0x467a0000    # 16000.0f

    .line 4
    .line 5
    cmpl-float p2, p0, p2

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-ltz p2, :cond_0

    .line 9
    .line 10
    new-instance p0, Landroid/content/Intent;

    .line 11
    .line 12
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 13
    .line 14
    .line 15
    const/16 p2, 0x1001

    .line 16
    .line 17
    invoke-virtual {p1, p2, p0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 21
    .line 22
    .line 23
    return v0

    .line 24
    :cond_0
    const p2, 0x453b8000    # 3000.0f

    .line 25
    .line 26
    .line 27
    cmpg-float p0, p0, p2

    .line 28
    .line 29
    if-gez p0, :cond_1

    .line 30
    .line 31
    new-instance p0, Landroid/content/Intent;

    .line 32
    .line 33
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 34
    .line 35
    .line 36
    const/16 p2, 0x1002

    .line 37
    .line 38
    invoke-virtual {p1, p2, p0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 42
    .line 43
    .line 44
    return v0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public h(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vra;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getSelectedImage()Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/vra;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Media;)Landroid/content/Intent;
    .locals 0

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->H2(Landroid/content/Context;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getCurrentMaxCount(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->f(I)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->j(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->c()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->b()Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->g(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$b;->a()Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Landroid/content/Intent;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    const/4 p2, -0x1

    .line 18
    invoke-virtual {p1, p2, p0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vra;->g(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    new-instance p0, Landroid/content/Intent;

    .line 15
    .line 16
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const/4 p2, -0x1

    .line 25
    invoke-virtual {p1, p2, p0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method
