.class Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

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
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$500(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$600(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$200(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Lcom/ss/bytertc/base/media/VideoSink;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$300(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Z

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
    iget-object v2, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$700(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    sub-long/2addr v0, v2

    .line 44
    iget-object v2, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 45
    .line 46
    invoke-static {v2}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$500(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)I

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
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$302(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Z)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$800(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$500(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    int-to-long v0, v0

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    iget-object v4, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 78
    .line 79
    invoke-static {v4}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$700(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    sub-long/2addr v2, v4

    .line 84
    sub-long/2addr v0, v2

    .line 85
    iget-object v2, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 86
    .line 87
    invoke-static {v2}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$600(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)Landroid/os/Handler;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    const-wide/16 v3, 0x0

    .line 92
    .line 93
    cmp-long v3, v0, v3

    .line 94
    .line 95
    if-ltz v3, :cond_1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/SurfaceTextureHelper$3;->this$0:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 99
    .line 100
    invoke-static {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->access$500(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    int-to-long v0, v0

    .line 105
    :goto_0
    invoke-virtual {v2, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void
.end method
