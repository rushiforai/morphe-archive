.class public final synthetic Ll/dte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/EglRenderer;

.field public final synthetic b:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

.field public final synthetic c:Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;

.field public final synthetic d:F

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/EglRenderer;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;FZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dte;->a:Lcom/ss/bytertc/base/media/EglRenderer;

    iput-object p2, p0, Ll/dte;->b:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    iput-object p3, p0, Ll/dte;->c:Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;

    iput p4, p0, Ll/dte;->d:F

    iput-boolean p5, p0, Ll/dte;->e:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dte;->a:Lcom/ss/bytertc/base/media/EglRenderer;

    iget-object v1, p0, Ll/dte;->b:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    iget-object v2, p0, Ll/dte;->c:Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;

    iget v3, p0, Ll/dte;->d:F

    iget-boolean p0, p0, Ll/dte;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Lcom/ss/bytertc/base/media/EglRenderer;->a(Lcom/ss/bytertc/base/media/EglRenderer;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/ss/bytertc/base/media/EglRenderer$FrameListener;FZ)V

    return-void
.end method
