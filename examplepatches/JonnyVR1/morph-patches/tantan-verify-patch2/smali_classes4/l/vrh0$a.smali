.class Ll/vrh0$a;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vrh0;->b(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/concurrent/atomic/AtomicBoolean;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
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

.field final synthetic e:Ll/vrh0;


# direct methods
.method public constructor <init>(Ll/vrh0;ZLandroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/vrh0$a;->c:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/vrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/vrh0$a;->a:I

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/vrh0$a;->b:Z

    .line 15
    .line 16
    return-void
.end method

.method private a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/vrh0;->i(Ll/vrh0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/vrh0;->i(Ll/vrh0;)Ljava/util/concurrent/atomic/AtomicBoolean;

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
    iget-boolean v0, p0, Ll/vrh0$a;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/vrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    iget-object v0, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 18
    .line 19
    iget-object v0, v0, Ll/vrh0;->f:Ll/p6m$a;

    .line 20
    .line 21
    iget-object v1, p0, Ll/vrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 22
    .line 23
    invoke-interface {v0, p1, v1}, Ll/p6m$a;->b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-direct {p0}, Ll/vrh0$a;->a()V

    .line 27
    .line 28
    .line 29
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
    const-string p2, "TEImageFocus"

    .line 5
    .line 6
    const-string p3, "Manual Focus capture buffer lost "

    .line 7
    .line 8
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/vrh0$a;->e:Ll/vrh0;

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
    iget-object p4, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 22
    .line 23
    iget-object p4, p4, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 24
    .line 25
    iget p4, p4, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 26
    .line 27
    const/16 p5, -0x19b

    .line 28
    .line 29
    invoke-interface {p2, p5, p4, p3}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-direct {p0, p1}, Ll/vrh0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 33
    .line 34
    .line 35
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
    const-string v0, "TEImageFocus"

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
    move-result-object p2

    .line 11
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    sget-object p2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 20
    .line 21
    invoke-virtual {p3, p2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Ljava/lang/Integer;

    .line 26
    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    const-string p1, "Focus failed."

    .line 30
    .line 31
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Ll/vrh0$a;->a()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget v1, p0, Ll/vrh0$a;->a:I

    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/4 v3, 0x5

    .line 45
    const/4 v4, 0x4

    .line 46
    if-eq v1, v2, :cond_6

    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eq v1, v4, :cond_2

    .line 53
    .line 54
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-ne v1, v3, :cond_6

    .line 59
    .line 60
    :cond_2
    iget-boolean v1, p0, Ll/vrh0$a;->c:Z

    .line 61
    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    iget-object v1, p0, Ll/vrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 65
    .line 66
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 67
    .line 68
    const/4 v5, 0x2

    .line 69
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v1, v2, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 77
    .line 78
    iget-object v1, v1, Ll/vrh0;->f:Ll/p6m$a;

    .line 79
    .line 80
    iget-object v2, p0, Ll/vrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 81
    .line 82
    invoke-interface {v1, p1, v2}, Ll/p6m$a;->b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    iget-object p1, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 87
    .line 88
    iget-object v1, p1, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 89
    .line 90
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 91
    .line 92
    if-nez v1, :cond_4

    .line 93
    .line 94
    iget-object p1, p1, Ll/vrh0;->f:Ll/p6m$a;

    .line 95
    .line 96
    invoke-interface {p1}, Ll/p6m$a;->a()I

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_0
    iget-boolean p1, p0, Ll/vrh0$a;->b:Z

    .line 100
    .line 101
    if-nez p1, :cond_5

    .line 102
    .line 103
    const/4 p1, 0x1

    .line 104
    iput-boolean p1, p0, Ll/vrh0$a;->b:Z

    .line 105
    .line 106
    iget-object p1, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 107
    .line 108
    iget-object p1, p1, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 109
    .line 110
    if-eqz p1, :cond_5

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object v1, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 117
    .line 118
    iget-object v1, v1, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->h()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    iget-object v2, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 125
    .line 126
    iget-object v2, v2, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 127
    .line 128
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 129
    .line 130
    const-string v5, "Done"

    .line 131
    .line 132
    invoke-interface {p1, v1, v2, v5}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_5
    invoke-direct {p0}, Ll/vrh0$a;->a()V

    .line 136
    .line 137
    .line 138
    new-instance p1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v1, "Focus done, isLock = "

    .line 141
    .line 142
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-boolean v1, p0, Ll/vrh0$a;->c:Z

    .line 146
    .line 147
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v1, ", afState = "

    .line 151
    .line 152
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_6
    iget-boolean p1, p0, Ll/vrh0$a;->b:Z

    .line 166
    .line 167
    if-eqz p1, :cond_7

    .line 168
    .line 169
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eq p1, v4, :cond_7

    .line 174
    .line 175
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eq p1, v3, :cond_7

    .line 180
    .line 181
    const-string p1, "afState error!!!, may be re-auto-focus in some device, switch to caf"

    .line 182
    .line 183
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 187
    .line 188
    iget-object v0, p1, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 189
    .line 190
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 191
    .line 192
    if-nez v0, :cond_7

    .line 193
    .line 194
    iget-object p1, p1, Ll/vrh0;->f:Ll/p6m$a;

    .line 195
    .line 196
    invoke-interface {p1}, Ll/p6m$a;->a()I

    .line 197
    .line 198
    .line 199
    :cond_7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    iput p1, p0, Ll/vrh0$a;->a:I

    .line 204
    .line 205
    iget-object p1, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 206
    .line 207
    invoke-static {p1}, Ll/vrh0;->j(Ll/vrh0;)Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-eqz p1, :cond_8

    .line 212
    .line 213
    iget-object p0, p0, Ll/vrh0$a;->e:Ll/vrh0;

    .line 214
    .line 215
    invoke-static {p3}, Lcom/ss/android/ttvecamera/f;->k(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    invoke-static {p0, p1}, Ll/vrh0;->k(Ll/vrh0;Z)Z

    .line 220
    .line 221
    .line 222
    :cond_8
    return-void

    .line 223
    :cond_9
    :goto_1
    const-string p0, "Not focus request!"

    .line 224
    .line 225
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
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
    const-string v0, "TEImageFocus"

    .line 19
    .line 20
    invoke-static {v0, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/vrh0$a;->e:Ll/vrh0;

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
    iget-object v0, p0, Ll/vrh0$a;->e:Ll/vrh0;

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
    invoke-direct {p0, p1}, Ll/vrh0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 49
    .line 50
    .line 51
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
    const-string p2, "TEImageFocus"

    .line 5
    .line 6
    const-string v0, "Manual Focus capture abort "

    .line 7
    .line 8
    invoke-static {p2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/vrh0$a;->e:Ll/vrh0;

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
    iget-object v1, p0, Ll/vrh0$a;->e:Ll/vrh0;

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
    invoke-direct {p0, p1}, Ll/vrh0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
