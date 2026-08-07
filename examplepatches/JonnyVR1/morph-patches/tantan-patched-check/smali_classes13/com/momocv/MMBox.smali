.class public Lcom/momocv/MMBox;
.super Lcom/momocv/MMRect;
.source "SourceFile"


# instance fields
.field public class_index_:I

.field public class_name_:Ljava/lang/String;

.field public score_:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momocv/MMRect;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momocv/MMBox;->score_:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/momocv/MMBox;->class_index_:I

    .line 9
    .line 10
    const-string v0, "NAN"

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method
