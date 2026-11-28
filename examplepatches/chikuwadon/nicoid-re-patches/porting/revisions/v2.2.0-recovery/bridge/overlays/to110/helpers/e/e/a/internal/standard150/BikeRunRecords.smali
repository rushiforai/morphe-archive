.class public final Le/e/a/internal/standard150/BikeRunRecords;
.super Ljava/lang/Object;
.source "BikeRunRecords.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/internal/standard150/BikeRunRecords$Entry;
    }
.end annotation


# static fields
.field public static final BEST_LIMIT:I = 0xa

.field private static final ORDER:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Le/e/a/internal/standard150/BikeRunRecords$Entry;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECENT_LIMIT:I = 0x1e


# instance fields
.field private final best:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/internal/standard150/BikeRunRecords$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final recent:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/internal/standard150/BikeRunRecords$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 22
    new-instance v0, Le/e/a/internal/standard150/BikeRunRecords$1;

    invoke-direct {v0}, Le/e/a/internal/standard150/BikeRunRecords$1;-><init>()V

    sput-object v0, Le/e/a/internal/standard150/BikeRunRecords;->ORDER:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 14

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    if-eqz p1, :cond_5

    .line 30
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0xf4240

    if-le v0, v1, :cond_0

    goto/16 :goto_2

    .line 31
    :cond_0
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v0, :cond_1

    .line 40
    invoke-direct {p0}, Le/e/a/internal/standard150/BikeRunRecords;->trimBest()V

    return-void

    .line 31
    :cond_1
    aget-object v3, p1, v2

    .line 33
    :try_start_0
    const-string v4, ","

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 34
    array-length v4, v3

    const/4 v5, 0x5

    if-eq v4, v5, :cond_2

    goto :goto_1

    .line 35
    :cond_2
    new-instance v4, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    const/4 v5, 0x1

    aget-object v7, v3, v5

    const/4 v5, 0x2

    aget-object v5, v3, v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    const/4 v5, 0x3

    aget-object v5, v3, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    const/4 v5, 0x4

    aget-object v11, v3, v5

    move-object v6, v4

    invoke-direct/range {v6 .. v11}, Le/e/a/internal/standard150/BikeRunRecords$Entry;-><init>(Ljava/lang/String;JILjava/lang/String;)V

    .line 36
    aget-object v5, v3, v1

    const-string v6, "R"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/16 v6, 0x1e

    if-ge v5, v6, :cond_3

    iget-object v5, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    iget-object v6, v4, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-static {v5, v6}, Le/e/a/internal/standard150/BikeRunRecords;->contains(Ljava/util/List;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    iget-object v5, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    :cond_3
    aget-object v3, v3, v1

    const-string v5, "B"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    iget-object v5, v4, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-static {v3, v5}, Le/e/a/internal/standard150/BikeRunRecords;->contains(Ljava/util/List;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_4
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    return-void
.end method

.method private static append(Ljava/lang/StringBuilder;Ljava/lang/String;Le/e/a/internal/standard150/BikeRunRecords$Entry;)V
    .registers 5

    .line 115
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x2c

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v0, p2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-wide v0, p2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->time:J

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v0, p2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->score:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method private static contains(Ljava/util/List;Ljava/lang/String;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Le/e/a/internal/standard150/BikeRunRecords$Entry;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 43
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v0, v0, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0
.end method

.method private trimBest()V
    .registers 6

    .line 53
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    sget-object v1, Le/e/a/internal/standard150/BikeRunRecords;->ORDER:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 54
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-gez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_1
    if-le v1, v0, :cond_2

    const/16 v1, 0xa

    if-le v2, v1, :cond_1

    .line 57
    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 56
    :cond_2
    iget-object v3, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v3, v3, Le/e/a/internal/standard150/BikeRunRecords$Entry;->version:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v4, v4, Le/e/a/internal/standard150/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    add-int/lit8 v2, v2, 0x1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public add(Le/e/a/internal/standard150/BikeRunRecords$Entry;)Z
    .registers 5

    .line 47
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    iget-object v1, p1, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-static {v0, v1}, Le/e/a/internal/standard150/BikeRunRecords;->contains(Ljava/util/List;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    iget-object v2, p1, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-static {v0, v2}, Le/e/a/internal/standard150/BikeRunRecords;->contains(Ljava/util/List;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 48
    :cond_0
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 49
    :goto_0
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x1e

    const/4 v2, 0x1

    if-gt v0, v1, :cond_1

    .line 50
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Le/e/a/internal/standard150/BikeRunRecords;->trimBest()V

    return v2

    .line 49
    :cond_1
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    :goto_1
    return v1
.end method

.method public best(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/internal/standard150/BikeRunRecords$Entry;",
            ">;"
        }
    .end annotation

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    return-object v0

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v3, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public encode()Ljava/lang/String;
    .registers 5

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 111
    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 111
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    const-string v3, "B"

    invoke-static {v0, v3, v1}, Le/e/a/internal/standard150/BikeRunRecords;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Le/e/a/internal/standard150/BikeRunRecords$Entry;)V

    goto :goto_1

    .line 110
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    const-string v3, "R"

    invoke-static {v0, v3, v2}, Le/e/a/internal/standard150/BikeRunRecords;->append(Ljava/lang/StringBuilder;Ljava/lang/String;Le/e/a/internal/standard150/BikeRunRecords$Entry;)V

    goto :goto_0
.end method

.method public highScores()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Le/e/a/internal/standard150/BikeRunRecords$Entry;",
            ">;"
        }
    .end annotation

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 86
    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 91
    new-instance v1, Le/e/a/internal/standard150/BikeRunRecords$2;

    invoke-direct {v1, p0}, Le/e/a/internal/standard150/BikeRunRecords$2;-><init>(Le/e/a/internal/standard150/BikeRunRecords;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v0

    .line 86
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    .line 88
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 89
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 88
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v4, v4, Le/e/a/internal/standard150/BikeRunRecords$Entry;->version:Ljava/lang/String;

    iget-object v5, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0
.end method

.method public migrateBeforeRelease(I)V
    .registers 13

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 68
    :goto_0
    iget-object v2, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_5

    const/4 v1, 0x0

    .line 72
    :goto_1
    iget-object v2, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_4

    .line 77
    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 78
    invoke-direct {p0}, Le/e/a/internal/standard150/BikeRunRecords;->trimBest()V

    if-lez p1, :cond_2

    .line 79
    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget v0, v0, Le/e/a/internal/standard150/BikeRunRecords$Entry;->score:I

    if-le p1, v0, :cond_2

    .line 80
    :cond_1
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    new-instance v7, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    const-wide/16 v3, 0x0

    const-string v6, "legacy-best"

    const-string v2, "1.0.0"

    move-object v1, v7

    move v5, p1

    invoke-direct/range {v1 .. v6}, Le/e/a/internal/standard150/BikeRunRecords$Entry;-><init>(Ljava/lang/String;JILjava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    invoke-direct {p0}, Le/e/a/internal/standard150/BikeRunRecords;->trimBest()V

    :cond_2
    return-void

    .line 77
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v3, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    iget-object v4, v1, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-static {v3, v4}, Le/e/a/internal/standard150/BikeRunRecords;->contains(Ljava/util/List;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 73
    :cond_4
    iget-object v2, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    .line 74
    iget-object v3, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    new-instance v10, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-wide v6, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->time:J

    iget v8, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->score:I

    iget-object v9, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    const-string v5, "1.0.0"

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Le/e/a/internal/standard150/BikeRunRecords$Entry;-><init>(Ljava/lang/String;JILjava/lang/String;)V

    invoke-virtual {v3, v1, v10}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 69
    :cond_5
    iget-object v2, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    .line 70
    iget-object v3, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    new-instance v10, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-wide v6, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->time:J

    iget v8, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->score:I

    iget-object v9, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    const-string v5, "1.0.0"

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Le/e/a/internal/standard150/BikeRunRecords$Entry;-><init>(Ljava/lang/String;JILjava/lang/String;)V

    invoke-virtual {v3, v1, v10}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method

.method public rank(Ljava/lang/String;Ljava/lang/String;)I
    .registers 6

    .line 104
    invoke-virtual {p0, p1}, Le/e/a/internal/standard150/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 105
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-lt v1, v2, :cond_1

    return v0

    :cond_1
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v2, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    add-int/lit8 v1, v1, 0x1

    if-eqz v2, :cond_0

    return v1
.end method

.method public recent()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Le/e/a/internal/standard150/BikeRunRecords$Entry;",
            ">;"
        }
    .end annotation

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public removeId(Ljava/lang/String;)Z
    .registers 8

    const/4 v4, 0x0

    if-eqz p1, :cond_3

    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->recent:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v3, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Le/e/a/internal/standard150/BikeRunRecords;->best:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;

    iget-object v3, v2, Le/e/a/internal/standard150/BikeRunRecords$Entry;->id:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    const/4 v4, 0x1

    goto :goto_1

    :cond_3
    return v4
.end method
