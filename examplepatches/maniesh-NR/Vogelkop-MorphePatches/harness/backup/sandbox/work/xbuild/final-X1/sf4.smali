.class public final Lsf4;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lpqh;

.field public final synthetic w:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lpqh;Ljava/lang/String;Lmt5;B)V
    .registers 5

    iput-byte p4, p0, Lsf4;->t:B

    iput-object p1, p0, Lsf4;->v:Lpqh;

    iput-object p2, p0, Lsf4;->w:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 6

    iget-byte v0, p0, Lsf4;->t:B

    iget-object v1, p0, Lsf4;->w:Ljava/lang/String;

    iget-object p0, p0, Lsf4;->v:Lpqh;

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Lsf4;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, p2, v2}, Lsf4;-><init>(Lpqh;Ljava/lang/String;Lmt5;B)V

    iput-object p1, v0, Lsf4;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_12
    new-instance v0, Lsf4;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p2, v2}, Lsf4;-><init>(Lpqh;Ljava/lang/String;Lmt5;B)V

    iput-object p1, v0, Lsf4;->u:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lsf4;->t:B

    check-cast p1, Lagf;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lsf4;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lsf4;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lsf4;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lsf4;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lsf4;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lsf4;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lsf4;->t:B

    const/4 v1, 0x0

    iget-object v2, p0, Lsf4;->v:Lpqh;

    iget-object v3, p0, Lsf4;->w:Ljava/lang/String;

    packed-switch v0, :pswitch_data_28

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lsf4;->u:Ljava/lang/Object;

    check-cast p0, Lagf;

    invoke-static {v3}, Lsd4;->b(Ljava/lang/String;)Ljava/lang/String;

    iput-object v1, v2, Lpqh;->a:Ljava/lang/Object;

    return-object p0

    :pswitch_19
    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lsf4;->u:Ljava/lang/Object;

    check-cast p0, Lagf;

    invoke-static {v3}, Lsd4;->b(Ljava/lang/String;)Ljava/lang/String;

    iput-object v1, v2, Lpqh;->a:Ljava/lang/Object;

    return-object p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
