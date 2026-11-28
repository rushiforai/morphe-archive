.class final enum Le/e/a/NicoliveCatalog$Sort;
.super Ljava/lang/Enum;
.source "NicoliveCatalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/NicoliveCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Sort"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Le/e/a/NicoliveCatalog$Sort;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum COMMENTS:Le/e/a/NicoliveCatalog$Sort;

.field private static final synthetic ENUM$VALUES:[Le/e/a/NicoliveCatalog$Sort;

.field public static final enum NEWEST:Le/e/a/NicoliveCatalog$Sort;

.field public static final enum OLDEST:Le/e/a/NicoliveCatalog$Sort;

.field public static final enum VIEWS:Le/e/a/NicoliveCatalog$Sort;


# instance fields
.field final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Le/e/a/NicoliveData$Program;",
            ">;"
        }
    .end annotation
.end field

.field final label:Ljava/lang/String;

.field final parameter:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 23
    new-instance v0, Le/e/a/NicoliveCatalog$Sort;

    new-instance v5, Le/e/a/NicoliveCatalog$Sort$0;

    invoke-direct {v5}, Le/e/a/NicoliveCatalog$Sort$0;-><init>()V

    const-string v1, "NEWEST"

    const/4 v2, 0x0

    const-string/jumbo v3, "\u958b\u59cb\u304c\u65b0\u3057\u3044\u9806"

    const-string v4, "recentDesc"

    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveCatalog$Sort;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/Comparator;)V

    sput-object v0, Le/e/a/NicoliveCatalog$Sort;->NEWEST:Le/e/a/NicoliveCatalog$Sort;

    .line 24
    new-instance v1, Le/e/a/NicoliveCatalog$Sort;

    new-instance v6, Le/e/a/NicoliveCatalog$Sort$1;

    invoke-direct {v6}, Le/e/a/NicoliveCatalog$Sort$1;-><init>()V

    const-string v2, "OLDEST"

    const/4 v3, 0x1

    const-string/jumbo v4, "\u958b\u59cb\u304c\u65e9\u3044\u9806"

    const-string v5, "recentAsc"

    invoke-direct/range {v1 .. v6}, Le/e/a/NicoliveCatalog$Sort;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/Comparator;)V

    sput-object v1, Le/e/a/NicoliveCatalog$Sort;->OLDEST:Le/e/a/NicoliveCatalog$Sort;

    .line 25
    new-instance v2, Le/e/a/NicoliveCatalog$Sort;

    new-instance v7, Le/e/a/NicoliveCatalog$Sort$2;

    invoke-direct {v7}, Le/e/a/NicoliveCatalog$Sort$2;-><init>()V

    const-string v3, "VIEWS"

    const/4 v4, 0x2

    const-string/jumbo v5, "\u6765\u5834\u8005\u6570\u304c\u591a\u3044\u9806"

    const-string v6, "viewCountDesc"

    invoke-direct/range {v2 .. v7}, Le/e/a/NicoliveCatalog$Sort;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/Comparator;)V

    sput-object v2, Le/e/a/NicoliveCatalog$Sort;->VIEWS:Le/e/a/NicoliveCatalog$Sort;

    .line 26
    new-instance v3, Le/e/a/NicoliveCatalog$Sort;

    new-instance v8, Le/e/a/NicoliveCatalog$Sort$3;

    invoke-direct {v8}, Le/e/a/NicoliveCatalog$Sort$3;-><init>()V

    const-string v4, "COMMENTS"

    const/4 v5, 0x3

    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u6570\u304c\u591a\u3044\u9806"

    const-string v7, "commentCountDesc"

    invoke-direct/range {v3 .. v8}, Le/e/a/NicoliveCatalog$Sort;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/Comparator;)V

    sput-object v3, Le/e/a/NicoliveCatalog$Sort;->COMMENTS:Le/e/a/NicoliveCatalog$Sort;

    .line 22
    filled-new-array {v0, v1, v2, v3}, [Le/e/a/NicoliveCatalog$Sort;

    move-result-object v0

    sput-object v0, Le/e/a/NicoliveCatalog$Sort;->ENUM$VALUES:[Le/e/a/NicoliveCatalog$Sort;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/Comparator;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Comparator<",
            "Le/e/a/NicoliveData$Program;",
            ">;)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 33
    iput-object p3, p0, Le/e/a/NicoliveCatalog$Sort;->label:Ljava/lang/String;

    .line 34
    iput-object p4, p0, Le/e/a/NicoliveCatalog$Sort;->parameter:Ljava/lang/String;

    .line 35
    iput-object p5, p0, Le/e/a/NicoliveCatalog$Sort;->comparator:Ljava/util/Comparator;

    return-void
.end method

.method static synthetic lambda$0(Le/e/a/NicoliveData$Program;Le/e/a/NicoliveData$Program;)I
    .registers 4

    .line 23
    iget-wide v0, p1, Le/e/a/NicoliveData$Program;->begin:J

    iget-wide p0, p0, Le/e/a/NicoliveData$Program;->begin:J

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$1(Le/e/a/NicoliveData$Program;Le/e/a/NicoliveData$Program;)I
    .registers 4

    .line 24
    iget-wide v0, p0, Le/e/a/NicoliveData$Program;->begin:J

    iget-wide p0, p1, Le/e/a/NicoliveData$Program;->begin:J

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$2(Le/e/a/NicoliveData$Program;Le/e/a/NicoliveData$Program;)I
    .registers 4

    .line 25
    iget-wide v0, p1, Le/e/a/NicoliveData$Program;->views:J

    iget-wide p0, p0, Le/e/a/NicoliveData$Program;->views:J

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$3(Le/e/a/NicoliveData$Program;Le/e/a/NicoliveData$Program;)I
    .registers 4

    .line 26
    iget-wide v0, p1, Le/e/a/NicoliveData$Program;->comments:J

    iget-wide p0, p0, Le/e/a/NicoliveData$Program;->comments:J

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static restore(Ljava/lang/String;Le/e/a/NicoliveCatalog$Sort;)Le/e/a/NicoliveCatalog$Sort;
    .registers 2

    .line 39
    :try_start_0
    invoke-static {p0}, Le/e/a/NicoliveCatalog$Sort;->valueOf(Ljava/lang/String;)Le/e/a/NicoliveCatalog$Sort;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    return-object p1
.end method

.method public static valueOf(Ljava/lang/String;)Le/e/a/NicoliveCatalog$Sort;
    .registers 2

    .line 1
    const-class v0, Le/e/a/NicoliveCatalog$Sort;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Le/e/a/NicoliveCatalog$Sort;

    return-object p0
.end method

.method public static values()[Le/e/a/NicoliveCatalog$Sort;
    .registers 4

    .line 1
    sget-object v0, Le/e/a/NicoliveCatalog$Sort;->ENUM$VALUES:[Le/e/a/NicoliveCatalog$Sort;

    array-length v1, v0

    new-array v2, v1, [Le/e/a/NicoliveCatalog$Sort;

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
