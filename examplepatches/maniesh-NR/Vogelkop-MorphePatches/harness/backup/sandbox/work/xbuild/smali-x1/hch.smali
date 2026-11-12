.class public Lhch;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# instance fields
.field public final a:Lpjg;

.field public final b:Landroid/os/Handler;

.field public c:Lcom/opera/android/custom_views/OperaIntroView;

.field public d:Lnu5;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lpjg;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lhch;->a:Lpjg;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lhch;->b:Landroid/os/Handler;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhch;->e:Z

    return-void
.end method


# virtual methods
.method public final f0()V
    .registers 3

    iget-object v0, p0, Lhch;->b:Landroid/os/Handler;

    iget-object v1, p0, Lhch;->a:Lpjg;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lqch;

    invoke-interface {p0, v1}, Lqch;->b(Z)V

    return-void

    :cond_18
    iput-boolean v1, p0, Lhch;->f:Z

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lhch;->a:Lpjg;

    const-wide/16 v0, 0x2710

    iget-object p0, p0, Lhch;->b:Landroid/os/Handler;

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    const p0, 0x7f0d00f6

    const/4 p3, 0x0

    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lhch;->b:Landroid/os/Handler;

    iget-object p0, p0, Lhch;->a:Lpjg;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lhch;->d:Lnu5;

    iget-object v1, v0, Lnu5;->b:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v1, 0x0

    iput v1, v0, Lnu5;->d:F

    invoke-virtual {v0}, Lnu5;->run()V

    const/4 v0, 0x0

    iput-object v0, p0, Lhch;->d:Lnu5;

    iput-object v0, p0, Lhch;->c:Lcom/opera/android/custom_views/OperaIntroView;

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public final onResume()V
    .registers 4

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    iget-boolean v0, p0, Lhch;->f:Z

    if-eqz v0, :cond_14

    new-instance v0, Lpjg;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lhch;->b:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_14
    iget-boolean v0, p0, Lhch;->e:Z

    if-eqz v0, :cond_3c

    const/4 v0, 0x0

    iput-boolean v0, p0, Lhch;->e:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object v1

    new-instance v2, Lgch;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p0, v2, Lgch;->a:Lhch;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-virtual {p0, v2}, Ltcc;->a(Lmdc;)V

    invoke-virtual {v1, v0, v2}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    :cond_3c
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0a059d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/OperaIntroView;

    iput-object p1, p0, Lhch;->c:Lcom/opera/android/custom_views/OperaIntroView;

    new-instance p2, Lnu5;

    iget-object v0, p0, Lhch;->b:Landroid/os/Handler;

    invoke-direct {p2, p1, v0}, Lnu5;-><init>(Lcom/opera/android/custom_views/OperaIntroView;Landroid/os/Handler;)V

    iput-object p2, p0, Lhch;->d:Lnu5;

    const/16 p1, 0x65

    new-array p1, p1, [Ljava/lang/Integer;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x0

    move v0, p2

    :goto_21
    const/16 v1, 0x64

    if-gt v0, v1, :cond_2f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    :cond_2f
    iget-object v0, p0, Lhch;->c:Lcom/opera/android/custom_views/OperaIntroView;

    new-instance v1, Lwub;

    invoke-direct {v1, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p1}, Lcom/opera/android/custom_views/OperaIntroView;->D(Lelf;Ljava/util/List;)V

    iget-object p0, p0, Lhch;->c:Lcom/opera/android/custom_views/OperaIntroView;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/OperaIntroView;->C(I)V

    const/16 p1, 0x9c

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p2, p1, v0}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    return-void
.end method
