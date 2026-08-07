.class Lcom/momo/mcamera/videoencoder/ProcessRender$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/videoprocess/VideoProcessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/videoencoder/ProcessRender;->initPipline(Ll/jt2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/videoencoder/ProcessRender;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFail(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/momo/mcamera/videoprocess/VideoProcessListener;->onFail(Ljava/lang/Exception;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onProcessFinish(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-interface {p0, p1}, Lcom/momo/mcamera/videoprocess/VideoProcessListener;->onProcessFinish(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onProcessProgress(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/momo/mcamera/videoprocess/VideoProcessListener;->onProcessProgress(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/videoencoder/ProcessRender$2;->this$0:Lcom/momo/mcamera/videoencoder/ProcessRender;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/videoencoder/ProcessRender;->access$100(Lcom/momo/mcamera/videoencoder/ProcessRender;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/momo/mcamera/videoprocess/VideoProcessListener;->onStart()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
