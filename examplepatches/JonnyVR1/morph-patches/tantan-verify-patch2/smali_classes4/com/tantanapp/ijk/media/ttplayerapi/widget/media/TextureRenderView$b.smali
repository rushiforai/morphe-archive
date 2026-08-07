.class public final Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;
.implements Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/graphics/SurfaceTexture;

.field public b:Z

.field public c:I

.field public d:I

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ll/r4m;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;)V
    .locals 1
    .param p1    # Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->e:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->f:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->g:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->i:Ljava/util/Map;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->h:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->a:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->a:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    iput-boolean p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->b:Z

    .line 5
    .line 6
    iput p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->c:I

    .line 7
    .line 8
    iput p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->d:I

    .line 9
    .line 10
    new-instance p3, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->h:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;

    .line 19
    .line 20
    invoke-direct {p3, v0, p1, p0}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;Landroid/graphics/SurfaceTexture;Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->i:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/r4m;

    .line 44
    .line 45
    invoke-interface {p1, p3, p2, p2}, Ll/r4m;->a(Ll/s4m;II)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->a:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->b:Z

    .line 5
    .line 6
    iput v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->c:I

    .line 7
    .line 8
    iput v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->d:I

    .line 9
    .line 10
    new-instance v0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->h:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;

    .line 19
    .line 20
    invoke-direct {v0, v1, p1, p0}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;Landroid/graphics/SurfaceTexture;Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->i:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ll/r4m;

    .line 44
    .line 45
    invoke-interface {v1, v0}, Ll/r4m;->c(Ll/s4m;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-boolean p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->e:Z

    .line 50
    .line 51
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->a:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->b:Z

    .line 5
    .line 6
    iput p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->c:I

    .line 7
    .line 8
    iput p3, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->d:I

    .line 9
    .line 10
    new-instance v0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->h:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;

    .line 19
    .line 20
    invoke-direct {v0, v1, p1, p0}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;-><init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;Landroid/graphics/SurfaceTexture;Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->i:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/r4m;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-interface {p1, v0, v1, p2, p3}, Ll/r4m;->b(Ll/s4m;III)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public releaseSurfaceTexture(Landroid/graphics/SurfaceTexture;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->g:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->a:Landroid/graphics/SurfaceTexture;

    .line 9
    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-boolean p0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->e:Z

    .line 17
    .line 18
    if-nez p0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 21
    .line 22
    .line 23
    :cond_2
    return-void

    .line 24
    :cond_3
    iget-boolean v0, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->f:Z

    .line 25
    .line 26
    iget-object v1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->a:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    if-eqz v0, :cond_6

    .line 30
    .line 31
    if-eq p1, v1, :cond_4

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_4
    iget-boolean p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->e:Z

    .line 38
    .line 39
    if-nez p1, :cond_5

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->c(Z)V

    .line 42
    .line 43
    .line 44
    :cond_5
    return-void

    .line 45
    :cond_6
    if-eq p1, v1, :cond_7

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_7
    iget-boolean p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->e:Z

    .line 52
    .line 53
    if-nez p1, :cond_8

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$b;->c(Z)V

    .line 56
    .line 57
    .line 58
    :cond_8
    return-void
.end method
