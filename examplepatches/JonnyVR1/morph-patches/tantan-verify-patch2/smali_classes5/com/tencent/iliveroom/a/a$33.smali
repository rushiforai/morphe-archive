.class Lcom/tencent/iliveroom/a/a$33;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->clearLocalMixConfig()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$33;->a:Lcom/tencent/iliveroom/a/a;

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
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    const-string v1, "clear local mix config"

    .line 3
    .line 4
    const-string v2, ""

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-static {v0, v1, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$33;->a:Lcom/tencent/iliveroom/a/a;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v4, p0, Lcom/tencent/iliveroom/a/a$33;->a:Lcom/tencent/iliveroom/a/a;

    .line 18
    .line 19
    iget-wide v4, v4, Lcom/tencent/iliveroom/a/a;->i:J

    .line 20
    .line 21
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-static {v0, v1, v3, v3, v2}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$33;->a:Lcom/tencent/iliveroom/a/a;

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$33;->a:Lcom/tencent/iliveroom/a/a;

    .line 41
    .line 42
    iput-object v2, p0, Lcom/tencent/iliveroom/a/a;->j:Lcom/tencent/iliveroom/a/a/d;

    .line 43
    .line 44
    const-wide/16 v0, -0x1

    .line 45
    .line 46
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 47
    .line 48
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->k:Lcom/tencent/iliveroom/a/c/a;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/c/a;->b()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
