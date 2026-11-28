.class final Lcom/google/common/util/concurrent/Striped$PaddedSemaphore;
.super Ljava/util/concurrent/Semaphore;
.source "Striped.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/Striped;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PaddedSemaphore"
.end annotation


# instance fields
.field unused1:J

.field unused2:J

.field unused3:J


# direct methods
.method constructor <init>(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permits"
        }
    .end annotation

    const/4 v0, 0x0

    .line 551
    invoke-direct {p0, p1, v0}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    return-void
.end method
