.class public final synthetic Le/e/a/CacheRowInfo$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/VideoInfoCounts$Values;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheRowInfo$$ExternalSyntheticLambda0;->f$0:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/CacheRowInfo$$ExternalSyntheticLambda0;->f$0:Lorg/json/JSONObject;

    invoke-static {v0, p1}, Le/e/a/CacheRowInfo;->lambda$0(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
