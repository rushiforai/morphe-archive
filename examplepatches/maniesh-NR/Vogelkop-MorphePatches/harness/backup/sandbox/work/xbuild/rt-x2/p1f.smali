.class public abstract Lp1f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Li7f;

.field public final b:Lnrl;

.field public final c:Ljava/lang/Runnable;

.field public d:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lp1f;->a:Li7f;

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lp1f;->b:Lnrl;

    iput-object p1, p0, Lp1f;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lt1f;

    iget-object v0, p0, Lp1f;->a:Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p0, p0, Lp1f;->c:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_f
    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lt1f;

    iget-object v0, p0, Lp1f;->a:Li7f;

    invoke-virtual {v0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p0, p0, Lp1f;->c:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_f
    return-void
.end method

.method public abstract a()Z
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lp1f;->a:Li7f;

    iget v1, v0, Li7f;->c:I

    if-nez v1, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Lp1f;->a()Z

    move-result v1

    iget-object v2, p0, Lp1f;->d:Ljava/lang/Boolean;

    if-eqz v2, :cond_15

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eq v1, v2, :cond_36

    :cond_15
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lp1f;->d:Ljava/lang/Boolean;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Li7f;)V

    :goto_20
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt1f;

    iget-object v2, p0, Lp1f;->d:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v0, v2}, Lt1f;->a(Z)V

    goto :goto_20

    :cond_36
    return-void
.end method
