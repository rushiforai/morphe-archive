.class public final Ley6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public final synthetic u:Lgy6;

.field public final synthetic v:Lpzh;


# direct methods
.method public synthetic constructor <init>(Lgy6;Lpzh;Lmt5;B)V
    .registers 5

    iput-byte p4, p0, Ley6;->t:B

    iput-object p1, p0, Ley6;->u:Lgy6;

    iput-object p2, p0, Ley6;->v:Lpzh;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p1, p0, Ley6;->t:B

    iget-object v0, p0, Ley6;->v:Lpzh;

    iget-object p0, p0, Ley6;->u:Lgy6;

    packed-switch p1, :pswitch_data_18

    new-instance p1, Ley6;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v0, p2, v1}, Ley6;-><init>(Lgy6;Lpzh;Lmt5;B)V

    return-object p1

    :pswitch_10
    new-instance p1, Ley6;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v0, p2, v1}, Ley6;-><init>(Lgy6;Lpzh;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ley6;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Ley6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ley6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ley6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Ley6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ley6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ley6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ley6;->t:B

    iget-object v1, p0, Ley6;->v:Lpzh;

    iget-object p0, p0, Ley6;->u:Lgy6;

    packed-switch v0, :pswitch_data_3e

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lgy6;->c:Lcrb;

    iget-object p1, v1, Lpzh;->g:Lvzh;

    invoke-virtual {p1}, Lvzh;->string()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lvne;->Companion:Lune;

    invoke-virtual {v0}, Lune;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p0, p1, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_23
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lgy6;->c:Lcrb;

    iget-object p1, v1, Lpzh;->g:Lvzh;

    invoke-virtual {p1}, Lvzh;->string()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ldoe;->Companion:Lcoe;

    invoke-virtual {v0}, Lcoe;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p0, p1, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
