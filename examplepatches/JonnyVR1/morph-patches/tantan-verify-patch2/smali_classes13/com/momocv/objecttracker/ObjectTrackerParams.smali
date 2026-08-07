.class public Lcom/momocv/objecttracker/ObjectTrackerParams;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public rect_:Lcom/momocv/MMRect;

.field public update_model_:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/momocv/objecttracker/ObjectTrackerParams;->update_model_:Z

    .line 6
    .line 7
    return-void
.end method
