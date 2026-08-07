.class public final synthetic Ll/pse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/EglRenderer;

.field public final synthetic b:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

.field public final synthetic c:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

.field public final synthetic d:F

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/EglRenderer$FrameListener;FZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iput-object p2, p0, Ll/pse;->b:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    iput-object p3, p0, Ll/pse;->c:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

    iput p4, p0, Ll/pse;->d:F

    iput-boolean p5, p0, Ll/pse;->e:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iget-object v1, p0, Ll/pse;->b:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    iget-object v2, p0, Ll/pse;->c:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

    iget v3, p0, Ll/pse;->d:F

    iget-boolean p0, p0, Ll/pse;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Lcom/bytedance/realx/video/EglRenderer;->e(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/RendererCommon$GlDrawer;Lcom/bytedance/realx/video/EglRenderer$FrameListener;FZ)V

    return-void
.end method
