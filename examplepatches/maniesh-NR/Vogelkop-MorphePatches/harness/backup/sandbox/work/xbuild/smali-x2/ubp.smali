.class public final Lubp;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Ljava/io/File;

.field public final synthetic w:Lylp;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Lylp;Lmt5;B)V
    .registers 5

    iput-byte p4, p0, Lubp;->t:B

    iput-object p1, p0, Lubp;->v:Ljava/io/File;

    iput-object p2, p0, Lubp;->w:Lylp;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte p1, p0, Lubp;->t:B

    packed-switch p1, :pswitch_data_1c

    new-instance p1, Lubp;

    iget-object v0, p0, Lubp;->w:Lylp;

    const/4 v1, 0x1

    iget-object p0, p0, Lubp;->v:Ljava/io/File;

    invoke-direct {p1, p0, v0, p2, v1}, Lubp;-><init>(Ljava/io/File;Lylp;Lmt5;B)V

    return-object p1

    :pswitch_10
    new-instance p1, Lubp;

    iget-object v0, p0, Lubp;->w:Lylp;

    const/4 v1, 0x0

    iget-object p0, p0, Lubp;->v:Ljava/io/File;

    invoke-direct {p1, p0, v0, p2, v1}, Lubp;-><init>(Ljava/io/File;Lylp;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lubp;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lubp;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lubp;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lubp;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lubp;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lubp;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lubp;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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

    iget-byte v0, p0, Lubp;->t:B

    iget-object v1, p0, Lubp;->w:Lylp;

    iget-object v2, p0, Lubp;->v:Ljava/io/File;

    const/4 v3, 0x0

    const-string v4, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_68

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lubp;->u:Z

    if-eqz v6, :cond_1d

    if-ne v6, v5, :cond_19

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_37

    :cond_19
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_39

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Ljava/io/File;

    invoke-virtual {v1}, Lylp;->e()Lyjo;

    move-result-object v1

    iget-object v1, v1, Lyjo;->c:Ljava/io/File;

    const-string v3, "omsdk-session-client.js"

    invoke-direct {p1, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-boolean v5, p0, Lubp;->u:Z

    invoke-static {v2, p1, p0}, Lz7h;->c(Ljava/io/File;Ljava/io/File;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_37

    move-object v3, v0

    goto :goto_39

    :cond_37
    :goto_37
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_39
    return-object v3

    :pswitch_3a
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lubp;->u:Z

    if-eqz v6, :cond_4a

    if-ne v6, v5, :cond_46

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_64

    :cond_46
    invoke-static {v4}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_66

    :cond_4a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Ljava/io/File;

    invoke-virtual {v1}, Lylp;->e()Lyjo;

    move-result-object v1

    iget-object v1, v1, Lyjo;->c:Ljava/io/File;

    const-string v3, "omsdk.js"

    invoke-direct {p1, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-boolean v5, p0, Lubp;->u:Z

    invoke-static {v2, p1, p0}, Lz7h;->c(Ljava/io/File;Ljava/io/File;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_64

    move-object v3, v0

    goto :goto_66

    :cond_64
    :goto_64
    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_66
    return-object v3

    nop

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
