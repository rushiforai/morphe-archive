.class public final Le/e/a/internal/classic131/BikeRunRecords$Entry;
.super Ljava/lang/Object;
.source "BikeRunRecords.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/internal/classic131/BikeRunRecords;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field public final id:Ljava/lang/String;

.field public final score:I

.field public final time:J

.field public final version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JILjava/lang/String;)V
    .registers 9

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 16
    const-string v0, "[0-9]+\\.[0-9]+\\.[0-9]+(-[a-zA-Z0-9.-]+)?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_0

    if-ltz p4, :cond_0

    if-eqz p5, :cond_0

    const-string v0, "[a-zA-Z0-9-]+"

    invoke-virtual {p5, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 17
    iput-object p1, p0, Le/e/a/internal/classic131/BikeRunRecords$Entry;->version:Ljava/lang/String;

    iput-wide p2, p0, Le/e/a/internal/classic131/BikeRunRecords$Entry;->time:J

    iput p4, p0, Le/e/a/internal/classic131/BikeRunRecords$Entry;->score:I

    iput-object p5, p0, Le/e/a/internal/classic131/BikeRunRecords$Entry;->id:Ljava/lang/String;

    return-void

    .line 16
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method
