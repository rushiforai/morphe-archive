.class public abstract Lcom/tencent/liteav/n;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:Lcom/tencent/liteav/h;

.field protected b:Landroid/content/Context;

.field protected c:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field protected d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/n;->a:Lcom/tencent/liteav/h;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/n;->b:Landroid/content/Context;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/n;->c:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/tencent/liteav/n;->b:Landroid/content/Context;

    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)I
    .locals 0

    .line 19
    const/4 p0, -0x1

    return p0
.end method

.method public abstract a(Ljava/lang/String;I)I
.end method

.method public abstract a(Z)I
.end method

.method public a()V
    .locals 1

    .line 20
    const-string p0, "TXIPlayer"

    const-string v0, "pause not support"

    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(F)V
    .locals 0

    .line 23
    const-string p0, "TXIPlayer"

    const-string p1, "rate not implement"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public abstract a(I)V
.end method

.method public a(II)V
    .locals 0

    .line 13
    return-void
.end method

.method public a(Landroid/content/Context;I)V
    .locals 0

    .line 14
    return-void
.end method

.method public a(Landroid/view/Surface;)V
    .locals 0

    .line 15
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 22
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/n;->d:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public abstract a(Lcom/tencent/liteav/basic/c/o;)V
.end method

.method public a(Lcom/tencent/liteav/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/n;->a:Lcom/tencent/liteav/h;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Lcom/tencent/liteav/h;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/tencent/liteav/h;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/tencent/liteav/n;->a:Lcom/tencent/liteav/h;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/o;Lcom/tencent/liteav/basic/a/b;Ljava/lang/Object;)V
    .locals 0

    .line 16
    return-void
.end method

.method public a(Lcom/tencent/rtmp/TXLivePlayer$ITXAudioRawDataListener;)V
    .locals 0

    .line 17
    return-void
.end method

.method public a(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/tencent/liteav/n;->c:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    return-void
.end method

.method public a(Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;)V
    .locals 0

    .line 18
    return-void
.end method

.method public abstract a(ZI)V
.end method

.method public b()V
    .locals 1

    .line 1
    const-string p0, "TXIPlayer"

    .line 2
    .line 3
    const-string v0, "resume not support"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public abstract b(I)V
.end method

.method public abstract b(Z)V
.end method

.method public abstract c(I)V
.end method

.method public abstract c(Z)V
.end method

.method public abstract c()Z
.end method

.method public abstract d()I
.end method

.method public abstract d(I)I
.end method

.method public d(Z)V
    .locals 0

    .line 1
    const-string p0, "TXIPlayer"

    .line 2
    .line 3
    const-string p1, "autoPlay not implement"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    const-string p0, "TXIPlayer"

    .line 2
    .line 3
    const-string p1, "seek not support"

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e()Z
    .locals 0

    .line 9
    const/4 p0, 0x0

    return p0
.end method

.method public f()V
    .locals 0

    return-void
.end method

.method public abstract h()I
.end method

.method public i()Lcom/tencent/liteav/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/n;->a:Lcom/tencent/liteav/h;

    .line 2
    .line 3
    return-object p0
.end method
