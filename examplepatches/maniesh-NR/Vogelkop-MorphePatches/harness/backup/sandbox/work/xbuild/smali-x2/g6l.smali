.class public final Lg6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La2l;
.implements Lw6f;


# instance fields
.field public final a:Lh7f;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lg6l;->a:Lh7f;

    return-void
.end method


# virtual methods
.method public final D(Lb2l;Z)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->D(Lb2l;Z)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, La2l;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final G(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->G(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, La2l;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final I(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->I(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final J(Lb2l;Z)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->J(Lb2l;Z)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final O(Lb2l;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2, p3}, La2l;->O(Lb2l;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final R(Ld7l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->R(Ld7l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final S(Ld7l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->S(Ld7l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final T(Lb2l;Lcom/opera/android/browser/TabInfo;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->T(Lb2l;Lcom/opera/android/browser/TabInfo;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final U(Lb2l;J)V
    .registers 5

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2, p3}, La2l;->U(Lb2l;J)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final V(Lb2l;I)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->V(Lb2l;I)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final a(Lb2l;Ld7l;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->a(Lb2l;Ld7l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final b(Lb2l;Lyqa;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->b(Lb2l;Lyqa;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final e(Lb2l;II)V
    .registers 5

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2, p3}, La2l;->e(Lb2l;II)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final f(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->f(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final g(Lb2l;J)V
    .registers 5

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2, p3}, La2l;->g(Lb2l;J)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final i(Lb2l;Lqwi;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->i(Lb2l;Lqwi;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final j(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->j(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final l(Lb2l;I)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1, p2}, La2l;->l(Lb2l;I)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final m(Ld7l;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, La2l;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-interface/range {v1 .. v6}, La2l;->m(Ld7l;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :cond_1d
    return-void
.end method

.method public final p(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->p(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final q(Ld7l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->q(Ld7l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final r(Ld7l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->r(Ld7l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final u(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->u(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final v(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->v(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final x(Lb2l;)V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lg6l;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2l;

    invoke-interface {p0, p1}, La2l;->x(Lb2l;)V

    goto :goto_7

    :cond_17
    return-void
.end method
