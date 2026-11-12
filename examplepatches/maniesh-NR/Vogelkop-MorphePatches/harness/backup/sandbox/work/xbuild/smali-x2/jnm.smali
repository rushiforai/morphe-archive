.class public final Ljnm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lb59;

.field public final b:Li7f;

.field public final c:Lnrl;

.field public final d:Lag;

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Ljnm;->b:Li7f;

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Ljnm;->c:Lnrl;

    new-instance v0, Lag;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lag;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ljnm;->d:Lag;

    new-instance v0, Lilm;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lilm;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lb94;

    const/4 v3, 0x0

    invoke-direct {v2, p2, v0, v3}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-array v0, v1, [Lbg1;

    aput-object v2, v0, v3

    const-string v1, "unseen_downloads_tracker"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ljnm;->a:Lb59;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lq1f;

    iget-object p0, p0, Ljnm;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lq1f;

    iget-object p0, p0, Ljnm;->b:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lre7;)V
    .registers 5

    iget-object v0, p0, Ljnm;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "unseen_download_ids"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    iget-wide v1, p1, Lre7;->o:J

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1b

    return-void

    :cond_1b
    invoke-virtual {p0, v0}, Ljnm;->b(Ljava/util/HashSet;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Ljnm;->c(Z)V

    return-void
.end method

.method public final b(Ljava/util/HashSet;)V
    .registers 3

    iget-object p0, p0, Ljnm;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "unseen_download_ids"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final c(Z)V
    .registers 3

    iget-boolean v0, p0, Ljnm;->e:Z

    if-eq p1, v0, :cond_1e

    iput-boolean p1, p0, Ljnm;->e:Z

    iget-object p0, p0, Ljnm;->b:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lq1f;

    iget-object p1, p1, Lq1f;->a:Lr1f;

    invoke-virtual {p1}, Lp1f;->b()V

    goto :goto_c

    :cond_1e
    return-void
.end method
