.class Le/e/a/Media3VideoPlayer$3;
.super Ljava/lang/Object;
.source "Media3VideoPlayer.java"

# interfaces
.implements Landroidx/media3/exoplayer/analytics/AnalyticsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Media3VideoPlayer;-><init>(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/Media3VideoPlayer;


# direct methods
.method constructor <init>(Le/e/a/Media3VideoPlayer;)V
    .registers 2

    .line 113
    iput-object p1, p0, Le/e/a/Media3VideoPlayer$3;->this$0:Le/e/a/Media3VideoPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBandwidthEstimate(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;IJJ)V
    .registers 13

    iget-wide v0, p1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->currentPlaybackPositionMs:J

    const-wide/16 v2, 0x3a98

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bandwidthEstimate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " bytes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " elapsedMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid-quality236"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public onDownstreamFormatChanged(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/exoplayer/source/MediaLoadData;)V
    .registers 8

    iget v0, p2, Landroidx/media3/exoplayer/source/MediaLoadData;->trackType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p2, Landroidx/media3/exoplayer/source/MediaLoadData;->trackFormat:Landroidx/media3/common/Format;

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "video "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroidx/media3/common/Format;->width:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroidx/media3/common/Format;->height:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " bitrate="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroidx/media3/common/Format;->bitrate:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " reason="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p2, Landroidx/media3/exoplayer/source/MediaLoadData;->trackSelectionReason:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " posMs="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->currentPlaybackPositionMs:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid-quality236"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public onRenderedFirstFrame(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Ljava/lang/Object;J)V
    .registers 5

    .line 116
    iget-object p1, p0, Le/e/a/Media3VideoPlayer$3;->this$0:Le/e/a/Media3VideoPlayer;

    invoke-static {p1, p2}, Le/e/a/Media3VideoPlayer;->access$9(Le/e/a/Media3VideoPlayer;Ljava/lang/Object;)V

    .line 117
    iget-object p1, p0, Le/e/a/Media3VideoPlayer$3;->this$0:Le/e/a/Media3VideoPlayer;

    # getter for: Le/e/a/Media3VideoPlayer;->popupReady:Ljava/lang/Runnable;
    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->access$10(Le/e/a/Media3VideoPlayer;)Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/Media3VideoPlayer$3;->this$0:Le/e/a/Media3VideoPlayer;

    # getter for: Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;
    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->access$11(Le/e/a/Media3VideoPlayer;)Landroid/view/Surface;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/Media3VideoPlayer$3;->this$0:Le/e/a/Media3VideoPlayer;

    # getter for: Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;
    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->access$11(Le/e/a/Media3VideoPlayer;)Landroid/view/Surface;

    move-result-object p1

    if-ne p2, p1, :cond_0

    .line 118
    iget-object p0, p0, Le/e/a/Media3VideoPlayer$3;->this$0:Le/e/a/Media3VideoPlayer;

    const-string p1, "first frame"

    # invokes: Le/e/a/Media3VideoPlayer;->completePopupOutput(Ljava/lang/String;)V
    invoke-static {p0, p1}, Le/e/a/Media3VideoPlayer;->access$12(Le/e/a/Media3VideoPlayer;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
