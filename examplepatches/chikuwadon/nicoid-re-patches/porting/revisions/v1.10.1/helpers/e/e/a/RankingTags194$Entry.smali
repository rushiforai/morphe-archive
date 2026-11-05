.class final Le/e/a/RankingTags194$Entry;
.super Ljava/lang/Object;
.source "RankingTags194.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/RankingTags194;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final tags:Lorg/json/JSONArray;

.field final time:J


# direct methods
.method constructor <init>(Lorg/json/JSONArray;)V
    .registers 4

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/RankingTags194$Entry;->time:J

    iput-object p1, p0, Le/e/a/RankingTags194$Entry;->tags:Lorg/json/JSONArray;

    return-void
.end method
