.class final Le/e/a/CommentGraph215$Snapshot;
.super Ljava/lang/Object;
.source "CommentGraph215.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentGraph215;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Snapshot"
.end annotation


# instance fields
.field final bins:[I

.field final count:I

.field final duration:J

.field final id:Ljava/lang/String;

.field final max:I


# direct methods
.method constructor <init>(Ljava/lang/String;J[II)V
    .registers 6

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CommentGraph215$Snapshot;->id:Ljava/lang/String;

    iput-wide p2, p0, Le/e/a/CommentGraph215$Snapshot;->duration:J

    iput-object p4, p0, Le/e/a/CommentGraph215$Snapshot;->bins:[I

    iput p5, p0, Le/e/a/CommentGraph215$Snapshot;->count:I

    array-length p1, p4

    const/4 p2, 0x0

    move p3, p2

    :goto_e
    if-lt p2, p1, :cond_13

    iput p3, p0, Le/e/a/CommentGraph215$Snapshot;->max:I

    return-void

    :cond_13
    aget p5, p4, p2

    invoke-static {p3, p5}, Ljava/lang/Math;->max(II)I

    move-result p3

    add-int/lit8 p2, p2, 0x1

    goto :goto_e
.end method
