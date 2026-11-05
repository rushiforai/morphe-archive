.class Le/e/a/BikeRunRecords$1;
.super Ljava/lang/Object;
.source "BikeRunRecords.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRunRecords;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Le/e/a/BikeRunRecords$Entry;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Le/e/a/BikeRunRecords$Entry;Le/e/a/BikeRunRecords$Entry;)I
    .registers 10

    .line 24
    iget v0, p1, Le/e/a/BikeRunRecords$Entry;->score:I

    iget v1, p2, Le/e/a/BikeRunRecords$Entry;->score:I

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-eq v0, v1, :cond_11

    iget p1, p1, Le/e/a/BikeRunRecords$Entry;->score:I

    iget p2, p2, Le/e/a/BikeRunRecords$Entry;->score:I

    if-le p1, p2, :cond_f

    goto :goto_10

    :cond_f
    const/4 v2, 0x1

    :goto_10
    return v2

    .line 25
    :cond_11
    iget-wide v0, p1, Le/e/a/BikeRunRecords$Entry;->time:J

    iget-wide v4, p2, Le/e/a/BikeRunRecords$Entry;->time:J

    cmp-long v6, v0, v4

    if-eqz v6, :cond_24

    iget-wide v0, p1, Le/e/a/BikeRunRecords$Entry;->time:J

    iget-wide p1, p2, Le/e/a/BikeRunRecords$Entry;->time:J

    cmp-long v4, v0, p1

    if-gez v4, :cond_22

    goto :goto_23

    :cond_22
    const/4 v2, 0x1

    :goto_23
    return v2

    .line 26
    :cond_24
    iget-object p1, p1, Le/e/a/BikeRunRecords$Entry;->id:Ljava/lang/String;

    iget-object p2, p2, Le/e/a/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p1, Le/e/a/BikeRunRecords$Entry;

    check-cast p2, Le/e/a/BikeRunRecords$Entry;

    invoke-virtual {p0, p1, p2}, Le/e/a/BikeRunRecords$1;->compare(Le/e/a/BikeRunRecords$Entry;Le/e/a/BikeRunRecords$Entry;)I

    move-result p1

    return p1
.end method
