.class public final Lkxa;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lgki;


# direct methods
.method public synthetic constructor <init>(Lgki;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lkxa;->t:B

    iput-object p1, p0, Lkxa;->v:Lgki;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lkxa;->t:B

    iget-object p0, p0, Lkxa;->v:Lgki;

    packed-switch v0, :pswitch_data_1a

    new-instance v0, Lkxa;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lkxa;-><init>(Lgki;Lmt5;B)V

    iput-object p1, v0, Lkxa;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lkxa;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lkxa;-><init>(Lgki;Lmt5;B)V

    iput-object p1, v0, Lkxa;->u:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lkxa;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnsl;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lkxa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lkxa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lkxa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Ls5h;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lkxa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lkxa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lkxa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lkxa;->t:B

    iget-object v1, p0, Lkxa;->v:Lgki;

    iget-object p0, p0, Lkxa;->u:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_34

    check-cast p0, Lnsl;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    new-instance p1, Ljava/lang/Integer;

    invoke-direct {p1, p0}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_1d

    :cond_1c
    const/4 p1, 0x0

    :goto_1d
    const-string p0, "tool"

    invoke-virtual {v1, p1, p0}, Lgki;->b(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    check-cast p0, Ls5h;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    const-string p1, "properties"

    invoke-virtual {v1, p0, p1}, Lgki;->b(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method
