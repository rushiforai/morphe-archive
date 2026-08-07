.class Lcom/tencent/trtc/TRTCSubCloud$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud;->exitRoom()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/trtc/TRTCSubCloud;


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$3;->a:Lcom/tencent/trtc/TRTCSubCloud;

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
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "exitRoom "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$3;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$5000(Lcom/tencent/trtc/TRTCSubCloud;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getRoomId()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ", "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$3;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$3;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 40
    .line 41
    invoke-static {v1, v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$5100(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    const/4 v3, 0x1

    .line 48
    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud$3;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 52
    .line 53
    const-string v0, "call from api"

    .line 54
    .line 55
    invoke-virtual {p0, v3, v0}, Lcom/tencent/trtc/TRTCSubCloud;->exitRoomInternal(ZLjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
