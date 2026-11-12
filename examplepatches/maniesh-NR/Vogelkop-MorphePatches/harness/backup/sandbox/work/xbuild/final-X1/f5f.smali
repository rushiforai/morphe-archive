.class public final synthetic Lf5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Z

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(JLkotlin/jvm/functions/Function0;Z)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lf5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lf5f;->d:J

    iput-object p3, p0, Lf5f;->b:Ljava/lang/Object;

    iput-boolean p4, p0, Lf5f;->c:Z

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;JJB)V
    .registers 7

    .line 13
    iput-byte p6, p0, Lf5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf5f;->b:Ljava/lang/Object;

    long-to-int p1, p2

    iput-boolean p1, p0, Lf5f;->c:Z

    iput-wide p4, p0, Lf5f;->d:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lf5f;->a:B

    iget-boolean v1, p0, Lf5f;->c:Z

    iget-wide v2, p0, Lf5f;->d:J

    iget-object v4, p0, Lf5f;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_9e

    move-object v6, v4

    check-cast v6, Lkotlin/jvm/functions/Function0;

    check-cast p1, Lg74;

    iget-object v0, p1, Lg74;->a:Le14;

    invoke-interface {v0}, Le14;->e()J

    move-result-wide v0

    const/16 v4, 0x20

    shr-long/2addr v0, v4

    long-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-static {p1, v0}, Lscd;->u(Lg74;F)Lj71;

    move-result-object v8

    new-instance v9, Lkh3;

    const/4 v0, 0x5

    invoke-direct {v9, v2, v3, v0}, Lkh3;-><init>(JI)V

    new-instance v5, Lha1;

    const/4 v10, 0x0

    iget-boolean v7, p0, Lf5f;->c:Z

    invoke-direct/range {v5 .. v10}, Lha1;-><init>(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v5}, Lg74;->a(Lkotlin/jvm/functions/Function1;)Lqe6;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast v4, Ljava/lang/String;

    int-to-long v0, v1

    check-cast p1, Lhi0;

    new-instance p0, Lg5f;

    invoke-direct {p0, v0, v1, v2, v3}, Lg5f;-><init>(JJ)V

    iget-object v0, p1, Lhi0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzd0;

    const/4 v1, -0x1

    const/4 v2, 0x2

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lhi0;->b:Lfi0;

    const/16 v1, 0x2d

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const/4 v3, 0x1

    if-eqz v2, :cond_69

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_69

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_76

    :cond_69
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_76
    invoke-virtual {v5, v4, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean p1, p0, Lg5f;->a:Z

    int-to-long v1, p1

    const/4 p1, 0x0

    invoke-virtual {v0, p1, v3, v1, v2}, Ljf0;->p(IIJ)V

    iget-wide p0, p0, Lg5f;->b:J

    invoke-virtual {v0, v3, v3, p0, p1}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_88
    check-cast v4, Ljava/lang/String;

    int-to-long v2, v1

    check-cast p1, Lck0;

    new-instance v0, Lf5f;

    const/4 v6, 0x1

    iget-wide v7, p0, Lf5f;->d:J

    move-object v1, v4

    move-wide v4, v7

    invoke-direct/range {v0 .. v6}, Lf5f;-><init>(Ljava/lang/String;JJB)V

    invoke-virtual {p1, v0}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_88
        :pswitch_38
    .end packed-switch
.end method
