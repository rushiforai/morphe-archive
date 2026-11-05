.class final Le/e/a/RankingPager196$Genre;
.super Ljava/lang/Object;
.source "RankingPager196.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/RankingPager196;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Genre"
.end annotation


# instance fields
.field ended:Z

.field final id:Ljava/lang/String;

.field items:Lorg/json/JSONArray;

.field page:I

.field final seen:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 3

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, -0x1

    iput v0, p0, Le/e/a/RankingPager196$Genre;->page:I

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Le/e/a/RankingPager196$Genre;->items:Lorg/json/JSONArray;

    .line 38
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/RankingPager196$Genre;->seen:Ljava/util/Set;

    .line 39
    iput-object p1, p0, Le/e/a/RankingPager196$Genre;->id:Ljava/lang/String;

    return-void
.end method
