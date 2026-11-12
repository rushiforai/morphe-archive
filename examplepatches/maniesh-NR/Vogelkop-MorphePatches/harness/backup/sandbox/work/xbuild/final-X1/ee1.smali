.class public final Lee1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltfd;


# instance fields
.field public final a:Lle1;

.field public b:Z


# direct methods
.method public constructor <init>(Lle1;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lee1;->a:Lle1;

    return-void
.end method


# virtual methods
.method public final a(Lshb;Ljava/util/List;I)I
    .registers 6

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_8

    return p1

    :cond_8
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpfd;

    invoke-interface {p0, p3}, Lpfd;->J(I)I

    move-result p0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    if-gt v0, p1, :cond_2c

    :goto_1a
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpfd;

    invoke-interface {v1, p3}, Lpfd;->J(I)I

    move-result v1

    if-le v1, p0, :cond_27

    move p0, v1

    :cond_27
    if-eq v0, p1, :cond_2c

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_2c
    return p0
.end method

.method public final b(Lvfd;Ljava/util/List;J)Lufd;
    .registers 13

    iget-object v0, p0, Lee1;->a:Lle1;

    iget-object v0, v0, Lle1;->a:Lt0g;

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    move-object v2, p2

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_17
    if-ge v3, v2, :cond_35

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lpfd;

    invoke-interface {v6, p3, p4}, Lpfd;->N(J)Lifg;

    move-result-object v6

    iget v7, v6, Lifg;->a:I

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget v7, v6, Lifg;->b:I

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :cond_35
    invoke-interface {p1}, Lshb;->F()Z

    move-result p2

    const-wide p3, 0xffffffffL

    const/16 v2, 0x20

    if-eqz p2, :cond_53

    const/4 p2, 0x1

    iput-boolean p2, p0, Lee1;->b:Z

    int-to-long v6, v4

    shl-long/2addr v6, v2

    int-to-long v2, v5

    and-long/2addr v2, p3

    or-long/2addr v6, v2

    new-instance p0, Lgcb;

    invoke-direct {p0, v6, v7}, Lgcb;-><init>(J)V

    invoke-virtual {v0, p0}, Lt0g;->setValue(Ljava/lang/Object;)V

    goto :goto_64

    :cond_53
    iget-boolean p0, p0, Lee1;->b:Z

    if-nez p0, :cond_64

    int-to-long v6, v4

    shl-long/2addr v6, v2

    int-to-long v2, v5

    and-long/2addr v2, p3

    or-long/2addr v6, v2

    new-instance p0, Lgcb;

    invoke-direct {p0, v6, v7}, Lgcb;-><init>(J)V

    invoke-virtual {v0, p0}, Lt0g;->setValue(Ljava/lang/Object;)V

    :cond_64
    :goto_64
    new-instance p0, Lb11;

    const/4 p2, 0x3

    invoke-direct {p0, v1, p2}, Lb11;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Ln08;->a:Ln08;

    invoke-interface {p1, v4, v5, p2, p0}, Lvfd;->b0(IILjava/util/Map;Lkotlin/jvm/functions/Function1;)Lufd;

    move-result-object p0

    return-object p0
.end method

.method public final c(Lshb;Ljava/util/List;I)I
    .registers 6

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_8

    return p1

    :cond_8
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpfd;

    invoke-interface {p0, p3}, Lpfd;->E(I)I

    move-result p0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    if-gt v0, p1, :cond_2c

    :goto_1a
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpfd;

    invoke-interface {v1, p3}, Lpfd;->E(I)I

    move-result v1

    if-le v1, p0, :cond_27

    move p0, v1

    :cond_27
    if-eq v0, p1, :cond_2c

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_2c
    return p0
.end method

.method public final d(Lshb;Ljava/util/List;I)I
    .registers 6

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_8

    return p1

    :cond_8
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpfd;

    invoke-interface {p0, p3}, Lpfd;->c(I)I

    move-result p0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    if-gt v0, p1, :cond_2c

    :goto_1a
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpfd;

    invoke-interface {v1, p3}, Lpfd;->c(I)I

    move-result v1

    if-le v1, p0, :cond_27

    move p0, v1

    :cond_27
    if-eq v0, p1, :cond_2c

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_2c
    return p0
.end method

.method public final e(Lshb;Ljava/util/List;I)I
    .registers 6

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_8

    return p1

    :cond_8
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpfd;

    invoke-interface {p0, p3}, Lpfd;->z(I)I

    move-result p0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    if-gt v0, p1, :cond_2c

    :goto_1a
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpfd;

    invoke-interface {v1, p3}, Lpfd;->z(I)I

    move-result v1

    if-le v1, p0, :cond_27

    move p0, v1

    :cond_27
    if-eq v0, p1, :cond_2c

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_2c
    return p0
.end method
