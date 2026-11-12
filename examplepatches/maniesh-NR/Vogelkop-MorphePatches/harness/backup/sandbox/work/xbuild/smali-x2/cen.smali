.class public final Lcen;
.super Ly08;
.source "SourceFile"

# interfaces
.implements Ltdn;


# instance fields
.field public a:Ly1n;

.field public b:Lf6l;

.field public final synthetic c:Lfen;


# direct methods
.method public constructor <init>(Lfen;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcen;->c:Lfen;

    invoke-virtual {p0}, Lcen;->W()V

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 1

    invoke-virtual {p0}, Lcen;->W()V

    return-void
.end method

.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 5

    iget-object p2, p0, Lcen;->c:Lfen;

    invoke-virtual {p2, p1}, Lfen;->h(Lb2l;)Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    iget-object p1, p0, Lcen;->a:Ly1n;

    if-eqz p1, :cond_10

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_10
    new-instance p1, Ly1n;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Ly1n;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcen;->a:Ly1n;

    const-wide/16 v0, 0x3e8

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-object p1, p0, Lcen;->a:Ly1n;

    if-eqz p1, :cond_a

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcen;->a:Ly1n;

    :cond_a
    return-void
.end method

.method public final S(Ld7l;)V
    .registers 2

    iget-object p1, p0, Lcen;->a:Ly1n;

    if-eqz p1, :cond_a

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcen;->a:Ly1n;

    :cond_a
    return-void
.end method

.method public final W()V
    .registers 6

    iget-object v0, p0, Lcen;->c:Lfen;

    iget-object v1, v0, Lmgn;->g:Lydn;

    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_16

    iget-object v1, v1, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_16

    move v1, v4

    goto :goto_17

    :cond_16
    move v1, v3

    :goto_17
    iget-object v2, p0, Lcen;->b:Lf6l;

    if-eqz v2, :cond_1c

    move v3, v4

    :cond_1c
    if-eq v1, v3, :cond_33

    if-eqz v1, :cond_29

    iget-object v0, v0, Lmgn;->f:Lk6l;

    invoke-virtual {v0, p0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object v0

    iput-object v0, p0, Lcen;->b:Lf6l;

    return-void

    :cond_29
    if-eqz v2, :cond_33

    iget-object v0, v0, Lmgn;->f:Lk6l;

    invoke-virtual {v0, v2}, Lk6l;->x(Lj6l;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcen;->b:Lf6l;

    :cond_33
    return-void
.end method

.method public final s()V
    .registers 1

    invoke-virtual {p0}, Lcen;->W()V

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method
