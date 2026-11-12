.class public final Lnqe;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lwnm;

.field public final c:Lode;

.field public final d:Lmqe;

.field public final e:Lmqe;

.field public f:Lc6j;

.field public g:Lupc;

.field public h:Ljava/net/URL;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ldse;Lx0f;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lnqe;->a:Landroid/content/Context;

    iget-object p1, p2, Ldse;->a:Lwnm;

    iput-object p1, p0, Lnqe;->b:Lwnm;

    const-string p1, "news"

    invoke-virtual {p3, p1}, Lx0f;->a(Ljava/lang/String;)Lode;

    move-result-object p1

    iput-object p1, p0, Lnqe;->c:Lode;

    new-instance p1, Lmqe;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lmqe;-><init>(Lnqe;B)V

    iput-object p1, p0, Lnqe;->d:Lmqe;

    new-instance p1, Lmqe;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lmqe;-><init>(Lnqe;B)V

    iput-object p1, p0, Lnqe;->e:Lmqe;

    return-void
.end method


# virtual methods
.method public final R(Z)V
    .registers 4

    iget-object v0, p0, Lnqe;->f:Lc6j;

    if-eqz p1, :cond_36

    if-nez v0, :cond_46

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Lnqe;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p1

    invoke-virtual {p1}, Lfqe;->c()Luqe;

    move-result-object p1

    invoke-virtual {p1}, Luqe;->h()Lc6j;

    move-result-object p1

    iput-object p1, p0, Lnqe;->f:Lc6j;

    new-instance v0, Lupc;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lupc;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lnqe;->g:Lupc;

    iget-object v1, p1, Lc6j;->b:Ljava/lang/Object;

    check-cast v1, Lnre;

    if-eqz v1, :cond_30

    iget-object v1, v1, Lnre;->b:Ljava/net/URL;

    iput-object v1, p0, Lnqe;->h:Ljava/net/URL;

    :cond_30
    iget-object p0, p1, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_36
    if-eqz v0, :cond_46

    iget-object p1, p0, Lnqe;->g:Lupc;

    const/4 v1, 0x0

    if-eqz p1, :cond_44

    iget-object v0, v0, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iput-object v1, p0, Lnqe;->g:Lupc;

    :cond_44
    iput-object v1, p0, Lnqe;->f:Lc6j;

    :cond_46
    return-void
.end method

.method public final S()V
    .registers 6

    iget-object v0, p0, Lnqe;->b:Lwnm;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcse;

    iget-object v1, p0, Lnqe;->c:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv0f;

    sget-object v2, Lcse;->c:Lcse;

    if-eq v0, v2, :cond_4a

    if-eqz v1, :cond_4a

    sget-object v2, Lcse;->a:Lcse;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v0, v2, :cond_22

    sget-object v0, Lv0f;->c:Lv0f;

    if-ne v1, v0, :cond_22

    move v0, v4

    goto :goto_23

    :cond_22
    move v0, v3

    :goto_23
    iget-object v1, p0, Lnqe;->a:Landroid/content/Context;

    invoke-static {v1}, Lbml;->u(Landroid/content/Context;)Lbml;

    move-result-object v2

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Laml;

    iget-boolean v2, v2, Laml;->a:Z

    if-eqz v2, :cond_36

    if-eqz v0, :cond_36

    move v3, v4

    :cond_36
    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object v1

    sget-object v2, Ld59;->e:Ld59;

    invoke-virtual {v1, v2, v3}, Le59;->c(Ld59;Z)V

    invoke-virtual {p0, v0}, Lnqe;->R(Z)V

    :cond_4a
    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Lnqe;->a:Landroid/content/Context;

    invoke-static {p1}, Lbml;->u(Landroid/content/Context;)Lbml;

    move-result-object p1

    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public final o(Z)V
    .registers 3

    if-eqz p1, :cond_10

    iget-object p1, p0, Lnqe;->b:Lwnm;

    iget-object v0, p0, Lnqe;->d:Lmqe;

    invoke-virtual {p1, v0}, Lekc;->k(Lf7f;)V

    iget-object p1, p0, Lnqe;->c:Lode;

    iget-object v0, p0, Lnqe;->e:Lmqe;

    invoke-virtual {p1, v0}, Lekc;->k(Lf7f;)V

    :cond_10
    invoke-virtual {p0}, Lnqe;->S()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lnqe;->a:Landroid/content/Context;

    invoke-static {p1}, Lbml;->u(Landroid/content/Context;)Lbml;

    move-result-object p1

    invoke-virtual {p1, p0}, Lno7;->p(Lmo7;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnqe;->R(Z)V

    iget-object p1, p0, Lnqe;->b:Lwnm;

    iget-object v0, p0, Lnqe;->d:Lmqe;

    invoke-virtual {p1, v0}, Lekc;->p(Lf7f;)V

    iget-object p1, p0, Lnqe;->c:Lode;

    iget-object p0, p0, Lnqe;->e:Lmqe;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    return-void
.end method
