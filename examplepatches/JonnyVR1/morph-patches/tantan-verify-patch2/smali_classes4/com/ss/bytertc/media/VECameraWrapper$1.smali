.class Lcom/ss/bytertc/media/VECameraWrapper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/android/ttvecamera/d$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/media/VECameraWrapper;->startCapture(Lcom/ss/bytertc/media/VECameraWrapper$CamParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/media/VECameraWrapper;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getPreviewSize(Ljava/util/List;)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;)",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/ss/bytertc/media/VECameraWrapper;->access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "supportPreviewSizes:"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/16 v2, 0x8

    .line 34
    .line 35
    const-string v3, "toSvr"

    .line 36
    .line 37
    invoke-virtual {v0, v2, v3, v1}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    move v2, v1

    .line 47
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-ge v2, v3, :cond_2

    .line 52
    .line 53
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 58
    .line 59
    iget v4, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 60
    .line 61
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 62
    .line 63
    iget-object v5, v5, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 64
    .line 65
    iget v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 66
    .line 67
    if-lt v4, v5, :cond_1

    .line 68
    .line 69
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-nez v2, :cond_3

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    move-object p1, v0

    .line 83
    :goto_1
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 88
    .line 89
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 92
    .line 93
    iget v1, v1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 94
    .line 95
    iget v2, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 96
    .line 97
    sub-int/2addr v1, v2

    .line 98
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    iget-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 103
    .line 104
    iget-object v2, v2, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 105
    .line 106
    iget v2, v2, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->height:I

    .line 107
    .line 108
    iget v3, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 109
    .line 110
    sub-int/2addr v2, v3

    .line 111
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    add-int/2addr v1, v2

    .line 116
    const/4 v2, 0x1

    .line 117
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    if-ge v2, v3, :cond_5

    .line 122
    .line 123
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 128
    .line 129
    iget-object v4, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 130
    .line 131
    iget-object v4, v4, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 132
    .line 133
    iget v4, v4, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 134
    .line 135
    iget v5, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 136
    .line 137
    sub-int/2addr v4, v5

    .line 138
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 143
    .line 144
    iget-object v5, v5, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 145
    .line 146
    iget v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->height:I

    .line 147
    .line 148
    iget v6, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 149
    .line 150
    sub-int/2addr v5, v6

    .line 151
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    add-int/2addr v4, v5

    .line 156
    if-ge v4, v1, :cond_4

    .line 157
    .line 158
    move-object v0, v3

    .line 159
    move v1, v4

    .line 160
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_5
    iget-object v3, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 164
    .line 165
    iget v4, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 166
    .line 167
    iget v5, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 168
    .line 169
    invoke-static {v3}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2700(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 174
    .line 175
    iget v6, p1, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 176
    .line 177
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 178
    .line 179
    invoke-static {p1}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2700(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 184
    .line 185
    iget v7, p1, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 186
    .line 187
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$1;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 188
    .line 189
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 190
    .line 191
    iget-boolean p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 192
    .line 193
    if-eqz p0, :cond_6

    .line 194
    .line 195
    sget-object p0, Lcom/bytedance/realx/video/RXPixelFormat;->kTextureOES:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 196
    .line 197
    :goto_3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXPixelFormat;->value()I

    .line 198
    .line 199
    .line 200
    move-result p0

    .line 201
    move v8, p0

    .line 202
    goto :goto_4

    .line 203
    :cond_6
    sget-object p0, Lcom/bytedance/realx/video/RXPixelFormat;->kNv21:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 204
    .line 205
    goto :goto_3

    .line 206
    :goto_4
    invoke-static/range {v3 .. v8}, Lcom/ss/bytertc/media/VECameraWrapper;->access$2800(Lcom/ss/bytertc/media/VECameraWrapper;IIIII)V

    .line 207
    .line 208
    .line 209
    return-object v0
.end method
