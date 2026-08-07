.class public Lcom/momocv/imgloader/ImageLoaderInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mmframe_:Lcom/momocv/MMFrame;

.field public scale_ratio_:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/momocv/imgloader/ImageLoaderInfo;->scale_ratio_:F

    .line 7
    .line 8
    return-void
.end method
