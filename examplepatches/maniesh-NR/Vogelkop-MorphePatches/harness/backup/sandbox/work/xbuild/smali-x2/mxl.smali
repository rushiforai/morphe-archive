.class public final Lmxl;
.super Lgxl;
.source "SourceFile"


# instance fields
.field public final a:Lbf9;

.field public final b:Lx5f;


# direct methods
.method public constructor <init>(Lbf9;Lx5f;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmxl;->a:Lbf9;

    iput-object p2, p0, Lmxl;->b:Lx5f;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-object v0, p0, Lmxl;->a:Lbf9;

    invoke-virtual {v0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v1, :cond_c

    move v0, v2

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    iget-object p0, p0, Lmxl;->b:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_14

    return-void

    :cond_14
    new-instance v1, Lxt0;

    const/4 v3, 0x5

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lh66;

    if-nez v5, :cond_36

    new-instance v5, Lh66;

    const/16 v6, 0xe

    invoke-direct {v5, v4, v2, v6}, Ljf0;-><init>(III)V

    invoke-virtual {v1, v3, v2, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lh66;

    :cond_36
    const/16 v3, 0x8

    invoke-virtual {v5, v3, v2, v0}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    const/16 v3, 0x29

    invoke-virtual {v0, v3, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final i()V
    .registers 1

    invoke-virtual {p0}, Lmxl;->a()V

    return-void
.end method

.method public final x(I)V
    .registers 2

    invoke-virtual {p0}, Lmxl;->a()V

    return-void
.end method
