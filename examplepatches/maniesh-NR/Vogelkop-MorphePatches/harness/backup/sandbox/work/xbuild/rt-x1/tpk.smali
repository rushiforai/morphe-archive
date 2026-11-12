.class public final Ltpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;
.implements Lp5j;


# instance fields
.field public final a:Lxnh;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lx5f;


# direct methods
.method public constructor <init>(Lxnh;Lcom/opera/android/settings/SettingsManager;Lx5f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltpk;->a:Lxnh;

    iput-object p2, p0, Ltpk;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Ltpk;->c:Lx5f;

    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_suggested_speed_dials_on_start_page"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    const-string v0, "enable_frequently_visited_sites"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    return-void

    :cond_11
    invoke-virtual {p0}, Ltpk;->a()V

    return-void
.end method

.method public final a()V
    .registers 8

    iget-object v0, p0, Ltpk;->c:Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    iget-object v2, p0, Ltpk;->a:Lxnh;

    invoke-virtual {v2}, Lno7;->j()Z

    move-result v3

    if-eqz v3, :cond_53

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwnh;

    const/high16 v4, 0x8000000

    invoke-virtual {v3, v4}, Lwnh;->a(I)Z

    move-result v3

    iget-object p0, p0, Ltpk;->b:Lcom/opera/android/settings/SettingsManager;

    if-eqz v3, :cond_28

    invoke-virtual {p0, v2}, Lcom/opera/android/settings/SettingsManager;->A(Lxnh;)Z

    move-result v2

    if-eqz v2, :cond_25

    sget-object v2, Ltq0;->b:Ltq0;

    goto :goto_2a

    :cond_25
    sget-object v2, Ltq0;->c:Ltq0;

    goto :goto_2a

    :cond_28
    sget-object v2, Ltq0;->d:Ltq0;

    :goto_2a
    iget-boolean v3, v0, Lx5f;->h:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_42

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v6, 0x35

    invoke-virtual {v5, v6, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_42
    const-string v2, "enable_frequently_visited_sites"

    invoke-virtual {p0, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4d

    sget-object p0, Lyk0;->b:Lyk0;

    goto :goto_4f

    :cond_4d
    sget-object p0, Lyk0;->c:Lyk0;

    :goto_4f
    iget-boolean v2, v0, Lx5f;->h:Z

    if-nez v2, :cond_54

    :cond_53
    return-void

    :cond_54
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, v1}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x36

    invoke-virtual {v1, v3, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final o(Z)V
    .registers 2

    invoke-virtual {p0}, Ltpk;->a()V

    return-void
.end method
