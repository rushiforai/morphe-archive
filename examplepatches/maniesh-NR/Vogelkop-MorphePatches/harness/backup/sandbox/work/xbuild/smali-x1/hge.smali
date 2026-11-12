.class public final Lhge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhxl;


# instance fields
.field public final a:Lbf9;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lx5f;

.field public d:Lwi0;


# direct methods
.method public constructor <init>(Lbf9;Lcom/opera/android/settings/SettingsManager;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhge;->a:Lbf9;

    iput-object p2, p0, Lhge;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lhge;->c:Lx5f;

    new-instance p3, Ls9;

    const/16 v0, 0x17

    invoke-direct {p3, p0, v0}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p1, p0}, Lbf9;->b(Lhxl;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lhge;->a:Lbf9;

    invoke-virtual {v0}, Lbf9;->t()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {v0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1f

    iget-object v0, p0, Lhge;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "my_flow_visible"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    sget-object v0, Lwi0;->b:Lwi0;

    goto :goto_21

    :cond_1c
    sget-object v0, Lwi0;->c:Lwi0;

    goto :goto_21

    :cond_1f
    sget-object v0, Lwi0;->d:Lwi0;

    :goto_21
    iget-object v1, p0, Lhge;->d:Lwi0;

    if-eq v0, v1, :cond_2d

    iput-object v0, p0, Lhge;->d:Lwi0;

    iget-object p0, p0, Lhge;->c:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_2e

    :cond_2d
    return-void

    :cond_2e
    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x37

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final i()V
    .registers 1

    invoke-virtual {p0}, Lhge;->a()V

    return-void
.end method

.method public final x(I)V
    .registers 2

    invoke-virtual {p0}, Lhge;->a()V

    return-void
.end method

.method public final z()V
    .registers 1

    return-void
.end method
