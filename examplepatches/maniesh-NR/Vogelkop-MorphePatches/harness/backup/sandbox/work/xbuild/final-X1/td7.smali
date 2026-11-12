.class public final synthetic Ltd7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbg1;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltd7;->a:B

    iput-object p1, p0, Ltd7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 10

    iget-byte v0, p0, Ltd7;->a:B

    iget-object p0, p0, Ltd7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2a

    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lmlf;

    const-string v6, "maybeScheduleReport(Landroid/content/SharedPreferences;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Lmlf;

    const-string v5, "maybeScheduleReport"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_18
    new-instance v2, Lnr9;

    move-object v4, p0

    check-cast v4, Lwd7;

    const-string v7, "onPrefsLoaded(Landroid/content/SharedPreferences;)V"

    const/4 v8, 0x0

    const/4 v3, 0x1

    const-class v5, Lwd7;

    const-string v6, "onPrefsLoaded"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Ltd7;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_34

    instance-of v0, p1, Lbg1;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lbg1;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Ltd7;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Ltd7;->a:B

    packed-switch v0, :pswitch_data_a6

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p0, p0, Ltd7;->b:Ljava/lang/Object;

    check-cast p0, Lmlf;

    iget-object v0, p0, Lmlf;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_e
    invoke-static {p1}, Lmlf;->d(Landroid/content/SharedPreferences;)Ljava/util/LinkedHashMap;

    move-result-object p1
    :try_end_12
    .catchall {:try_start_e .. :try_end_12} :catchall_64

    monitor-exit v0

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_63

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_21
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_63

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const-string v2, "stop_event_"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_21

    if-lez v0, :cond_21

    iget-object p1, p0, Lmlf;->b:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 v1, 0xb

    invoke-direct {p1, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-wide v0, p0, Lmlf;->a:J

    invoke-virtual {p1, v0, v1}, Lplk;->q(J)V

    :cond_63
    return-void

    :catchall_64
    move-exception p0

    monitor-exit v0

    throw p0

    :pswitch_67
    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p0, p0, Ltd7;->b:Ljava/lang/Object;

    check-cast p0, Lwd7;

    new-instance v0, Lpqh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const-string v1, "id"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lpqh;->a:Ljava/lang/Object;

    if-nez v3, :cond_95

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lpqh;->a:Ljava/lang/Object;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v3, v0, Lpqh;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-interface {p1, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_95
    iget-object p1, p0, Lwd7;->b:Lumi;

    new-instance v1, Lfh4;

    const/16 v3, 0x1d

    invoke-direct {v1, p0, v0, v3}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v2}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_67
    .end packed-switch
.end method
