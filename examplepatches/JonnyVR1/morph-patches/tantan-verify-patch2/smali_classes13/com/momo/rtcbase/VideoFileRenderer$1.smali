.class Lcom/momo/rtcbase/VideoFileRenderer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/VideoFileRenderer;-><init>(Ljava/lang/String;IILcom/momo/rtcbase/EglBase$Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/VideoFileRenderer;

.field final synthetic val$sharedContext:Lcom/momo/rtcbase/EglBase$Context;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/VideoFileRenderer;Lcom/momo/rtcbase/EglBase$Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/VideoFileRenderer$1;->this$0:Lcom/momo/rtcbase/VideoFileRenderer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/VideoFileRenderer$1;->val$sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/VideoFileRenderer$1;->this$0:Lcom/momo/rtcbase/VideoFileRenderer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/VideoFileRenderer$1;->val$sharedContext:Lcom/momo/rtcbase/EglBase$Context;

    .line 4
    .line 5
    sget-object v2, Lcom/momo/rtcbase/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 6
    .line 7
    invoke-static {v1, v2}, Lcom/momo/rtcbase/EglBase;->create(Lcom/momo/rtcbase/EglBase$Context;[I)Lcom/momo/rtcbase/EglBase;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Lcom/momo/rtcbase/VideoFileRenderer;->access$002(Lcom/momo/rtcbase/VideoFileRenderer;Lcom/momo/rtcbase/EglBase;)Lcom/momo/rtcbase/EglBase;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/rtcbase/VideoFileRenderer$1;->this$0:Lcom/momo/rtcbase/VideoFileRenderer;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/momo/rtcbase/VideoFileRenderer;->access$000(Lcom/momo/rtcbase/VideoFileRenderer;)Lcom/momo/rtcbase/EglBase;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->createDummyPbufferSurface()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/rtcbase/VideoFileRenderer$1;->this$0:Lcom/momo/rtcbase/VideoFileRenderer;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/momo/rtcbase/VideoFileRenderer;->access$000(Lcom/momo/rtcbase/VideoFileRenderer;)Lcom/momo/rtcbase/EglBase;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->makeCurrent()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/rtcbase/VideoFileRenderer$1;->this$0:Lcom/momo/rtcbase/VideoFileRenderer;

    .line 33
    .line 34
    new-instance v0, Lcom/momo/rtcbase/YuvConverter;

    .line 35
    .line 36
    invoke-direct {v0}, Lcom/momo/rtcbase/YuvConverter;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {p0, v0}, Lcom/momo/rtcbase/VideoFileRenderer;->access$102(Lcom/momo/rtcbase/VideoFileRenderer;Lcom/momo/rtcbase/YuvConverter;)Lcom/momo/rtcbase/YuvConverter;

    .line 40
    .line 41
    .line 42
    return-void
.end method
