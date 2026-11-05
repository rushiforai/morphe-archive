.class final Le/e/a/SeekFeedback239$Ink;
.super Ljava/lang/Object;
.source "SeekFeedback239.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SeekFeedback239;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Ink"
.end annotation


# instance fields
.field final delta:Landroid/graphics/Paint$FontMetrics;

.field final main:Landroid/graphics/Paint$FontMetrics;

.field final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>()V
    .registers 3

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/SeekFeedback239$Ink;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object v0, p0, Le/e/a/SeekFeedback239$Ink;->main:Landroid/graphics/Paint$FontMetrics;

    new-instance v0, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object v0, p0, Le/e/a/SeekFeedback239$Ink;->delta:Landroid/graphics/Paint$FontMetrics;

    return-void
.end method
