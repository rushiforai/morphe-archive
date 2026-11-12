.class public final Lxoc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Ljava/util/HashMap;

.field public final c:Ljava/util/HashMap;

.field public final d:Ljava/util/HashMap;

.field public e:Z


# direct methods
.method public constructor <init>(Lx5f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxoc;->a:Lx5f;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lxoc;->b:Ljava/util/HashMap;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lxoc;->c:Ljava/util/HashMap;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lxoc;->d:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final a(Ltg0;)V
    .registers 8

    iget-object p0, p0, Lxoc;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lsg0;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_34

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_34

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v0, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3d

    :cond_34
    invoke-static {p1, v0, v5}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v0, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3d
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
