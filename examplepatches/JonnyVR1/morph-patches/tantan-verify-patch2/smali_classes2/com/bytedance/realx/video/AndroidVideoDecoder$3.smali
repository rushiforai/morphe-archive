.class Lcom/bytedance/realx/video/AndroidVideoDecoder$3;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bytedance/realx/video/AndroidVideoDecoder;->createOutputThread()Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$3;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$3;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$700(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder$3;->this$0:Lcom/bytedance/realx/video/AndroidVideoDecoder;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->deliverDecodedFrame()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->access$800(Lcom/bytedance/realx/video/AndroidVideoDecoder;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
