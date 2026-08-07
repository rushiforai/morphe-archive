.class Ll/ish0$a;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ish0;->b(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/concurrent/atomic/AtomicBoolean;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private a:I

.field private b:Z

.field final synthetic c:Z

.field final synthetic d:Landroid/hardware/camera2/CaptureRequest$Builder;

.field final synthetic e:Ll/ish0;


# direct methods
.method public constructor <init>(Ll/ish0;ZLandroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/ish0$a;->c:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/ish0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/ish0$a;->a:I

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/ish0$a;->b:Z

    .line 15
    .line 16
    return-void
.end method

.method private a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ish0;->i(Ll/ish0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/ish0;->i(Ll/ish0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private b(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ish0$a;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ish0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 6
    .line 7
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/ish0;->j(Ll/ish0;)Ll/p6m$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/ish0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 24
    .line 25
    invoke-interface {v0, p1, v1}, Ll/p6m$a;->b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-direct {p0}, Ll/ish0$a;->a()V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V

    .line 2
    .line 3
    .line 4
    const-string p2, "TEVideoFocus"

    .line 5
    .line 6
    const-string p3, "Manual Focus capture buffer lost "

    .line 7
    .line 8
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 12
    .line 13
    iget-object p2, p2, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget-object p4, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 22
    .line 23
    iget-object p4, p4, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 24
    .line 25
    invoke-virtual {p4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->h()I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    const/16 p5, -0x19b

    .line 30
    .line 31
    invoke-interface {p2, p5, p4, p3}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-direct {p0, p1}, Ll/ish0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 6
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "TEVideoFocus"

    .line 2
    .line 3
    if-eqz p2, :cond_9

    .line 4
    .line 5
    const-string v1, "FOCUS_TAG"

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 20
    .line 21
    invoke-virtual {p3, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/Integer;

    .line 26
    .line 27
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 28
    .line 29
    invoke-virtual {p2, v2}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Ljava/lang/Integer;

    .line 34
    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v4, "Manual Focus onCaptureCompleted: afState = "

    .line 38
    .line 39
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v4, ", triggerState = "

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-static {v0, p2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    const-string p1, "Focus failed."

    .line 63
    .line 64
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Ll/ish0$a;->a()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    iget p2, p0, Ll/ish0$a;->a:I

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    const/4 v4, 0x5

    .line 78
    const/4 v5, 0x4

    .line 79
    if-eq p2, v3, :cond_6

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eq p2, v5, :cond_2

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-ne p2, v4, :cond_6

    .line 92
    .line 93
    :cond_2
    iget-boolean p2, p0, Ll/ish0$a;->c:Z

    .line 94
    .line 95
    if-eqz p2, :cond_3

    .line 96
    .line 97
    iget-object p2, p0, Ll/ish0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 98
    .line 99
    const/4 v3, 0x2

    .line 100
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {p2, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    iget-object p2, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 108
    .line 109
    invoke-static {p2}, Ll/ish0;->j(Ll/ish0;)Ll/p6m$a;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    iget-object v2, p0, Ll/ish0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 114
    .line 115
    invoke-interface {p2, p1, v2}, Ll/p6m$a;->b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    iget-object p1, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 120
    .line 121
    iget-object p2, p1, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 122
    .line 123
    iget-boolean p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 124
    .line 125
    if-nez p2, :cond_4

    .line 126
    .line 127
    invoke-static {p1}, Ll/ish0;->j(Ll/ish0;)Ll/p6m$a;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-interface {p1}, Ll/p6m$a;->a()I

    .line 132
    .line 133
    .line 134
    :cond_4
    :goto_0
    iget-boolean p1, p0, Ll/ish0$a;->b:Z

    .line 135
    .line 136
    if-nez p1, :cond_5

    .line 137
    .line 138
    const/4 p1, 0x1

    .line 139
    iput-boolean p1, p0, Ll/ish0$a;->b:Z

    .line 140
    .line 141
    iget-object p1, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 142
    .line 143
    iget-object p1, p1, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 144
    .line 145
    if-eqz p1, :cond_5

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iget-object p2, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 152
    .line 153
    iget-object p2, p2, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 154
    .line 155
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->h()I

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    iget-object v2, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 160
    .line 161
    iget-object v2, v2, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 162
    .line 163
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 164
    .line 165
    const-string v3, "Done"

    .line 166
    .line 167
    invoke-interface {p1, p2, v2, v3}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_5
    invoke-direct {p0}, Ll/ish0$a;->a()V

    .line 171
    .line 172
    .line 173
    new-instance p1, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string p2, "Focus done, isLock = "

    .line 176
    .line 177
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget-boolean p2, p0, Ll/ish0$a;->c:Z

    .line 181
    .line 182
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string p2, ", afState = "

    .line 186
    .line 187
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_6
    iget-boolean p1, p0, Ll/ish0$a;->b:Z

    .line 201
    .line 202
    if-eqz p1, :cond_7

    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-eq p1, v5, :cond_7

    .line 209
    .line 210
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-eq p1, v4, :cond_7

    .line 215
    .line 216
    const-string p1, "afState error!!!, may be re-auto-focus in some device, switch to caf"

    .line 217
    .line 218
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 222
    .line 223
    iget-object p2, p1, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 224
    .line 225
    iget-boolean p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 226
    .line 227
    if-nez p2, :cond_7

    .line 228
    .line 229
    invoke-static {p1}, Ll/ish0;->j(Ll/ish0;)Ll/p6m$a;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-interface {p1}, Ll/p6m$a;->a()I

    .line 234
    .line 235
    .line 236
    :cond_7
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    iput p1, p0, Ll/ish0$a;->a:I

    .line 241
    .line 242
    iget-object p0, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 243
    .line 244
    iget-boolean p1, p0, Ll/orh0;->d:Z

    .line 245
    .line 246
    if-eqz p1, :cond_8

    .line 247
    .line 248
    invoke-static {p3}, Lcom/ss/android/ttvecamera/f;->k(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    iput-boolean p1, p0, Ll/orh0;->d:Z

    .line 253
    .line 254
    :cond_8
    return-void

    .line 255
    :cond_9
    :goto_1
    const-string p1, "Not focus request!"

    .line 256
    .line 257
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-direct {p0}, Ll/ish0$a;->a()V

    .line 261
    .line 262
    .line 263
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureFailure;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "Manual Focus Failed: "

    .line 7
    .line 8
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const-string v0, "TEVideoFocus"

    .line 19
    .line 20
    invoke-static {v0, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 24
    .line 25
    iget-object p2, p2, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 26
    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 36
    .line 37
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 38
    .line 39
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    const/16 v1, -0x19b

    .line 44
    .line 45
    invoke-interface {p2, v1, v0, p3}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-direct {p0, p1}, Ll/ish0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "TEVideoFocus"

    .line 5
    .line 6
    const-string p1, "Focus onCaptureProgressed!"

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V

    .line 2
    .line 3
    .line 4
    const-string p2, "TEVideoFocus"

    .line 5
    .line 6
    const-string v0, "Manual Focus capture abort "

    .line 7
    .line 8
    invoke-static {p2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 12
    .line 13
    iget-object p2, p2, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget-object v1, p0, Ll/ish0$a;->e:Ll/ish0;

    .line 22
    .line 23
    iget-object v1, v1, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 24
    .line 25
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 26
    .line 27
    const/16 v2, -0x1b6

    .line 28
    .line 29
    invoke-interface {p2, v2, v1, v0}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-direct {p0, p1}, Ll/ish0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V

    .line 2
    .line 3
    .line 4
    const-string p1, "TEVideoFocus"

    .line 5
    .line 6
    const-string p2, "Focus onCaptureSequenceCompleted!"

    .line 7
    .line 8
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/ish0$a;->a()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super/range {p0 .. p6}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V

    .line 2
    .line 3
    .line 4
    const-string p0, "TEVideoFocus"

    .line 5
    .line 6
    const-string p1, "Focus onCaptureStarted!"

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
