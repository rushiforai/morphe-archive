.class public Lpmd;
.super Lomd;
.source "SourceFile"


# instance fields
.field public final d:Lyg8;

.field public final e:Lqmd;

.field public f:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lomd;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lyg8;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lpmd;->d:Lyg8;

    new-instance v1, Lvl9;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Lvl9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public constructor <init>(Lqmd;)V
    .registers 3

    .line 26
    invoke-direct {p0}, Lomd;-><init>()V

    .line 27
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 28
    new-instance v0, Lyg8;

    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object v0, p0, Lpmd;->d:Lyg8;

    .line 31
    iput-object p1, p0, Lpmd;->e:Lqmd;

    return-void
.end method


# virtual methods
.method public final h0(Landroid/content/Context;)Lnmd;
    .registers 5

    new-instance v0, Lco4;

    invoke-virtual {p0}, Landroidx/fragment/app/i;->getTheme()I

    move-result v1

    const/4 v2, 0x1

    invoke-direct {v0, p0, p1, v1, v2}, Lco4;-><init>(Lomd;Landroid/content/Context;IB)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-object v0
.end method

.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onDismiss(Landroid/content/DialogInterface;)V

    iget-boolean p1, p0, Lpmd;->f:Z

    if-nez p1, :cond_12

    iget-object p0, p0, Lpmd;->e:Lqmd;

    if-eqz p0, :cond_12

    iget-object p0, p0, Lk73;->e:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;

    invoke-virtual {p0}, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a()V

    :cond_12
    return-void
.end method

.method public final onStart()V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    iget-object v1, p0, Lpmd;->d:Lyg8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    iput v0, v1, Lyg8;->a:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_1f

    const/4 v0, 0x1

    goto :goto_20

    :cond_1f
    const/4 v0, 0x0

    :goto_20
    iput-boolean v0, v1, Lyg8;->b:Z

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    return-void
.end method

.method public final onStop()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStop()V

    iget-object v0, p0, Lpmd;->d:Lyg8;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-virtual {v0, p0}, Lyg8;->a(Landroidx/fragment/app/r;)V

    return-void
.end method
