.class public final Lcom/opera/android/oauth2/OAuth2Account;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrb;

.field public final b:Lyqa;

.field public final c:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

.field public final d:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

.field public final e:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

.field public final f:Lzwk;

.field public g:J

.field public h:Z


# direct methods
.method public constructor <init>(Lrb;Lzwk;Lyqa;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iput-object p3, p0, Lcom/opera/android/oauth2/OAuth2Account;->b:Lyqa;

    new-instance v0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->a(I)[Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v1, "social_accounts"

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;-><init>(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/oauth2/OperaAccessSandbox;)V

    iput-object v0, p0, Lcom/opera/android/oauth2/OAuth2Account;->c:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    new-instance v1, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    const/4 p1, 0x1

    invoke-static {p1}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->a(I)[Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    const-string v2, "subscriptions"

    invoke-direct/range {v1 .. v6}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;-><init>(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/oauth2/OperaAccessSandbox;)V

    iput-object v1, p0, Lcom/opera/android/oauth2/OAuth2Account;->d:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    new-instance v2, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    const/4 p1, 0x2

    invoke-static {p1}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->a(I)[Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    const-string v3, "ai_assistant"

    invoke-direct/range {v2 .. v7}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;-><init>(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/oauth2/OperaAccessSandbox;)V

    iput-object v2, p0, Lcom/opera/android/oauth2/OAuth2Account;->e:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    iput-object p2, p0, Lcom/opera/android/oauth2/OAuth2Account;->f:Lzwk;

    invoke-static {p0}, LJ/N;->M6Ded1KR(Ljava/lang/Object;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    return-void
.end method


# virtual methods
.method public final a(ILahf;)V
    .registers 4

    invoke-virtual {p0}, Lcom/opera/android/oauth2/OAuth2Account;->b()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-interface {p2}, Lahf;->b()V

    return-void

    :cond_a
    if-eqz p1, :cond_1c

    const/4 v0, 0x1

    if-eq p1, v0, :cond_19

    const/4 v0, 0x2

    if-ne p1, v0, :cond_15

    iget-object p1, p0, Lcom/opera/android/oauth2/OAuth2Account;->e:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    goto :goto_1e

    :cond_15
    invoke-static {}, Lhai;->d()V

    return-void

    :cond_19
    iget-object p1, p0, Lcom/opera/android/oauth2/OAuth2Account;->d:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    goto :goto_1e

    :cond_1c
    iget-object p1, p0, Lcom/opera/android/oauth2/OAuth2Account;->c:Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    :goto_1e
    new-instance v0, Lj42;

    invoke-direct {v0, p0, p2}, Lj42;-><init>(Lcom/opera/android/oauth2/OAuth2Account;Lahf;)V

    invoke-virtual {p1, v0}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    return-void
.end method

.method public final b()Z
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_10

    invoke-static {v0, v1}, LJ/N;->MXn7xpDo(J)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Z)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "pending"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    const-string v0, "pun_1"

    invoke-virtual {p0, v0, p1}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final e(Z)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "verified"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void
.end method

.method public final f(ZZ)V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eqz p1, :cond_4a

    invoke-virtual {p0, v1}, Lcom/opera/android/oauth2/OAuth2Account;->d(Ljava/lang/String;)V

    const-string v2, "full_name"

    iget-object v3, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    invoke-virtual {v3, v2, v1}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "display_name"

    invoke-virtual {v3, v2, v1}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "profile_picture"

    invoke-virtual {v3, v2, v1}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v3, Lrb;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v4, "has_default_profile_picture"

    invoke-static {v2, v4, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object v2, v3, Lrb;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v4, "has_2fa"

    invoke-static {v2, v4, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object v2, v3, Lrb;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "verified"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OAuth2Account;->c(Z)V

    :cond_4a
    if-eqz p2, :cond_56

    new-instance p2, Lrl;

    const/16 v2, 0x17

    invoke-direct {p2, p0, v2}, Lrl;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, p2}, LJ/N;->MMjOJmyf(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_56
    if-eqz p1, :cond_68

    iget-wide v1, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    const-wide/16 v3, 0x0

    cmp-long p2, v1, v3

    if-eqz p2, :cond_68

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/android/oauth2/OAuth2Account;->h:Z

    invoke-static {v1, v2}, LJ/N;->MLbdWsOM(J)V

    iput-boolean v0, p0, Lcom/opera/android/oauth2/OAuth2Account;->h:Z

    :cond_68
    iget-object p2, p0, Lcom/opera/android/oauth2/OAuth2Account;->f:Lzwk;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->M3muZ2vl()V

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->b:Lyqa;

    iget-object p2, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast p2, Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p2

    iget-object p2, p2, Ld6j;->c:Lx5f;

    sget-object v0, Ljh0;->b:Ljh0;

    invoke-virtual {p2, v0}, Lx5f;->b0(Ljh0;)V

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ldb;

    iget-object p2, p0, Ldb;->b:Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    const-string v0, "account_type"

    invoke-static {p2, v0}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    iget-object p0, p0, Ldb;->e:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_a0
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_b0

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcb;

    invoke-virtual {p2, p1}, Lcb;->d(Z)V

    goto :goto_a0

    :cond_b0
    return-void
.end method

.method public final onDestroy()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    return-void
.end method

.method public final onSignedOut()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/oauth2/OAuth2Account;->h:Z

    if-nez v0, :cond_8

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/opera/android/oauth2/OAuth2Account;->f(ZZ)V

    :cond_8
    return-void
.end method
