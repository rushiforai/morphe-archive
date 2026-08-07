.class Ll/aiw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/aiw;->o(Landroid/graphics/SurfaceTexture;Ll/uje;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/aiw;


# direct methods
.method public constructor <init>(Ll/aiw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 2
    .line 3
    invoke-static {p2}, Ll/aiw;->g(Ll/aiw;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    monitor-enter p2

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 9
    .line 10
    invoke-static {v0}, Ll/aiw;->h(Ll/aiw;)Ll/ypl$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 17
    .line 18
    invoke-static {v0}, Ll/aiw;->h(Ll/aiw;)Ll/ypl$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0, p1}, Ll/ypl$a;->onData([B)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 29
    .line 30
    invoke-static {v0}, Ll/aiw;->z(Ll/aiw;)Landroid/hardware/Camera;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 37
    .line 38
    invoke-static {v0}, Ll/aiw;->B(Ll/aiw;)Ll/sow;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v0, v0, Ll/sow;->y:I

    .line 43
    .line 44
    array-length v1, p1

    .line 45
    if-ne v0, v1, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 48
    .line 49
    invoke-static {v0}, Ll/aiw;->z(Ll/aiw;)Landroid/hardware/Camera;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 57
    .line 58
    invoke-static {p1}, Ll/aiw;->D(Ll/aiw;)Ll/gql;

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 62
    .line 63
    invoke-static {p1}, Ll/aiw;->G(Ll/aiw;)Ll/uje;

    .line 64
    .line 65
    .line 66
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    :try_start_1
    iget-object p1, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 70
    .line 71
    invoke-static {p1}, Ll/aiw;->G(Ll/aiw;)Ll/uje;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ll/uje;->f()Z

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 79
    .line 80
    invoke-static {p1}, Ll/aiw;->H(Ll/aiw;)Landroid/graphics/SurfaceTexture;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    iget-object p0, p0, Ll/aiw$a;->a:Ll/aiw;

    .line 87
    .line 88
    invoke-static {p0}, Ll/aiw;->H(Ll/aiw;)Landroid/graphics/SurfaceTexture;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :catch_0
    move-exception p0

    .line 97
    :try_start_2
    const-string p1, "Camera"

    .line 98
    .line 99
    const-string v0, "updateTextureImage error, contex maybe released by outside !"

    .line 100
    .line 101
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p1, v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    :goto_1
    monitor-exit p2

    .line 109
    return-void

    .line 110
    :goto_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    throw p0
.end method
