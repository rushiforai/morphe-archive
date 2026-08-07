.class public Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;
.super Lcom/p1/mobile/android/ui/cropiwa/CropperAct;
.source "SourceFile"


# instance fields
.field public e:Ll/ku20;

.field public f:Ll/lu20;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;-><init>()V

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
    invoke-static {p0, p1, v0, v0}, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;

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
    const-string p0, "crop_new_43_picture"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "is_crop_live_cover"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public E1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->e:Ll/ku20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ku20;->f0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ku20;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ku20;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->e:Ll/ku20;

    .line 10
    .line 11
    new-instance v0, Ll/lu20;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/lu20;-><init>(Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->f:Ll/lu20;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->e:Ll/ku20;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->e:Ll/ku20;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ku20;->h0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->e:Ll/ku20;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ku20;->i0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->e:Ll/ku20;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ku20;->k0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->e:Ll/ku20;

    .line 5
    .line 6
    sget-boolean p1, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ku20;->g0(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTheme()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->f:Ll/lu20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lu20;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
