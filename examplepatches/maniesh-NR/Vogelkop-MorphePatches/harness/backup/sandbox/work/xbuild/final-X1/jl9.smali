.class public final Ljl9;
.super Lx1p;
.source "SourceFile"


# instance fields
.field public final p:Ljava/util/ArrayList;

.field public final synthetic q:Lll9;


# direct methods
.method public constructor <init>(Lll9;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljl9;->q:Lll9;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ljl9;->p:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final J(Landroidx/fragment/app/Fragment;)V
    .registers 2

    instance-of p1, p1, Lryl;

    if-eqz p1, :cond_12

    iget-object p0, p0, Ljl9;->q:Lll9;

    iget-object p0, p0, Lll9;->e:Lil9;

    iget-boolean p1, p0, Lil9;->a:Z

    if-nez p1, :cond_12

    const/4 p1, 0x1

    iput-boolean p1, p0, Lil9;->a:Z

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_12
    return-void
.end method

.method public final K(Landroidx/fragment/app/Fragment;)V
    .registers 6

    iget-object v0, p0, Ljl9;->q:Lll9;

    iget-object v1, v0, Lll9;->d:Lil9;

    iget-object v2, v0, Lll9;->g:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2f

    instance-of p0, p1, Lucl;

    if-eqz p0, :cond_23

    iget p0, v0, Lll9;->i:I

    sub-int/2addr p0, v3

    iput p0, v0, Lll9;->i:I

    if-lez p0, :cond_19

    return-void

    :cond_19
    iget-boolean p0, v1, Lil9;->a:Z

    if-nez p0, :cond_4b

    iput-boolean v3, v1, Lil9;->a:Z

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :cond_23
    iget-object p0, v0, Lll9;->f:Lil9;

    iget-boolean p1, p0, Lil9;->a:Z

    if-nez p1, :cond_4b

    iput-boolean v3, p0, Lil9;->a:Z

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :cond_2f
    iget-object p0, p0, Ljl9;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4b

    instance-of p0, p1, Lcom/opera/android/browser/BrowserFragment;

    if-nez p0, :cond_4b

    iget p0, v0, Lll9;->h:I

    sub-int/2addr p0, v3

    iput p0, v0, Lll9;->h:I

    if-gtz p0, :cond_4b

    iget-boolean p0, v1, Lil9;->a:Z

    if-nez p0, :cond_4b

    iput-boolean v3, v1, Lil9;->a:Z

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_4b
    return-void
.end method

.method public final N(Landroidx/fragment/app/Fragment;)V
    .registers 3

    instance-of v0, p1, Lryl;

    if-eqz v0, :cond_d

    iget-object p0, p0, Ljl9;->q:Lll9;

    iget-object p0, p0, Lll9;->g:Ljava/util/ArrayList;

    check-cast p1, Lryl;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public final P(Landroidx/fragment/app/Fragment;)V
    .registers 4

    iget-object v0, p0, Ljl9;->q:Lll9;

    iget-object v1, v0, Lll9;->g:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    iget-object p0, p0, Ljl9;->p:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    instance-of p0, p1, Lcom/opera/android/browser/BrowserFragment;

    if-nez p0, :cond_1f

    iget p0, v0, Lll9;->h:I

    add-int/lit8 p0, p0, 0x1

    iput p0, v0, Lll9;->h:I

    :cond_1f
    return-void
.end method
