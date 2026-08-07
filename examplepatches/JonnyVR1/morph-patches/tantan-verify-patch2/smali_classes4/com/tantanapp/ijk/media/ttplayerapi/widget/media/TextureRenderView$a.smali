.class public final Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s4m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;

.field public b:Landroid/graphics/SurfaceTexture;

.field public c:Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;Landroid/graphics/SurfaceTexture;Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;)V
    .locals 0
    .param p1    # Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/SurfaceTexture;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;->a:Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;->b:Landroid/graphics/SurfaceTexture;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tantanapp/ijk/media/ttplayerapi/widget/media/TextureRenderView$a;->c:Lcom/tantanapp/ijk/media/player/ISurfaceTextureHost;

    .line 9
    .line 10
    return-void
.end method
