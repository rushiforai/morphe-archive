.class public final synthetic Ll/yah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/SurfaceTextureHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yah0;->a:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    return-void
.end method


# virtual methods
.method public final onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yah0;->a:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    invoke-static {p0, p1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->e(Lcom/bytedance/realx/video/SurfaceTextureHelper;Landroid/graphics/SurfaceTexture;)V

    return-void
.end method
