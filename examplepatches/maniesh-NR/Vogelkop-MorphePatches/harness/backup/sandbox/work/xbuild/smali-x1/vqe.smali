.class public final synthetic Lvqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsrg;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lvqe;->a:J

    iput-object p1, p0, Lvqe;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 8

    check-cast p1, Loqe;

    instance-of v0, p1, Lmsh;

    iget-wide v1, p0, Lvqe;->a:J

    const/4 v3, 0x0

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lmsh;

    iget-wide v4, v0, Lmsh;->p:J

    cmp-long v0, v4, v1

    if-gez v0, :cond_35

    goto :goto_2e

    :cond_13
    instance-of v0, p1, Lere;

    if-eqz v0, :cond_35

    move-object v0, p1

    check-cast v0, Lere;

    iget-object v0, v0, Lere;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_35

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmsh;

    iget-wide v4, v0, Lmsh;->p:J

    cmp-long v0, v4, v1

    if-gez v0, :cond_35

    :goto_2e
    iget-object p0, p0, Lvqe;->b:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    return p0

    :cond_35
    return v3
.end method
