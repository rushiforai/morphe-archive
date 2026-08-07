.class Lcom/bytedance/realx/video/SurfaceTextureHelper$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/SurfaceTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

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
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$400(Lcom/bytedance/realx/video/SurfaceTextureHelper;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$500(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$200(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Lcom/bytedance/realx/video/VideoSink;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$300(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iget-object v2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$600(Lcom/bytedance/realx/video/SurfaceTextureHelper;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    sub-long/2addr v0, v2

    .line 44
    iget-object v2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 45
    .line 46
    invoke-static {v2}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$400(Lcom/bytedance/realx/video/SurfaceTextureHelper;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    int-to-long v2, v2

    .line 51
    cmp-long v0, v0, v2

    .line 52
    .line 53
    if-ltz v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$302(Lcom/bytedance/realx/video/SurfaceTextureHelper;Z)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$700(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_0

    .line 68
    .line 69
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$800(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$400(Lcom/bytedance/realx/video/SurfaceTextureHelper;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    int-to-long v0, v0

    .line 81
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    iget-object v4, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 86
    .line 87
    invoke-static {v4}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$600(Lcom/bytedance/realx/video/SurfaceTextureHelper;)J

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    sub-long/2addr v2, v4

    .line 92
    sub-long/2addr v0, v2

    .line 93
    iget-object v2, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 94
    .line 95
    invoke-static {v2}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$500(Lcom/bytedance/realx/video/SurfaceTextureHelper;)Landroid/os/Handler;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    const-wide/16 v3, 0x0

    .line 100
    .line 101
    cmp-long v3, v0, v3

    .line 102
    .line 103
    if-ltz v3, :cond_1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceTextureHelper$3;->this$0:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->access$400(Lcom/bytedance/realx/video/SurfaceTextureHelper;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    int-to-long v0, v0

    .line 113
    :goto_0
    invoke-virtual {v2, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 114
    .line 115
    .line 116
    :cond_2
    return-void
.end method
