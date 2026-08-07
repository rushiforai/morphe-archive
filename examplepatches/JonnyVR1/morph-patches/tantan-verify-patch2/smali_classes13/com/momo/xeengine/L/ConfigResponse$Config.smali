.class public Lcom/momo/xeengine/L/ConfigResponse$Config;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/L/ConfigResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Config"
.end annotation


# instance fields
.field private expireTime:J

.field private result:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static fromJson(Lorg/json/JSONObject;)Lcom/momo/xeengine/L/ConfigResponse$Config;
    .locals 4

    .line 1
    new-instance v0, Lcom/momo/xeengine/L/ConfigResponse$Config;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/L/ConfigResponse$Config;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "result"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput-boolean v1, v0, Lcom/momo/xeengine/L/ConfigResponse$Config;->result:Z

    .line 14
    .line 15
    const-string v1, "expireTime"

    .line 16
    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    invoke-virtual {p0, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    iput-wide v1, v0, Lcom/momo/xeengine/L/ConfigResponse$Config;->expireTime:J

    .line 24
    .line 25
    return-object v0
.end method


# virtual methods
.method public getExpireTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/L/ConfigResponse$Config;->expireTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public isResult()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/L/ConfigResponse$Config;->result:Z

    .line 2
    .line 3
    return p0
.end method
