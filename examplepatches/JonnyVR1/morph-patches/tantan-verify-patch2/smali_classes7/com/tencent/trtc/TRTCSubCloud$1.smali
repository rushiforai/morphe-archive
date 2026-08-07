.class Lcom/tencent/trtc/TRTCSubCloud$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud;->destroy()V
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
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

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
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$000(Lcom/tencent/trtc/TRTCSubCloud;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$100(Lcom/tencent/trtc/TRTCSubCloud;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    const-wide/16 v3, 0x0

    .line 15
    .line 16
    cmp-long v1, v1, v3

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 21
    .line 22
    const-string v2, "destroy context"

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tencent/trtc/TRTCSubCloud;->access$200(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$300(Lcom/tencent/trtc/TRTCSubCloud;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v5

    .line 33
    invoke-static {v1, v5, v6}, Lcom/tencent/trtc/TRTCSubCloud;->access$400(Lcom/tencent/trtc/TRTCSubCloud;J)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 40
    .line 41
    invoke-static {v1, v3, v4}, Lcom/tencent/trtc/TRTCSubCloud;->access$502(Lcom/tencent/trtc/TRTCSubCloud;J)J

    .line 42
    .line 43
    .line 44
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$602(Lcom/tencent/trtc/TRTCSubCloud;Lcom/tencent/trtc/TRTCCloudListener;)Lcom/tencent/trtc/TRTCCloudListener;

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$702(Lcom/tencent/trtc/TRTCSubCloud;Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$800(Lcom/tencent/trtc/TRTCSubCloud;)Ljava/util/HashMap;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$900(Lcom/tencent/trtc/TRTCSubCloud;)Ljava/util/ArrayList;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/tencent/liteav/audio/a;->a()Lcom/tencent/liteav/audio/a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud$1;->a:Lcom/tencent/trtc/TRTCSubCloud;

    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/audio/a;->a(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    throw p0
.end method
