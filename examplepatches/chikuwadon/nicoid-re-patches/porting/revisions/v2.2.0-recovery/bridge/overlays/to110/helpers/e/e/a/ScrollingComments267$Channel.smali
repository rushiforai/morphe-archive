.class final Le/e/a/ScrollingComments267$Channel;
.super Ljava/lang/Object;
.source "ScrollingComments267.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ScrollingComments267;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Channel"
.end annotation


# instance fields
.field admitMaxNs:J

.field admitNs:J

.field batchDuration:I

.field batchPreviousVideo:F

.field batchRate:F

.field batchVideo:F

.field batchVisual:F

.field frames:J

.field generation:J

.field glyphMaxNs:J

.field glyphNs:J

.field final hidden:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Le/e/a/CommentSource280$Item;",
            ">;"
        }
    .end annotation
.end field

.field final intervalMs:[I

.field lastDrawEndNs:J

.field lastFrameNs:J

.field longGaps:J

.field longestGapNs:J

.field outsideMaxNs:J

.field outsideNs:J

.field outsideSamples:J

.field final pending:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Le/e/a/CommentSource280$Item;",
            ">;"
        }
    .end annotation
.end field

.field previousVideo:F

.field renderMaxNs:J

.field renderNs:J

.field scanMaxNs:J

.field scanNs:J

.field final source:Le/e/a/CommentSource280;

.field tracedCaller:Z

.field windowStartedNs:J


# direct methods
.method constructor <init>()V
    .registers 3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Le/e/a/CommentSource280;

    invoke-direct {v0}, Le/e/a/CommentSource280;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$Channel;->source:Le/e/a/CommentSource280;

    .line 26
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$Channel;->hidden:Ljava/util/ArrayDeque;

    .line 29
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$Channel;->pending:Ljava/util/ArrayDeque;

    .line 30
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    iput v0, p0, Le/e/a/ScrollingComments267$Channel;->previousVideo:F

    .line 33
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Le/e/a/ScrollingComments267$Channel;->generation:J

    .line 39
    const/16 v0, 0x65

    new-array v0, v0, [I

    iput-object v0, p0, Le/e/a/ScrollingComments267$Channel;->intervalMs:[I

    .line 23
    return-void
.end method
