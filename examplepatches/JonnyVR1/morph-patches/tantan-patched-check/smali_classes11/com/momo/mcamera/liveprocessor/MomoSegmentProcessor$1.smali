.class Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->process(Ll/omw;)Lcom/momocv/segmentation/SegmentationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;

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
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->access$200(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;)Lcom/momocv/segmentation/Segmentation;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->access$100(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Lcom/momocv/segmentation/Segmentation;->LoadModel(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v0, v1}, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->access$002(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;Z)Z

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor$1;->this$0:Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {p0, v0}, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->access$302(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;Z)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method
