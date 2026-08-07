.class public Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils$MmlThreadFactory;,
        Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils$MmlRejectedExecutionHandler;
    }
.end annotation


# static fields
.field static a:Ll/k510;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Ll/k510;

    .line 2
    .line 3
    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v8, Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils$MmlThreadFactory;

    .line 9
    .line 10
    const-string v1, "live-media-normal"

    .line 11
    .line 12
    invoke-direct {v8, v1}, Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils$MmlThreadFactory;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance v9, Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils$MmlRejectedExecutionHandler;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {v9, v1}, Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils$MmlRejectedExecutionHandler;-><init>(Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils$1;)V

    .line 19
    .line 20
    .line 21
    const-string v1, "live-media-normal"

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    const/4 v3, 0x2

    .line 25
    const-wide/16 v4, 0x7530

    .line 26
    .line 27
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 28
    .line 29
    invoke-direct/range {v0 .. v9}, Ll/k510;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Ltv/danmaku/ijk/media/util/netspeedutil/MediaThreadUtils;->a:Ll/k510;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
