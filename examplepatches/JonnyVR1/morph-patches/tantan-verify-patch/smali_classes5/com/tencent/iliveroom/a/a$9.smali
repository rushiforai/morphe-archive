.class Lcom/tencent/iliveroom/a/a$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setVideoRenderDelegate(JLcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;JLcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$9;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a$9;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/iliveroom/a/a$9;->b:Lcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$9;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->m(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$9;->a:J

    .line 8
    .line 9
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a$9;->b:Lcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;

    .line 14
    .line 15
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$9;->c:Lcom/tencent/iliveroom/a/a;

    .line 19
    .line 20
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$9;->a:J

    .line 21
    .line 22
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x2

    .line 27
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$9;->c:Lcom/tencent/iliveroom/a/a;

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-static {v0, v1, v3, v2, p0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I

    .line 31
    .line 32
    .line 33
    return-void
.end method
