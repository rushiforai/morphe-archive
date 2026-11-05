.class final Le/e/a/SeriesPlayback$QueueState;
.super Ljava/lang/Object;
.source "SeriesPlayback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SeriesPlayback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "QueueState"
.end annotation


# instance fields
.field repeat:Z

.field series:Ljava/lang/String;

.field touched:Z


# direct methods
.method constructor <init>(Z)V
    .registers 2

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Le/e/a/SeriesPlayback$QueueState;->repeat:Z

    return-void
.end method
