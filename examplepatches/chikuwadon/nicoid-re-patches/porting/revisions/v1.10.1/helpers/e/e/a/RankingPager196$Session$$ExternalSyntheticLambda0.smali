.class public final synthetic Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Le/e/a/RankingPager196$Session;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Le/e/a/NetworkTask;


# direct methods
.method public synthetic constructor <init>(Le/e/a/RankingPager196$Session;Lorg/json/JSONObject;Le/e/a/NetworkTask;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;->f$0:Le/e/a/RankingPager196$Session;

    iput-object p2, p0, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;->f$2:Le/e/a/NetworkTask;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;->f$0:Le/e/a/RankingPager196$Session;

    iget-object v1, p0, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;->f$2:Le/e/a/NetworkTask;

    invoke-virtual {v0, v1, v2}, Le/e/a/RankingPager196$Session;->lambda$0$e-e-a-RankingPager196$Session(Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method
