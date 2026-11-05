.class public final Le/e/a/VideoOutput227;
.super Ljava/lang/Object;
.source "VideoOutput227.java"


# static fields
.field static final MAIN:Landroid/os/Handler;

.field static final OUTPUTS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/SurfaceTexture;",
            ">;>;"
        }
    .end annotation
.end field

.field static final PENDING:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/TextureView;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/VideoOutput227;->MAIN:Landroid/os/Handler;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/VideoOutput227;->PENDING:Ljava/util/WeakHashMap;

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/VideoOutput227;->OUTPUTS:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bind(Landroid/view/View;Landroid/view/TextureView;)V
    .registers 4

    .line 9
    if-eqz p0, :cond_39

    if-nez p1, :cond_5

    goto :goto_39

    :cond_5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1a

    sget-object v0, Le/e/a/VideoOutput227;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/VideoOutput227$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Le/e/a/VideoOutput227$$ExternalSyntheticLambda1;-><init>(Landroid/view/View;Landroid/view/TextureView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1a
    sget-object v0, Le/e/a/VideoOutput227;->PENDING:Ljava/util/WeakHashMap;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_2a

    return-void

    :cond_2a
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sget-object p0, Le/e/a/VideoOutput227;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/VideoOutput227$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1}, Le/e/a/VideoOutput227$$ExternalSyntheticLambda2;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_39
    :goto_39
    return-void
.end method

.method static connect(Landroid/view/View;Landroid/view/TextureView;)V
    .registers 8

    .line 11
    :try_start_0
    invoke-virtual {p1}, Landroid/view/TextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_e1

    invoke-virtual {p1}, Landroid/view/TextureView;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_e1

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-nez v0, :cond_14

    goto/16 :goto_e1

    .line 12
    :cond_14
    const-string v0, "videoViewImpl"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "delegate"

    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "exoMediaPlayer"

    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 13
    const-string v1, "surface"

    invoke-static {v0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Le/e/a/VideoOutput227;->OUTPUTS:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_4f

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v3

    if-ne v2, v3, :cond_4f

    instance-of v2, v1, Landroid/view/Surface;

    if-eqz v2, :cond_4f

    move-object v2, v1

    check-cast v2, Landroid/view/Surface;

    invoke-virtual {v2}, Landroid/view/Surface;->isValid()Z

    move-result v2

    if-eqz v2, :cond_4f

    const/4 v2, 0x1

    goto :goto_50

    :cond_4f
    const/4 v2, 0x0

    :goto_50
    if-eqz v2, :cond_55

    check-cast v1, Landroid/view/Surface;

    goto :goto_5e

    :cond_55
    new-instance v1, Landroid/view/Surface;

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5e} :catch_e2

    .line 14
    :goto_5e
    if-nez v2, :cond_7f

    :try_start_60
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "setSurface"

    const-class v5, Landroid/view/Surface;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_77} :catch_78

    goto :goto_7f

    :catch_78
    move-exception p0

    if-nez v2, :cond_7e

    :try_start_7b
    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    :cond_7e
    throw p0

    :cond_7f
    :goto_7f
    sget-object v0, Le/e/a/VideoOutput227;->OUTPUTS:Ljava/util/WeakHashMap;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    const-string v0, "previewImageView"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v3, v0, Landroid/view/View;

    if-eqz v3, :cond_9e

    check-cast v0, Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 17
    :cond_9e
    if-nez v2, :cond_ea

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Existing video output rebound; hardware="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/view/View;->isHardwareAccelerated()Z

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " surface="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v1}, Landroid/view/Surface;->isValid()Z

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " size="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/TextureView;->getWidth()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "x"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/TextureView;->getHeight()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_e0
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_e0} :catch_e2

    .line 18
    goto :goto_ea

    .line 11
    :cond_e1
    :goto_e1
    return-void

    .line 18
    :catch_e2
    move-exception p0

    const-string p1, "nicoid-video-output"

    const-string v0, "Cannot bind retained decoder output"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_ea
    :goto_ea
    return-void
.end method

.method static synthetic lambda$0(Landroid/view/View;Landroid/view/TextureView;)V
    .registers 2

    .line 9
    invoke-static {p0, p1}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 9
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-nez p0, :cond_9

    return-void

    :cond_9
    sget-object v0, Le/e/a/VideoOutput227;->PENDING:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_15

    const/4 v0, 0x0

    goto :goto_1b

    :cond_15
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/TextureView;

    :goto_1b
    if-eqz v0, :cond_20

    invoke-static {p0, v0}, Le/e/a/VideoOutput227;->connect(Landroid/view/View;Landroid/view/TextureView;)V

    :cond_20
    return-void
.end method

.method public static prepared(Ljava/lang/Object;)V
    .registers 3

    .line 6
    :try_start_0
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Le/e/a/MiniSession225;->texture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v1

    if-nez v1, :cond_f

    return-void

    :cond_f
    invoke-static {v0, v1}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    invoke-static {p0}, Le/e/a/PlayerCollapse227;->attach(Ljava/lang/Object;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_16

    goto :goto_1e

    :catch_16
    move-exception p0

    const-string v0, "nicoid-video-output"

    const-string v1, "Cannot inspect prepared output"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1e
    return-void
.end method
