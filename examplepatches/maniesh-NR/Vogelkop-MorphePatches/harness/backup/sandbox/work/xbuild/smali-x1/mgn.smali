.class public abstract Lmgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Loz3;

.field public final c:Lcom/opera/android/BrowserActivity;

.field public final d:Lgbf;

.field public final e:Lcom/opera/android/BrowserActivity;

.field public final f:Lk6l;

.field public final g:Lydn;

.field public final h:Lysl;

.field public final i:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Loz3;Lcom/opera/android/BrowserActivity;Lgbf;Lcom/opera/android/BrowserActivity;Lk6l;Lydn;Lysl;Lcom/opera/android/settings/SettingsManager;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lmgn;->b:Loz3;

    iput-object p3, p0, Lmgn;->c:Lcom/opera/android/BrowserActivity;

    iput-object p4, p0, Lmgn;->d:Lgbf;

    iput-object p5, p0, Lmgn;->e:Lcom/opera/android/BrowserActivity;

    iput-object p6, p0, Lmgn;->f:Lk6l;

    iput-object p7, p0, Lmgn;->g:Lydn;

    iput-object p8, p0, Lmgn;->h:Lysl;

    iput-object p9, p0, Lmgn;->i:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lmgn;->f()V

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 3

    iget-object p0, p0, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "vpn.tooltip_free_closed"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final b(Llgn;)V
    .registers 3

    invoke-virtual {p0}, Lmgn;->e()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object p0, p0, Lmgn;->b:Loz3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_11
    invoke-virtual {p0}, Lmgn;->a()Z

    move-result p1

    if-nez p1, :cond_1a

    invoke-virtual {p0}, Lmgn;->g()V

    :cond_1a
    return-void
.end method

.method public c()Lcom/opera/android/bar/OmniButtonView;
    .registers 2

    iget-object p0, p0, Lmgn;->d:Lgbf;

    iget-object v0, p0, Lgbf;->b:Lz43;

    invoke-virtual {v0}, Lz43;->q()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lgbf;->q()Lcom/opera/android/bar/OmniButtonView;

    move-result-object p0

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d(Lb2l;)Z
    .registers 2

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    iget-object p0, p0, Lmgn;->g:Lydn;

    if-eqz p1, :cond_11

    iget-object p0, p0, Lydn;->d:Lvdn;

    iget-boolean p0, p0, Lvdn;->a:Z

    return p0

    :cond_11
    iget-object p0, p0, Lydn;->d:Lvdn;

    invoke-virtual {p0}, Lvdn;->a()Z

    move-result p0

    return p0
.end method

.method public e()Z
    .registers 3

    iget-object v0, p0, Lmgn;->i:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "feature_tips_notification"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object p0, p0, Lmgn;->e:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->k0()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public abstract f()V
.end method

.method public abstract g()V
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-virtual {p0}, Lmgn;->g()V

    return-void
.end method
