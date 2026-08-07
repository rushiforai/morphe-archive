.class public final Ll/g0w0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/ezv0;Ll/ksv0;Ljava/util/concurrent/ScheduledExecutorService;I)Ll/wuv0;
    .locals 3

    .line 1
    new-instance v0, Ll/ssv0;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move-object p0, p1

    .line 7
    :goto_0
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    invoke-direct {v0, p0, v1, v2, p2}, Ll/ssv0;-><init>(Ll/wuv0;JLjava/util/concurrent/ScheduledExecutorService;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static b(Ll/ozv0;Ljava/util/concurrent/ScheduledExecutorService;)Ll/wuv0;
    .locals 3

    .line 1
    new-instance v0, Ll/ssv0;

    .line 2
    .line 3
    sget-object v1, Ll/sgs0;->Z3:Ll/dgs0;

    .line 4
    .line 5
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/Long;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-direct {v0, p0, v1, v2, p1}, Ll/ssv0;-><init>(Ll/wuv0;JLjava/util/concurrent/ScheduledExecutorService;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public static c(Ll/p0w0;Ljava/util/concurrent/ScheduledExecutorService;)Ll/wuv0;
    .locals 3

    .line 1
    new-instance v0, Ll/ssv0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, p0, v1, v2, p1}, Ll/ssv0;-><init>(Ll/wuv0;JLjava/util/concurrent/ScheduledExecutorService;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
