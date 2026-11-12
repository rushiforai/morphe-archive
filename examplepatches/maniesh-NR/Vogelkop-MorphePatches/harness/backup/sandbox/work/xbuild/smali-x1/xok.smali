.class public final Lxok;
.super Ltq8;
.source "SourceFile"


# instance fields
.field public h:Ljava/util/ArrayList;

.field public i:I


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ltq8;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lxok;->h:Ljava/util/ArrayList;

    const v0, 0x7fffffff

    iput v0, p0, Lxok;->i:I

    return-void
.end method


# virtual methods
.method public final D(Ljava/util/List;)Ljava/util/List;
    .registers 6

    iget-object v0, p0, Lxok;->h:Ljava/util/ArrayList;

    invoke-static {p1, v0}, Lsfe;->N(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    iget-object v0, p0, Lxok;->h:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lxok;->h:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget v2, p0, Lxok;->i:I

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1

    :goto_22
    iget-object v1, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_32

    invoke-virtual {p0, v2}, Ltq8;->u(I)Lhq8;

    move-result-object v1

    invoke-virtual {p0, v1}, Ltq8;->A(Lhq8;)V

    goto :goto_22

    :cond_32
    :goto_32
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v2, v1, :cond_49

    new-instance v1, Lqok;

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Look;

    invoke-direct {v1, v3}, Lqok;-><init>(Look;)V

    invoke-virtual {p0, v2, v1}, Ltq8;->s(ILhq8;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_32

    :cond_49
    return-object v0
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    const-string p0, "suggested-sites-root"

    return-object p0
.end method

.method public final e()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 2

    const-string p0, ""

    return-object p0
.end method

.method public final q(Ljava/lang/String;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final z()Ljava/util/Date;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method
