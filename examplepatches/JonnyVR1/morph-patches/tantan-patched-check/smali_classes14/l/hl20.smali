.class public Ll/hl20;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/x1d0;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-class v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setThrowable(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public static b(Ll/x1d0;Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)Ll/x1d0;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/network/NetworkTrackInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setCreateTime(J)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestTimestamp(J)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setReportType(Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequest(Ll/x1d0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-class p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static c(Ll/x1d0;Ll/v4m;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            "Ll/v4m<",
            "Lcom/tantanapp/common/network/NetworkTrackInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-class v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setFinishTime(J)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/v4m;->a(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public static d(Ll/x1d0;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-class v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setCancel(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method
