.class final Le/e/a/TabPlayback110$Queue;
.super Ljava/lang/Object;
.source "TabPlayback110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/TabPlayback110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Queue"
.end annotation


# instance fields
.field cursor:I

.field mode:I

.field rows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field tab:Ljava/lang/String;

.field token:J


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/ArrayList;II)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;II)V"
        }
    .end annotation

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-wide v0, Le/e/a/TabPlayback110;->serial:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sput-wide v0, Le/e/a/TabPlayback110;->serial:J

    iput-wide v0, p0, Le/e/a/TabPlayback110$Queue;->token:J

    iput-object p1, p0, Le/e/a/TabPlayback110$Queue;->tab:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/TabPlayback110$Queue;->rows:Ljava/util/ArrayList;

    iput p3, p0, Le/e/a/TabPlayback110$Queue;->cursor:I

    iput p4, p0, Le/e/a/TabPlayback110$Queue;->mode:I

    return-void
.end method
