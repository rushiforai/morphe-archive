.class public Ll/cdw;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public l:Ll/x20;

.field public m:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->j:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/cdw;->j:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p2, p0, Ll/cdw;->l:Ll/x20;

    .line 10
    .line 11
    iput-object p3, p0, Ll/cdw;->m:Ll/x20;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/cdw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cdw;->H()V

    return-void
.end method

.method public static synthetic F(Ll/cdw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cdw;->I()V

    return-void
.end method

.method public static synthetic G(Ll/cdw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cdw;->J()V

    return-void
.end method

.method private synthetic H()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdw;->l:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic I()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdw;->l:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/cdw;->k:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic J()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdw;->m:Ll/x20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/cdw;->j:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Ll/kec0;->t3:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 19
    .line 20
    iput-object p1, p0, Ll/cdw;->k:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, -0x1

    .line 13
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 14
    .line 15
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    const/high16 v0, 0x4000000

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 23
    .line 24
    .line 25
    const/high16 v0, 0x20000

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x400

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 37
    .line 38
    .line 39
    const/high16 v0, -0x80000000

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public show()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cdw;->k:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->setErrorWhenFrameJank(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cdw;->k:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 11
    .line 12
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/fdw;->d()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/zcw;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/zcw;-><init>(Ll/cdw;)V

    .line 23
    .line 24
    .line 25
    new-instance v3, Ll/adw;

    .line 26
    .line 27
    invoke-direct {v3, p0}, Ll/adw;-><init>(Ll/cdw;)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ll/bdw;

    .line 31
    .line 32
    invoke-direct {v4, p0}, Ll/bdw;-><init>(Ll/cdw;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->z(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Ll/x20;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
