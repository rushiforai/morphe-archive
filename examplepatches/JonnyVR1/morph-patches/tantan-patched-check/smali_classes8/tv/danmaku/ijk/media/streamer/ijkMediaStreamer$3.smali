.class Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->startMonitor()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$3;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    const-string v0, "ijkMediaStreamer"

    .line 2
    .line 3
    const-string v1, "MonitorTask:too long not data receive notify user"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$3;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 9
    .line 10
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->mOnErrorListener:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/16 v1, 0x12c

    .line 15
    .line 16
    const/16 v2, 0xc

    .line 17
    .line 18
    invoke-interface {v0, p0, v1, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnErrorListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
