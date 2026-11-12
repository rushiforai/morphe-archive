.class public final synthetic Lrlc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Lapc;


# direct methods
.method public synthetic constructor <init>(JLapc;B)V
    .registers 5

    iput-byte p4, p0, Lrlc;->a:B

    iput-wide p1, p0, Lrlc;->b:J

    iput-object p3, p0, Lrlc;->c:Lapc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Lrlc;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x1

    iget-object v3, p0, Lrlc;->c:Lapc;

    iget-wide v4, p0, Lrlc;->b:J

    check-cast p1, Losk;

    packed-switch v0, :pswitch_data_d6

    const-string p0, "SELECT * FROM notifications where oscoreId = ? AND sport = ? LIMIT 1"

    invoke-virtual {p1, p0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p0

    :try_start_13
    invoke-virtual {p0, v2, v4, v5}, Lwsk;->T0(IJ)V

    iget-boolean p1, v3, Lapc;->a:Z

    int-to-long v3, p1

    invoke-virtual {p0, v1, v3, v4}, Lwsk;->T0(IJ)V

    const-string p1, "oscoreId"

    invoke-static {p0, p1}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result p1

    const-string v0, "sport"

    invoke-static {p0, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v1, "ttlEndTimestamp"

    invoke-static {p0, v1}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v1

    const-string v3, "subscribed"

    invoke-static {p0, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0}, Lwsk;->n()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_90

    invoke-virtual {p0, p1}, Lwsk;->getLong(I)J

    move-result-wide v7

    invoke-virtual {p0, v0}, Lwsk;->getLong(I)J

    move-result-wide v9

    long-to-int p1, v9

    sget-object v0, Lapc;->b:Lix5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lapc;->f:Lh58;

    invoke-virtual {v0}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_61

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lapc;

    iget-boolean v6, v6, Lapc;->a:Z

    if-ne v6, p1, :cond_4f

    move-object v5, v4

    :cond_61
    move-object v9, v5

    check-cast v9, Lapc;

    if-eqz v9, :cond_7c

    invoke-virtual {p0, v1}, Lwsk;->getLong(I)J

    move-result-wide v10

    invoke-virtual {p0, v3}, Lwsk;->getLong(I)J

    move-result-wide v0

    long-to-int p1, v0

    if-eqz p1, :cond_73

    :goto_71
    move v12, v2

    goto :goto_75

    :cond_73
    const/4 v2, 0x0

    goto :goto_71

    :goto_75
    new-instance v6, Lr0f;

    invoke-direct/range {v6 .. v12}, Lr0f;-><init>(JLapc;JZ)V

    move-object v5, v6

    goto :goto_90

    :cond_7c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown sport id: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_90
    .catchall {:try_start_13 .. :try_end_90} :catchall_94

    :cond_90
    :goto_90
    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    return-object v5

    :catchall_94
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    throw p1

    :pswitch_9a
    const-string p0, "UPDATE notifications SET subscribed = 1 WHERE oscoreId = ? AND sport = ?"

    invoke-virtual {p1, p0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p0

    :try_start_a0
    invoke-virtual {p0, v2, v4, v5}, Lwsk;->T0(IJ)V

    iget-boolean p1, v3, Lapc;->a:Z

    int-to-long v2, p1

    invoke-virtual {p0, v1, v2, v3}, Lwsk;->T0(IJ)V

    invoke-virtual {p0}, Lwsk;->n()Z

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_ae
    .catchall {:try_start_a0 .. :try_end_ae} :catchall_b2

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    return-object p1

    :catchall_b2
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    throw p1

    :pswitch_b8
    const-string p0, "DELETE FROM notifications WHERE oscoreId = ? AND sport = ?"

    invoke-virtual {p1, p0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p0

    :try_start_be
    invoke-virtual {p0, v2, v4, v5}, Lwsk;->T0(IJ)V

    iget-boolean p1, v3, Lapc;->a:Z

    int-to-long v2, p1

    invoke-virtual {p0, v1, v2, v3}, Lwsk;->T0(IJ)V

    invoke-virtual {p0}, Lwsk;->n()Z

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_cc
    .catchall {:try_start_be .. :try_end_cc} :catchall_d0

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    return-object p1

    :catchall_d0
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    throw p1

    :pswitch_data_d6
    .packed-switch 0x0
        :pswitch_b8
        :pswitch_9a
    .end packed-switch
.end method
