.class public final Ld3f;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lx0f;

.field public final e:Lk3i;

.field public final f:Lode;

.field public final g:Ls9;

.field public final h:Lh42;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ld8j;Lx0f;Lk3i;)V
    .registers 7

    invoke-direct {p0, p1, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p3, p0, Ld3f;->d:Lx0f;

    iput-object p4, p0, Ld3f;->e:Lk3i;

    new-instance p2, Lode;

    invoke-direct {p2}, Lekc;-><init>()V

    iput-object p2, p0, Ld3f;->f:Lode;

    new-instance p2, Ls9;

    const/16 v0, 0x1a

    invoke-direct {p2, p0, v0}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ld3f;->g:Ls9;

    new-instance v0, Lh42;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lh42;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ld3f;->h:Lh42;

    invoke-virtual {p0}, Ld3f;->g()V

    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p1, p3, Lx0f;->e:Lode;

    new-instance p2, Lc3f;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lc3f;-><init>(Ld3f;B)V

    new-instance p3, Lt7d;

    const/4 v1, 0x1

    invoke-direct {p3, p2, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, p3}, Lh42;->s(Lekc;Lf7f;)V

    invoke-virtual {p4}, Lk3i;->a()Likc;

    move-result-object p1

    new-instance p2, Lc3f;

    invoke-direct {p2, p0, v1}, Lc3f;-><init>(Ld3f;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, p2, v1}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, p0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 2

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ld3f;->g:Ls9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method

.method public final g()V
    .registers 12

    new-instance v0, Lb3f;

    new-instance v1, Ljwk;

    const-string v2, "vpn_pro_in_app_notification"

    iget-object v3, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x1

    invoke-direct {v1, v4, v2}, Ljwk;-><init>(ZZ)V

    new-instance v2, Ljwk;

    const-string v5, "wallpaper_in_app_notification"

    invoke-virtual {v3, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v5

    invoke-direct {v2, v4, v5}, Ljwk;-><init>(ZZ)V

    move-object v5, v3

    new-instance v3, Ljwk;

    const-string v6, "feedback_in_app_notification"

    invoke-virtual {v5, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v3, v4, v6}, Ljwk;-><init>(ZZ)V

    move v6, v4

    new-instance v4, Ljwk;

    const-string v7, "product_and_service_in_app_notification"

    invoke-virtual {v5, v7}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v7

    invoke-direct {v4, v6, v7}, Ljwk;-><init>(ZZ)V

    move-object v7, v5

    new-instance v5, Ljwk;

    const-string v8, "feature_tips_notification"

    invoke-virtual {v7, v8}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    invoke-direct {v5, v6, v8}, Ljwk;-><init>(ZZ)V

    move v8, v6

    new-instance v6, Ljwk;

    const-string v9, "esim_notifications"

    invoke-virtual {v7, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v9

    invoke-direct {v6, v8, v9}, Ljwk;-><init>(ZZ)V

    move-object v8, v7

    new-instance v7, Ljwk;

    iget-object v9, p0, Ld3f;->e:Lk3i;

    invoke-virtual {v9}, Lk3i;->b()Z

    move-result v9

    const-string v10, "rewards_notifications"

    invoke-virtual {v8, v10}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    invoke-direct {v7, v9, v8}, Ljwk;-><init>(ZZ)V

    iget-object v8, p0, Ld3f;->d:Lx0f;

    iget-object v8, v8, Lx0f;->e:Lode;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lw0f;

    invoke-direct/range {v0 .. v8}, Lb3f;-><init>(Ljwk;Ljwk;Ljwk;Ljwk;Ljwk;Ljwk;Ljwk;Lw0f;)V

    iget-object p0, p0, Ld3f;->f:Lode;

    invoke-static {p0, v0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    return-void
.end method
