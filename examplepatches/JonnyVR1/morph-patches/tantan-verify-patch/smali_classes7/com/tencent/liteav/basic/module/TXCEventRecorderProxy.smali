.class public Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:J


# direct methods
.method public static a(Ljava/lang/String;IJJLjava/lang/String;I)V
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p6, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static/range {p0 .. p7}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->nativeAddEventMsg(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    :cond_1
    :goto_0
    return-void
.end method

.method private static native nativeAddEventMsg(Ljava/lang/String;IJJLjava/lang/String;I)V
.end method

.method private static native nativeRelease(J)V
.end method


# virtual methods
.method public finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->nativeRelease(J)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a:J

    .line 9
    .line 10
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
