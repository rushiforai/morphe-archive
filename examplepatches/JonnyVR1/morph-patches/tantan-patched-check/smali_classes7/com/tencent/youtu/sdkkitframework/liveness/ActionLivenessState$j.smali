.class public Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/youtu/ytposedetect/YTPoseDetectInterface$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 157
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "pose state "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    .line 158
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "YTPoseDetectInterface.poseDetect.onFailed: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " s: "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ActionLivenessState"

    invoke-static {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 159
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 160
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->j:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->j:I

    return-void
.end method

.method public a([BIII)Z
    .locals 12

    .line 1
    move v3, p3

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 3
    .line 4
    const-string v4, "codec info: rotatedWith: "

    .line 5
    .line 6
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    const-string v4, "rotatedHeight: "

    .line 13
    .line 14
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v4, " bitrate: "

    .line 21
    .line 22
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 26
    .line 27
    iget v4, v4, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->r:I

    .line 28
    .line 29
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, " framerate"

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 38
    .line 39
    iget v4, v4, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->s:I

    .line 40
    .line 41
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v4, " iframeinterval"

    .line 45
    .line 46
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 50
    .line 51
    iget v4, v4, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->t:I

    .line 52
    .line 53
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const-string v4, "ActionLivenessState"

    .line 61
    .line 62
    invoke-static {v4, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 66
    .line 67
    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 68
    .line 69
    iget-boolean v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->i:Z

    .line 70
    .line 71
    const/4 v9, 0x0

    .line 72
    const-string v10, "p"

    .line 73
    .line 74
    const/4 v11, 0x1

    .line 75
    if-nez v5, :cond_1

    .line 76
    .line 77
    iget v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->R:I

    .line 78
    .line 79
    iput-boolean v11, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->i:Z

    .line 80
    .line 81
    iget-boolean v1, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->j:Z

    .line 82
    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    iget-object v1, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->isEncodingStarted()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_1

    .line 92
    .line 93
    :try_start_0
    iget-object v1, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 94
    .line 95
    new-instance v5, Ljava/io/File;

    .line 96
    .line 97
    iget-object v6, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->b:Ljava/lang/String;

    .line 98
    .line 99
    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    move-object v6, v5

    .line 103
    iget v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->c:I

    .line 104
    .line 105
    move-object v7, v6

    .line 106
    iget v6, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->d:I

    .line 107
    .line 108
    iget v4, v4, Lcom/tencent/youtu/sdkkitframework/liveness/p;->e:I

    .line 109
    .line 110
    move-object v2, v7

    .line 111
    move v7, v4

    .line 112
    move-object v4, v2

    .line 113
    move v2, p2

    .line 114
    invoke-virtual/range {v1 .. v8}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->startEncoding(IILjava/io/File;IIII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :catch_0
    :cond_0
    const-string v0, "sunny-start video encode error"

    .line 119
    .line 120
    const/4 v1, 0x0

    .line 121
    invoke-static {v10, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 122
    .line 123
    .line 124
    return v9

    .line 125
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->m:Lcom/tencent/youtu/sdkkitframework/liveness/p;

    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    :try_start_1
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 133
    .line 134
    invoke-direct {v1, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;-><init>([BII)V

    .line 135
    .line 136
    .line 137
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 138
    .line 139
    invoke-virtual {v2, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->queueFrame(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;)V

    .line 140
    .line 141
    .line 142
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->a:Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;

    .line 143
    .line 144
    iget v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/p;->d:I

    .line 145
    .line 146
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtVideoEncoder;->encode(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 147
    .line 148
    .line 149
    return v11

    .line 150
    :catch_1
    move-exception v0

    .line 151
    const-string v1, "encode frame error:"

    .line 152
    .line 153
    invoke-static {v10, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 154
    .line 155
    .line 156
    return v9
.end method
