.class public Lcom/momocv/objectdetect/ObjectDetectParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public detect_all_:Z

.field public object_num_:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momocv/objectdetect/ObjectDetectParams;->detect_all_:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/momocv/objectdetect/ObjectDetectParams;->object_num_:I

    .line 9
    .line 10
    return-void
.end method
