.class Lcom/tencent/liteav/videoencoder/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/videoencoder/a;->start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

.field final synthetic b:Lcom/tencent/liteav/videoencoder/a;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/videoencoder/a;Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/a$1;->b:Lcom/tencent/liteav/videoencoder/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 4
    .line 5
    iget v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    .line 6
    .line 7
    const/4 v3, 0x3

    .line 8
    const/4 v4, 0x2

    .line 9
    const-string v5, "unknown"

    .line 10
    .line 11
    const/4 v6, 0x1

    .line 12
    if-eq v2, v6, :cond_2

    .line 13
    .line 14
    if-eq v2, v4, :cond_1

    .line 15
    .line 16
    if-eq v2, v3, :cond_0

    .line 17
    .line 18
    move-object v13, v5

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const-string v2, "CQ"

    .line 21
    .line 22
    :goto_0
    move-object v13, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    const-string v2, "VBR"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    const-string v2, "CBR"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :goto_1
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderProfile:I

    .line 31
    .line 32
    if-eq v1, v6, :cond_5

    .line 33
    .line 34
    if-eq v1, v4, :cond_4

    .line 35
    .line 36
    if-eq v1, v3, :cond_3

    .line 37
    .line 38
    :goto_2
    move-object v14, v5

    .line 39
    goto :goto_3

    .line 40
    :cond_3
    const-string v5, "High"

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_4
    const-string v5, "Main"

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_5
    const-string v5, "Baseline"

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :goto_3
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->b:Lcom/tencent/liteav/videoencoder/a;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 60
    .line 61
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 68
    .line 69
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 70
    .line 71
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 76
    .line 77
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 78
    .line 79
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v10

    .line 83
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 84
    .line 85
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bitrate:I

    .line 86
    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v11

    .line 91
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 92
    .line 93
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    .line 94
    .line 95
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v12

    .line 99
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 100
    .line 101
    iget-boolean v2, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->bMultiRef:Z

    .line 102
    .line 103
    if-eqz v2, :cond_6

    .line 104
    .line 105
    const-string v2, "true"

    .line 106
    .line 107
    :goto_4
    move-object v15, v2

    .line 108
    goto :goto_5

    .line 109
    :cond_6
    const-string v2, "false"

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :goto_5
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    .line 113
    .line 114
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v16

    .line 118
    filled-new-array/range {v7 .. v16}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    const-string v2, "VideoEncoder[%d]: Start [type:hardware][resolution:%d*%d][fps:%d][bitrate:%dkbps][gop:%d][rateControl:%s][profile:%s][rps:%s][streamType:%d]"

    .line 123
    .line 124
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    const-string v2, ""

    .line 129
    .line 130
    const/4 v3, 0x0

    .line 131
    invoke-static {v4, v1, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    const-string v2, "start:"

    .line 135
    .line 136
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    const-string v2, "TXCHWVideoEncoder"

    .line 141
    .line 142
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->b:Lcom/tencent/liteav/videoencoder/a;

    .line 146
    .line 147
    iget-boolean v2, v1, Lcom/tencent/liteav/videoencoder/c;->mInit:Z

    .line 148
    .line 149
    if-eqz v2, :cond_7

    .line 150
    .line 151
    invoke-static {v1}, Lcom/tencent/liteav/videoencoder/a;->a(Lcom/tencent/liteav/videoencoder/a;)V

    .line 152
    .line 153
    .line 154
    :cond_7
    iget-object v1, v0, Lcom/tencent/liteav/videoencoder/a$1;->b:Lcom/tencent/liteav/videoencoder/a;

    .line 155
    .line 156
    iget-object v2, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 157
    .line 158
    invoke-static {v1, v2}, Lcom/tencent/liteav/videoencoder/a;->a(Lcom/tencent/liteav/videoencoder/a;Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    iget-object v2, v0, Lcom/tencent/liteav/videoencoder/a$1;->b:Lcom/tencent/liteav/videoencoder/a;

    .line 163
    .line 164
    if-eqz v1, :cond_8

    .line 165
    .line 166
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    iget-object v0, v0, Lcom/tencent/liteav/videoencoder/a$1;->a:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 175
    .line 176
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    .line 177
    .line 178
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    const-string v1, "VideoEncoder[%d]: Start successfully, streamType:%d"

    .line 187
    .line 188
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    const-string v1, "streamType: 2-big, 3-small, 7-sub"

    .line 193
    .line 194
    invoke-static {v4, v0, v1, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_8
    const v0, 0x989684

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2, v0}, Lcom/tencent/liteav/videoencoder/c;->callDelegate(I)V

    .line 202
    .line 203
    .line 204
    return-void
.end method
