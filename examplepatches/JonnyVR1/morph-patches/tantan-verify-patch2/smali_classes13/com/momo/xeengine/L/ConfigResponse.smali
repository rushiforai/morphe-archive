.class public Lcom/momo/xeengine/L/ConfigResponse;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/L/ConfigResponse$Config;
    }
.end annotation


# instance fields
.field private data:Lcom/momo/xeengine/L/ConfigResponse$Config;

.field private ec:I

.field private em:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/momo/xeengine/L/ConfigResponse;->ec:I

    .line 6
    .line 7
    const-string v0, "\u64cd\u4f5c\u6210\u529f"

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/L/ConfigResponse;->em:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static fromJson(Lorg/json/JSONObject;)Lcom/momo/xeengine/L/ConfigResponse;
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/xeengine/L/ConfigResponse;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/xeengine/L/ConfigResponse;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ec"

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, v0, Lcom/momo/xeengine/L/ConfigResponse;->ec:I

    .line 14
    .line 15
    const-string v1, "em"

    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/momo/xeengine/L/ConfigResponse;->em:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "data"

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    invoke-static {p0}, Lcom/momo/xeengine/L/ConfigResponse$Config;->fromJson(Lorg/json/JSONObject;)Lcom/momo/xeengine/L/ConfigResponse$Config;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, v0, Lcom/momo/xeengine/L/ConfigResponse;->data:Lcom/momo/xeengine/L/ConfigResponse$Config;

    .line 38
    .line 39
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getData()Lcom/momo/xeengine/L/ConfigResponse$Config;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/L/ConfigResponse;->data:Lcom/momo/xeengine/L/ConfigResponse$Config;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEc()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/L/ConfigResponse;->ec:I

    .line 2
    .line 3
    return p0
.end method

.method public getEm()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/L/ConfigResponse;->em:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
