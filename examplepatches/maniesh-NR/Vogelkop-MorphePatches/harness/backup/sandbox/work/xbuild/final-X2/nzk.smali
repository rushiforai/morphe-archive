.class public final Lnzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public a:Z

.field public final b:Lh7f;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    if-eqz p1, :cond_19

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, 0x30

    const/16 v1, 0x20

    if-ne p1, v1, :cond_19

    const/4 v0, 0x1

    :cond_19
    iput-boolean v0, p0, Lnzk;->a:Z

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnzk;->b:Lh7f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lmzk;

    iget-object p0, p0, Lnzk;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lmzk;

    iget-object p0, p0, Lnzk;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Landroid/content/res/Configuration;)V
    .registers 4

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, 0x30

    const/16 v0, 0x20

    if-ne p1, v0, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    iget-boolean v0, p0, Lnzk;->a:Z

    if-eq v0, p1, :cond_2a

    iput-boolean p1, p0, Lnzk;->a:Z

    new-instance p1, Lg7f;

    iget-object v0, p0, Lnzk;->b:Lh7f;

    invoke-direct {p1, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_18
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmzk;

    iget-boolean v1, p0, Lnzk;->a:Z

    invoke-interface {v0, v1}, Lmzk;->k(Z)V

    goto :goto_18

    :cond_2a
    return-void
.end method
