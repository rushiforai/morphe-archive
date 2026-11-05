.class final Le/e/a/Mp4Transfer115$Track;
.super Ljava/lang/Object;
.source "Mp4Transfer115.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Mp4Transfer115;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Track"
.end annotation


# instance fields
.field extractor:Landroid/media/MediaExtractor;

.field first:J

.field last:J

.field target:I


# direct methods
.method constructor <init>(Landroid/media/MediaExtractor;I)V
    .registers 5

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Le/e/a/Mp4Transfer115$Track;->last:J

    iput-object p1, p0, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    iput p2, p0, Le/e/a/Mp4Transfer115$Track;->target:I

    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/Mp4Transfer115$Track;->first:J

    return-void
.end method
