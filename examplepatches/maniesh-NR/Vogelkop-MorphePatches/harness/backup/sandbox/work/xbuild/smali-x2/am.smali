.class public final Lam;
.super Lryl;
.source "SourceFile"


# instance fields
.field public final c:Lc4;

.field public final d:Ljava/lang/Runnable;

.field public final e:Lq65;


# direct methods
.method public constructor <init>(Lc4;Ljava/lang/Runnable;)V
    .registers 4

    invoke-direct {p0}, Lryl;-><init>()V

    iput-object p1, p0, Lam;->c:Lc4;

    iput-object p2, p0, Lam;->d:Ljava/lang/Runnable;

    new-instance p1, Lc4;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Lc4;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lq65;

    const/4 v0, 0x4

    invoke-direct {p2, p1, v0}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lam;->e:Lq65;

    return-void
.end method


# virtual methods
.method public final g0()V
    .registers 2

    invoke-super {p0}, Lryl;->g0()V

    iget-object v0, p0, Lam;->e:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object p0, p0, Lam;->d:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    new-instance p1, Landroid/view/View;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    const/4 p2, -0x1

    invoke-direct {p0, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const p0, -0xff0100

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-object p1
.end method

.method public final onResume()V
    .registers 6

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    sget-object v0, Lvml;->d:Lumi;

    const-wide/16 v1, 0x64

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v4, p0, Lam;->e:Lq65;

    invoke-virtual {v4, v0, v1, v2, v3}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iget-object p0, p0, Lam;->c:Lc4;

    invoke-virtual {p0}, Lc4;->run()V

    return-void
.end method
