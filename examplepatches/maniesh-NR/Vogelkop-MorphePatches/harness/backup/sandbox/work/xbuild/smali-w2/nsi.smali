.class public final Lnsi;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lpsi;


# direct methods
.method public synthetic constructor <init>(Lpsi;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lnsi;->t:B

    iput-object p1, p0, Lnsi;->v:Lpsi;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lnsi;->t:B

    iget-object p0, p0, Lnsi;->v:Lpsi;

    packed-switch v0, :pswitch_data_22

    new-instance v0, Lnsi;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p2, v1}, Lnsi;-><init>(Lpsi;Lmt5;B)V

    iput-object p1, v0, Lnsi;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lnsi;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lnsi;-><init>(Lpsi;Lmt5;B)V

    iput-object p1, v0, Lnsi;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_19
    new-instance v0, Lnsi;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lnsi;-><init>(Lpsi;Lmt5;B)V

    iput-object p1, v0, Lnsi;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_19
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lnsi;->t:B

    packed-switch v0, :pswitch_data_38

    check-cast p1, Li0a;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lnsi;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lnsi;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnsi;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lut8;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lnsi;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lnsi;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnsi;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Lf3h;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lnsi;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lnsi;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnsi;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lnsi;->t:B

    iget-object v1, p0, Lnsi;->v:Lpsi;

    iget-object p0, p0, Lnsi;->u:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_56

    check-cast p0, Li0a;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-boolean p0, p0, Li0a;->a:Z

    iput-boolean p0, v1, Lpsi;->r:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p0, Lut8;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lnt8;->h:Lh58;

    const/4 v0, 0x0

    if-eqz p1, :cond_29

    invoke-virtual {p1}, La4;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_40

    :cond_29
    invoke-static {p1, p1}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object p1

    :cond_2d
    invoke-virtual {p1}, Lw4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-virtual {p1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnt8;

    invoke-static {p0, v2}, Lipe;->t(Lut8;Lnt8;)Ltt8;

    move-result-object v2

    if-eqz v2, :cond_2d

    const/4 v0, 0x1

    :cond_40
    iput-boolean v0, v1, Lpsi;->o:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_45
    check-cast p0, Lf3h;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lf3h;->b()Z

    move-result p0

    iput-boolean p0, v1, Lpsi;->n:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_45
        :pswitch_17
    .end packed-switch
.end method
