.class public abstract Lyij;
.super Lg53;
.source "SourceFile"


# instance fields
.field public final P:Lnj2;

.field public Q:Ldb;

.field public R:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lrz4;-><init>(I)V

    new-instance v0, Lnj2;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lnj2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lyij;->P:Lnj2;

    return-void
.end method


# virtual methods
.method public final M0()Ldb;
    .registers 2

    iget-object v0, p0, Lyij;->Q:Ldb;

    if-nez v0, :cond_12

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    iput-object v0, p0, Lyij;->Q:Ldb;

    :cond_12
    return-object v0
.end method

.method public onDestroy()V
    .registers 2

    invoke-super {p0}, Lg53;->onDestroy()V

    invoke-virtual {p0}, Lyij;->M0()Ldb;

    move-result-object v0

    iget-object p0, p0, Lyij;->P:Lnj2;

    invoke-virtual {v0, p0}, Ldb;->h(Lcb;)V

    return-void
.end method

.method public p0()V
    .registers 2

    iget-boolean v0, p0, Lyij;->R:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lyij;->R:Z

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    return-void
.end method

.method public final v0()V
    .registers 2

    invoke-super {p0}, Lg53;->v0()V

    invoke-virtual {p0}, Lyij;->M0()Ldb;

    move-result-object v0

    iget-object p0, p0, Lyij;->P:Lnj2;

    invoke-virtual {v0, p0}, Ldb;->a(Lcb;)V

    return-void
.end method
