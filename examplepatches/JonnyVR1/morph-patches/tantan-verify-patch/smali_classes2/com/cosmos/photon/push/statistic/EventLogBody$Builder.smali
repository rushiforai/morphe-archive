.class public final Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/statistic/EventLogBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private alias:Ljava/lang/String;

.field private clickFromBusiness:Z

.field private data:Lorg/json/JSONObject;

.field private pushSource:Ljava/lang/String;

.field private reason:I

.field private time:J

.field private type:I

.field private uploadType:I


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

.method public static synthetic access$000(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$200(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$600(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->alias:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->clickFromBusiness:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public alias(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->alias:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public build()Lcom/cosmos/photon/push/statistic/EventLogBody;
    .locals 2

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody;-><init>(Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;Lcom/cosmos/photon/push/statistic/EventLogBody$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public clickFromBusiness(Z)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->clickFromBusiness:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public data(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :catch_0
    move-exception p1

    .line 17
    const-string v0, "MoPush-STATISTIC"

    .line 18
    .line 19
    invoke-static {v0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;"
        }
    .end annotation

    if-nez p1, :cond_0

    return-object p0

    .line 23
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data:Lorg/json/JSONObject;

    return-object p0
.end method

.method public data(Lorg/json/JSONObject;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data:Lorg/json/JSONObject;

    return-object p0
.end method

.method public pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason:I

    .line 2
    .line 3
    return-object p0
.end method

.method public time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time:J

    .line 2
    .line 3
    return-object p0
.end method

.method public type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type:I

    .line 2
    .line 3
    return-object p0
.end method

.method public uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType:I

    .line 2
    .line 3
    return-object p0
.end method
