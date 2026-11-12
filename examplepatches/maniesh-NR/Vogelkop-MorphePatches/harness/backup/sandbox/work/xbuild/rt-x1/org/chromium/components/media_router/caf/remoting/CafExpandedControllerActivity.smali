.class public Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;
.super Landroidx/fragment/app/r;
.source "SourceFile"

# interfaces
.implements La93;


# static fields
.field public static final synthetic h:I


# instance fields
.field public a:Landroid/os/Handler;

.field public b:Lorg/chromium/third_party/android/media/MediaController;

.field public c:Lbuh;

.field public d:Landroidx/mediarouter/app/MediaRouteButton;

.field public e:Landroid/widget/TextView;

.field public f:Lfv2;

.field public final g:Lwth;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/r;-><init>()V

    new-instance v0, Lwth;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->g:Lwth;

    return-void
.end method


# virtual methods
.method public final f()V
    .registers 1

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Landroidx/fragment/app/r;->onCreate(Landroid/os/Bundle;)V

    sget-object p1, Lbuh;->g:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbuh;

    goto :goto_10

    :cond_f
    move-object p1, v0

    :goto_10
    if-eqz p1, :cond_a1

    invoke-virtual {p1}, Lc93;->g()Z

    move-result v1

    if-eqz v1, :cond_a1

    iput-object p1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object p1, p1, Lc93;->e:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v1, 0x400

    invoke-virtual {p1, v1, v1}, Landroid/view/Window;->setFlags(II)V

    const p1, 0x7f0d0138

    invoke-virtual {p0, p1}, Lxd5;->setContentView(I)V

    const p1, 0x1020002

    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    const/high16 v1, -0x1000000

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    const v1, 0x7f0a01e7

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lorg/chromium/third_party/android/media/MediaController;

    iput-object v1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->b:Lorg/chromium/third_party/android/media/MediaController;

    iget-object v2, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->g:Lwth;

    iput-object v2, v1, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    invoke-virtual {v1}, Lorg/chromium/third_party/android/media/MediaController;->c()V

    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d00b2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroidx/mediarouter/app/MediaRouteButton;

    if-eqz v2, :cond_82

    check-cast v1, Landroidx/mediarouter/app/MediaRouteButton;

    iput-object v1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->d:Landroidx/mediarouter/app/MediaRouteButton;

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->d:Landroidx/mediarouter/app/MediaRouteButton;

    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    iget-object p1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object p1, p1, Lc93;->c:Lvz5;

    if-eqz p1, :cond_79

    iget-object p1, p1, Lvz5;->d:Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Llrd;

    :cond_79
    invoke-interface {v0}, Llrd;->a()Lvnd;

    move-result-object p1

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->d:Landroidx/mediarouter/app/MediaRouteButton;

    invoke-virtual {v0, p1}, Landroidx/mediarouter/app/MediaRouteButton;->d(Lvnd;)V

    :cond_82
    const p1, 0x7f0a01e9

    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->e:Landroid/widget/TextView;

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->a:Landroid/os/Handler;

    new-instance p1, Lfv2;

    const/16 v0, 0x1c

    invoke-direct {p1, p0, v0}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->f:Lfv2;

    invoke-virtual {p0}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->t()V

    return-void

    :cond_a1
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object v0, v0, Lc93;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-super {p0}, Landroidx/fragment/app/r;->onDestroy()V

    return-void
.end method

.method public final onMetadataUpdated()V
    .registers 1

    invoke-virtual {p0}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->t()V

    return-void
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/r;->onResume()V

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v0

    if-eqz v0, :cond_e

    return-void

    :cond_e
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onStatusUpdated()V
    .registers 1

    invoke-virtual {p0}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->t()V

    return-void
.end method

.method public final s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;
    .registers 1

    iget-object p0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object p0, p0, Lc93;->a:Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0}, Lcom/google/android/gms/cast/framework/CastSession;->getRemoteMediaClient()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p0

    return-object p0
.end method

.method public final t()V
    .registers 4

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v0

    if-eqz v0, :cond_53

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object v0, v0, Lc93;->a:Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/CastSession;->getCastDevice()Lcom/google/android/gms/cast/CastDevice;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/CastDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22

    const v1, 0x7f1403c9

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_24

    :cond_22
    const-string v0, ""

    :goto_24
    iget-object v1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->e:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->b:Lorg/chromium/third_party/android/media/MediaController;

    invoke-virtual {v0}, Lorg/chromium/third_party/android/media/MediaController;->d()V

    invoke-virtual {v0}, Lorg/chromium/third_party/android/media/MediaController;->b()V

    invoke-virtual {v0}, Lorg/chromium/third_party/android/media/MediaController;->c()V

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->b:Lorg/chromium/third_party/android/media/MediaController;

    invoke-virtual {v0}, Lorg/chromium/third_party/android/media/MediaController;->d()V

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->a:Landroid/os/Handler;

    iget-object v1, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->f:Lfv2;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_53

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->a:Landroid/os/Handler;

    iget-object p0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->f:Lfv2;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_53
    return-void
.end method
