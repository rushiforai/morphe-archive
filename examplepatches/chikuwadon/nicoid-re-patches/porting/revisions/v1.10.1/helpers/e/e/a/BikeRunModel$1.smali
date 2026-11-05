.class Le/e/a/BikeRunModel$1;
.super Ljava/util/LinkedHashMap;
.source "BikeRunModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRunModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/Long;",
        "Le/e/a/BikeRunModel$Profile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/BikeRunModel;


# direct methods
.method constructor <init>(Le/e/a/BikeRunModel;IFZ)V
    .registers 5

    .line 24
    iput-object p1, p0, Le/e/a/BikeRunModel$1;->this$0:Le/e/a/BikeRunModel;

    invoke-direct {p0, p2, p3, p4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Long;",
            "Le/e/a/BikeRunModel$Profile;",
            ">;)Z"
        }
    .end annotation

    .line 28
    invoke-virtual {p0}, Le/e/a/BikeRunModel$1;->size()I

    move-result p1

    const/4 v0, 0x4

    if-le p1, v0, :cond_9

    const/4 p1, 0x1

    return p1

    :cond_9
    const/4 p1, 0x0

    return p1
.end method
