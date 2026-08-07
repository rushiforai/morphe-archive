.class public Ll/pqh0;
.super Lcom/ss/android/ttvecamera/framework/TECameraModeBase;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final Y:Ljava/lang/String; = "pqh0"


# instance fields
.field private X:Ll/bz0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Landroid/os/Handler;)V
    .locals 0
    .param p1    # Lcom/ss/android/ttvecamera/b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CameraManager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p4}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;-><init>(Lcom/ss/android/ttvecamera/b;Landroid/content/Context;Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/pqh0;->X:Ll/bz0;

    .line 6
    .line 7
    iput-object p3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->e:Landroid/hardware/camera2/CameraManager;

    .line 8
    .line 9
    new-instance p1, Ll/ish0;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/ish0;-><init>(Ll/p6m$a;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->i:Ll/orh0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public B0()V
    .locals 1

    .line 1
    sget-object p0, Ll/pqh0;->Y:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "closeARSession not supported"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C0(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->b:Ll/crh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/crh0;->k()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/bz0;->a()Ll/bz0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/pqh0;->X:Ll/bz0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, p1, v1}, Ll/bz0;->b(Landroid/content/Context;Lcom/ss/android/ttvecamera/TECameraSettings;)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/pqh0;->X:Ll/bz0;

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ll/bz0;->c(Landroid/os/Handler;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public D0(Landroid/hardware/camera2/CameraDevice;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public a()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 10
    .line 11
    const-string v2, "rollbackNormalSessionRequest : param is null."

    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 14
    .line 15
    const/16 v3, -0x64

    .line 16
    .line 17
    invoke-interface {v0, v1, v3, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return v3

    .line 21
    :cond_0
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 32
    .line 33
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 44
    .line 45
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public c(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    sget-object p1, Ll/pqh0;->Y:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -100. Reason: mCaptureRequestBuilder is null"

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "switchFlashMode: CaptureRequest.Builder is null"

    .line 18
    .line 19
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 25
    .line 26
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 27
    .line 28
    const-string v1, "switchFlashMode:CaptureRequest.Builder is null"

    .line 29
    .line 30
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 31
    .line 32
    const/16 v2, -0x64

    .line 33
    .line 34
    invoke-interface {p1, v0, v2, v1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    if-eqz p1, :cond_2

    .line 39
    .line 40
    const/4 v2, 0x2

    .line 41
    if-eq p1, v2, :cond_1

    .line 42
    .line 43
    sget-object p0, Ll/pqh0;->Y:Ljava/lang/String;

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v1, "Video Mode not support this mode : "

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 64
    .line 65
    invoke-virtual {v1, v3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 69
    .line 70
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 71
    .line 72
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 81
    .line 82
    invoke-virtual {v1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 86
    .line 87
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 98
    .line 99
    iput p1, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d0:I

    .line 100
    .line 101
    iget-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->c()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_3

    .line 112
    .line 113
    sget-object v0, Ll/pqh0;->Y:Ljava/lang/String;

    .line 114
    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v2, "[VE_UI_TEST]Failed event: TOGGLE_TORCH. Code: -418. Reason: "

    .line 118
    .line 119
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 137
    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v2, "switch flash failed."

    .line 141
    .line 142
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;->a()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 157
    .line 158
    const/16 v1, -0x1a2

    .line 159
    .line 160
    invoke-interface {v0, v1, v1, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    :cond_3
    return-void
.end method

.method public d()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->f:Lcom/ss/android/ttvecamera/c$a;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 8
    .line 9
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 10
    .line 11
    const-string v2, "rollbackNormalSessionRequest : param is null."

    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 14
    .line 15
    const/16 v3, -0x64

    .line 16
    .line 17
    invoke-interface {v0, v1, v3, v2, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return v3

    .line 21
    :cond_0
    iget v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->y0(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 27
    .line 28
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->v0(Landroid/hardware/camera2/CaptureRequest$Builder;)Lcom/ss/android/ttvecamera/framework/TECameraModeBase$f;

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public m0()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->K()Ll/jrh0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 8
    .line 9
    if-eqz v1, :cond_6

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    invoke-super {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->R()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->j:Landroid/hardware/camera2/CameraDevice;

    .line 23
    .line 24
    const/4 v2, 0x3

    .line 25
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 30
    .line 31
    new-instance v1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ll/jrh0;->f()Ll/irh0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Ll/irh0;->g()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/16 v3, 0x8

    .line 45
    .line 46
    if-ne v2, v3, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/jrh0;->e()[Landroid/view/Surface;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-virtual {v0}, Ll/jrh0;->d()Landroid/view/Surface;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Landroid/view/Surface;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 84
    .line 85
    invoke-virtual {v3, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    new-instance v0, Landroid/util/Range;

    .line 90
    .line 91
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 92
    .line 93
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 94
    .line 95
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 96
    .line 97
    iget-object v3, v3, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 98
    .line 99
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 100
    .line 101
    div-int/2addr v2, v3

    .line 102
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->B:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 107
    .line 108
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 109
    .line 110
    iget-object v4, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 111
    .line 112
    iget-object v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 113
    .line 114
    iget v4, v4, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 115
    .line 116
    div-int/2addr v3, v4

    .line 117
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-direct {v0, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->r(Landroid/util/Range;)Landroid/util/Range;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->c:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 129
    .line 130
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 131
    .line 132
    invoke-virtual {v2, v3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    const/4 v0, 0x0

    .line 136
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->G:Z

    .line 137
    .line 138
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    iput-wide v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->H:J

    .line 143
    .line 144
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 145
    .line 146
    iget-boolean v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 147
    .line 148
    if-eqz v2, :cond_4

    .line 149
    .line 150
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->D()Landroid/os/Handler;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    goto :goto_2

    .line 155
    :cond_4
    iget-object v2, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->k:Landroid/os/Handler;

    .line 156
    .line 157
    :goto_2
    const/4 v3, 0x0

    .line 158
    iput-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 159
    .line 160
    iget-object v3, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->V:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 161
    .line 162
    invoke-virtual {p0, v1, v3, v2}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->t(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d:Landroid/hardware/camera2/CameraCaptureSession;

    .line 166
    .line 167
    if-nez v1, :cond_5

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->z0()V

    .line 170
    .line 171
    .line 172
    :cond_5
    return v0

    .line 173
    :cond_6
    :goto_3
    sget-object p0, Ll/pqh0;->Y:Ljava/lang/String;

    .line 174
    .line 175
    const-string v0, "CameraDevice or ProviderManager is null!"

    .line 176
    .line 177
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    const/16 p0, -0x64

    .line 181
    .line 182
    return p0
.end method
