.class public Lcom/momocv/handgesture/HandGestureParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public ansyc_detect_:Z

.field public detect_all_:Z

.field public handgesture_type_:I

.field public skip4det_:I

.field public use2hands_:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momocv/handgesture/HandGestureParams;->detect_all_:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momocv/handgesture/HandGestureParams;->use2hands_:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/momocv/handgesture/HandGestureParams;->ansyc_detect_:Z

    .line 11
    .line 12
    iput v0, p0, Lcom/momocv/handgesture/HandGestureParams;->handgesture_type_:I

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    iput v0, p0, Lcom/momocv/handgesture/HandGestureParams;->skip4det_:I

    .line 16
    .line 17
    return-void
.end method
