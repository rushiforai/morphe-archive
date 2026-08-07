.class public Lcom/tencent/liteav/screencapture/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/screencapture/c$a;,
        Lcom/tencent/liteav/screencapture/c$b;
    }
.end annotation


# static fields
.field private static volatile a:Lcom/tencent/liteav/screencapture/c;


# instance fields
.field private final b:Landroid/content/Context;

.field private final c:Landroid/os/Handler;

.field private final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/Surface;",
            "Lcom/tencent/liteav/screencapture/c$a;",
            ">;"
        }
    .end annotation
.end field

.field private e:Z

.field private f:Landroid/media/projection/MediaProjection;

.field private g:Lcom/tencent/liteav/basic/util/h;

.field private h:Z

.field private i:Landroid/media/projection/MediaProjection$Callback;

.field private j:Lcom/tencent/liteav/basic/util/h$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/tencent/liteav/screencapture/c;->e:Z

    .line 13
    .line 14
    new-instance v0, Lcom/tencent/liteav/screencapture/c$1;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/tencent/liteav/screencapture/c$1;-><init>(Lcom/tencent/liteav/screencapture/c;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/c;->i:Landroid/media/projection/MediaProjection$Callback;

    .line 20
    .line 21
    new-instance v0, Lcom/tencent/liteav/screencapture/c$2;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/tencent/liteav/screencapture/c$2;-><init>(Lcom/tencent/liteav/screencapture/c;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/c;->j:Lcom/tencent/liteav/basic/util/h$a;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/c;->b:Landroid/content/Context;

    .line 33
    .line 34
    new-instance v0, Lcom/tencent/liteav/basic/util/e;

    .line 35
    .line 36
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v1}, Lcom/tencent/liteav/basic/util/e;-><init>(Landroid/os/Looper;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/c;->c:Landroid/os/Handler;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/tencent/liteav/screencapture/c;->b(Landroid/content/Context;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iput-boolean p1, p0, Lcom/tencent/liteav/screencapture/c;->h:Z

    .line 50
    .line 51
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/tencent/liteav/screencapture/c;
    .locals 2

    .line 103
    sget-object v0, Lcom/tencent/liteav/screencapture/c;->a:Lcom/tencent/liteav/screencapture/c;

    if-nez v0, :cond_1

    .line 104
    const-class v0, Lcom/tencent/liteav/screencapture/c;

    monitor-enter v0

    .line 105
    :try_start_0
    sget-object v1, Lcom/tencent/liteav/screencapture/c;->a:Lcom/tencent/liteav/screencapture/c;

    if-nez v1, :cond_0

    .line 106
    new-instance v1, Lcom/tencent/liteav/screencapture/c;

    invoke-direct {v1, p0}, Lcom/tencent/liteav/screencapture/c;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/tencent/liteav/screencapture/c;->a:Lcom/tencent/liteav/screencapture/c;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 107
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 108
    :cond_1
    :goto_2
    sget-object p0, Lcom/tencent/liteav/screencapture/c;->a:Lcom/tencent/liteav/screencapture/c;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/screencapture/c;)Ljava/util/Map;
    .locals 0

    .line 150
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    return-object p0
.end method

.method private a()V
    .locals 12

    .line 134
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tencent/liteav/screencapture/c$a;

    .line 135
    iget-object v2, v1, Lcom/tencent/liteav/screencapture/c$a;->e:Landroid/hardware/display/VirtualDisplay;

    if-eqz v2, :cond_1

    goto :goto_0

    .line 136
    :cond_1
    iget-object v3, p0, Lcom/tencent/liteav/screencapture/c;->f:Landroid/media/projection/MediaProjection;

    iget v5, v1, Lcom/tencent/liteav/screencapture/c$a;->b:I

    iget v6, v1, Lcom/tencent/liteav/screencapture/c$a;->c:I

    iget-object v9, v1, Lcom/tencent/liteav/screencapture/c$a;->a:Landroid/view/Surface;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v4, "TXCScreenCapture"

    const/4 v7, 0x1

    const/4 v8, 0x1

    invoke-virtual/range {v3 .. v11}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/liteav/screencapture/c$a;->e:Landroid/hardware/display/VirtualDisplay;

    .line 137
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "create VirtualDisplay "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/liteav/screencapture/c$a;->e:Landroid/hardware/display/VirtualDisplay;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "VirtualDisplayManager"

    invoke-static {v3, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    iget-object v1, v1, Lcom/tencent/liteav/screencapture/c$a;->d:Lcom/tencent/liteav/screencapture/c$b;

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 139
    invoke-interface {v1, v2, v3}, Lcom/tencent/liteav/screencapture/c$b;->a(ZZ)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/screencapture/c;Z)V
    .locals 0

    .line 101
    invoke-direct {p0, p1}, Lcom/tencent/liteav/screencapture/c;->a(Z)V

    return-void
.end method

.method private a(Z)V
    .locals 3

    .line 140
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    .line 141
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/c;->c:Landroid/os/Handler;

    new-instance v0, Lcom/tencent/liteav/screencapture/c$3;

    invoke-direct {v0, p0}, Lcom/tencent/liteav/screencapture/c$3;-><init>(Lcom/tencent/liteav/screencapture/c;)V

    const-wide/16 v1, 0x3e8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 142
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "stop media projection session "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tencent/liteav/screencapture/c;->f:Landroid/media/projection/MediaProjection;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "VirtualDisplayManager"

    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/c;->f:Landroid/media/projection/MediaProjection;

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 144
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/c;->i:Landroid/media/projection/MediaProjection$Callback;

    invoke-virtual {p1, v1}, Landroid/media/projection/MediaProjection;->unregisterCallback(Landroid/media/projection/MediaProjection$Callback;)V

    .line 145
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/c;->f:Landroid/media/projection/MediaProjection;

    invoke-virtual {p1}, Landroid/media/projection/MediaProjection;->stop()V

    .line 146
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/c;->f:Landroid/media/projection/MediaProjection;

    .line 147
    :cond_2
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/c;->g:Lcom/tencent/liteav/basic/util/h;

    if-eqz p1, :cond_3

    .line 148
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/util/h;->a()V

    .line 149
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/c;->g:Lcom/tencent/liteav/basic/util/h;

    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/screencapture/c;Landroid/content/Context;)Z
    .locals 0

    .line 102
    invoke-direct {p0, p1}, Lcom/tencent/liteav/screencapture/c;->b(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/screencapture/c;)Landroid/content/Context;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/c;->b:Landroid/content/Context;

    return-object p0
.end method

.method private b(Landroid/content/Context;)Z
    .locals 1

    .line 1
    const-string p0, "window"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/WindowManager;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return p1

    .line 13
    :cond_0
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-ne p0, v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_2
    :goto_0
    return p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/screencapture/c;Z)Z
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/tencent/liteav/screencapture/c;->h:Z

    return p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/screencapture/c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/liteav/screencapture/c;->h:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public a(Landroid/media/projection/MediaProjection;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tencent/liteav/screencapture/c;->e:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-nez p1, :cond_2

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashMap;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    .line 10
    .line 11
    invoke-direct {p1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/tencent/liteav/screencapture/c$a;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/tencent/liteav/screencapture/c$a;->d:Lcom/tencent/liteav/screencapture/c$b;

    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-interface {p1, v0, v1}, Lcom/tencent/liteav/screencapture/c$b;->a(ZZ)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return-void

    .line 48
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v2, "Got session "

    .line 51
    .line 52
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v2, "VirtualDisplayManager"

    .line 63
    .line 64
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/c;->f:Landroid/media/projection/MediaProjection;

    .line 68
    .line 69
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/c;->i:Landroid/media/projection/MediaProjection$Callback;

    .line 70
    .line 71
    iget-object v2, p0, Lcom/tencent/liteav/screencapture/c;->c:Landroid/os/Handler;

    .line 72
    .line 73
    invoke-virtual {p1, v0, v2}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Lcom/tencent/liteav/screencapture/c;->a()V

    .line 77
    .line 78
    .line 79
    new-instance p1, Lcom/tencent/liteav/basic/util/h;

    .line 80
    .line 81
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v2, p0, Lcom/tencent/liteav/screencapture/c;->j:Lcom/tencent/liteav/basic/util/h$a;

    .line 86
    .line 87
    invoke-direct {p1, v0, v2}, Lcom/tencent/liteav/basic/util/h;-><init>(Landroid/os/Looper;Lcom/tencent/liteav/basic/util/h$a;)V

    .line 88
    .line 89
    .line 90
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/c;->g:Lcom/tencent/liteav/basic/util/h;

    .line 91
    .line 92
    const/16 v0, 0x32

    .line 93
    .line 94
    invoke-virtual {p1, v0, v0}, Lcom/tencent/liteav/basic/util/h;->a(II)V

    .line 95
    .line 96
    .line 97
    invoke-direct {p0, v1}, Lcom/tencent/liteav/screencapture/c;->a(Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public a(Landroid/view/Surface;)V
    .locals 2

    .line 127
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_2

    if-nez p1, :cond_0

    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tencent/liteav/screencapture/c$a;

    if-eqz p1, :cond_1

    .line 129
    iget-object v0, p1, Lcom/tencent/liteav/screencapture/c$a;->e:Landroid/hardware/display/VirtualDisplay;

    if-eqz v0, :cond_1

    .line 130
    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "VirtualDisplay released, "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lcom/tencent/liteav/screencapture/c$a;->e:Landroid/hardware/display/VirtualDisplay;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "VirtualDisplayManager"

    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 p1, 0x1

    .line 132
    invoke-direct {p0, p1}, Lcom/tencent/liteav/screencapture/c;->a(Z)V

    return-void

    .line 133
    :cond_2
    const-string p0, "Must call this at main thread!"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void
.end method

.method public a(Landroid/view/Surface;IILcom/tencent/liteav/screencapture/c$b;)V
    .locals 2

    .line 109
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_3

    if-nez p1, :cond_0

    .line 110
    const-string p0, "VirtualDisplayManager"

    const-string p1, "surface is null!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 111
    invoke-interface {p4, p0, p0}, Lcom/tencent/liteav/screencapture/c$b;->a(ZZ)V

    return-void

    .line 112
    :cond_0
    new-instance v0, Lcom/tencent/liteav/screencapture/c$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tencent/liteav/screencapture/c$a;-><init>(Lcom/tencent/liteav/screencapture/c$1;)V

    .line 113
    iput-object p1, v0, Lcom/tencent/liteav/screencapture/c$a;->a:Landroid/view/Surface;

    .line 114
    iput p2, v0, Lcom/tencent/liteav/screencapture/c$a;->b:I

    .line 115
    iput p3, v0, Lcom/tencent/liteav/screencapture/c$a;->c:I

    .line 116
    iput-object p4, v0, Lcom/tencent/liteav/screencapture/c$a;->d:Lcom/tencent/liteav/screencapture/c$b;

    .line 117
    iput-object v1, v0, Lcom/tencent/liteav/screencapture/c$a;->e:Landroid/hardware/display/VirtualDisplay;

    .line 118
    iget-object p2, p0, Lcom/tencent/liteav/screencapture/c;->d:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/c;->f:Landroid/media/projection/MediaProjection;

    if-nez p1, :cond_2

    .line 120
    iget-boolean p1, p0, Lcom/tencent/liteav/screencapture/c;->e:Z

    if-nez p1, :cond_1

    const/4 p1, 0x1

    .line 121
    iput-boolean p1, p0, Lcom/tencent/liteav/screencapture/c;->e:Z

    .line 122
    new-instance p1, Landroid/content/Intent;

    iget-object p2, p0, Lcom/tencent/liteav/screencapture/c;->b:Landroid/content/Context;

    const-class p3, Lcom/tencent/rtmp/video/TXScreenCapture$TXScreenCaptureAssistantActivity;

    invoke-direct {p1, p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 p2, 0x10000000

    .line 123
    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 124
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/c;->b:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_1
    return-void

    .line 125
    :cond_2
    invoke-direct {p0}, Lcom/tencent/liteav/screencapture/c;->a()V

    return-void

    .line 126
    :cond_3
    const-string p0, "Must call this method in main thread!"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void
.end method
