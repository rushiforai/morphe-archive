.class public final Lj8p;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lp8p;


# direct methods
.method public synthetic constructor <init>(Lp8p;B)V
    .registers 3

    iput-byte p2, p0, Lj8p;->i:B

    iput-object p1, p0, Lj8p;->j:Lp8p;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lj8p;->i:B

    iget-object p0, p0, Lj8p;->j:Lp8p;

    packed-switch v0, :pswitch_data_5a

    new-instance v0, Ld7p;

    invoke-direct {v0, p0}, Ld7p;-><init>(Lp8p;)V

    return-object v0

    :pswitch_d
    sget-object v0, Lp8p;->e:Lcrb;

    :try_start_f
    sget-object v1, Lt0i;->b:Lp0i;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lp8p;->Companion:Lk8p;

    invoke-virtual {v1}, Lk8p;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object v1
    :try_end_1e
    .catchall {:try_start_f .. :try_end_1e} :catchall_1f

    goto :goto_28

    :catchall_1f
    move-exception v1

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v1, v2

    :goto_28
    invoke-static {v1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_53

    :try_start_2e
    instance-of v1, v2, Lo2j;

    if-eqz v1, :cond_4a

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    invoke-static {v1}, Lzwg;->r(Litb;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    if-eqz v2, :cond_45

    invoke-virtual {v0, p0, v2}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object v1

    goto :goto_53

    :cond_45
    invoke-static {v1}, Lwxe;->Y(Litb;)V

    const/4 p0, 0x0

    throw p0

    :cond_4a
    throw v2
    :try_end_4b
    .catchall {:try_start_2e .. :try_end_4b} :catchall_4b

    :catchall_4b
    move-exception p0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_53
    :goto_53
    new-instance p0, Lt0i;

    invoke-direct {p0, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p0

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
