.class Ll/biw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/biw;->O(Landroid/graphics/SurfaceTexture;Ll/wje;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/biw;


# direct methods
.method public constructor <init>(Ll/biw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/biw$a;->a:Ll/biw;

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
    iget-object p2, p0, Ll/biw$a;->a:Ll/biw;

    .line 2
    .line 3
    invoke-static {p2}, Ll/biw;->f(Ll/biw;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    monitor-enter p2

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/biw$a;->a:Ll/biw;

    .line 9
    .line 10
    invoke-static {v0}, Ll/biw;->l(Ll/biw;)Ll/xpl$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/biw$a;->a:Ll/biw;

    .line 17
    .line 18
    invoke-static {v0}, Ll/biw;->l(Ll/biw;)Ll/xpl$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0, p1}, Ll/xpl$a;->onData([B)V

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
    iget-object v0, p0, Ll/biw$a;->a:Ll/biw;

    .line 29
    .line 30
    invoke-static {v0}, Ll/biw;->n(Ll/biw;)Landroid/hardware/Camera;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/biw$a;->a:Ll/biw;

    .line 37
    .line 38
    invoke-static {v0}, Ll/biw;->o(Ll/biw;)Ll/tow;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v0, v0, Ll/tow;->L:I

    .line 43
    .line 44
    array-length v1, p1

    .line 45
    if-ne v0, v1, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Ll/biw$a;->a:Ll/biw;

    .line 48
    .line 49
    invoke-static {v0}, Ll/biw;->n(Ll/biw;)Landroid/hardware/Camera;

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
    iget-object p1, p0, Ll/biw$a;->a:Ll/biw;

    .line 57
    .line 58
    invoke-static {p1}, Ll/biw;->p(Ll/biw;)Ll/wje;

    .line 59
    .line 60
    .line 61
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    :try_start_1
    iget-object p1, p0, Ll/biw$a;->a:Ll/biw;

    .line 65
    .line 66
    invoke-static {p1}, Ll/biw;->p(Ll/biw;)Ll/wje;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ll/wje;->i()Z

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/biw$a;->a:Ll/biw;

    .line 74
    .line 75
    invoke-static {p1}, Ll/biw;->q(Ll/biw;)Landroid/graphics/SurfaceTexture;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    iget-object p0, p0, Ll/biw$a;->a:Ll/biw;

    .line 82
    .line 83
    invoke-static {p0}, Ll/biw;->q(Ll/biw;)Landroid/graphics/SurfaceTexture;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catch_0
    move-exception p0

    .line 92
    :try_start_2
    const-string p1, "Camera"

    .line 93
    .line 94
    const-string v0, "updateTextureImage error, contex maybe released by outside !"

    .line 95
    .line 96
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p1, v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_1
    monitor-exit p2

    .line 104
    return-void

    .line 105
    :goto_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    throw p0
.end method
