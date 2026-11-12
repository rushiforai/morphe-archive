.class public final synthetic Lp5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ltc0;

.field public final synthetic b:J

.field public final synthetic c:J

.field public final synthetic d:J

.field public final synthetic e:J

.field public final synthetic f:J

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:J

.field public final synthetic k:Lnc0;


# direct methods
.method public synthetic constructor <init>(Ltc0;JJJJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLnc0;)V
    .registers 18

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp5f;->a:Ltc0;

    iput-wide p2, p0, Lp5f;->b:J

    iput-wide p4, p0, Lp5f;->c:J

    iput-wide p6, p0, Lp5f;->d:J

    iput-wide p8, p0, Lp5f;->e:J

    iput-wide p10, p0, Lp5f;->f:J

    iput-object p12, p0, Lp5f;->g:Ljava/lang/String;

    iput-object p13, p0, Lp5f;->h:Ljava/lang/String;

    iput-object p14, p0, Lp5f;->i:Ljava/lang/String;

    move-wide p1, p15

    iput-wide p1, p0, Lp5f;->j:J

    move-object/from16 p1, p17

    iput-object p1, p0, Lp5f;->k:Lnc0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-object v0, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lfe0;

    const/4 v1, -0x1

    const/16 v2, 0xb

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltd0;->b:Lqd0;

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    const/4 v3, 0x1

    if-eqz v2, :cond_2d

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2d

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_36

    :cond_2d
    invoke-static {p1, v1, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_36
    invoke-virtual {v4, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    iget-object v2, p0, Lp5f;->a:Ltc0;

    invoke-virtual {v0, p1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    iget-wide v4, p0, Lp5f;->b:J

    invoke-virtual {v0, v1, v3, v4, v5}, Ljf0;->p(IIJ)V

    const/4 p1, 0x3

    iget-wide v1, p0, Lp5f;->c:J

    invoke-virtual {v0, p1, v3, v1, v2}, Ljf0;->p(IIJ)V

    const/4 p1, 0x4

    iget-wide v1, p0, Lp5f;->d:J

    invoke-virtual {v0, p1, v3, v1, v2}, Ljf0;->p(IIJ)V

    const/4 p1, 0x5

    iget-wide v1, p0, Lp5f;->e:J

    invoke-virtual {v0, p1, v3, v1, v2}, Ljf0;->p(IIJ)V

    const/4 p1, 0x6

    iget-wide v1, p0, Lp5f;->f:J

    invoke-virtual {v0, p1, v3, v1, v2}, Ljf0;->p(IIJ)V

    const/4 p1, 0x7

    iget-object v1, p0, Lp5f;->g:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lfe0;->x(ILjava/lang/String;)V

    iget-object p1, p0, Lp5f;->h:Ljava/lang/String;

    invoke-virtual {v0, v3, p1}, Lfe0;->x(ILjava/lang/String;)V

    const/16 p1, 0x8

    iget-object v1, p0, Lp5f;->i:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lfe0;->x(ILjava/lang/String;)V

    const-wide/16 v1, 0x0

    iget-wide v4, p0, Lp5f;->j:J

    cmp-long p1, v4, v1

    if-ltz p1, :cond_7b

    const/16 p1, 0x9

    invoke-virtual {v0, p1, v3, v4, v5}, Ljf0;->p(IIJ)V

    :cond_7b
    const/16 p1, 0xa

    iget-object p0, p0, Lp5f;->k:Lnc0;

    invoke-virtual {v0, p1, v3, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
