.class public Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/jl70;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/xvx;

.field public b:Ll/bbh0;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

.field public d:Lcom/p1/mobile/putong/data/Media;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Z

.field public h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->d:Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->e:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->f:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->i:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->k:Z

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ll/bvx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->s0(Ll/bvx;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->q0(Ljava/util/HashMap;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->r0()V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->y0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->x0()V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->t0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jl70;

    .line 4
    .line 5
    iget-object v0, v0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/fl70;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/fl70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->o0()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/jl70;

    .line 7
    .line 8
    iget-object p1, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "ext_from"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->e:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/jl70;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/jl70;->r()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic x0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->b:Ll/bbh0;

    .line 3
    .line 4
    return-void
.end method

.method public static z0(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    mul-int/2addr v3, p1

    .line 18
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    div-int/2addr v3, v4

    .line 23
    if-le v1, v2, :cond_1

    .line 24
    .line 25
    move v4, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v4, p1

    .line 28
    :goto_0
    if-le v1, v2, :cond_2

    .line 29
    .line 30
    move v3, p1

    .line 31
    :cond_2
    const/4 v1, 0x1

    .line 32
    :try_start_0
    invoke-static {p0, v4, v3, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    move-object p0, v0

    .line 38
    :goto_1
    if-nez p0, :cond_3

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_3
    sub-int/2addr v4, p1

    .line 42
    div-int/lit8 v4, v4, 0x2

    .line 43
    .line 44
    sub-int/2addr v3, p1

    .line 45
    div-int/lit8 v3, v3, 0x2

    .line 46
    .line 47
    :try_start_1
    invoke-static {p0, v4, v3, p1, p1}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eq p0, v0, :cond_4

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    .line 55
    .line 56
    :catch_1
    :cond_4
    return-object v0
.end method


# virtual methods
.method public A0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "image/*"

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "raw"

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 29
    .line 30
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Landroid/content/Intent;

    .line 35
    .line 36
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 37
    .line 38
    .line 39
    sget-object v2, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->p0()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    const/16 v0, 0xb

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/16 v0, 0xa

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    const/16 v0, 0xd

    .line 61
    .line 62
    :goto_0
    const-string v2, "extra_from_type"

    .line 63
    .line 64
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast v0, Ll/jl70;

    .line 70
    .line 71
    iget-object v0, v0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 72
    .line 73
    const/4 v2, -0x1

    .line 74
    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast p0, Ll/jl70;

    .line 80
    .line 81
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public C0(Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "receiver_user_id"

    .line 7
    .line 8
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->p0()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const-string p1, "reply"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p1, "switch"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p1, "time"

    .line 28
    .line 29
    :goto_0
    const-string v1, "new_photo_type"

    .line 30
    .line 31
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    move-object v1, p1

    .line 37
    check-cast v1, Ll/jl70;

    .line 38
    .line 39
    iget-object v1, v1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 40
    .line 41
    check-cast p1, Ll/jl70;

    .line 42
    .line 43
    iget-object p1, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const/4 v4, 0x1

    .line 54
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast v3, Ll/jl70;

    .line 78
    .line 79
    iget-object v3, v3, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 80
    .line 81
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->h:I

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSubmitButtonTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->addReportMap(Ljava/util/Map;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 96
    .line 97
    if-eqz v2, :cond_3

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->p0()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_2

    .line 104
    .line 105
    const/16 p0, 0xb

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_2
    const/16 p0, 0xa

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    const/16 p0, 0xd

    .line 112
    .line 113
    :goto_1
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const/16 p1, 0x312

    .line 126
    .line 127
    invoke-virtual {v1, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public D0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xvx;->l()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/xvx;->k(Lcom/p1/mobile/android/app/Act;)Z

    .line 13
    .line 14
    .line 15
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    goto :goto_2

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    :try_start_1
    const-string v3, "c++_shared"

    .line 21
    .line 22
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 23
    .line 24
    .line 25
    move v3, v1

    .line 26
    goto :goto_0

    .line 27
    :catchall_1
    move v3, v2

    .line 28
    :goto_0
    :try_start_2
    const-string v4, "xeengine"

    .line 29
    .line 30
    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :catchall_2
    move v1, v2

    .line 35
    :goto_1
    new-instance v4, Ljava/lang/RuntimeException;

    .line 36
    .line 37
    new-instance v5, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v6, "IMomoRecorder prepare error, cppSharedLoaded="

    .line 40
    .line 41
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, ", xeengineLoaded="

    .line 48
    .line 49
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {v4, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    move v0, v2

    .line 66
    :goto_2
    if-eqz v0, :cond_0

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/xvx;->o()V

    .line 71
    .line 72
    .line 73
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast v0, Ll/jl70;

    .line 76
    .line 77
    iget-object v0, v0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 78
    .line 79
    new-instance v1, Ll/gl70;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/gl70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V

    .line 82
    .line 83
    .line 84
    const-wide/16 v2, 0x64

    .line 85
    .line 86
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public E0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xvx;->r()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/xvx;->h()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->i:Z

    .line 13
    .line 14
    return-void
.end method

.method public F0(Ll/wo50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xvx;->s(Ll/wo50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cl70;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/cl70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/dl70;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/dl70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->n0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final l0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jl70;

    .line 4
    .line 5
    iget-object v0, v0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    new-instance v0, Ll/hl70;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/hl70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public m0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/bvx;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v5, 0x1

    .line 12
    const/16 v6, 0x32

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-direct/range {v1 .. v6}, Ll/bvx;-><init>(Landroid/content/Context;ZZZI)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/jl70;

    .line 22
    .line 23
    iget-object v0, v0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/bvx;->t()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v2, Ll/el70;

    .line 34
    .line 35
    invoke-direct {v2, p0, v1}, Ll/el70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ll/bvx;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Ll/jl70;

    .line 48
    .line 49
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 50
    .line 51
    invoke-static {p0}, Landroidx/loader/app/a;->b(Ll/ker;)Landroidx/loader/app/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 v0, 0x0

    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-virtual {p0, v0, v2, v1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->l0()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final o0()V
    .locals 3

    .line 1
    new-instance v0, Ll/xvx;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xvx;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/xvx;->c()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/xvx;->q()V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/bbh0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Ll/bbh0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/xvx;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->b:Ll/bbh0;

    .line 28
    .line 29
    const/high16 v1, 0x41c00000    # 24.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    invoke-virtual {v0, v1}, Ll/bbh0;->l(F)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->b:Ll/bbh0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/bbh0;->i()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public p0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->e:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "from_pic_exchange_reply_type"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic q0(Ljava/util/HashMap;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic r0()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/g96;->b(Ljava/util/List;I)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    if-ge v2, v3, :cond_5

    .line 22
    .line 23
    check-cast v4, Ll/jl70;

    .line 24
    .line 25
    iget-object v3, v4, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v3}, Ll/oki;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_1
    new-instance v4, Ljava/io/File;

    .line 57
    .line 58
    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-nez v5, :cond_2

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    :try_start_0
    invoke-static {}, Ll/tvb;->h()Ll/tvb;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast v4, Ll/jl70;

    .line 79
    .line 80
    iget-object v7, v4, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 81
    .line 82
    sget v9, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->v:I

    .line 83
    .line 84
    const/4 v11, 0x0

    .line 85
    move v10, v9

    .line 86
    invoke-virtual/range {v6 .. v11}, Ll/tvb;->n(Landroid/content/Context;Landroid/net/Uri;III)Landroid/graphics/Bitmap;

    .line 87
    .line 88
    .line 89
    move-result-object v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    goto :goto_1

    .line 91
    :catch_0
    const/4 v4, 0x0

    .line 92
    :goto_1
    if-nez v4, :cond_3

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    sget v5, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->v:I

    .line 96
    .line 97
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->z0(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    if-nez v4, :cond_4

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_4
    iget-object v5, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast v5, Ll/jl70;

    .line 107
    .line 108
    iget-object v5, v5, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 109
    .line 110
    invoke-virtual {v5}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    invoke-static {v5, v4}, Ll/end0;->a(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Ll/dnd0;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    const/high16 v5, 0x41c00000    # 24.0f

    .line 119
    .line 120
    invoke-static {v5}, Ll/bnl0;->w(F)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    int-to-float v5, v5

    .line 125
    invoke-virtual {v4, v5}, Ll/dnd0;->e(F)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Ll/pzi0;->o()J

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_5
    check-cast v4, Ll/jl70;

    .line 138
    .line 139
    iget-object v0, v4, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 140
    .line 141
    new-instance v2, Ll/il70;

    .line 142
    .line 143
    invoke-direct {v2, p0, v1}, Ll/il70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;Ljava/util/HashMap;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final synthetic s0(Ll/bvx;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jl70;

    .line 4
    .line 5
    iget-object v0, v0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    if-nez p2, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->k:Z

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->l0()V

    .line 38
    .line 39
    .line 40
    :cond_3
    const/4 p2, 0x0

    .line 41
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->k:Z

    .line 42
    .line 43
    iget-boolean v0, p1, Ll/bvx;->g:Z

    .line 44
    .line 45
    if-eqz v0, :cond_4

    .line 46
    .line 47
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p0, Ll/jl70;

    .line 52
    .line 53
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 63
    .line 64
    invoke-static {p0}, Landroidx/loader/app/a;->b(Ll/ker;)Landroidx/loader/app/a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, p2, v0, p1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 70
    .line 71
    .line 72
    :cond_4
    :goto_0
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/xvx;->q()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->D0()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 15
    .line 16
    if-ne p1, v0, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/xvx;->q()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->b:Ll/bbh0;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-virtual {p0, p1}, Ll/bbh0;->k(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 33
    .line 34
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/xvx;->q()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/xvx;->l()V

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public final synthetic y0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xvx;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->a:Ll/xvx;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xvx;->r()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
