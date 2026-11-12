.class public final Ltap;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILmt5;B)V
    .registers 4

    iput-byte p3, p0, Ltap;->t:B

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p0, p0, Ltap;->t:B

    packed-switch p0, :pswitch_data_1a

    new-instance p0, Ltap;

    const/4 v0, 0x2

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Ltap;-><init>(ILmt5;B)V

    iput-object p1, p0, Ltap;->u:Ljava/lang/Object;

    return-object p0

    :pswitch_f
    new-instance p0, Ltap;

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Ltap;-><init>(ILmt5;B)V

    iput-object p1, p0, Ltap;->u:Ljava/lang/Object;

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ltap;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Ljava/lang/Throwable;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ltap;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ltap;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ltap;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ltap;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ltap;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ltap;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Ltap;->t:B

    packed-switch v0, :pswitch_data_3a

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Ltap;->u:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Throwable;

    instance-of p0, p0, Lo2j;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_15
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Ltap;->u:Ljava/lang/Object;

    check-cast p0, Lnx5;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    :try_start_21
    sget-object p0, Lt0i;->b:Lp0i;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 p0, 0x5265c00

    sub-long v0, v2, p0

    const-wide/32 v4, 0xea60

    const/high16 v6, 0x40000

    invoke-static/range {v0 .. v6}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;
    :try_end_34
    .catchall {:try_start_21 .. :try_end_34} :catchall_35

    goto :goto_37

    :catchall_35
    sget-object p0, Lt0i;->b:Lp0i;

    :goto_37
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
