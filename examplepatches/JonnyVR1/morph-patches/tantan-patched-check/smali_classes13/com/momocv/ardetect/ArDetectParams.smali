.class public Lcom/momocv/ardetect/ArDetectParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public frame_interval_:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    iput v0, p0, Lcom/momocv/ardetect/ArDetectParams;->frame_interval_:I

    .line 6
    .line 7
    return-void
.end method
