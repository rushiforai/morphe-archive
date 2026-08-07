.class Lcom/momo/rtcbase/FileVideoCapturer$1;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/FileVideoCapturer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/FileVideoCapturer;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/FileVideoCapturer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/FileVideoCapturer$1;->this$0:Lcom/momo/rtcbase/FileVideoCapturer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/FileVideoCapturer$1;->this$0:Lcom/momo/rtcbase/FileVideoCapturer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/FileVideoCapturer;->tick()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
