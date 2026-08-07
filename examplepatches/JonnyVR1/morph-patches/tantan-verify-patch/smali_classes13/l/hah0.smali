.class public final synthetic Ll/hah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/SurfaceTextureHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    return-void
.end method


# virtual methods
.method public final onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hah0;->a:Lcom/momo/rtcbase/SurfaceTextureHelper;

    invoke-static {p0, p1}, Lcom/momo/rtcbase/SurfaceTextureHelper;->b(Lcom/momo/rtcbase/SurfaceTextureHelper;Landroid/graphics/SurfaceTexture;)V

    return-void
.end method
