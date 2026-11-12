.class public final Ltkj;
.super Ltq8;
.source "SourceFile"


# instance fields
.field public final h:Lukj;

.field public final i:Z


# direct methods
.method public constructor <init>(Ltq8;)V
    .registers 7

    new-instance v0, Lukj;

    invoke-direct {v0, p1}, Lukj;-><init>(Lhq8;)V

    invoke-virtual {p1}, Ltq8;->y()Z

    move-result v1

    new-instance v2, Lb10;

    const/16 v3, 0x1a

    invoke-direct {v2, v3}, Lb10;-><init>(B)V

    new-instance v3, Lzlb;

    const/4 v4, 0x1

    invoke-direct {v3, p1, v2, v4}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v3}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-direct {p0}, Ltq8;-><init>()V

    iput-object v0, p0, Ltkj;->h:Lukj;

    iput-boolean v1, p0, Ltkj;->i:Z

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_26
    if-ge v1, v0, :cond_35

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhq8;

    const/4 v3, -0x1

    invoke-virtual {p0, v3, v2}, Ltq8;->s(ILhq8;)V

    goto :goto_26

    :cond_35
    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ltkj;->h:Lukj;

    iget-object p0, p0, Lukj;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final e()J
    .registers 3

    iget-object p0, p0, Ltkj;->h:Lukj;

    iget-wide v0, p0, Lukj;->a:J

    return-wide v0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ltkj;->h:Lukj;

    iget-object p0, p0, Lukj;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ltkj;->h:Lukj;

    iget-object p0, p0, Lukj;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 3

    sget-object v0, Lp6l;->b:Lp6l;

    iget-object p0, p0, Ltkj;->h:Lukj;

    if-ne p1, v0, :cond_b

    iget-object p0, p0, Lukj;->e:Ljava/lang/Object;

    :goto_8
    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_b
    iget-object p0, p0, Lukj;->d:Ljava/lang/Object;

    goto :goto_8
.end method

.method public final q(Ljava/lang/String;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final y()Z
    .registers 1

    iget-boolean p0, p0, Ltkj;->i:Z

    return p0
.end method

.method public final z()Ljava/util/Date;
    .registers 1

    iget-object p0, p0, Ltkj;->h:Lukj;

    iget-object p0, p0, Lukj;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/Date;

    return-object p0
.end method
