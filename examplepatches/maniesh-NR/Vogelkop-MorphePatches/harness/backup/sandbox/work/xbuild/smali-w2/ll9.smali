.class public final Lll9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayDeque;

.field public final b:Lmcj;

.field public final c:Lqim;

.field public final d:Lil9;

.field public final e:Lil9;

.field public final f:Lil9;

.field public final g:Ljava/util/ArrayList;

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Lmcj;Lqim;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lll9;->a:Ljava/util/ArrayDeque;

    new-instance v0, Lil9;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lil9;-><init>(Lll9;B)V

    iput-object v0, p0, Lll9;->d:Lil9;

    new-instance v0, Lil9;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lil9;-><init>(Lll9;B)V

    iput-object v0, p0, Lll9;->e:Lil9;

    new-instance v0, Lil9;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v2}, Lil9;-><init>(Lll9;B)V

    iput-object v0, p0, Lll9;->f:Lil9;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lll9;->g:Ljava/util/ArrayList;

    iput v1, p0, Lll9;->h:I

    iput-object p1, p0, Lll9;->b:Lmcj;

    iput-object p2, p0, Lll9;->c:Lqim;

    new-instance p2, Ljl9;

    invoke-direct {p2, p0}, Ljl9;-><init>(Lll9;)V

    iget-object p0, p1, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Ldx3;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-virtual {p0, p2, v1}, Landroidx/fragment/app/w;->b0(Lx1p;Z)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget v0, p0, Lll9;->h:I

    if-lez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lll9;->a:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v1

    if-eqz v1, :cond_4a

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzhj;

    iget v2, p0, Lll9;->i:I

    const-class v3, Lucl;

    if-lez v2, :cond_2f

    iget-object v2, v1, Lzhj;->a:Lwzg;

    iget-object v2, v2, Lwzg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_11

    :cond_2f
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    iget-object v2, v1, Lzhj;->a:Lwzg;

    iget-object v2, v2, Lwzg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_44

    iget v2, p0, Lll9;->i:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lll9;->i:I

    :cond_44
    iget-object v2, p0, Lll9;->b:Lmcj;

    invoke-virtual {v2, v1}, Lmcj;->h(Lzhj;)V

    goto :goto_11

    :cond_4a
    return-void
.end method

.method public final b(Lzhj;)V
    .registers 3

    iget-object v0, p0, Lll9;->a:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lll9;->a()V

    return-void
.end method
