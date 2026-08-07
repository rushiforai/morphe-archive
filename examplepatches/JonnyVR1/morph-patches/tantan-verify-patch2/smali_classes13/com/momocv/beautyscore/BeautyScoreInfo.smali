.class public Lcom/momocv/beautyscore/BeautyScoreInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public beauty_score:F

.field public beauty_type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/momocv/beautyscore/BeautyScoreInfo;->beauty_score:F

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/momocv/beautyscore/BeautyScoreInfo;->beauty_type:I

    .line 10
    .line 11
    return-void
.end method
