.class public abstract Ll53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpz3;


# instance fields
.field public a:Lkjm;

.field public b:Z


# virtual methods
.method public final finish(Lhjm;)V
    .registers 3

    iget-boolean v0, p0, Ll53;->b:Z

    if-nez v0, :cond_b

    const/4 v0, 0x1

    iput-boolean v0, p0, Ll53;->b:Z

    iget-object v0, p0, Ll53;->a:Lkjm;

    if-nez v0, :cond_c

    :cond_b
    return-void

    :cond_c
    invoke-interface {v0, p0, p1}, Lkjm;->o(Ljjm;Lhjm;)V

    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 2

    iput-object p1, p0, Ll53;->a:Lkjm;

    return-void
.end method
