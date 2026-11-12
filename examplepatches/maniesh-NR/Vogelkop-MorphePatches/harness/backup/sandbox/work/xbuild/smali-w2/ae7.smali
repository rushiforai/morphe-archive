.class public final Lae7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrsf;


# instance fields
.field public final a:Leq6;

.field public final b:Lu56;


# direct methods
.method public constructor <init>(Leq6;Lu56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lae7;->a:Leq6;

    iput-object p2, p0, Lae7;->b:Lu56;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b(JZ)V
    .registers 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const/4 p3, -0x1

    iget-object p0, p0, Lae7;->b:Lu56;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p3, p1, p2}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final c()V
    .registers 5

    const/4 v0, 0x7

    const/4 v1, 0x1

    iget-object p0, p0, Lae7;->b:Lu56;

    const-wide/16 v2, 0x3c9

    invoke-virtual {p0, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final d(Lrsf;)V
    .registers 7

    check-cast p1, Lae7;

    iget-object p1, p1, Lae7;->b:Lu56;

    iget-object p0, p0, Lae7;->b:Lu56;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_17

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p1, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_17
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_27

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p1, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_27
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_38

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    const/4 v3, -0x1

    invoke-virtual {p1, v0, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_38
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_49

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_49
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_71

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqf0;

    new-instance v1, Lqf0;

    const/16 v3, 0x88c

    invoke-direct {v1, v3, v2, v2}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_6e

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, v3, v2, p0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_6e
    invoke-virtual {p1, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_71
    return-void
.end method

.method public final e(Lrsf;)Lrsf;
    .registers 4

    new-instance v0, Lae7;

    check-cast p1, Lae7;

    iget-object p1, p1, Lae7;->b:Lu56;

    iget-object v1, p0, Lae7;->b:Lu56;

    invoke-virtual {v1, p1}, Lu56;->m(Ljf0;)Ljf0;

    iget-object p0, p0, Lae7;->a:Leq6;

    invoke-direct {v0, p0, v1}, Lae7;-><init>(Leq6;Lu56;)V

    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lae7;->b:Lu56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final g(III)V
    .registers 4

    return-void
.end method

.method public final h(Ljava/io/ByteArrayOutputStream;J)V
    .registers 4

    iget-object p0, p0, Lae7;->b:Lu56;

    invoke-virtual {p0, p1, p2, p3}, Ljf0;->t(Ljava/io/ByteArrayOutputStream;J)V

    return-void
.end method

.method public final i(IZ)V
    .registers 5

    sget-object p1, Lhr5;->a:La36;

    if-nez p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p0, Lae7;->b:Lu56;

    const/4 p2, -0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 p1, 0x6

    const-wide/16 v0, 0x3c9

    invoke-virtual {p0, p1, p2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 p1, 0x4

    const-wide/16 v0, 0x68

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Ljf0;->p(IIJ)V

    const/4 p1, 0x5

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Ljf0;->p(IIJ)V

    return-void
.end method

.method public final isEmpty()Z
    .registers 2

    iget-object p0, p0, Lae7;->b:Lu56;

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_11

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    goto :goto_12

    :cond_11
    const/4 p0, 0x0

    :goto_12
    if-nez p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final j(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lae7;->b:Lu56;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lu56;->x(ILjava/lang/String;)V

    return-void
.end method
