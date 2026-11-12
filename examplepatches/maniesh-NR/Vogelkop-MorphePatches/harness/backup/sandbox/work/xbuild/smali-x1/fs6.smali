.class public final Lfs6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lkze;

.field public final c:Lkze;

.field public final d:Ljze;

.field public final e:Ljze;

.field public final f:Ljze;

.field public final g:Lode;

.field public final h:Lhx5;

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lkze;Lkze;Lode;Lhx5;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lfs6;->b:Lkze;

    iput-object p3, p0, Lfs6;->c:Lkze;

    iput-object p4, p0, Lfs6;->g:Lode;

    iput-object p5, p0, Lfs6;->h:Lhx5;

    new-instance p4, Ljze;

    invoke-virtual {p0}, Lfs6;->a()Z

    move-result p5

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p5

    invoke-direct {p4, p5}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lfs6;->e:Ljze;

    new-instance p5, Les6;

    const/4 v0, 0x0

    invoke-direct {p5, p0, v0}, Les6;-><init>(Lfs6;B)V

    invoke-virtual {p4, p3, p5}, Ljze;->s(Lekc;Lf7f;)V

    new-instance p4, Ljze;

    invoke-virtual {p0}, Lfs6;->b()Z

    move-result p5

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p5

    invoke-direct {p4, p5}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lfs6;->d:Ljze;

    new-instance p5, Les6;

    const/4 v1, 0x1

    invoke-direct {p5, p0, v1}, Les6;-><init>(Lfs6;B)V

    invoke-virtual {p4, p2, p5}, Ljze;->s(Lekc;Lf7f;)V

    new-instance p4, Ljze;

    invoke-virtual {p0}, Lfs6;->b()Z

    move-result p5

    if-eqz p5, :cond_54

    invoke-virtual {p0}, Lfs6;->a()Z

    move-result p5

    if-eqz p5, :cond_54

    const-string p5, "live_scores_odds_enabled"

    invoke-virtual {p1, p5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p5

    if-eqz p5, :cond_54

    move v0, v1

    :cond_54
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p5

    invoke-direct {p4, p5}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Lfs6;->f:Ljze;

    new-instance p5, Les6;

    const/4 v0, 0x2

    invoke-direct {p5, p0, v0}, Les6;-><init>(Lfs6;B)V

    iget-object p4, p4, Ljze;->l:Lh42;

    invoke-virtual {p4, p2, p5}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p2, Les6;

    const/4 p5, 0x3

    invoke-direct {p2, p0, p5}, Les6;-><init>(Lfs6;B)V

    invoke-virtual {p4, p3, p2}, Lh42;->s(Lekc;Lf7f;)V

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "live_scores_enabled"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Lfs6;->b()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object v0, p0, Lfs6;->d:Ljze;

    invoke-static {v0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lfs6;->c()V

    return-void

    :cond_19
    const-string v0, "live_scores_odds_enabled"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_24

    invoke-virtual {p0}, Lfs6;->c()V

    :cond_24
    return-void
.end method

.method public final a()Z
    .registers 2

    iget-object v0, p0, Lfs6;->c:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-boolean p0, p0, Lfs6;->i:Z

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Z
    .registers 2

    iget-object v0, p0, Lfs6;->b:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object p0, p0, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "live_scores_enabled"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final c()V
    .registers 3

    invoke-virtual {p0}, Lfs6;->b()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Lfs6;->a()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "live_scores_odds_enabled"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object p0, p0, Lfs6;->f:Ljze;

    invoke-static {p0, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void
.end method
