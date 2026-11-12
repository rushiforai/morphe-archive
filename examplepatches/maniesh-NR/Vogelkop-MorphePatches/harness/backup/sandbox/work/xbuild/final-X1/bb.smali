.class public final Lbb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lzwk;

.field public final c:Lrb;

.field public d:Z

.field public e:Z

.field public f:Z

.field public final synthetic g:Ldb;


# direct methods
.method public constructor <init>(Ldb;Landroid/content/Context;Lumi;Lzwk;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbb;->g:Ldb;

    iput-object p2, p0, Lbb;->a:Landroid/content/Context;

    iput-object p4, p0, Lbb;->b:Lzwk;

    new-instance p1, Lrb;

    new-instance p4, Lya;

    const/4 v0, 0x1

    invoke-direct {p4, p0, v0}, Lya;-><init>(Lbb;B)V

    new-instance v0, Lb94;

    const/4 v1, 0x0

    invoke-direct {v0, p3, p4, v1}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, p2, v0}, Lrb;-><init>(Landroid/content/Context;Lb94;)V

    iput-object p1, p0, Lbb;->c:Lrb;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-object v0, p0, Lbb;->g:Ldb;

    iget-object v1, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz v1, :cond_7e

    iget-boolean v1, p0, Lbb;->d:Z

    if-eqz v1, :cond_7e

    iget-boolean v1, p0, Lbb;->e:Z

    if-eqz v1, :cond_7e

    iget-object v1, v0, Ldb;->b:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "need_to_log_status"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    sget-object v5, Ljh0;->c:Ljh0;

    const/4 v6, 0x0

    if-eqz v4, :cond_44

    invoke-static {v1, v2, v6}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, p0, Lbb;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    iget-object v2, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    invoke-virtual {v2}, Lcom/opera/android/oauth2/OAuth2Account;->b()Z

    move-result v2

    if-eqz v2, :cond_3f

    move-object v2, v5

    goto :goto_41

    :cond_3f
    sget-object v2, Ljh0;->b:Ljh0;

    :goto_41
    invoke-virtual {v1, v2}, Lx5f;->b0(Ljh0;)V

    :cond_44
    invoke-virtual {v0}, Ldb;->f()Z

    move-result v1

    if-eqz v1, :cond_66

    invoke-virtual {v0}, Ldb;->b()Ljh0;

    move-result-object v1

    if-ne v1, v5, :cond_66

    new-instance v1, Lab;

    invoke-direct {v1, v0, v6}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez v2, :cond_5e

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lab;->run(Ljava/lang/Object;)V

    goto :goto_66

    :cond_5e
    new-instance v4, Lqie;

    invoke-direct {v4, v2, v1}, Lqie;-><init>(Lcom/opera/android/oauth2/OAuth2Account;Lab;)V

    invoke-virtual {v2, v6, v4}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    :cond_66
    :goto_66
    iput-boolean v3, p0, Lbb;->f:Z

    iget-object p0, v0, Ldb;->e:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6e
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcb;

    invoke-virtual {v0}, Lcb;->a()V

    goto :goto_6e

    :cond_7e
    return-void
.end method

.method public final run()V
    .registers 6

    new-instance v0, Lcom/opera/android/oauth2/OAuth2Account;

    new-instance v1, Lyqa;

    iget-object v2, p0, Lbb;->a:Landroid/content/Context;

    iget-object v3, p0, Lbb;->g:Ldb;

    invoke-direct {v1, v3, v2}, Lyqa;-><init>(Ldb;Landroid/content/Context;)V

    iget-object v2, p0, Lbb;->c:Lrb;

    iget-object v4, p0, Lbb;->b:Lzwk;

    invoke-direct {v0, v2, v4, v1}, Lcom/opera/android/oauth2/OAuth2Account;-><init>(Lrb;Lzwk;Lyqa;)V

    iput-object v0, v3, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    invoke-virtual {p0}, Lbb;->a()V

    return-void
.end method
