.class public final Lo0i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnx5;

.field public final b:Lqs6;

.field public final c:Ldx5;


# direct methods
.method public constructor <init>(Lnx5;Lqs6;Ldx5;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo0i;->a:Lnx5;

    iput-object p2, p0, Lo0i;->b:Lqs6;

    iput-object p3, p0, Lo0i;->c:Ldx5;

    return-void
.end method


# virtual methods
.method public final a(IJLkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p5, Ln0i;

    if-eqz v0, :cond_13

    move-object v0, p5

    check-cast v0, Ln0i;

    iget v1, v0, Ln0i;->A:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ln0i;->A:I

    goto :goto_18

    :cond_13
    new-instance v0, Ln0i;

    invoke-direct {v0, p0, p5}, Ln0i;-><init>(Lo0i;Lnt5;)V

    :goto_18
    iget-object p0, v0, Ln0i;->y:Ljava/lang/Object;

    sget-object p5, Lpx5;->a:Lpx5;

    iget v1, v0, Ln0i;->A:I

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_4c

    if-eq v1, v3, :cond_3c

    if-ne v1, v2, :cond_35

    iget p1, v0, Ln0i;->u:I

    iget-wide p2, v0, Ln0i;->w:J

    iget-byte p4, v0, Ln0i;->t:B

    iget-object v1, v0, Ln0i;->x:Lkotlin/jvm/functions/Function1;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_cd

    :cond_35
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_3c
    iget p1, v0, Ln0i;->v:I

    iget p2, v0, Ln0i;->u:I

    iget-wide p3, v0, Ln0i;->w:J

    iget-byte v1, v0, Ln0i;->t:B

    iget-object v4, v0, Ln0i;->x:Lkotlin/jvm/functions/Function1;

    check-cast v4, Lkotlin/jvm/functions/Function1;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_70

    :cond_4c
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    const/4 p0, 0x0

    move v9, p1

    move p1, p0

    move p0, v9

    :goto_53
    if-ge p1, p0, :cond_d9

    move-object v1, p4

    check-cast v1, Lkotlin/jvm/functions/Function1;

    iput-object v1, v0, Ln0i;->x:Lkotlin/jvm/functions/Function1;

    iput-byte p0, v0, Ln0i;->t:B

    iput-wide p2, v0, Ln0i;->w:J

    iput p1, v0, Ln0i;->u:I

    iput p1, v0, Ln0i;->v:I

    iput v3, v0, Ln0i;->A:I

    invoke-interface {p4, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p5, :cond_c8

    move-object v4, v1

    move v1, p0

    move-object p0, v4

    move-object v4, p4

    move-wide p3, p2

    move p2, p1

    :goto_70
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_7b

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_7b
    sget-object p0, Lpn7;->b:Lon7;

    shl-int p0, v3, p1

    sget-object v5, Lun7;->e:Lun7;

    invoke-static {p0, v5}, Lcs5;->x0(ILun7;)J

    move-result-wide v5

    sget-object p0, Luih;->a:Ltih;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Luih;->b:Lk6;

    const/16 v7, 0x3e8

    invoke-virtual {p0, v7}, Lk6;->k(I)I

    move-result p0

    sget-object v7, Lun7;->d:Lun7;

    invoke-static {p0, v7}, Lcs5;->x0(ILun7;)J

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Lpn7;->m(JJ)J

    move-result-wide v5

    new-instance p0, Lpn7;

    invoke-direct {p0, v5, v6}, Lpn7;-><init>(J)V

    new-instance v5, Lpn7;

    invoke-direct {v5, p3, p4}, Lpn7;-><init>(J)V

    invoke-virtual {p0, v5}, Lpn7;->compareTo(Ljava/lang/Object;)I

    move-result v6

    if-lez v6, :cond_ad

    move-object p0, v5

    :cond_ad
    add-int/lit8 v5, v1, -0x1

    if-ge p1, v5, :cond_d1

    move-object v5, v4

    check-cast v5, Lkotlin/jvm/functions/Function1;

    iput-object v5, v0, Ln0i;->x:Lkotlin/jvm/functions/Function1;

    iput-byte v1, v0, Ln0i;->t:B

    iput-wide p3, v0, Ln0i;->w:J

    iput p2, v0, Ln0i;->u:I

    iput p1, v0, Ln0i;->v:I

    iput v2, v0, Ln0i;->A:I

    iget-wide p0, p0, Lpn7;->a:J

    invoke-static {p0, p1, v0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p5, :cond_c9

    :cond_c8
    return-object p5

    :cond_c9
    move p1, p2

    move-wide p2, p3

    move p4, v1

    move-object v1, v4

    :goto_cd
    move p0, p4

    move-wide p3, p2

    move p2, p1

    goto :goto_d3

    :cond_d1
    move p0, v1

    move-object v1, v4

    :goto_d3
    add-int/lit8 p1, p2, 0x1

    move-wide p2, p3

    move-object p4, v1

    goto/16 :goto_53

    :cond_d9
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method
