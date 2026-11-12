.class public final synthetic Lyx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp17;
.implements Lswl;
.implements Lk37;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lami;Lxx;Lr9i;J)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lyx;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyx;->c:Ljava/lang/Object;

    iput-object p2, p0, Lyx;->d:Ljava/lang/Object;

    iput-object p3, p0, Lyx;->e:Ljava/lang/Object;

    iput-wide p4, p0, Lyx;->b:J

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;B)V
    .registers 7

    .line 16
    iput-byte p6, p0, Lyx;->a:B

    iput-object p1, p0, Lyx;->c:Ljava/lang/Object;

    iput-object p2, p0, Lyx;->d:Ljava/lang/Object;

    iput-wide p3, p0, Lyx;->b:J

    iput-object p5, p0, Lyx;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lle9;JLjava/lang/Object;Lvk2;B)V
    .registers 7

    .line 15
    iput-byte p6, p0, Lyx;->a:B

    iput-object p1, p0, Lyx;->c:Ljava/lang/Object;

    iput-wide p2, p0, Lyx;->b:J

    iput-object p4, p0, Lyx;->d:Ljava/lang/Object;

    iput-object p5, p0, Lyx;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a([Lmkg;)V
    .registers 10

    iget-object v0, p0, Lyx;->c:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v1, p0, Lyx;->d:Ljava/lang/Object;

    check-cast v1, Legd;

    iget-object v2, p0, Lyx;->e:Ljava/lang/Object;

    check-cast v2, Lpjg;

    iget-object v3, v0, Ltjg;->o:Lxbf;

    if-nez v3, :cond_11

    return-void

    :cond_11
    iget-object v3, v0, Ltjg;->k:Lokg;

    iget-object v3, v3, Lokg;->c:Llkg;

    invoke-interface {v3}, Llkg;->isEmpty()Z

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_30

    if-eqz v1, :cond_30

    move v3, v5

    :goto_20
    array-length v6, p1

    if-ge v3, v6, :cond_30

    aget-object v6, p1, v3

    iget-object v6, v6, Lmkg;->b:Legd;

    invoke-virtual {v1, v6}, Legd;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_31

    add-int/lit8 v3, v3, 0x1

    goto :goto_20

    :cond_30
    move v3, v4

    :cond_31
    if-eq v3, v4, :cond_40

    const/4 v1, 0x1

    iput-boolean v1, v0, Ltjg;->p:Z

    iget-object v1, v0, Ltjg;->k:Lokg;

    iget-wide v6, p0, Lyx;->b:J

    invoke-virtual {v1, p1, v3, v6, v7}, Lokg;->d([Lmkg;IJ)V

    iput-boolean v5, v0, Ltjg;->p:Z

    goto :goto_45

    :cond_40
    iget-object p0, v0, Ltjg;->k:Lokg;

    invoke-virtual {p0, v5, p1}, Lokg;->a(I[Lmkg;)V

    :goto_45
    invoke-virtual {v2}, Lpjg;->run()V

    return-void
.end method

.method public final b(Leq6;)Ljava/util/concurrent/ScheduledFuture;
    .registers 9

    iget-byte v0, p0, Lyx;->a:B

    iget-object v1, p0, Lyx;->e:Ljava/lang/Object;

    iget-wide v2, p0, Lyx;->b:J

    iget-object v4, p0, Lyx;->d:Ljava/lang/Object;

    iget-object p0, p0, Lyx;->c:Ljava/lang/Object;

    check-cast p0, Lo17;

    packed-switch v0, :pswitch_data_32

    check-cast v4, Ljava/util/concurrent/Callable;

    check-cast v1, Ljava/util/concurrent/TimeUnit;

    iget-object v0, p0, Lo17;->b:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v5, Ln17;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v4, p1, v6}, Ln17;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v5, v2, v3, v1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    return-object p0

    :pswitch_20
    check-cast v4, Ljava/lang/Runnable;

    check-cast v1, Ljava/util/concurrent/TimeUnit;

    iget-object v0, p0, Lo17;->b:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v5, Lm17;

    const/4 v6, 0x1

    invoke-direct {v5, p0, v4, p1, v6}, Lm17;-><init>(Lo17;Ljava/lang/Runnable;Leq6;B)V

    invoke-interface {v0, v5, v2, v3, v1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_20
    .end packed-switch
.end method

.method public final run()Lqwl;
    .registers 13

    iget-byte v0, p0, Lyx;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lyx;->e:Ljava/lang/Object;

    iget-object v3, p0, Lyx;->d:Ljava/lang/Object;

    iget-object v4, p0, Lyx;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_40

    move-object v9, v4

    check-cast v9, Lle9;

    move-object v10, v3

    check-cast v10, Lre9;

    move-object v8, v2

    check-cast v8, Lvk2;

    iget-object v0, v9, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_25

    new-instance v5, Lxd9;

    iget-wide v6, p0, Lyx;->b:J

    invoke-direct/range {v5 .. v11}, Lxd9;-><init>(JLvk2;Lle9;Lre9;Ljava/lang/String;)V

    move-object v1, v5

    :cond_25
    return-object v1

    :pswitch_26
    move-object v7, v4

    check-cast v7, Lle9;

    move-object v5, v3

    check-cast v5, Loi2;

    move-object v6, v2

    check-cast v6, Lvk2;

    iget-object v0, v7, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_3f

    new-instance v2, Lxd9;

    iget-wide v3, p0, Lyx;->b:J

    invoke-direct/range {v2 .. v8}, Lxd9;-><init>(JLoi2;Lvk2;Lle9;Ljava/lang/String;)V

    move-object v1, v2

    :cond_3f
    return-object v1

    :pswitch_data_40
    .packed-switch 0x3
        :pswitch_26
    .end packed-switch
.end method
