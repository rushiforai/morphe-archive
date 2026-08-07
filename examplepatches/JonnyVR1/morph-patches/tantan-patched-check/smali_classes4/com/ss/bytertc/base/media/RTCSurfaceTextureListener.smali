.class public Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# instance fields
.field private final key:Ljava/lang/String;

.field private nativeSurfaceHelperHandle:J

.field private textureView:Landroid/view/TextureView;


# direct methods
.method public constructor <init>(Landroid/view/TextureView;JLjava/lang/String;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->nativeSurfaceHelperHandle:J

    .line 7
    .line 8
    iput-object p1, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->textureView:Landroid/view/TextureView;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->key:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    move-object v4, p1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    goto :goto_0

    .line 22
    :goto_1
    iput-wide p2, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->nativeSurfaceHelperHandle:J

    .line 23
    .line 24
    if-eqz v4, :cond_1

    .line 25
    .line 26
    cmp-long p1, p2, v0

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Landroid/os/Handler;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/ijc0;

    .line 40
    .line 41
    move-object v3, p0

    .line 42
    move-wide v5, p2

    .line 43
    move-object v7, p4

    .line 44
    invoke-direct/range {v2 .. v7}, Ll/ijc0;-><init>(Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;Landroid/graphics/SurfaceTexture;JLjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;Landroid/graphics/SurfaceTexture;JLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->textureView:Landroid/view/TextureView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Landroid/view/Surface;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p2, p3, p1, p4}, Lcom/ss/bytertc/base/media/RTCSurfaceHelper;->nativeSetRenderTarget(JLandroid/view/Surface;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2

    .line 1
    iget-wide p2, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->nativeSurfaceHelperHandle:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long p2, p2, v0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    new-instance p2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p3, "onSurfaceTextureAvailable key:"

    .line 12
    .line 13
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p3, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->key:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-string p3, "RTCSurfaceTextureListener"

    .line 26
    .line 27
    invoke-static {p3, p2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-wide p2, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->nativeSurfaceHelperHandle:J

    .line 31
    .line 32
    new-instance v0, Landroid/view/Surface;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->key:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p2, p3, v0, p0}, Lcom/ss/bytertc/base/media/RTCSurfaceHelper;->nativeSetRenderTarget(JLandroid/view/Surface;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->nativeSurfaceHelperHandle:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v0, "onSurfaceTextureDestroyed key:"

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->key:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "RTCSurfaceTextureListener"

    .line 26
    .line 27
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->nativeSurfaceHelperHandle:J

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iget-object p0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->key:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0, v1, p1, p0}, Lcom/ss/bytertc/base/media/RTCSurfaceHelper;->nativeSetRenderTarget(JLandroid/view/Surface;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public resetCallback()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->nativeSurfaceHelperHandle:J

    .line 4
    .line 5
    iget-object p0, p0, Lcom/ss/bytertc/base/media/RTCSurfaceTextureListener;->textureView:Landroid/view/TextureView;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
