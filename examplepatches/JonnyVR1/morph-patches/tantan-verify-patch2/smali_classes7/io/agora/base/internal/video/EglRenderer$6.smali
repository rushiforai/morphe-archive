.class Lio/agora/base/internal/video/EglRenderer$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/EglRenderer;->release()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/EglRenderer;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglRenderer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 193
    invoke-virtual {p0}, Lio/agora/base/internal/video/EglRenderer$6;->call()Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public call()Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    const-string v1, "release egl and gl resources on render thread"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 9
    .line 10
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$100(Lio/agora/base/internal/video/EglRenderer;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 17
    .line 18
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 25
    .line 26
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->hasSurface()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 37
    .line 38
    const-string v1, "egl context not attached, make current to release gl resource"

    .line 39
    .line 40
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 44
    .line 45
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->createDummyPbufferSurface()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 53
    .line 54
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->makeCurrent()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$102(Lio/agora/base/internal/video/EglRenderer;Z)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception v0

    .line 69
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 70
    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v3, "failed to make current: "

    .line 74
    .line 75
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v1, v0}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_0
    :goto_0
    sget-object v0, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 89
    .line 90
    monitor-enter v0

    .line 91
    const/4 v1, 0x0

    .line 92
    :try_start_1
    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 93
    .line 94
    .line 95
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 97
    .line 98
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1700(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/RendererCommon$GlDrawer;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const/4 v2, 0x0

    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 106
    .line 107
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1700(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/RendererCommon$GlDrawer;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-interface {v0}, Lio/agora/base/internal/video/RendererCommon$GlDrawer;->release()V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 115
    .line 116
    invoke-static {v0, v2}, Lio/agora/base/internal/video/EglRenderer;->access$1702(Lio/agora/base/internal/video/EglRenderer;Lio/agora/base/internal/video/RendererCommon$GlDrawer;)Lio/agora/base/internal/video/RendererCommon$GlDrawer;

    .line 117
    .line 118
    .line 119
    :cond_1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 120
    .line 121
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1800(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/VideoFrameDrawer;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lio/agora/base/internal/video/VideoFrameDrawer;->release()V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 129
    .line 130
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1900(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->release()V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 138
    .line 139
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    if-eqz v0, :cond_2

    .line 144
    .line 145
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 146
    .line 147
    const-string v3, "eglBase detach and release."

    .line 148
    .line 149
    invoke-static {v0, v3}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 153
    .line 154
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->detachCurrent()V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 162
    .line 163
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$102(Lio/agora/base/internal/video/EglRenderer;Z)Z

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 167
    .line 168
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$000(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/EglBase;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->release()V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 176
    .line 177
    invoke-static {v0, v2}, Lio/agora/base/internal/video/EglRenderer;->access$002(Lio/agora/base/internal/video/EglRenderer;Lio/agora/base/internal/video/EglBase;)Lio/agora/base/internal/video/EglBase;

    .line 178
    .line 179
    .line 180
    :cond_2
    iget-object p0, p0, Lio/agora/base/internal/video/EglRenderer$6;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 181
    .line 182
    invoke-static {p0}, Lio/agora/base/internal/video/EglRenderer;->access$2000(Lio/agora/base/internal/video/EglRenderer;)Ljava/util/ArrayList;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 187
    .line 188
    .line 189
    return-object v2

    .line 190
    :catchall_0
    move-exception p0

    .line 191
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 192
    throw p0
.end method
