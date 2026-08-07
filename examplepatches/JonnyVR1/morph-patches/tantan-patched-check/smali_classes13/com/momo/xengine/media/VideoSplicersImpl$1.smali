.class Lcom/momo/xengine/media/VideoSplicersImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xengine/media/VideoSplicersImpl;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xengine/media/VideoSplicersImpl;


# direct methods
.method public constructor <init>(Lcom/momo/xengine/media/VideoSplicersImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoSplicersImpl$1;->this$0:Lcom/momo/xengine/media/VideoSplicersImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onProcess(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoSplicersImpl$1;->this$0:Lcom/momo/xengine/media/VideoSplicersImpl;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xengine/media/VideoSplicersImpl;->access$000(Lcom/momo/xengine/media/VideoSplicersImpl;)Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;->onProcess(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onResult(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl$1;->this$0:Lcom/momo/xengine/media/VideoSplicersImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xengine/media/VideoSplicersImpl;->access$100(Lcom/momo/xengine/media/VideoSplicersImpl;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl$1;->this$0:Lcom/momo/xengine/media/VideoSplicersImpl;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/momo/xengine/media/VideoSplicersImpl;->access$200(Lcom/momo/xengine/media/VideoSplicersImpl;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/xengine/media/VideoSplicersImpl$1;->this$0:Lcom/momo/xengine/media/VideoSplicersImpl;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/momo/xengine/media/VideoSplicersImpl;->access$000(Lcom/momo/xengine/media/VideoSplicersImpl;)Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1}, Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;->onResult(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
