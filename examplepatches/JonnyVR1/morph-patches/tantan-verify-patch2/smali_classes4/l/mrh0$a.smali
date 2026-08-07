.class Ll/mrh0$a;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mrh0;->b(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/util/concurrent/atomic/AtomicBoolean;Z)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
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

.field final synthetic e:Ll/mrh0;


# direct methods
.method public constructor <init>(Ll/mrh0;ZLandroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/mrh0$a;->c:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/mrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/mrh0$a;->a:I

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/mrh0$a;->b:Z

    .line 15
    .line 16
    return-void
.end method

.method private a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/mrh0;->i(Ll/mrh0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/mrh0;->i(Ll/mrh0;)Ljava/util/concurrent/atomic/AtomicBoolean;

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
    iget-boolean v0, p0, Ll/mrh0$a;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/mrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

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
    iget-object v0, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/mrh0;->j(Ll/mrh0;)Ll/p6m$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/mrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 24
    .line 25
    invoke-interface {v0, p1, v1}, Ll/p6m$a;->b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-direct {p0}, Ll/mrh0$a;->a()V

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
    new-instance p2, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p3, "Manual Focus capture buffer lost , session: "

    .line 7
    .line 8
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const-string p3, "TEFocusAndMeterStrategy"

    .line 19
    .line 20
    invoke-static {p3, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/mrh0$a;->e:Ll/mrh0;

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
    iget-object p3, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 34
    .line 35
    iget-object p3, p3, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 36
    .line 37
    invoke-virtual {p3}, Lcom/ss/android/ttvecamera/TEFocusSettings;->h()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    const-string p4, "Manual Focus capture buffer lost "

    .line 42
    .line 43
    const/16 p5, -0x19b

    .line 44
    .line 45
    invoke-interface {p2, p5, p3, p4}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-direct {p0, p1}, Ll/mrh0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 49
    .line 50
    .line 51
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
    sget-object p2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 2
    .line 3
    invoke-virtual {p3, p2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ljava/lang/Integer;

    .line 8
    .line 9
    const-string v0, "TEFocusAndMeterStrategy"

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    const-string p1, "Focus failed."

    .line 14
    .line 15
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/mrh0$a;->a()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget v1, p0, Ll/mrh0$a;->a:I

    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, 0x1

    .line 29
    if-eq v1, v2, :cond_1

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v2, "Focus onCaptureCompleted! afState = "

    .line 34
    .line 35
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    move v1, v3

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 v1, 0x0

    .line 51
    :goto_0
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iput v2, p0, Ll/mrh0$a;->a:I

    .line 56
    .line 57
    const/4 v2, 0x5

    .line 58
    const/4 v4, 0x4

    .line 59
    if-eqz v1, :cond_5

    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eq v1, v4, :cond_2

    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-ne v1, v2, :cond_5

    .line 72
    .line 73
    :cond_2
    iget-boolean v1, p0, Ll/mrh0$a;->c:Z

    .line 74
    .line 75
    iget-object v5, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 76
    .line 77
    if-eqz v1, :cond_3

    .line 78
    .line 79
    invoke-static {v5}, Ll/mrh0;->j(Ll/mrh0;)Ll/p6m$a;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object v5, p0, Ll/mrh0$a;->d:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 84
    .line 85
    invoke-interface {v1, p1, v5}, Ll/p6m$a;->b(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    invoke-static {v5}, Ll/mrh0;->j(Ll/mrh0;)Ll/p6m$a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-interface {p1}, Ll/p6m$a;->a()I

    .line 94
    .line 95
    .line 96
    :goto_1
    iget-boolean p1, p0, Ll/mrh0$a;->b:Z

    .line 97
    .line 98
    if-nez p1, :cond_4

    .line 99
    .line 100
    iput-boolean v3, p0, Ll/mrh0$a;->b:Z

    .line 101
    .line 102
    iget-object p1, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 103
    .line 104
    iget-object p1, p1, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 105
    .line 106
    if-eqz p1, :cond_4

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object v1, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 113
    .line 114
    iget-object v1, v1, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->h()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    iget-object v3, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 121
    .line 122
    iget-object v3, v3, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 123
    .line 124
    iget v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 125
    .line 126
    const-string v5, "Done"

    .line 127
    .line 128
    invoke-interface {p1, v1, v3, v5}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_4
    invoke-direct {p0}, Ll/mrh0$a;->a()V

    .line 132
    .line 133
    .line 134
    new-instance p1, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v1, "Focus done, isLock = "

    .line 137
    .line 138
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-boolean v1, p0, Ll/mrh0$a;->c:Z

    .line 142
    .line 143
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v1, ", afState = "

    .line 147
    .line 148
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :cond_5
    iget-boolean p1, p0, Ll/mrh0$a;->b:Z

    .line 162
    .line 163
    if-eqz p1, :cond_6

    .line 164
    .line 165
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-eq p1, v4, :cond_6

    .line 170
    .line 171
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eq p1, v2, :cond_6

    .line 176
    .line 177
    const-string p1, "afState error!!!, may be re-auto-focus in some device, switch to caf"

    .line 178
    .line 179
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 183
    .line 184
    invoke-static {p1}, Ll/mrh0;->j(Ll/mrh0;)Ll/p6m$a;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-interface {p1}, Ll/p6m$a;->a()I

    .line 189
    .line 190
    .line 191
    :cond_6
    iget-object p0, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 192
    .line 193
    iget-boolean p1, p0, Ll/orh0;->d:Z

    .line 194
    .line 195
    if-eqz p1, :cond_7

    .line 196
    .line 197
    invoke-static {p3}, Lcom/ss/android/ttvecamera/f;->k(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    iput-boolean p1, p0, Ll/orh0;->d:Z

    .line 202
    .line 203
    :cond_7
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
    const-string v0, ", session: "

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    const-string v0, "TEFocusAndMeterStrategy"

    .line 27
    .line 28
    invoke-static {v0, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 32
    .line 33
    iget-object p2, p2, Ll/orh0;->b:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 34
    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    iget-object v0, p0, Ll/mrh0$a;->e:Ll/mrh0;

    .line 42
    .line 43
    iget-object v0, v0, Ll/orh0;->c:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 46
    .line 47
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    const/16 v1, -0x19b

    .line 52
    .line 53
    invoke-interface {p2, v1, v0, p3}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-direct {p0, p1}, Ll/mrh0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 57
    .line 58
    .line 59
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
    const-string p0, "TEFocusAndMeterStrategy"

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
    const-string p2, "TEFocusAndMeterStrategy"

    .line 5
    .line 6
    const-string v0, "Manual Focus capture abort "

    .line 7
    .line 8
    invoke-static {p2, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/mrh0$a;->e:Ll/mrh0;

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
    iget-object v1, p0, Ll/mrh0$a;->e:Ll/mrh0;

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
    invoke-direct {p0, p1}, Ll/mrh0$a;->b(Landroid/hardware/camera2/CameraCaptureSession;)V

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
    const-string p1, "TEFocusAndMeterStrategy"

    .line 5
    .line 6
    const-string p2, "Focus onCaptureSequenceCompleted!"

    .line 7
    .line 8
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/mrh0$a;->a()V

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
    const-string p0, "TEFocusAndMeterStrategy"

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
