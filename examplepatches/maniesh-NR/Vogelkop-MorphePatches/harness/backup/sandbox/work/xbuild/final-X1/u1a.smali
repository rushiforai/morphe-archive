.class public final Lu1a;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lv1a;

.field public final synthetic w:Z


# direct methods
.method public synthetic constructor <init>(Lv1a;ZLmt5;B)V
    .registers 5

    iput-byte p4, p0, Lu1a;->t:B

    iput-object p1, p0, Lu1a;->v:Lv1a;

    iput-boolean p2, p0, Lu1a;->w:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p1, p0, Lu1a;->t:B

    iget-boolean v0, p0, Lu1a;->w:Z

    iget-object p0, p0, Lu1a;->v:Lv1a;

    packed-switch p1, :pswitch_data_18

    new-instance p1, Lu1a;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, p2, v1}, Lu1a;-><init>(Lv1a;ZLmt5;B)V

    return-object p1

    :pswitch_10
    new-instance p1, Lu1a;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, p2, v1}, Lu1a;-><init>(Lv1a;ZLmt5;B)V

    return-object p1

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lu1a;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lu1a;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lu1a;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lu1a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lu1a;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lu1a;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lu1a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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

    iget-byte v0, p0, Lu1a;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    iget-object v4, p0, Lu1a;->v:Lv1a;

    iget-boolean v5, p0, Lu1a;->w:Z

    packed-switch v0, :pswitch_data_72

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lu1a;->u:Z

    if-eqz v6, :cond_1d

    if-ne v6, v3, :cond_19

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_36

    :cond_19
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_38

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v4, Lv1a;->i:Ljava/lang/Boolean;

    iget-object p1, v4, Lv1a;->e:Ljdj;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-boolean v3, p0, Lu1a;->u:Z

    invoke-virtual {p1, v1, p0}, Ljdj;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_36

    move-object v1, v0

    goto :goto_38

    :cond_36
    :goto_36
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_38
    return-object v1

    :pswitch_39
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lu1a;->u:Z

    if-eqz v6, :cond_49

    if-ne v6, v3, :cond_45

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6e

    :cond_45
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_70

    :cond_49
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v4, Lv1a;->i:Ljava/lang/Boolean;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6e

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v4, Lv1a;->i:Ljava/lang/Boolean;

    iget-object p1, v4, Lv1a;->e:Ljdj;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-boolean v3, p0, Lu1a;->u:Z

    invoke-virtual {p1, v1, p0}, Ljdj;->emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_6e

    move-object v1, v0

    goto :goto_70

    :cond_6e
    :goto_6e
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_70
    return-object v1

    nop

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_39
    .end packed-switch
.end method
