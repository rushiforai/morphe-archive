.class Lcom/immomo/mmdns/MDDNSEntrance$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mmdns/DNSLogger$LogCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mmdns/MDDNSEntrance;->setUploadLogger(Lcom/immomo/mmdns/MDDNSEntrance$ILogger;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mmdns/MDDNSEntrance;

.field final synthetic val$iLogger:Lcom/immomo/mmdns/MDDNSEntrance$ILogger;


# direct methods
.method public constructor <init>(Lcom/immomo/mmdns/MDDNSEntrance;Lcom/immomo/mmdns/MDDNSEntrance$ILogger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mmdns/MDDNSEntrance$1;->this$0:Lcom/immomo/mmdns/MDDNSEntrance;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/mmdns/MDDNSEntrance$1;->val$iLogger:Lcom/immomo/mmdns/MDDNSEntrance$ILogger;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLog(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mmdns/MDDNSEntrance$1;->val$iLogger:Lcom/immomo/mmdns/MDDNSEntrance$ILogger;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance$ILogger;->upload(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onLogOverflow(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mmdns/MDDNSEntrance$1;->val$iLogger:Lcom/immomo/mmdns/MDDNSEntrance$ILogger;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/immomo/mmdns/MDDNSEntrance$ILogger;->upload(Ljava/lang/String;Lorg/json/JSONArray;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
