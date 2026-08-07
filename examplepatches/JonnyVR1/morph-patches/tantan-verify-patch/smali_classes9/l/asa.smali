.class public Ll/asa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s0y;


# static fields
.field public static a:Ljava/lang/String; = "selected_image"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isVideoSelected()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->getSelectedVideo()Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p1, p2, p3, p0}, Ll/cmc0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/data/Media;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 17
    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, p3}, Ll/asa;->i(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V

    .line 23
    .line 24
    .line 25
    return v1
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const-string v0, "extra_images_just_back"

    .line 9
    .line 10
    invoke-virtual {p4, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    :cond_0
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->isVideoSelected()Z

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allSelectedMedias:Ljava/util/ArrayList;

    .line 21
    .line 22
    if-eqz p4, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Ll/asa;->j(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Ll/asa;->i(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Z
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
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 23
    .line 24
    const p2, 0x476a6000    # 60000.0f

    .line 25
    .line 26
    .line 27
    cmpl-float p0, p0, p2

    .line 28
    .line 29
    if-ltz p0, :cond_0

    .line 30
    .line 31
    new-instance p0, Ll/jl80$a;

    .line 32
    .line 33
    invoke-direct {p0, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->A4:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->D5:I

    .line 47
    .line 48
    new-array v0, v0, [Ljava/lang/Object;

    .line 49
    .line 50
    invoke-virtual {p0, p2, v0}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->k:I

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p2, Ll/zra;

    .line 61
    .line 62
    invoke-direct {p2}, Ll/zra;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x1

    .line 73
    return p0

    .line 74
    :cond_0
    return v0
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/asa;->h(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_2

    .line 13
    .line 14
    new-instance p0, Landroid/content/Intent;

    .line 15
    .line 16
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/asa;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string v0, "extra_images"

    .line 25
    .line 26
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const-string p2, "extra_images_just_back"

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    iget p2, p3, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 p2, 0x0

    .line 45
    :goto_0
    const-string p3, "extra_from_type"

    .line 46
    .line 47
    invoke-virtual {p0, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    const/4 p2, -0x1

    .line 51
    invoke-virtual {p1, p2, p0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_1
    return-void
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
    sget-object v0, Ll/asa;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    const-string v0, "extra_images"

    .line 18
    .line 19
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    const-string p2, "extra_images_just_back"

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const/4 p2, -0x1

    .line 29
    invoke-virtual {p1, p2, p0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
