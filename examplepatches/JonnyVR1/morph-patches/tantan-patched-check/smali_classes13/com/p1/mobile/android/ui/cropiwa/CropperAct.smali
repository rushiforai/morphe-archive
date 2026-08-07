.class public Lcom/p1/mobile/android/ui/cropiwa/CropperAct;
.super Lcom/p1/mobile/android/app/Act;
.source "SourceFile"


# instance fields
.field public c:Ll/gxb;

.field public d:Lcom/p1/mobile/android/ui/cropiwa/c;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "image_uri"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "crop_new_profile_picture"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static H1(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, "temp_media_crop_dir"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static I1(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->H1(Landroid/content/Context;)Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method


# virtual methods
.method public E1()V
    .locals 0

    .line 1
    return-void
.end method

.method public checkGradientColors()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    sget v2, Ll/z8c0;->a:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    sget v0, Ll/z8c0;->a:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->d:Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/c;->q()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getAppTheme()Ll/ux0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/zld;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zld;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->d:Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/c;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gxb;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/gxb;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/ui/cropiwa/c;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropperAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->d:Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gxb;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gxb;->o0(Landroid/view/Menu;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public onHomePressed()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gxb;->l0()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string p0, "confirm_cancel_picture"

    .line 13
    .line 14
    const-string v0, "cancel"

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, "e_picture_editing_page_operation_button"

    .line 25
    .line 26
    const-string v1, "p_picture_editing_page"

    .line 27
    .line 28
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "keep_width_bigger_than_540"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->d:Lcom/p1/mobile/android/ui/cropiwa/c;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/c;->f()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "image_uri"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Ll/gxb;->q0(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "crop_new_profile_picture"

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p1, v0}, Ll/gxb;->p0(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "crop_new_43_picture"

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {p1, v0}, Ll/gxb;->s0(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->c:Ll/gxb;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "is_crop_live_cover"

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p1, v0}, Ll/gxb;->r0(Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string v0, "is_new_ui1"

    .line 70
    .line 71
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_0

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->checkGradientColors()V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-void
.end method

.method public setTheme()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->setTheme()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "is_new_ui1"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget v0, Ll/tgc0;->m:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
