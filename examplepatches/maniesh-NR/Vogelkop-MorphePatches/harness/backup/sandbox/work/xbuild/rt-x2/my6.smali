.class public final Lmy6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lmy6;->t:B

    iput-object p1, p0, Lmy6;->v:Ljava/util/List;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lmy6;->t:B

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Lmy6;

    iget-object p0, p0, Lmy6;->v:Ljava/util/List;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lmy6;-><init>(Ljava/util/List;Lmt5;B)V

    iput-object p1, v0, Lmy6;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lmy6;

    iget-object p0, p0, Lmy6;->v:Ljava/util/List;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lmy6;-><init>(Ljava/util/List;Lmt5;B)V

    iput-object p1, v0, Lmy6;->u:Ljava/lang/Object;

    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lmy6;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lmy6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lmy6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lmy6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lfon;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lmy6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lmy6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lmy6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lmy6;->t:B

    iget-object v1, p0, Lmy6;->v:Ljava/util/List;

    packed-switch v0, :pswitch_data_6a

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Lmy6;->u:Ljava/lang/Object;

    check-cast p0, Lnx5;

    :try_start_10
    sget-object p0, Lt0i;->b:Lp0i;

    if-eqz v1, :cond_2e

    sget-object p0, Ljko;->a:Ljava/util/TreeSet;

    invoke-static {}, Lfcp;->d()Lrpb;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lk72;

    sget-object v0, Ltxo;->Companion:Lawo;

    invoke-virtual {v0}, Lawo;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v2, 0x0

    invoke-direct {p1, v0, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {p0, v1, p1}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p0
    :try_end_2d
    .catchall {:try_start_10 .. :try_end_2d} :catchall_30

    goto :goto_39

    :cond_2e
    const/4 p0, 0x0

    goto :goto_39

    :catchall_30
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_39
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1

    :pswitch_3f
    iget-object p0, p0, Lmy6;->u:Ljava/lang/Object;

    check-cast p0, Lfon;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lgv9;->toBuilder()Lgv9$a;

    move-result-object p0

    check-cast p0, Leon;

    invoke-virtual {p0}, Lgv9$a;->copyOnWrite()V

    iget-object p1, p0, Lgv9$a;->instance:Lgv9;

    check-cast p1, Lfon;

    invoke-virtual {p1}, Lfon;->c()V

    check-cast v1, Ljava/lang/Iterable;

    invoke-virtual {p0}, Lgv9$a;->copyOnWrite()V

    iget-object p1, p0, Lgv9$a;->instance:Lgv9;

    check-cast p1, Lfon;

    invoke-virtual {p1, v1}, Lfon;->b(Ljava/lang/Iterable;)V

    invoke-virtual {p0}, Lgv9$a;->build()Lgv9;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_3f
    .end packed-switch
.end method
