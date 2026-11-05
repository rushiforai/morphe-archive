.class public final synthetic Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONObject;

.field public final synthetic f$1:Le/e/a/RankingFetch190$TagSource;

.field public final synthetic f$2:Le/e/a/NetworkTask;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Le/e/a/RankingFetch190$TagSource;Le/e/a/NetworkTask;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;->f$0:Lorg/json/JSONObject;

    iput-object p2, p0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;->f$1:Le/e/a/RankingFetch190$TagSource;

    iput-object p3, p0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;->f$2:Le/e/a/NetworkTask;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;->f$0:Lorg/json/JSONObject;

    iget-object v1, p0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;->f$1:Le/e/a/RankingFetch190$TagSource;

    iget-object v2, p0, Le/e/a/RankingFetch190$$ExternalSyntheticLambda4;->f$2:Le/e/a/NetworkTask;

    invoke-static {v0, v1, v2}, Le/e/a/RankingFetch190;->lambda$4(Lorg/json/JSONObject;Le/e/a/RankingFetch190$TagSource;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method
