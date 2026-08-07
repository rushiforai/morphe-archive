.class Lcom/ss/bytertc/engine/utils/TextureHelper$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/utils/TextureHelper;->textureToYuv(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

.field final synthetic val$result:[Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

.field final synthetic val$textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/utils/TextureHelper;[Lcom/bytedance/realx/video/VideoFrame$I420Buffer;Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->val$result:[Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->val$textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$502(Lcom/ss/bytertc/engine/utils/TextureHelper;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$600(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/YuvConverter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 16
    .line 17
    new-instance v1, Lcom/bytedance/realx/video/YuvConverter;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/bytedance/realx/video/YuvConverter;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$602(Lcom/ss/bytertc/engine/utils/TextureHelper;Lcom/bytedance/realx/video/YuvConverter;)Lcom/bytedance/realx/video/YuvConverter;

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$000(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 34
    .line 35
    new-instance v1, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 36
    .line 37
    invoke-direct {v1}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$002(Lcom/ss/bytertc/engine/utils/TextureHelper;Lcom/bytedance/realx/video/GlRectDrawer;)Lcom/bytedance/realx/video/GlRectDrawer;

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->val$result:[Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$600(Lcom/ss/bytertc/engine/utils/TextureHelper;)Lcom/bytedance/realx/video/YuvConverter;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->val$textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/bytedance/realx/video/YuvConverter;->convert(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/4 v2, 0x0

    .line 58
    aput-object v1, v0, v2

    .line 59
    .line 60
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 61
    .line 62
    invoke-static {v0, v2}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$502(Lcom/ss/bytertc/engine/utils/TextureHelper;Z)Z

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$700(Lcom/ss/bytertc/engine/utils/TextureHelper;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureHelper$3;->this$0:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 74
    .line 75
    invoke-static {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->access$800(Lcom/ss/bytertc/engine/utils/TextureHelper;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method
