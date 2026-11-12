.class public abstract Lgtg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbz;


# instance fields
.field public a:Z

.field public final b:Lsx;

.field public final c:Lr9g;


# direct methods
.method public constructor <init>(Lr9g;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lsx;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lsx;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lgtg;->b:Lsx;

    iput-object p1, p0, Lgtg;->c:Lr9g;

    return-void
.end method


# virtual methods
.method public final g(Ldl;)V
    .registers 11

    iget-boolean v0, p0, Lgtg;->a:Z

    if-nez v0, :cond_40

    iget-object v0, p1, Ldl;->c:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lgtg;->k(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_40

    iget-object v0, p0, Lgtg;->c:Lr9g;

    iget-object v0, v0, Lr9g;->b:Ljava/lang/Object;

    check-cast v0, Lw7h;

    instance-of v1, p1, Lhl;

    const/4 v2, 0x1

    if-eqz v1, :cond_19

    const/4 v0, 0x0

    goto :goto_3e

    :cond_19
    iget-object v3, v0, Lw7h;->n:Li3j;

    iget-object v4, p1, Ldl;->d:Ljava/util/SortedSet;

    iget-object v5, p1, Ldl;->e:Ljava/util/SortedSet;

    new-instance v6, Lm43;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v1, 0x0

    invoke-direct {v6, p1, v1, v2, v0}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x1

    invoke-virtual/range {v3 .. v8}, Li3j;->v(Ljava/util/Set;Ljava/util/Set;Laz;ZLjava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_39

    invoke-virtual {v3}, Li3j;->u()V

    :cond_39
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v2

    :goto_3e
    if-eqz v0, :cond_41

    :cond_40
    return-void

    :cond_41
    iput-boolean v2, p0, Lgtg;->a:Z

    iget-object v0, p0, Lgtg;->b:Lsx;

    invoke-virtual {p0, v0, p1}, Lgtg;->j(Lsx;Ldl;)V

    return-void
.end method

.method public final i()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public j(Lsx;Ldl;)V
    .registers 7

    new-instance v0, Lm43;

    const/4 v1, 0x1

    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v3, 0x0

    invoke-direct {v0, p2, v3, v1, v2}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    invoke-interface {p0, p1, v0}, Lbz;->e(Lzy;Laz;)V

    return-void
.end method

.method public abstract k(Ljava/lang/String;)Z
.end method
