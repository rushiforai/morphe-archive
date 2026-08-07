.class Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->stopThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

.field final synthetic val$I4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

.field final synthetic val$rotateFilter:Lcom/tencent/liteav/basic/c/h;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Lcom/tencent/liteav/basic/c/h;Lcom/tencent/liteav/beauty/b/k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->val$rotateFilter:Lcom/tencent/liteav/basic/c/h;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->val$I4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->val$rotateFilter:Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->val$I4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$100(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 24
    .line 25
    const-string v1, "CustomCapture release"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$300(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$100(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/d;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->p()V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method
