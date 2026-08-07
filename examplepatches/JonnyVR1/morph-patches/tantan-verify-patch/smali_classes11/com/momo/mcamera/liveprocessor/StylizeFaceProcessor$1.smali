.class Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->process(Ll/omw;)Lcom/momocv/stylizeface/StylizefaceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->access$200(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;)Lcom/momocv/stylizeface/Stylizeface;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->access$100(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Lcom/momocv/stylizeface/Stylizeface;->LoadModel(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v0, v1}, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->access$002(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;Z)Z

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {p0, v0}, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->access$302(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;Z)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method
