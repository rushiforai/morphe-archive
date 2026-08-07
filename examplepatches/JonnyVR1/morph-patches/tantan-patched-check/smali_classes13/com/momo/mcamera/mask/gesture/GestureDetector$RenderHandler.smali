.class Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/gesture/GestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RenderHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/gesture/GestureDetector;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;->this$0:Lcom/momo/mcamera/mask/gesture/GestureDetector;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/CVDetector;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Lcom/core/glcore/cv/MMCVBoxes;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;->gestureDetect(Lcom/core/glcore/cv/MMCVBoxes;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
