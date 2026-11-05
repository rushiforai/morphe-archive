.class public final synthetic Le/e/a/RankingFetch190$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/RankingFetch190$TagSource;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final fetch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;
    .registers 3

    .line 0
    invoke-static {p1, p2}, Le/e/a/RankingFetch190;->tags(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object p1

    return-object p1
.end method
