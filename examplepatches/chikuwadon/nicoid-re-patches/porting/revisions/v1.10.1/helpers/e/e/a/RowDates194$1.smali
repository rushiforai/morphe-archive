.class Le/e/a/RowDates194$1;
.super Ljava/util/LinkedHashMap;
.source "RowDates194.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/RowDates194;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(IFZ)V
    .registers 4

    .line 12
    invoke-direct {p0, p1, p2, p3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    .line 12
    invoke-virtual {p0}, Le/e/a/RowDates194$1;->size()I

    move-result p1

    const/16 v0, 0x100

    if-le p1, v0, :cond_a

    const/4 p1, 0x1

    return p1

    :cond_a
    const/4 p1, 0x0

    return p1
.end method
