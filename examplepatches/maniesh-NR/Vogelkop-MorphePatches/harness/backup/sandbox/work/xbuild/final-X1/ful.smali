.class public final Lful;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lkul;

.field public final synthetic w:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lkul;Landroid/net/Uri;Lmt5;B)V
    .registers 5

    iput-byte p4, p0, Lful;->t:B

    iput-object p1, p0, Lful;->v:Lkul;

    iput-object p2, p0, Lful;->w:Landroid/net/Uri;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p1, p0, Lful;->t:B

    iget-object v0, p0, Lful;->w:Landroid/net/Uri;

    iget-object p0, p0, Lful;->v:Lkul;

    packed-switch p1, :pswitch_data_18

    new-instance p1, Lful;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, p2, v1}, Lful;-><init>(Lkul;Landroid/net/Uri;Lmt5;B)V

    return-object p1

    :pswitch_10
    new-instance p1, Lful;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, p2, v1}, Lful;-><init>(Lkul;Landroid/net/Uri;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lful;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lful;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lful;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lful;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lful;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lful;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lful;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lful;->t:B

    iget-object v1, p0, Lful;->w:Landroid/net/Uri;

    iget-object v2, p0, Lful;->v:Lkul;

    const/4 v3, 0x0

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_4e

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lful;->u:Z

    if-eqz v6, :cond_1d

    if-ne v6, v5, :cond_19

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2a

    :cond_19
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_2c

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v5, p0, Lful;->u:Z

    invoke-virtual {v2, v1, p0}, Lkul;->c(Landroid/net/Uri;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2a

    move-object v3, v0

    goto :goto_2c

    :cond_2a
    :goto_2a
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2c
    return-object v3

    :pswitch_2d
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lful;->u:Z

    if-eqz v6, :cond_3d

    if-ne v6, v5, :cond_39

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4a

    :cond_39
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_4c

    :cond_3d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v5, p0, Lful;->u:Z

    invoke-virtual {v2, v1, p0}, Lkul;->a(Landroid/net/Uri;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_4a

    move-object v3, v0

    goto :goto_4c

    :cond_4a
    :goto_4a
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_4c
    return-object v3

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method
