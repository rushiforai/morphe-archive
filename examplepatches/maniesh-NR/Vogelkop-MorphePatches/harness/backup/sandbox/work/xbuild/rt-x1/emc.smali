.class public final Lemc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic t:B

.field public u:B

.field public final synthetic v:Lgmc;

.field public final synthetic w:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lgmc;Ljava/util/ArrayList;Lmt5;B)V
    .registers 5

    iput-byte p4, p0, Lemc;->t:B

    iput-object p1, p0, Lemc;->v:Lgmc;

    iput-object p2, p0, Lemc;->w:Ljava/util/ArrayList;

    const/4 p1, 0x1

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lemc;->t:B

    iget-object v1, p0, Lemc;->w:Ljava/util/ArrayList;

    iget-object p0, p0, Lemc;->v:Lgmc;

    packed-switch v0, :pswitch_data_18

    new-instance v0, Lemc;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, p1, v2}, Lemc;-><init>(Lgmc;Ljava/util/ArrayList;Lmt5;B)V

    return-object v0

    :pswitch_10
    new-instance v0, Lemc;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lemc;-><init>(Lgmc;Ljava/util/ArrayList;Lmt5;B)V

    return-object v0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lemc;->t:B

    check-cast p1, Lmt5;

    packed-switch v0, :pswitch_data_22

    invoke-virtual {p0, p1}, Lemc;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lemc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lemc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_14
    invoke-virtual {p0, p1}, Lemc;->create(Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lemc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lemc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lemc;->t:B

    iget-object v1, p0, Lemc;->w:Ljava/util/ArrayList;

    const/4 v2, 0x0

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    iget-object v4, p0, Lemc;->v:Lgmc;

    const/4 v5, 0x1

    const/4 v6, 0x2

    packed-switch v0, :pswitch_data_ac

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v7, p0, Lemc;->u:B

    if-eqz v7, :cond_24

    if-eq v7, v5, :cond_20

    if-ne v7, v6, :cond_1c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_56

    :cond_1c
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_58

    :cond_20
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3d

    :cond_24
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v4, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    sget-object v2, Loi9;->c:Loi9;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    iput-byte v5, p0, Lemc;->u:B

    invoke-virtual {p1, v2, p0}, Lwlc;->b(Ljava/util/List;Lkuk;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_54

    :goto_3d
    iget-object p1, v4, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    iput-byte v6, p0, Lemc;->u:B

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Lulc;

    invoke-direct {v3, p1, v1, v5}, Lulc;-><init>(Lwlc;Ljava/util/ArrayList;B)V

    invoke-static {v2, v3, p0}, Lkfo;->Z(Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_56

    :cond_54
    move-object v2, v0

    goto :goto_58

    :cond_56
    :goto_56
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_58
    return-object v2

    :pswitch_59
    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v7, p0, Lemc;->u:B

    const/4 v8, 0x0

    if-eqz v7, :cond_70

    if-eq v7, v5, :cond_6c

    if-ne v7, v6, :cond_68

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a8

    :cond_68
    invoke-static {v3}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_aa

    :cond_6c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_8c

    :cond_70
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v4, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    iput-byte v5, p0, Lemc;->u:B

    iget-object p1, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v2, Lg8c;

    const/16 v3, 0xf

    invoke-direct {v2, v3}, Lg8c;-><init>(B)V

    invoke-static {p0, p1, v8, v5, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_a6

    :goto_8c
    iget-object p1, v4, Lgmc;->a:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwlc;

    iput-byte v6, p0, Lemc;->u:B

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p1, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v3, Lulc;

    invoke-direct {v3, p1, v1, v6}, Lulc;-><init>(Lwlc;Ljava/util/ArrayList;B)V

    invoke-static {p0, v2, v8, v5, v3}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_a8

    :cond_a6
    move-object v2, v0

    goto :goto_aa

    :cond_a8
    :goto_a8
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_aa
    return-object v2

    nop

    :pswitch_data_ac
    .packed-switch 0x0
        :pswitch_59
    .end packed-switch
.end method
