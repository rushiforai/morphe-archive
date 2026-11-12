.class public final Lk0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final a:Llz3;

.field public final b:Lj0h;

.field public c:Z

.field public final synthetic d:Ll0h;


# direct methods
.method public constructor <init>(Ll0h;Llz3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk0h;->d:Ll0h;

    new-instance p1, Lj0h;

    invoke-direct {p1, p0}, Lj0h;-><init>(Lk0h;)V

    iput-object p1, p0, Lk0h;->b:Lj0h;

    iput-object p2, p0, Lk0h;->a:Llz3;

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 5

    iget-object v0, p0, Lk0h;->a:Llz3;

    iget-object v0, v0, Llz3;->c:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lk0h;->d:Ll0h;

    iget-object v1, v0, Ll0h;->e:Lgbf;

    iget-object v2, p0, Lk0h;->b:Lj0h;

    iget-object v1, v1, Lgbf;->p:Li7f;

    invoke-virtual {v1, v2}, Li7f;->c(Ljava/lang/Object;)Z

    sget-object v1, Lhjm;->a:Lhjm;

    if-ne p1, v1, :cond_21

    iget-boolean p0, p0, Lk0h;->c:Z

    if-nez p0, :cond_21

    iget-object p0, v0, Ll0h;->e:Lgbf;

    iget-object p0, p0, Lgbf;->m:Ldbf;

    invoke-virtual {p0}, Ldbf;->B()V

    :cond_21
    return-void
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lk0h;->c:Z

    return-void
.end method

.method public final g(Llz3;)V
    .registers 5

    iget-object p1, p0, Lk0h;->d:Ll0h;

    iget-object v0, p1, Ll0h;->b:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p1}, Ltcc;->b(Lmdc;)V

    iget-object v0, p1, Ll0h;->f:Lk6l;

    iget-object v1, p1, Ll0h;->g:Lqz;

    invoke-virtual {v0, v1}, Lk6l;->v(La2l;)V

    iget-object v0, p1, Ll0h;->e:Lgbf;

    iget-object p0, p0, Lk0h;->b:Lj0h;

    iget-object v0, v0, Lgbf;->p:Li7f;

    invoke-virtual {v0, p0}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p1, Ll0h;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "privacy_monitor.promotion.shown.timestamp"

    invoke-interface {p1, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method
