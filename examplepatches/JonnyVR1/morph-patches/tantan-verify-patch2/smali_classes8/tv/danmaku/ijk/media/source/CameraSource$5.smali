.class Ltv/danmaku/ijk/media/source/CameraSource$5;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/source/CameraSource;->r0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/source/CameraSource;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/CameraSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    const-string p1, "VideoSource"

    .line 2
    .line 3
    const-string v0, "initCamera doInBackground"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 9
    .line 10
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/CameraSource;->b0(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    if-ge v0, v1, :cond_0

    .line 19
    .line 20
    const-wide/16 v1, 0x7d0

    .line 21
    .line 22
    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 23
    .line 24
    .line 25
    const-string p1, "VideoSource"

    .line 26
    .line 27
    const-string v1, "camera dealay creat"

    .line 28
    .line 29
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    :catch_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 33
    .line 34
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/CameraSource;->b0(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 42
    .line 43
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/CameraSource;->c0(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/source/CameraSource;->d0(Ltv/danmaku/ijk/media/source/CameraSource;Z)Z

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 56
    .line 57
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/CameraSource;->f0(Ltv/danmaku/ijk/media/source/CameraSource;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 61
    .line 62
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/CameraSource;->h0(Ltv/danmaku/ijk/media/source/CameraSource;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 66
    .line 67
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/CameraSource;->k0(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    monitor-enter v0

    .line 72
    :try_start_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 73
    .line 74
    invoke-static {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->k0(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 79
    .line 80
    .line 81
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :catchall_0
    move-exception p0

    .line 88
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 89
    throw p0
.end method

.method public b(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 8
    .line 9
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/CameraSource;->j0(Ltv/danmaku/ijk/media/source/CameraSource;)Landroid/hardware/Camera;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 17
    .line 18
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/CameraSource;->i0(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource$5;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 25
    .line 26
    invoke-static {p0}, Ltv/danmaku/ijk/media/source/CameraSource;->i0(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->setSourceSucess()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :cond_2
    :goto_0
    const-string p0, "VideoSource"

    .line 35
    .line 36
    const-string p1, "\u65e0\u6cd5\u8fde\u63a5\u5230\u76f8\u673a"

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/CameraSource$5;->a([Ljava/lang/String;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/source/CameraSource$5;->b(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
