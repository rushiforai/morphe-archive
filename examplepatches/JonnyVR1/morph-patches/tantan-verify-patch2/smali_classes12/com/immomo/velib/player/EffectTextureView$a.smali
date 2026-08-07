.class Lcom/immomo/velib/player/EffectTextureView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/velib/player/EffectTextureView;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/velib/player/EffectTextureView;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/player/EffectTextureView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/player/EffectTextureView$a;->a:Lcom/immomo/velib/player/EffectTextureView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/immomo/velib/player/EffectTextureView$a;->a:Lcom/immomo/velib/player/EffectTextureView;

    .line 2
    .line 3
    iget-object p3, p2, Lcom/immomo/velib/player/EffectTextureView;->a:Lcom/immomo/velib/player/d;

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean p2, p2, Lcom/immomo/velib/player/EffectTextureView;->b:Z

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-interface {p3, p1}, Lcom/immomo/velib/player/d;->d(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/immomo/velib/player/EffectTextureView$a;->a:Lcom/immomo/velib/player/EffectTextureView;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/immomo/velib/player/EffectTextureView;->b:Z

    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    const/4 p0, 0x0

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
