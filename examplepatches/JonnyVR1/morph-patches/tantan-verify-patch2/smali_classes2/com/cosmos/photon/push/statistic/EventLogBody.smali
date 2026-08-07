.class public Lcom/cosmos/photon/push/statistic/EventLogBody;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    }
.end annotation


# static fields
.field public static TYPE_ARRIVED:I = 0x1

.field public static TYPE_ARRIVED_NOT_SHOWN:I = 0x4

.field public static TYPE_CLICKED:I = 0x3

.field public static TYPE_FORGROUND_NOT_SHOWN:I = 0x5

.field public static TYPE_SHOWN:I = 0x2


# instance fields
.field public alias:Ljava/lang/String;

.field public clickFromBusiness:Z

.field private data:Lorg/json/JSONObject;

.field private pushSource:Ljava/lang/String;

.field private reason:I

.field private time:J

.field private type:I

.field public uploadType:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$000(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->pushSource:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$100(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->time:J

    .line 15
    .line 16
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$200(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->type:I

    .line 21
    .line 22
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$300(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->reason:I

    .line 27
    .line 28
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$400(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->data:Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$500(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->uploadType:I

    .line 39
    .line 40
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$600(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->alias:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->access$700(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput-boolean p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->clickFromBusiness:Z

    .line 51
    .line 52
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;Lcom/cosmos/photon/push/statistic/EventLogBody$1;)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody;-><init>(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "push_source"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->pushSource:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "time"

    .line 14
    .line 15
    iget-wide v2, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->time:J

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "type"

    .line 21
    .line 22
    iget v2, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->type:I

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "reason"

    .line 28
    .line 29
    iget v2, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->reason:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->alias:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    const-string v1, "lc_alias"

    .line 43
    .line 44
    iget-object v2, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->alias:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception p0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    const-string v1, "data"

    .line 53
    .line 54
    iget-object v2, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->data:Lorg/json/JSONObject;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    const-string v1, "cfb"

    .line 60
    .line 61
    iget-boolean p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody;->clickFromBusiness:Z

    .line 62
    .line 63
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :goto_1
    const-string v1, "MoPush-"

    .line 68
    .line 69
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method
