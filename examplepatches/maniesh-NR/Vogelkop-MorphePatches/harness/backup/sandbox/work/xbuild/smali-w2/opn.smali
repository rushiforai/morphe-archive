.class public final Lopn;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lcom/opera/android/weather/ui/WeatherWidgetActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lopn;->t:B

    iput-object p1, p0, Lopn;->v:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lopn;->t:B

    iget-object p0, p0, Lopn;->v:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    packed-switch p1, :pswitch_data_24

    new-instance p1, Lopn;

    const/4 v0, 0x3

    invoke-direct {p1, p0, p2, v0}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lopn;

    const/4 v0, 0x2

    invoke-direct {p1, p0, p2, v0}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    return-object p1

    :pswitch_15
    new-instance p1, Lopn;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    return-object p1

    :pswitch_1c
    new-instance p1, Lopn;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lopn;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_3e

    invoke-virtual {p0, p1, p2}, Lopn;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lopn;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lopn;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lopn;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lopn;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lopn;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_23
    invoke-virtual {p0, p1, p2}, Lopn;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lopn;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lopn;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_30
    invoke-virtual {p0, p1, p2}, Lopn;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lopn;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lopn;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_30
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lopn;->t:B

    iget-object v1, p0, Lopn;->v:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_cc

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lopn;->u:Z

    if-eqz v5, :cond_1b

    if-ne v5, v3, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_30

    :cond_17
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_32

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lqcc;->e:Lqcc;

    new-instance v2, Lopn;

    const/4 v5, 0x2

    invoke-direct {v2, v1, v4, v5}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    iput-boolean v3, p0, Lopn;->u:Z

    invoke-static {v1, p1, v2, p0}, Lm5h;->w(Lndc;Lqcc;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_30

    move-object v4, v0

    goto :goto_32

    :cond_30
    :goto_30
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_32
    return-object v4

    :pswitch_33
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lopn;->u:Z

    if-eqz v5, :cond_43

    if-ne v5, v3, :cond_3f

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_69

    :cond_3f
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_71

    :cond_43
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->T:Loam;

    if-nez p1, :cond_4b

    move-object p1, v4

    :cond_4b
    iget-object v1, v1, Lhjf;->h:Lsz4;

    if-eqz v1, :cond_6c

    invoke-static {v1}, Lyi4;->y(Lsz4;)Z

    move-result v1

    iput-boolean v3, p0, Lopn;->u:Z

    iget-object p1, p1, Loam;->c:Ljava/lang/Object;

    check-cast p1, Ljdj;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v1, p0}, Ljdj;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v0, :cond_65

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_65
    if-ne p0, v0, :cond_69

    move-object v4, v0

    goto :goto_71

    :cond_69
    :goto_69
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_71

    :cond_6c
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_71
    return-object v4

    :pswitch_72
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lopn;->u:Z

    if-eqz v5, :cond_82

    if-ne v5, v3, :cond_7e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_97

    :cond_7e
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_99

    :cond_82
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lqcc;->d:Lqcc;

    new-instance v2, Lopn;

    const/4 v5, 0x0

    invoke-direct {v2, v1, v4, v5}, Lopn;-><init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;B)V

    iput-boolean v3, p0, Lopn;->u:Z

    invoke-static {v1, p1, v2, p0}, Lm5h;->w(Lndc;Lqcc;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_97

    move-object v4, v0

    goto :goto_99

    :cond_97
    :goto_97
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_99
    return-object v4

    :pswitch_9a
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lopn;->u:Z

    if-eqz v5, :cond_aa

    if-eq v5, v3, :cond_a6

    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_ca

    :cond_a6
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_c5

    :cond_aa
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget p1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->e0:I

    invoke-virtual {v1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object p1

    iget-object p1, p1, Lrpn;->d:Lrlh;

    new-instance v2, Lhkm;

    const/4 v5, 0x4

    invoke-direct {v2, v5, v4, v1}, Lhkm;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-boolean v3, p0, Lopn;->u:Z

    invoke-static {p1, v2, p0}, Lj14;->v(Lf99;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_c5

    move-object v4, v0

    goto :goto_ca

    :cond_c5
    :goto_c5
    const-string p0, "SharedFlow never completes, this call should never return."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_ca
    return-object v4

    nop

    :pswitch_data_cc
    .packed-switch 0x0
        :pswitch_9a
        :pswitch_72
        :pswitch_33
    .end packed-switch
.end method
