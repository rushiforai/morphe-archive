.class public final Lmdf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltcc;

.field public final b:Lx5f;

.field public final c:Lx5f;

.field public final d:Lwsf;

.field public final e:Ljava/util/ArrayList;

.field public f:J

.field public g:J

.field public h:Z

.field public final i:Lob;


# direct methods
.method public constructor <init>(Ltcc;Lx5f;Lx5f;Lwsf;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmdf;->a:Ltcc;

    iput-object p2, p0, Lmdf;->b:Lx5f;

    iput-object p3, p0, Lmdf;->c:Lx5f;

    iput-object p4, p0, Lmdf;->d:Lwsf;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lmdf;->e:Ljava/util/ArrayList;

    new-instance p2, Lob;

    const/16 p3, 0xd

    invoke-direct {p2, p0, p3}, Lob;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lmdf;->i:Lob;

    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final a(Lkl0;Lgl0;)V
    .registers 9

    invoke-virtual {p0, p1, p2}, Lmdf;->b(Lkl0;Lgl0;)V

    sget-object v0, Lkl0;->b:Lkl0;

    if-eq p1, v0, :cond_24

    sget-object v0, Lkl0;->c:Lkl0;

    if-eq p1, v0, :cond_21

    sget-object v0, Lkl0;->d:Lkl0;

    if-eq p1, v0, :cond_1e

    sget-object v0, Lkl0;->e:Lkl0;

    if-eq p1, v0, :cond_1b

    sget-object v0, Lkl0;->f:Lkl0;

    if-eq p1, v0, :cond_18

    return-void

    :cond_18
    sget-object p1, Lll0;->f:Lll0;

    goto :goto_26

    :cond_1b
    sget-object p1, Lll0;->e:Lll0;

    goto :goto_26

    :cond_1e
    sget-object p1, Lll0;->d:Lll0;

    goto :goto_26

    :cond_21
    sget-object p1, Lll0;->c:Lll0;

    goto :goto_26

    :cond_24
    sget-object p1, Lll0;->b:Lll0;

    :goto_26
    sget-object v0, Lgl0;->b:Lgl0;

    if-eq p2, v0, :cond_32

    sget-object v0, Lgl0;->d:Lgl0;

    if-eq p2, v0, :cond_2f

    return-void

    :cond_2f
    sget-object p2, Lwd0;->c:Lwd0;

    goto :goto_34

    :cond_32
    sget-object p2, Lwd0;->b:Lwd0;

    :goto_34
    iget-object p0, p0, Lmdf;->b:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_3b

    return-void

    :cond_3b
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v0}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v0

    new-instance v2, Lxd0;

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v4, v4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p1, 0x1c

    invoke-virtual {v0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_70

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_70

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_79

    :cond_70
    invoke-static {v0, p1, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object p2

    new-instance v3, Lhf0;

    invoke-direct {v3, v0, p1, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_79
    invoke-virtual {v3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final b(Lkl0;Lgl0;)V
    .registers 12

    iget-object v0, p0, Lmdf;->e:Ljava/util/ArrayList;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkl0;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    if-eqz p1, :cond_13

    invoke-virtual {p0, p1}, Lmdf;->c(Lkl0;)V

    :cond_13
    iget-boolean v1, p0, Lmdf;->h:Z

    if-eqz v1, :cond_26

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lmdf;->f:J

    iget-wide v5, p0, Lmdf;->g:J

    sub-long v5, v1, v5

    add-long/2addr v5, v3

    iput-wide v5, p0, Lmdf;->f:J

    iput-wide v1, p0, Lmdf;->g:J

    :cond_26
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    int-to-long v3, v0

    iget-wide v6, p0, Lmdf;->f:J

    new-instance v1, Ltsf;

    const/4 v8, 0x0

    move-object v2, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v8}, Ltsf;-><init>(Lkl0;JLgl0;JB)V

    iget-object p0, p0, Lmdf;->d:Lwsf;

    invoke-virtual {p0, v1}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final c(Lkl0;)V
    .registers 5

    iget-object v0, p0, Lmdf;->e:Ljava/util/ArrayList;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkl0;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lmdf;->f:J

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_15
    return-void
.end method
