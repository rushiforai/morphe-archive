.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

.field final synthetic val$surface:[Landroid/view/Surface;

.field final synthetic val$surfaceSize:Lcom/tencent/liteav/basic/util/d;

.field final synthetic val$surfaceView:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;Landroid/view/SurfaceView;[Landroid/view/Surface;Lcom/tencent/liteav/basic/util/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceView:Landroid/view/SurfaceView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surface:[Landroid/view/Surface;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceSize:Lcom/tencent/liteav/basic/util/d;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceView:Landroid/view/SurfaceView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/Surface;->isValid()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget-object v1, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 36
    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "startLocalPreview with valid surface "

    .line 40
    .line 41
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v3, " width "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceView:Landroid/view/SurfaceView;

    .line 57
    .line 58
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v3, ", height "

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceView:Landroid/view/SurfaceView;

    .line 71
    .line 72
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surface:[Landroid/view/Surface;

    .line 87
    .line 88
    const/4 v2, 0x0

    .line 89
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    aput-object v0, v1, v2

    .line 94
    .line 95
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceSize:Lcom/tencent/liteav/basic/util/d;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceView:Landroid/view/SurfaceView;

    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iput v1, v0, Lcom/tencent/liteav/basic/util/d;->a:I

    .line 104
    .line 105
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceSize:Lcom/tencent/liteav/basic/util/d;

    .line 106
    .line 107
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->val$surfaceView:Landroid/view/SurfaceView;

    .line 108
    .line 109
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    iput v1, v0, Lcom/tencent/liteav/basic/util/d;->b:I

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_0
    iget-object v0, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 117
    .line 118
    const-string v1, "startLocalPreview with surfaceView add callback"

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

    .line 124
    .line 125
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 126
    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 130
    .line 131
    iget v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDebugType:I

    .line 132
    .line 133
    invoke-virtual {v1, v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->showVideoDebugLog(I)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;

    .line 137
    .line 138
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 139
    .line 140
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 143
    .line 144
    if-eqz v0, :cond_2

    .line 145
    .line 146
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$15;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 147
    .line 148
    iget v1, v0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->leftMargin:F

    .line 149
    .line 150
    iget v2, v0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->rightMargin:F

    .line 151
    .line 152
    iget v3, v0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->topMargin:F

    .line 153
    .line 154
    iget v0, v0, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->bottomMargin:F

    .line 155
    .line 156
    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogMarginRatio(FFFF)V

    .line 157
    .line 158
    .line 159
    :cond_2
    return-void
.end method
