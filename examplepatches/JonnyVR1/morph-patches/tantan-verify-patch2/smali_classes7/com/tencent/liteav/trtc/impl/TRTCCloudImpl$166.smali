.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRenderView(Ljava/lang/String;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

.field final synthetic val$renderInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

.field final synthetic val$userId:Ljava/lang/String;

.field final synthetic val$videoRender:Lcom/tencent/liteav/renderer/e;

.field final synthetic val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;Lcom/tencent/liteav/renderer/e;Ljava/lang/String;Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$renderInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$videoRender:Lcom/tencent/liteav/renderer/e;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$userId:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->getSurfaceView()Landroid/view/SurfaceView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$renderInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 18
    .line 19
    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$renderInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 23
    .line 24
    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Landroid/view/Surface;->isValid()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 40
    .line 41
    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    filled-new-array {v4, v5, v6}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    const-string v5, "startRemoteView with valid surface %s, width: %d, height: %d"

    .line 66
    .line 67
    invoke-static {v2, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v3, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$videoRender:Lcom/tencent/liteav/renderer/e;

    .line 75
    .line 76
    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v2, v1}, Lcom/tencent/liteav/renderer/e;->a(Landroid/view/Surface;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$videoRender:Lcom/tencent/liteav/renderer/e;

    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p0, v1, v0}, Lcom/tencent/liteav/renderer/e;->c(II)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v1, "startRemoteView with surfaceView add callback "

    .line 100
    .line 101
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$renderInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 105
    .line 106
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v3, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    new-instance v0, Landroid/view/TextureView;

    .line 118
    .line 119
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 120
    .line 121
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-direct {v0, v2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 126
    .line 127
    .line 128
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 129
    .line 130
    invoke-virtual {v2, v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->addVideoView(Landroid/view/TextureView;)V

    .line 131
    .line 132
    .line 133
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 134
    .line 135
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 139
    .line 140
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$userId:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setUserId(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 146
    .line 147
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 148
    .line 149
    iget v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mDebugType:I

    .line 150
    .line 151
    invoke-virtual {v1, v2}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->showVideoDebugLog(I)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$debugMargin:Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;

    .line 155
    .line 156
    if-eqz v1, :cond_2

    .line 157
    .line 158
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$view:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 159
    .line 160
    iget v3, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->leftMargin:F

    .line 161
    .line 162
    iget v4, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->rightMargin:F

    .line 163
    .line 164
    iget v5, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->topMargin:F

    .line 165
    .line 166
    iget v1, v1, Lcom/tencent/trtc/TRTCCloud$TRTCViewMargin;->bottomMargin:F

    .line 167
    .line 168
    invoke-virtual {v2, v3, v4, v5, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogMarginRatio(FFFF)V

    .line 169
    .line 170
    .line 171
    :cond_2
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$166;->val$videoRender:Lcom/tencent/liteav/renderer/e;

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/e;->a(Landroid/view/TextureView;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method
