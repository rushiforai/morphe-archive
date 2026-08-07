.class Lcom/momo/rtcbase/AndroidVideoDecoder$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/AndroidVideoDecoder;->createOutputThread()Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/AndroidVideoDecoder;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/AndroidVideoDecoder;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder$1;->this$0:Lcom/momo/rtcbase/AndroidVideoDecoder;

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
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder$1;->this$0:Lcom/momo/rtcbase/AndroidVideoDecoder;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->access$002(Lcom/momo/rtcbase/AndroidVideoDecoder;Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;)Lcom/momo/rtcbase/ThreadUtils$ThreadChecker;

    .line 9
    .line 10
    .line 11
    :goto_0
    iget-object v0, p0, Lcom/momo/rtcbase/AndroidVideoDecoder$1;->this$0:Lcom/momo/rtcbase/AndroidVideoDecoder;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/momo/rtcbase/AndroidVideoDecoder;->access$100(Lcom/momo/rtcbase/AndroidVideoDecoder;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/momo/rtcbase/AndroidVideoDecoder$1;->this$0:Lcom/momo/rtcbase/AndroidVideoDecoder;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->deliverDecodedFrame()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {v1}, Lcom/momo/rtcbase/AndroidVideoDecoder;->access$200(Lcom/momo/rtcbase/AndroidVideoDecoder;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
