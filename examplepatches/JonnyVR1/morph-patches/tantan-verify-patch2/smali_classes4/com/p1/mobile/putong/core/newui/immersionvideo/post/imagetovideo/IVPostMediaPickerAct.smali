.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

.field public d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->b2(Landroid/view/View;)V

    return-void
.end method

.method public static Z1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "params_object"

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "extra_bundle"

    .line 19
    .line 20
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method private a2(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->A1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/v8m;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/v8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic b2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c2(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/adc0;->Nb:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "extra_bundle"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 42
    .line 43
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v0, "params_object"

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    sget v0, Ll/adc0;->Nb:I

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 80
    .line 81
    const-string v1, "MediaPickerFrag"

    .line 82
    .line 83
    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public checkRunningCondition()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->ensurePlugin()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/toh0;->t(Landroid/content/Intent;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public ensurePlugin()Z
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 10
    .line 11
    const-string v0, "account"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/dg00;->z(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {}, Ll/uqb0;->J0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->G:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget v1, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->finishInAnim:I

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget v1, Ll/w7c0;->a:I

    .line 17
    .line 18
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->finishOutAnim:I

    .line 19
    .line 20
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget p2, Ll/kec0;->m4:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->a2(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/u8m;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/u8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->onActivityResult(IILandroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v1, 0x7

    .line 17
    if-ne v0, v1, :cond_2

    .line 18
    .line 19
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v1, "preprocessed"

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 31
    .line 32
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    const-string p1, "image/jpeg"

    .line 39
    .line 40
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 41
    .line 42
    new-instance p1, Landroid/content/Intent;

    .line 43
    .line 44
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 45
    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 48
    .line 49
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->c:Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerFrag;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerBaseFrag;->N4(Landroid/content/Intent;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    const/4 v0, -0x1

    .line 74
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostMediaPickerAct;->finish()V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_local_album"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v0, Ll/c9c0;->V:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 16
    .line 17
    .line 18
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    const/16 v0, 0x1a

    .line 21
    .line 22
    if-lt p1, v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    and-int/lit8 p1, p1, -0x11

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
