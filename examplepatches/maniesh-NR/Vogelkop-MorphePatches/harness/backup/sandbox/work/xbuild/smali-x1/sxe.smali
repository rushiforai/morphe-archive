.class public final Lsxe;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lnwe;
.implements Lp5j;


# instance fields
.field public final a:Lx5f;

.field public final b:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lx5f;Lcom/opera/android/settings/SettingsManager;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsxe;->a:Lx5f;

    iput-object p2, p0, Lsxe;->b:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "darken_websites"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "night_mode_dimming"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "night_mode_overlay_keyboard"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "night_mode_schedule"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "night_mode"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "night_mode_switch_theme"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "night_mode_temperature"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_39

    return-void

    :cond_39
    invoke-virtual {p0}, Lsxe;->R()V

    return-void
.end method

.method public final R()V
    .registers 15

    iget-object v0, p0, Lsxe;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, v0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result v2

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x0

    sget-object v7, Lcb0;->b:Lcb0;

    if-eqz v2, :cond_30

    if-eq v2, v5, :cond_25

    if-eq v2, v4, :cond_1a

    move v2, v6

    goto :goto_31

    :cond_1a
    sget-object v2, Lowe;->c:Lowe;

    iget-object v2, v2, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    sget-object v7, Lcb0;->d:Lcb0;

    goto :goto_31

    :cond_25
    sget-object v2, Lowe;->c:Lowe;

    iget-object v2, v2, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    sget-object v7, Lcb0;->c:Lcb0;

    goto :goto_31

    :cond_30
    move v2, v3

    :goto_31
    const-string v8, "night_mode_temperature"

    invoke-interface {v1, v8}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v9

    const/4 v10, -0x1

    if-eqz v9, :cond_3f

    invoke-virtual {v0, v8}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v8

    goto :goto_40

    :cond_3f
    move v8, v10

    :goto_40
    const-string v9, "night_mode_dimming"

    invoke-interface {v1, v9}, Ly9j;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4c

    invoke-virtual {v0, v9}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v10

    :cond_4c
    const-string v1, "night_mode_switch_theme"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    const-string v9, "darken_websites"

    invoke-virtual {v0, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    const-string v11, "night_mode_overlay_keyboard"

    invoke-virtual {v0, v11}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lsxe;->a:Lx5f;

    iget-boolean v11, p0, Lx5f;->h:Z

    if-nez v11, :cond_65

    return-void

    :cond_65
    iget-object v11, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    invoke-virtual {v12, v11}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v13

    invoke-virtual {v13, v11}, Lb66;->y(Lzpa;)Ldb0;

    move-result-object v11

    invoke-virtual {v11, v3, v3, v2}, Ljf0;->r(IIZ)V

    const/4 v2, 0x6

    invoke-virtual {v11, v2, v3, v7}, Ljf0;->q(IILjava/lang/Object;)V

    int-to-long v7, v8

    invoke-virtual {v11, v6, v3, v7, v8}, Ljf0;->p(IIJ)V

    const/4 v2, 0x5

    int-to-long v6, v10

    invoke-virtual {v11, v2, v3, v6, v7}, Ljf0;->p(IIJ)V

    invoke-virtual {v11, v5, v3, v1}, Ljf0;->r(IIZ)V

    invoke-virtual {v11, v4, v3, v9}, Ljf0;->r(IIZ)V

    const/4 v1, 0x4

    invoke-virtual {v11, v1, v3, v0}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v12}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    sget-object p1, Lowe;->c:Lowe;

    invoke-virtual {p1, p0}, Lowe;->a(Lnwe;)V

    iget-object p1, p0, Lsxe;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0}, Lsxe;->R()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    sget-object p1, Lowe;->c:Lowe;

    invoke-virtual {p1, p0}, Lowe;->b(Lnwe;)V

    iget-object p1, p0, Lsxe;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method

.method public final y(Z)V
    .registers 5

    iget-object p0, p0, Lsxe;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v2

    invoke-virtual {v2, v0}, Lb66;->y(Lzpa;)Ldb0;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v2, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
