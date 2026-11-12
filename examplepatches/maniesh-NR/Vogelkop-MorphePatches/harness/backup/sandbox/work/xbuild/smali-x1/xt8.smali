.class public final Lxt8;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lrb;

.field public final b:Lydn;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lwt8;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lydn;Lcom/opera/android/settings/SettingsManager;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lrb;

    invoke-direct {v0, p1}, Lrb;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lxt8;->a:Lrb;

    iput-object p2, p0, Lxt8;->b:Lydn;

    iput-object p3, p0, Lxt8;->c:Lcom/opera/android/settings/SettingsManager;

    new-instance p1, Lwt8;

    invoke-direct {p1, p0}, Lwt8;-><init>(Lxt8;)V

    iput-object p1, p0, Lxt8;->d:Lwt8;

    return-void
.end method


# virtual methods
.method public final R(I)V
    .registers 4

    iget-object p0, p0, Lxt8;->a:Lrb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    if-eqz p1, :cond_19

    if-eq p1, v0, :cond_16

    const/4 v1, 0x2

    if-ne p1, v1, :cond_10

    const-string p1, "vpn_pro"

    goto :goto_1b

    :cond_10
    const-string p0, "Unknown feature"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_16
    const-string p1, "night_mode"

    goto :goto_1b

    :cond_19
    const-string p1, "vpn"

    :goto_1b
    const-string v1, "feature_activated_"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void
.end method

.method public final S(I)V
    .registers 4

    iget-object p0, p0, Lxt8;->a:Lrb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x1

    if-eqz p1, :cond_19

    if-eq p1, v0, :cond_16

    const/4 v1, 0x2

    if-ne p1, v1, :cond_10

    const-string p1, "vpn_pro"

    goto :goto_1b

    :cond_10
    const-string p0, "Unknown feature"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_16
    const-string p1, "night_mode"

    goto :goto_1b

    :cond_19
    const-string p1, "vpn"

    :goto_1b
    const-string v1, "settings_fragment_shown_"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p1, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-object p1, p0, Lxt8;->b:Lydn;

    iget-object v0, p0, Lxt8;->d:Lwt8;

    invoke-virtual {p1, v0}, Lydn;->b(Ltdn;)V

    iget-object p0, p0, Lxt8;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {v0}, Lwt8;->s()V

    iget-object p0, v0, Lwt8;->a:Lxt8;

    iget-object p1, p0, Lxt8;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1e

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lxt8;->R(I)V

    :cond_1e
    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lxt8;->b:Lydn;

    iget-object v0, p0, Lxt8;->d:Lwt8;

    invoke-virtual {p1, v0}, Lydn;->A(Ltdn;)V

    iget-object p0, p0, Lxt8;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
