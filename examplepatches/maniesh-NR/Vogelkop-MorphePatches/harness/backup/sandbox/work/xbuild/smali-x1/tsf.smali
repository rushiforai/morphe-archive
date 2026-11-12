.class public final synthetic Ltsf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkl0;

.field public final synthetic c:J

.field public final synthetic d:Lgl0;

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Lkl0;JLgl0;JB)V
    .registers 8

    iput-byte p7, p0, Ltsf;->a:B

    iput-object p1, p0, Ltsf;->b:Lkl0;

    iput-wide p2, p0, Ltsf;->c:J

    iput-object p4, p0, Ltsf;->d:Lgl0;

    iput-wide p5, p0, Ltsf;->e:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Ltsf;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_78

    check-cast p1, Ljl0;

    iget-object v0, p0, Ltsf;->b:Lkl0;

    if-eqz v0, :cond_12

    iget-object v3, p1, Ljl0;->a:Lil0;

    invoke-virtual {v3, v2, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_12
    iget-object p1, p1, Ljl0;->a:Lil0;

    iget-wide v2, p0, Ltsf;->c:J

    invoke-virtual {p1, v1, v1, v2, v3}, Ljf0;->p(IIJ)V

    const/4 v0, 0x2

    iget-object v2, p0, Ltsf;->d:Lgl0;

    invoke-virtual {p1, v0, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v0, 0x3

    iget-wide v2, p0, Ltsf;->e:J

    invoke-virtual {p1, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_28
    check-cast p1, Lak0;

    iget-object p1, p1, Lak0;->h:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsd0;

    new-instance v3, Ltsf;

    const/4 v10, 0x1

    iget-object v4, p0, Ltsf;->b:Lkl0;

    iget-wide v5, p0, Ltsf;->c:J

    iget-object v7, p0, Ltsf;->d:Lgl0;

    iget-wide v8, p0, Ltsf;->e:J

    invoke-direct/range {v3 .. v10}, Ltsf;-><init>(Lkl0;JLgl0;JB)V

    iget-object p0, p1, Lsd0;->a:Lqs7;

    invoke-static {}, Lqs7;->v()Lil0;

    move-result-object p0

    iget-object p1, p1, Lsd0;->b:Lpd0;

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_5c

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5c

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_69

    :cond_5c
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v2, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_69
    invoke-virtual {v1, p0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    new-instance p1, Ljl0;

    invoke-direct {p1, p0}, Ljl0;-><init>(Lil0;)V

    invoke-virtual {v3, p1}, Ltsf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
