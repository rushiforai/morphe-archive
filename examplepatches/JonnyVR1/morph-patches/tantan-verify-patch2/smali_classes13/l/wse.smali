.class public final synthetic Ll/wse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/EglRenderer;

.field public final synthetic b:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

.field public final synthetic c:Lcom/momo/rtcbase/EglRenderer$FrameListener;

.field public final synthetic d:F

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/EglRenderer$FrameListener;FZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wse;->a:Lcom/momo/rtcbase/EglRenderer;

    iput-object p2, p0, Ll/wse;->b:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    iput-object p3, p0, Ll/wse;->c:Lcom/momo/rtcbase/EglRenderer$FrameListener;

    iput p4, p0, Ll/wse;->d:F

    iput-boolean p5, p0, Ll/wse;->e:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wse;->a:Lcom/momo/rtcbase/EglRenderer;

    iget-object v1, p0, Ll/wse;->b:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    iget-object v2, p0, Ll/wse;->c:Lcom/momo/rtcbase/EglRenderer$FrameListener;

    iget v3, p0, Ll/wse;->d:F

    iget-boolean p0, p0, Ll/wse;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Lcom/momo/rtcbase/EglRenderer;->f(Lcom/momo/rtcbase/EglRenderer;Lcom/momo/rtcbase/RendererCommon$GlDrawer;Lcom/momo/rtcbase/EglRenderer$FrameListener;FZ)V

    return-void
.end method
