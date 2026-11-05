.class Le/e/a/BikeRunRecords$2;
.super Ljava/lang/Object;
.source "BikeRunRecords.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/BikeRunRecords;->highScores()Ljava/util/List;
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


# instance fields
.field final synthetic this$0:Le/e/a/BikeRunRecords;


# direct methods
.method constructor <init>(Le/e/a/BikeRunRecords;)V
    .registers 2

    .line 91
    iput-object p1, p0, Le/e/a/BikeRunRecords$2;->this$0:Le/e/a/BikeRunRecords;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Le/e/a/BikeRunRecords$Entry;Le/e/a/BikeRunRecords$Entry;)I
    .registers 8

    .line 93
    iget-object p1, p1, Le/e/a/BikeRunRecords$Entry;->version:Ljava/lang/String;

    const-string v0, "\\."

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    iget-object p2, p2, Le/e/a/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_10
    const/4 v2, 0x3

    if-lt v1, v2, :cond_14

    return v0

    .line 95
    :cond_14
    new-instance v2, Ljava/math/BigInteger;

    aget-object v3, p1, v1

    invoke-direct {v2, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/math/BigInteger;

    aget-object v4, p2, v1

    invoke-direct {v3, v4}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v3, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    if-eqz v2, :cond_29

    return v2

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_10
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p1, Le/e/a/BikeRunRecords$Entry;

    check-cast p2, Le/e/a/BikeRunRecords$Entry;

    invoke-virtual {p0, p1, p2}, Le/e/a/BikeRunRecords$2;->compare(Le/e/a/BikeRunRecords$Entry;Le/e/a/BikeRunRecords$Entry;)I

    move-result p1

    return p1
.end method
