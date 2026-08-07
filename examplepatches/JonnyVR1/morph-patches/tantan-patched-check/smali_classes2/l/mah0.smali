.class public final synthetic Ll/mah0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/SurfaceTextureHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mah0;->a:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mah0;->a:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    invoke-static {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->c(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V

    return-void
.end method
