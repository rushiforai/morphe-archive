.class public final Lmfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lx5f;

.field public final b:Ljfn;

.field public c:Lnfn;

.field public d:Z

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Lx5f;Ljfn;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmfn;->a:Lx5f;

    iput-object p2, p0, Lmfn;->b:Ljfn;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 14

    iget-boolean v0, p0, Lmfn;->d:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6f

    iget-object v0, p0, Lmfn;->c:Lnfn;

    if-eqz v0, :cond_6f

    iget-object v0, v0, Lnfn;->d:Laxc;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_15

    :cond_13
    const-string v2, "giveaway_v1"

    :cond_15
    iget v3, p0, Lmfn;->e:I

    iget v4, p0, Lmfn;->f:I

    iget-object v5, p0, Lmfn;->a:Lx5f;

    iget-boolean v6, v5, Lx5f;->h:Z

    if-eqz v6, :cond_6a

    iget-object v6, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    new-instance v8, Lwt0;

    const/4 v9, -0x1

    const/4 v10, 0x3

    const/16 v11, 0x98b

    invoke-direct {v8, v11, v9, v10}, Ljf0;-><init>(III)V

    const/4 v9, 0x2

    const/4 v10, 0x1

    const-wide/16 v11, 0x1

    invoke-virtual {v8, v9, v10, v11, v12}, Ljf0;->p(IIJ)V

    int-to-long v11, v3

    invoke-virtual {v8, v1, v10, v11, v12}, Ljf0;->p(IIJ)V

    int-to-long v3, v4

    invoke-virtual {v8, v10, v10, v3, v4}, Ljf0;->p(IIJ)V

    invoke-virtual {v7, v6}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v3

    const/16 v4, 0x22

    invoke-virtual {v3, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_57

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_57

    new-instance v9, Lif0;

    invoke-direct {v9, v3, v4, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_64

    :cond_57
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v3, v4, v10, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v9, Lif0;

    invoke-direct {v9, v3, v4, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_64
    invoke-virtual {v9, v2, v8}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5, v7}, Lx5f;->U0(Lx56;)V

    :cond_6a
    iget-object v2, p0, Lmfn;->b:Ljfn;

    invoke-virtual {v2, v0}, Ljfn;->run(Ljava/lang/Object;)V

    :cond_6f
    iput-boolean v1, p0, Lmfn;->d:Z

    iput v1, p0, Lmfn;->e:I

    iput v1, p0, Lmfn;->f:I

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lnfn;

    if-eqz p1, :cond_d

    iget-object v0, p0, Lmfn;->c:Lnfn;

    invoke-virtual {p1, v0}, Lnfn;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-virtual {p0}, Lmfn;->a()V

    iput-object p1, p0, Lmfn;->c:Lnfn;

    return-void
.end method
