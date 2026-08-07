.class Lcom/bytedance/realx/video/EglRenderer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bytedance/realx/video/EglRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bytedance/realx/video/EglRenderer;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/EglRenderer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer$2;->this$0:Lcom/bytedance/realx/video/EglRenderer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/EglRenderer$2;->this$0:Lcom/bytedance/realx/video/EglRenderer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bytedance/realx/video/EglRenderer;->access$200(Lcom/bytedance/realx/video/EglRenderer;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/realx/video/EglRenderer$2;->this$0:Lcom/bytedance/realx/video/EglRenderer;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p0, v1}, Lcom/bytedance/realx/video/EglRenderer;->access$302(Lcom/bytedance/realx/video/EglRenderer;Landroid/os/Handler;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method
