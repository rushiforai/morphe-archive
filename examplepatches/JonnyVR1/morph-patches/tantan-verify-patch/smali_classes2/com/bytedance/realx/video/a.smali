.class public final synthetic Lcom/bytedance/realx/video/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/AndroidVideoDecoder;

.field public final synthetic b:Landroid/os/HandlerThread;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bytedance/realx/video/a;->a:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    iput-object p2, p0, Lcom/bytedance/realx/video/a;->b:Landroid/os/HandlerThread;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/a;->a:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    iget-object p0, p0, Lcom/bytedance/realx/video/a;->b:Landroid/os/HandlerThread;

    invoke-static {v0, p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->b(Lcom/bytedance/realx/video/AndroidVideoDecoder;Landroid/os/HandlerThread;)V

    return-void
.end method
