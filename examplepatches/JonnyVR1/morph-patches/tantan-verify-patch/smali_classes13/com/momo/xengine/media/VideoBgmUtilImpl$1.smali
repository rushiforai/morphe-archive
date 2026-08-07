.class Lcom/momo/xengine/media/VideoBgmUtilImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xengine/media/VideoBgmUtilImpl;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xengine/media/VideoBgmUtilImpl;


# direct methods
.method public constructor <init>(Lcom/momo/xengine/media/VideoBgmUtilImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl$1;->this$0:Lcom/momo/xengine/media/VideoBgmUtilImpl;

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
    iget-object p0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl$1;->this$0:Lcom/momo/xengine/media/VideoBgmUtilImpl;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->access$000(Lcom/momo/xengine/media/VideoBgmUtilImpl;)Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;->onProcess(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onResult(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl$1;->this$0:Lcom/momo/xengine/media/VideoBgmUtilImpl;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->access$000(Lcom/momo/xengine/media/VideoBgmUtilImpl;)Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;->onResult(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
