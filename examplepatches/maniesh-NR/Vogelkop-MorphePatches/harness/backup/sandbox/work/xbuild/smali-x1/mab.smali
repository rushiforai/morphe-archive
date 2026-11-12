.class public Lmab;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# instance fields
.field public final a:Landroid/os/Handler;

.field public b:Lcom/opera/android/custom_views/OperaIntroView;

.field public c:Lnu5;

.field public d:Lu85;

.field public e:I


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lmab;->a:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final f0(Lr0k;Ljava/util/Locale;Lx5f;)V
    .registers 6

    new-instance v0, Lwci;

    invoke-direct {v0}, Lwci;-><init>()V

    iget-object v1, v0, Lwci;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p2, Ln9h;

    invoke-direct {p2, v0}, Ln9h;-><init>(Lwci;)V

    invoke-interface {p1, p2}, Lr0k;->i(Ln9h;)Lcom/google/android/gms/tasks/Task;

    move-result-object p2

    new-instance v0, La32;

    const/16 v1, 0xf

    invoke-direct {v0, p0, p1, p3, v1}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lge5;

    const/16 v0, 0x1a

    invoke-direct {p2, p0, p3, v0}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    iget p3, p0, Lmab;->e:I

    if-ne p1, p3, :cond_12

    if-nez p2, :cond_12

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/startup/InstallSplitLocaleActivity;

    invoke-virtual {p0}, Lcom/opera/android/startup/InstallSplitLocaleActivity;->J()V

    :cond_12
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 10

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    sget-object p1, Lmdb;->b:Ljava/util/Random;

    invoke-virtual {p1}, Ljava/util/Random;->nextInt()I

    move-result p1

    const v0, 0xffff

    and-int/2addr p1, v0

    iput p1, p0, Lmab;->e:I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object v2, p1, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object v3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v4

    invoke-interface {v3}, Lr0k;->c()Lcom/google/android/gms/tasks/Task;

    move-result-object v7

    new-instance v0, Luf;

    const/4 v6, 0x2

    move-object v1, p0

    move-object v5, v2

    move-object v2, p1

    invoke-direct/range {v0 .. v6}, Luf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v2, v5

    invoke-virtual {v7, v0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance v0, Lws1;

    const/16 v5, 0x9

    invoke-direct/range {v0 .. v5}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    const p0, 0x7f0d00f6

    const/4 p3, 0x0

    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a059d

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/custom_views/OperaIntroView;

    if-eqz p2, :cond_2a

    const p1, 0x7f0a059e

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    if-eqz p2, :cond_2a

    check-cast p0, Landroid/widget/LinearLayout;

    const p1, 0x7f141177

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    return-object p0

    :cond_2a
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lmab;->d:Lu85;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Lu85;->c()V

    const/4 v0, 0x0

    iput-object v0, p0, Lmab;->d:Lu85;

    :cond_d
    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lmab;->c:Lnu5;

    iget-object v1, v0, Lnu5;->b:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v1, 0x0

    iput v1, v0, Lnu5;->d:F

    invoke-virtual {v0}, Lnu5;->run()V

    const/4 v0, 0x0

    iput-object v0, p0, Lmab;->c:Lnu5;

    iput-object v0, p0, Lmab;->b:Lcom/opera/android/custom_views/OperaIntroView;

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0a059d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/OperaIntroView;

    iput-object p1, p0, Lmab;->b:Lcom/opera/android/custom_views/OperaIntroView;

    new-instance p2, Lnu5;

    iget-object v0, p0, Lmab;->a:Landroid/os/Handler;

    invoke-direct {p2, p1, v0}, Lnu5;-><init>(Lcom/opera/android/custom_views/OperaIntroView;Landroid/os/Handler;)V

    iput-object p2, p0, Lmab;->c:Lnu5;

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
    iget-object v0, p0, Lmab;->b:Lcom/opera/android/custom_views/OperaIntroView;

    new-instance v1, Lqe6;

    const/16 v2, 0x14

    invoke-direct {v1, p0, v2}, Lqe6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, p1}, Lcom/opera/android/custom_views/OperaIntroView;->D(Lelf;Ljava/util/List;)V

    iget-object p0, p0, Lmab;->b:Lcom/opera/android/custom_views/OperaIntroView;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/OperaIntroView;->C(I)V

    const/16 p1, 0x9c

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p2, p1, v0}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    return-void
.end method
