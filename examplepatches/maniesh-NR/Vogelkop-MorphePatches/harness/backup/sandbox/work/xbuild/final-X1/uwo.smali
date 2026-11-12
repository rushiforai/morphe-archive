.class public final Luwo;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public A:B

.field public synthetic B:Ljava/lang/Object;

.field public final synthetic C:Landroid/content/Context;

.field public t:Ljava/lang/Object;

.field public u:Ljava/lang/Object;

.field public v:Ljava/lang/Object;

.field public w:Ljava/lang/Object;

.field public x:Z

.field public y:Z

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmt5;)V
    .registers 3

    iput-object p1, p0, Luwo;->C:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    new-instance v0, Luwo;

    iget-object p0, p0, Luwo;->C:Landroid/content/Context;

    invoke-direct {v0, p0, p2}, Luwo;-><init>(Landroid/content/Context;Lmt5;)V

    iput-object p1, v0, Luwo;->B:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Luwo;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Luwo;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Luwo;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, p0, Luwo;->A:B

    const/4 v2, 0x5

    const/4 v3, 0x6

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x0

    packed-switch v1, :pswitch_data_1b2

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :pswitch_12
    iget v0, p0, Luwo;->z:I

    iget-boolean v1, p0, Luwo;->y:Z

    iget-boolean v2, p0, Luwo;->x:Z

    iget-object v3, p0, Luwo;->v:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Luwo;->u:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Luwo;->t:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iget-object v6, p0, Luwo;->B:Ljava/lang/Object;

    check-cast v6, Landroid/location/Location;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move v9, v2

    move-object v7, v3

    move-object v2, v5

    move v5, v0

    move v3, v1

    move-object v1, v6

    move-object v6, v4

    goto/16 :goto_1a6

    :pswitch_34
    iget v1, p0, Luwo;->z:I

    iget-boolean v2, p0, Luwo;->y:Z

    iget-boolean v4, p0, Luwo;->x:Z

    iget-object v5, p0, Luwo;->t:Ljava/lang/Object;

    check-cast v5, Landroid/location/Location;

    iget-object v6, p0, Luwo;->B:Ljava/lang/Object;

    check-cast v6, Lh07;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_177

    :pswitch_47
    iget-boolean v1, p0, Luwo;->y:Z

    iget-boolean v4, p0, Luwo;->x:Z

    iget-object v5, p0, Luwo;->u:Ljava/lang/Object;

    check-cast v5, Landroid/location/Location;

    iget-object v7, p0, Luwo;->t:Ljava/lang/Object;

    check-cast v7, Lh07;

    iget-object v8, p0, Luwo;->B:Ljava/lang/Object;

    check-cast v8, Lh07;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_158

    :pswitch_5c
    iget-boolean v1, p0, Luwo;->x:Z

    iget-object v4, p0, Luwo;->v:Ljava/lang/Object;

    check-cast v4, Landroid/location/Location;

    iget-object v5, p0, Luwo;->u:Ljava/lang/Object;

    check-cast v5, Lh07;

    iget-object v7, p0, Luwo;->t:Ljava/lang/Object;

    check-cast v7, Lh07;

    iget-object v8, p0, Luwo;->B:Ljava/lang/Object;

    check-cast v8, Lh07;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object v13, v4

    move v4, v1

    move-object v1, v13

    goto/16 :goto_137

    :pswitch_76
    iget-object v1, p0, Luwo;->w:Ljava/lang/Object;

    check-cast v1, Landroid/location/Location;

    iget-object v5, p0, Luwo;->v:Ljava/lang/Object;

    check-cast v5, Lh07;

    iget-object v7, p0, Luwo;->u:Ljava/lang/Object;

    check-cast v7, Lh07;

    iget-object v8, p0, Luwo;->t:Ljava/lang/Object;

    check-cast v8, Lh07;

    iget-object v9, p0, Luwo;->B:Ljava/lang/Object;

    check-cast v9, Lh07;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_11a

    :pswitch_8f
    iget-object v1, p0, Luwo;->w:Ljava/lang/Object;

    check-cast v1, Lh07;

    iget-object v7, p0, Luwo;->v:Ljava/lang/Object;

    check-cast v7, Lh07;

    iget-object v8, p0, Luwo;->u:Ljava/lang/Object;

    check-cast v8, Lh07;

    iget-object v9, p0, Luwo;->t:Ljava/lang/Object;

    check-cast v9, Lh07;

    iget-object v10, p0, Luwo;->B:Ljava/lang/Object;

    check-cast v10, Lh07;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_102

    :pswitch_a7
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Luwo;->B:Ljava/lang/Object;

    check-cast p1, Lnx5;

    new-instance v1, Lwr;

    iget-object v7, p0, Luwo;->C:Landroid/content/Context;

    const/4 v8, 0x7

    invoke-direct {v1, v7, v6, v8}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p1, v6, v6, v1, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v1

    new-instance v9, Lwr;

    const/16 v10, 0x8

    invoke-direct {v9, v7, v6, v10}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p1, v6, v6, v9, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v10

    new-instance v9, Lwr;

    invoke-direct {v9, v7, v6, v3}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p1, v6, v6, v9, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v9

    new-instance v11, Lwv0;

    invoke-direct {v11, v5, v6, v8}, Lwv0;-><init>(ILmt5;B)V

    invoke-static {p1, v6, v6, v11, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v8

    new-instance v11, Lwr;

    const/16 v12, 0x9

    invoke-direct {v11, v7, v6, v12}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p1, v6, v6, v11, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v11

    new-instance v12, Lwr;

    invoke-direct {v12, v7, v6, v2}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p1, v6, v6, v12, v4}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object p1

    iput-object v10, p0, Luwo;->B:Ljava/lang/Object;

    iput-object v9, p0, Luwo;->t:Ljava/lang/Object;

    iput-object v8, p0, Luwo;->u:Ljava/lang/Object;

    iput-object v11, p0, Luwo;->v:Ljava/lang/Object;

    iput-object p1, p0, Luwo;->w:Ljava/lang/Object;

    const/4 v7, 0x1

    iput-byte v7, p0, Luwo;->A:B

    invoke-virtual {v1, p0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_19b

    move-object v7, v1

    move-object v1, p1

    move-object p1, v7

    move-object v7, v11

    :goto_102
    check-cast p1, Landroid/location/Location;

    iput-object v9, p0, Luwo;->B:Ljava/lang/Object;

    iput-object v8, p0, Luwo;->t:Ljava/lang/Object;

    iput-object v7, p0, Luwo;->u:Ljava/lang/Object;

    iput-object v1, p0, Luwo;->v:Ljava/lang/Object;

    iput-object p1, p0, Luwo;->w:Ljava/lang/Object;

    iput-byte v5, p0, Luwo;->A:B

    invoke-interface {v10, p0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v0, :cond_19b

    move-object v13, v1

    move-object v1, p1

    move-object p1, v5

    move-object v5, v13

    :goto_11a
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-object v8, p0, Luwo;->B:Ljava/lang/Object;

    iput-object v7, p0, Luwo;->t:Ljava/lang/Object;

    iput-object v5, p0, Luwo;->u:Ljava/lang/Object;

    iput-object v1, p0, Luwo;->v:Ljava/lang/Object;

    iput-object v6, p0, Luwo;->w:Ljava/lang/Object;

    iput-boolean p1, p0, Luwo;->x:Z

    iput-byte v4, p0, Luwo;->A:B

    invoke-interface {v9, p0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v0, :cond_19b

    move-object v13, v4

    move v4, p1

    move-object p1, v13

    :goto_137
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-object v7, p0, Luwo;->B:Ljava/lang/Object;

    iput-object v5, p0, Luwo;->t:Ljava/lang/Object;

    iput-object v1, p0, Luwo;->u:Ljava/lang/Object;

    iput-object v6, p0, Luwo;->v:Ljava/lang/Object;

    iput-boolean v4, p0, Luwo;->x:Z

    iput-boolean p1, p0, Luwo;->y:Z

    const/4 v9, 0x4

    iput-byte v9, p0, Luwo;->A:B

    invoke-interface {v8, p0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v8

    if-eq v8, v0, :cond_19b

    move-object v13, v1

    move v1, p1

    move-object p1, v8

    move-object v8, v7

    move-object v7, v5

    move-object v5, v13

    :goto_158
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    iput-object v7, p0, Luwo;->B:Ljava/lang/Object;

    iput-object v5, p0, Luwo;->t:Ljava/lang/Object;

    iput-object v6, p0, Luwo;->u:Ljava/lang/Object;

    iput-boolean v4, p0, Luwo;->x:Z

    iput-boolean v1, p0, Luwo;->y:Z

    iput p1, p0, Luwo;->z:I

    iput-byte v2, p0, Luwo;->A:B

    invoke-interface {v8, p0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v0, :cond_19b

    move v6, v1

    move v1, p1

    move-object p1, v2

    move v2, v6

    move-object v6, v7

    :goto_177
    check-cast p1, Lj7m;

    iget-object v7, p1, Lj7m;->a:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v8, p1, Lj7m;->b:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object p1, p1, Lj7m;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object v5, p0, Luwo;->B:Ljava/lang/Object;

    iput-object v7, p0, Luwo;->t:Ljava/lang/Object;

    iput-object v8, p0, Luwo;->u:Ljava/lang/Object;

    iput-object p1, p0, Luwo;->v:Ljava/lang/Object;

    iput-boolean v4, p0, Luwo;->x:Z

    iput-boolean v2, p0, Luwo;->y:Z

    iput v1, p0, Luwo;->z:I

    iput-byte v3, p0, Luwo;->A:B

    invoke-interface {v6, p0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_19c

    :cond_19b
    return-object v0

    :cond_19c
    move-object v6, v7

    move-object v7, p1

    move-object p1, v3

    move v3, v2

    move-object v2, v6

    move-object v6, v5

    move v5, v1

    move-object v1, v6

    move v9, v4

    move-object v6, v8

    :goto_1a6
    move-object v8, p1

    check-cast v8, Lt5p;

    new-instance v0, Lswo;

    iget-object v4, p0, Luwo;->C:Landroid/content/Context;

    invoke-direct/range {v0 .. v9}, Lswo;-><init>(Landroid/location/Location;Ljava/lang/String;ZLandroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lt5p;Z)V

    return-object v0

    nop

    :pswitch_data_1b2
    .packed-switch 0x0
        :pswitch_a7
        :pswitch_8f
        :pswitch_76
        :pswitch_5c
        :pswitch_47
        :pswitch_34
        :pswitch_12
    .end packed-switch
.end method
