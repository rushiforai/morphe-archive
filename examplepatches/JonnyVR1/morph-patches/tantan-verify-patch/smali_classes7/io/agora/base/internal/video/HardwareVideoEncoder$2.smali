.class Lio/agora/base/internal/video/HardwareVideoEncoder$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/HardwareVideoEncoder;->initEncodeInternal()Lio/agora/base/internal/video/VideoCodecStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/internal/video/VideoCodecStatus;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

.field final synthetic val$copyLevelId:Ljava/lang/String;

.field final synthetic val$format:Landroid/media/MediaFormat;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/HardwareVideoEncoder;Landroid/media/MediaFormat;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->val$format:Landroid/media/MediaFormat;

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->val$copyLevelId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "HardwareVideoEncoder"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 4
    .line 5
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->val$format:Landroid/media/MediaFormat;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    invoke-interface {v1, v2, v4, v4, v3}, Lio/agora/base/internal/video/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 17
    .line 18
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 25
    .line 26
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase$Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    instance-of v1, v1, Lio/agora/base/internal/video/EglBase10$Context;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const-string v1, "Encoders will use EglBase10"

    .line 35
    .line 36
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 40
    .line 41
    new-instance v2, Lio/agora/base/internal/video/EglBase10;

    .line 42
    .line 43
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase$Context;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lio/agora/base/internal/video/EglBase10$Context;

    .line 48
    .line 49
    sget-object v4, Lio/agora/base/internal/video/EglBase;->CONFIG_RECORDABLE:[I

    .line 50
    .line 51
    invoke-direct {v2, v3, v4}, Lio/agora/base/internal/video/EglBase10;-><init>(Lio/agora/base/internal/video/EglBase10$Context;[I)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$602(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/EglBase;)Lio/agora/base/internal/video/EglBase;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v1

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    const-string v1, "Encoders will use EglBase14"

    .line 61
    .line 62
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 66
    .line 67
    new-instance v2, Lio/agora/base/internal/video/EglBase14;

    .line 68
    .line 69
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 70
    .line 71
    invoke-static {v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase$Context;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Lio/agora/base/internal/video/EglBase14$Context;

    .line 76
    .line 77
    sget-object v4, Lio/agora/base/internal/video/EglBase;->CONFIG_RECORDABLE:[I

    .line 78
    .line 79
    invoke-direct {v2, v3, v4}, Lio/agora/base/internal/video/EglBase14;-><init>(Lio/agora/base/internal/video/EglBase14$Context;[I)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$602(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/internal/video/EglBase;)Lio/agora/base/internal/video/EglBase;

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 86
    .line 87
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-interface {v2}, Lio/agora/base/internal/video/MediaCodecWrapper;->createInputSurface()Landroid/view/Surface;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v1, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$702(Lio/agora/base/internal/video/HardwareVideoEncoder;Landroid/view/Surface;)Landroid/view/Surface;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 99
    .line 100
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 105
    .line 106
    invoke-static {v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Landroid/view/Surface;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-interface {v1, v2}, Lio/agora/base/internal/video/EglBase;->createSurface(Landroid/view/Surface;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 114
    .line 115
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$600(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/EglBase;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-interface {v1}, Lio/agora/base/internal/video/EglBase;->makeCurrent()V

    .line 120
    .line 121
    .line 122
    :cond_1
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 123
    .line 124
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-interface {v1}, Lio/agora/base/internal/video/MediaCodecWrapper;->start()V

    .line 129
    .line 130
    .line 131
    const-string v1, "media encoder started"

    .line 132
    .line 133
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    .line 135
    .line 136
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->OK:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 137
    .line 138
    return-object p0

    .line 139
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v3, "initEncodeInternal failed. "

    .line 142
    .line 143
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v0, v2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 161
    .line 162
    invoke-virtual {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->release()Lio/agora/base/internal/video/VideoCodecStatus;

    .line 163
    .line 164
    .line 165
    instance-of v0, v1, Ljava/lang/RuntimeException;

    .line 166
    .line 167
    if-eqz v0, :cond_2

    .line 168
    .line 169
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->val$copyLevelId:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-nez p0, :cond_2

    .line 176
    .line 177
    check-cast v1, Ljava/lang/RuntimeException;

    .line 178
    .line 179
    invoke-static {v1}, Lio/agora/base/internal/video/MediaCodecUtils;->isMediaCodecException(Ljava/lang/RuntimeException;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    sget-object v0, Lio/agora/base/internal/video/VideoCodecStatus;->ERROR:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 184
    .line 185
    if-ne p0, v0, :cond_2

    .line 186
    .line 187
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_DEFAULT_PROFILE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 188
    .line 189
    return-object p0

    .line 190
    :cond_2
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 191
    .line 192
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 193
    invoke-virtual {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder$2;->call()Lio/agora/base/internal/video/VideoCodecStatus;

    move-result-object p0

    return-object p0
.end method
