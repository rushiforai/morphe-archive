.class Lcom/ss/bytertc/engine/ui/VideoFrameRender$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/ui/VideoFrameRender$SurfaceLifecycleCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/ui/VideoFrameRender;-><init>(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/ui/VideoFrameRender;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender$1;->this$0:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCreated()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender$1;->this$0:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->access$000(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const-string p0, "VideoFrameRender"

    .line 16
    .line 17
    const-string v0, "Already has an another surface created."

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender$1;->this$0:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->access$100(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lcom/ss/bytertc/engine/ui/VideoFrameRender$1;->this$0:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->access$000(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->access$000(Lcom/ss/bytertc/engine/ui/VideoFrameRender;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    const-string p0, "VideoFrameRender"

    .line 36
    .line 37
    const-string v0, "Already has an another surface destroyed."

    .line 38
    .line 39
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
