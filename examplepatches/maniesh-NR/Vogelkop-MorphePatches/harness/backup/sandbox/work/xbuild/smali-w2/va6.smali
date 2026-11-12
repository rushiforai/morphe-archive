.class public final Lva6;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lmzk;
.implements Lcll;


# instance fields
.field public final a:Lx5f;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ldll;

.field public final d:Lnzk;

.field public e:Z


# direct methods
.method public constructor <init>(Lx5f;Lcom/opera/android/settings/SettingsManager;Ldll;Lnzk;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lva6;->a:Lx5f;

    iput-object p2, p0, Lva6;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lva6;->c:Ldll;

    iput-object p4, p0, Lva6;->d:Lnzk;

    return-void
.end method


# virtual methods
.method public final K()V
    .registers 6

    iget-object v0, p0, Lva6;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lva6;->d:Lnzk;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->P(Lnzk;)Z

    move-result v0

    iget-boolean v1, p0, Lva6;->e:Z

    if-eq v1, v0, :cond_14

    iput-boolean v0, p0, Lva6;->e:Z

    iget-object p0, p0, Lva6;->a:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_15

    :cond_14
    return-void

    :cond_15
    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v1

    iget-object v1, v1, Lqp0;->b:Lb66;

    const/16 v3, 0x18

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, v0}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 8

    iget-object p1, p0, Lva6;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v0, p0, Lva6;->d:Lnzk;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->P(Lnzk;)Z

    move-result p1

    iput-boolean p1, p0, Lva6;->e:Z

    iget-object v1, p0, Lva6;->a:Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_25

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-static {v2, v4}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v2

    iget-object v2, v2, Lqp0;->b:Lb66;

    const/16 v5, 0x18

    invoke-virtual {v2, v5, v3, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v4}, Lx5f;->U0(Lx56;)V

    :cond_25
    iget-boolean p1, v0, Lnzk;->a:Z

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_3d

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v2}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v2

    const/16 v5, 0x8

    invoke-virtual {v2, v5, v3, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v4}, Lx5f;->U0(Lx56;)V

    :cond_3d
    iget-object p1, p0, Lva6;->c:Ldll;

    invoke-virtual {p1, p0}, Ldll;->a(Lcll;)V

    iget-object p1, v0, Lnzk;->b:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final k(Z)V
    .registers 6

    iget-object p0, p0, Lva6;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->J(Lzpa;)Lsn0;

    move-result-object v0

    const/16 v2, 0x8

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lva6;->c:Ldll;

    invoke-virtual {p1, p0}, Ldll;->b(Lcll;)V

    iget-object p1, p0, Lva6;->d:Lnzk;

    iget-object p1, p1, Lnzk;->b:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method
