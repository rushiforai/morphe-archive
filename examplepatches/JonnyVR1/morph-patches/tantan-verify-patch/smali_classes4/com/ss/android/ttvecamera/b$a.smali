.class Lcom/ss/android/ttvecamera/b$a;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field a:Lcom/ss/android/ttvecamera/b$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ss/android/ttvecamera/b$b<",
            "Landroid/hardware/camera2/CameraDevice;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic b:Lcom/ss/android/ttvecamera/b;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/b;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/ss/android/ttvecamera/b$b;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/ss/android/ttvecamera/b$b;-><init>(Lcom/ss/android/ttvecamera/b;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->a:Lcom/ss/android/ttvecamera/b$b;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 4
    .line 5
    instance-of v0, p0, Ll/pqh0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/pqh0;

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Ll/pqh0;->D0(Landroid/hardware/camera2/CameraDevice;II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "TECamera2"

    .line 2
    .line 3
    const-string v1, "onDisconnected: OpenCameraCallBack"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 11
    .line 12
    instance-of v1, v0, Ll/pqh0;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    check-cast v0, Ll/pqh0;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, -0x1

    .line 20
    invoke-virtual {v0, p1, v1, v2}, Ll/pqh0;->D0(Landroid/hardware/camera2/CameraDevice;II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->X0()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$a;->a:Lcom/ss/android/ttvecamera/b$b;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/b$b;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onError: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "TECamera2"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 23
    .line 24
    instance-of v2, v0, Ll/pqh0;

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    check-cast v0, Ll/pqh0;

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-virtual {v0, p1, v2, p2}, Ll/pqh0;->D0(Landroid/hardware/camera2/CameraDevice;II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->X0()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->a:Lcom/ss/android/ttvecamera/b$b;

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    const-string p0, "had called onError"

    .line 44
    .line 45
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttvecamera/b$b;->b(Ljava/lang/Object;I)Z

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lcom/ss/android/ttvecamera/b$a;->a:Lcom/ss/android/ttvecamera/b$b;

    .line 54
    .line 55
    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 6
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "onOpened: OpenCameraCallBack"

    .line 2
    .line 3
    const-string v1, "TECamera2"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 11
    .line 12
    const-string v2, "did start camera2"

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/16 v4, 0x6b

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    invoke-interface {v0, v4, v5, v2, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 24
    .line 25
    instance-of v2, v0, Ll/pqh0;

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    check-cast v0, Ll/pqh0;

    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    invoke-virtual {v0, p1, v5, v2}, Ll/pqh0;->D0(Landroid/hardware/camera2/CameraDevice;II)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 36
    .line 37
    iput-object p1, v0, Lcom/ss/android/ttvecamera/b;->D:Landroid/hardware/camera2/CameraDevice;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->Z(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->X0()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->a:Lcom/ss/android/ttvecamera/b$b;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Lcom/ss/android/ttvecamera/b$b;->c(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 63
    .line 64
    iget-boolean v2, v0, Lcom/ss/android/ttvecamera/b;->J:Z

    .line 65
    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    iget-boolean v2, v0, Lcom/ss/android/ttvecamera/b;->I:Z

    .line 69
    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    iget-object v0, v0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 73
    .line 74
    invoke-static {v0, p1}, Ll/wqh0;->b(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/camera2/CameraDevice;)V

    .line 75
    .line 76
    .line 77
    const-string p1, "onOpened: OpenCameraCallBack, but had camera close intent..."

    .line 78
    .line 79
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 83
    .line 84
    iput-boolean v5, p0, Lcom/ss/android/ttvecamera/b;->I:Z

    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    iget-object p1, v0, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 88
    .line 89
    iget-boolean p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 90
    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    :try_start_0
    iget-object p1, v0, Lcom/ss/android/ttvecamera/b;->G:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->u()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :catch_0
    move-exception p1

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v2, "onOpened: createSessionByDeferredSurface, some bad case occur, close camera! exception msg: "

    .line 103
    .line 104
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {v1, p1}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 122
    .line 123
    iget-object v0, p1, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 124
    .line 125
    iput-boolean v5, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 126
    .line 127
    iget p1, p1, Lcom/ss/android/ttvecamera/b;->z:I

    .line 128
    .line 129
    const/4 v0, 0x3

    .line 130
    if-eq p1, v0, :cond_3

    .line 131
    .line 132
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/b;->u0()V

    .line 135
    .line 136
    .line 137
    :cond_3
    return-void

    .line 138
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/b$a;->b:Lcom/ss/android/ttvecamera/b;

    .line 139
    .line 140
    iget-object p0, p0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 141
    .line 142
    invoke-static {p0, p1}, Ll/wqh0;->b(Lcom/bytedance/bpea/basics/Cert;Landroid/hardware/camera2/CameraDevice;)V

    .line 143
    .line 144
    .line 145
    const-string p0, "onOpened: OpenCameraCallBack, some bad case occur, close camera!"

    .line 146
    .line 147
    invoke-static {v1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method
