.class public final Leq9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ld37;

.field public b:Z

.field public final c:Lh7f;

.field public final d:Lpde;

.field public final e:Lty3;


# direct methods
.method public constructor <init>(Lumi;Lx5f;Lhd;Lki;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Leq9;->c:Lh7f;

    new-instance v0, Lpde;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Leq9;->d:Lpde;

    new-instance v0, Lty3;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Leq9;->e:Lty3;

    new-instance v0, Ld37;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Ld37;->c:Ljava/lang/Object;

    iput-object p2, v0, Ld37;->d:Ljava/lang/Object;

    iput-object p3, v0, Ld37;->e:Ljava/lang/Object;

    iput-object p4, v0, Ld37;->f:Ljava/lang/Object;

    iput-object v0, p0, Leq9;->a:Ld37;

    return-void
.end method


# virtual methods
.method public final a(Liq9;)V
    .registers 2

    iget-object p0, p0, Leq9;->c:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Leq9;->a:Ld37;

    invoke-virtual {p0}, Ld37;->p()Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Ld37;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_23

    iget-object p0, p0, Ld37;->g:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_23

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->z1()V

    :cond_23
    return-void
.end method

.method public final c()Z
    .registers 2

    iget-boolean v0, p0, Leq9;->b:Z

    if-nez v0, :cond_e

    iget-object p0, p0, Leq9;->a:Ld37;

    invoke-virtual {p0}, Ld37;->p()Z

    move-result p0

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method

.method public final d(Z)V
    .registers 3

    iget-boolean v0, p0, Leq9;->b:Z

    if-eq v0, p1, :cond_1c

    iput-boolean p1, p0, Leq9;->b:Z

    iget-object p0, p0, Leq9;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liq9;

    invoke-interface {v0, p1}, Liq9;->P(Z)V

    goto :goto_c

    :cond_1c
    return-void
.end method

.method public final e()V
    .registers 3

    iget-object v0, p0, Leq9;->a:Ld37;

    invoke-virtual {v0}, Ld37;->p()Z

    move-result v1

    if-eqz v1, :cond_18

    iget-object v0, v0, Ld37;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_18

    iget v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->E:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_16

    const/4 v1, 0x3

    if-ne v0, v1, :cond_18

    :cond_16
    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    iget-object p0, p0, Leq9;->d:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_2e

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_2e
    return-void
.end method
