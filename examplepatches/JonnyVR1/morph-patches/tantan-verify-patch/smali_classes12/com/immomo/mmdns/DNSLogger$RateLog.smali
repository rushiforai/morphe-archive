.class Lcom/immomo/mmdns/DNSLogger$RateLog;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mmdns/DNSLogger$Jsonable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmdns/DNSLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RateLog"
.end annotation


# instance fields
.field host:Ljava/lang/String;

.field ip:Ljava/lang/String;

.field success:Z

.field final synthetic this$0:Lcom/immomo/mmdns/DNSLogger;


# direct methods
.method public constructor <init>(Lcom/immomo/mmdns/DNSLogger;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mmdns/DNSLogger$RateLog;->this$0:Lcom/immomo/mmdns/DNSLogger;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/mmdns/DNSLogger$RateLog;->host:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/immomo/mmdns/DNSLogger$RateLog;->ip:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/immomo/mmdns/DNSLogger$RateLog;->success:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public toJson()Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "host"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/immomo/mmdns/DNSLogger$RateLog;->host:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "ip"

    .line 14
    .line 15
    iget-object v2, p0, Lcom/immomo/mmdns/DNSLogger$RateLog;->ip:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "success"

    .line 21
    .line 22
    iget-boolean p0, p0, Lcom/immomo/mmdns/DNSLogger$RateLog;->success:Z

    .line 23
    .line 24
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
