.class public abstract Lhq8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lh7f;

.field public b:Ltq8;

.field public c:I

.field public d:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lhq8;->a:Lh7f;

    const/4 v0, -0x1

    iput v0, p0, Lhq8;->c:I

    return-void
.end method


# virtual methods
.method public final b(Lgq8;)V
    .registers 2

    iget-object p0, p0, Lhq8;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public c()Ljava/lang/String;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public e()J
    .registers 3

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public f()Ljava/lang/String;
    .registers 2

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public g()Ljava/lang/String;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public h()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public i(Lp6l;)Ljava/lang/String;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public j()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final m()Z
    .registers 2

    iget-object v0, p0, Lhq8;->d:Ljava/lang/Boolean;

    if-nez v0, :cond_14

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lz7h;->s(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lhq8;->d:Ljava/lang/Boolean;

    :cond_14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final n(ILhq8;)V
    .registers 4

    new-instance v0, Lg7f;

    iget-object p0, p0, Lhq8;->a:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgq8;

    invoke-interface {p0, p1, p2}, Lgq8;->r(ILhq8;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final o(Lgq8;)V
    .registers 2

    iget-object p0, p0, Lhq8;->a:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public p()V
    .registers 3

    new-instance v0, Lg7f;

    iget-object v1, p0, Lhq8;->a:Lh7f;

    invoke-direct {v0, v1}, Lg7f;-><init>(Lh7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgq8;

    invoke-interface {v1, p0}, Lgq8;->Q(Lhq8;)V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public r()V
    .registers 2

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p0}, Lhq8;->n(ILhq8;)V

    return-void
.end method
