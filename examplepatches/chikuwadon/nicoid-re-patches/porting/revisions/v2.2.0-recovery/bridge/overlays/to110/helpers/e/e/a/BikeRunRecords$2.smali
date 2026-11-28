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

.method private static numericPart(Ljava/lang/String;I)Ljava/math/BigInteger;
    .registers 8

    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    if-eqz p0, :cond_1

    const-string v1, "\\."

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    array-length v2, v1

    if-ge p1, v2, :cond_1

    aget-object v2, v1, p1

    const-string v3, "^[^0-9]*"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "[^0-9].*$"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-object v0
.end method


# virtual methods
.method public compare(Le/e/a/BikeRunRecords$Entry;Le/e/a/BikeRunRecords$Entry;)I
    .registers 9

    iget-object v4, p1, Le/e/a/BikeRunRecords$Entry;->version:Ljava/lang/String;

    iget-object v5, p2, Le/e/a/BikeRunRecords$Entry;->version:Ljava/lang/String;

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    invoke-static {v4, v0}, Le/e/a/BikeRunRecords$2;->numericPart(Ljava/lang/String;I)Ljava/math/BigInteger;

    move-result-object v2

    invoke-static {v5, v0}, Le/e/a/BikeRunRecords$2;->numericPart(Ljava/lang/String;I)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v1

    if-eqz v1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return v0
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
