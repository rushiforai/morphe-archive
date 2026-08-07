.class public final synthetic Lcom/bytedance/realx/video/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/HardwareVideoEncoder;

.field public final synthetic b:Landroid/os/HandlerThread;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/HardwareVideoEncoder;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/realx/video/c;->a:Lcom/bytedance/realx/video/HardwareVideoEncoder;

    iput-object p2, p0, Lcom/bytedance/realx/video/c;->b:Landroid/os/HandlerThread;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/c;->a:Lcom/bytedance/realx/video/HardwareVideoEncoder;

    iget-object p0, p0, Lcom/bytedance/realx/video/c;->b:Landroid/os/HandlerThread;

    invoke-static {v0, p0}, Lcom/bytedance/realx/video/HardwareVideoEncoder;->b(Lcom/bytedance/realx/video/HardwareVideoEncoder;Landroid/os/HandlerThread;)V

    return-void
.end method
