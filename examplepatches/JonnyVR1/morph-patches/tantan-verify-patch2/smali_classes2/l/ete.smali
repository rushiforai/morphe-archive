.class public final synthetic Ll/ete;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/EglRenderer;

.field public final synthetic b:Ljava/util/concurrent/CountDownLatch;

.field public final synthetic c:Lcom/bytedance/realx/video/EglRenderer$FrameListener;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/bytedance/realx/video/EglRenderer$FrameListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ete;->a:Lcom/bytedance/realx/video/EglRenderer;

    iput-object p2, p0, Ll/ete;->b:Ljava/util/concurrent/CountDownLatch;

    iput-object p3, p0, Ll/ete;->c:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ete;->a:Lcom/bytedance/realx/video/EglRenderer;

    iget-object v1, p0, Ll/ete;->b:Ljava/util/concurrent/CountDownLatch;

    iget-object p0, p0, Ll/ete;->c:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

    invoke-static {v0, v1, p0}, Lcom/bytedance/realx/video/EglRenderer;->g(Lcom/bytedance/realx/video/EglRenderer;Ljava/util/concurrent/CountDownLatch;Lcom/bytedance/realx/video/EglRenderer$FrameListener;)V

    return-void
.end method
