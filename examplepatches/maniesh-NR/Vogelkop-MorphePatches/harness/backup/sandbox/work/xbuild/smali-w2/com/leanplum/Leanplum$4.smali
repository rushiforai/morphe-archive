.class Lcom/leanplum/Leanplum$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->startHelper(Ljava/lang/String;Ljava/util/Map;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public response(Lorg/json/JSONObject;)V
    .registers 3

    const-string p0, "Received start response: %s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    # invokes: Lcom/leanplum/Leanplum;->handleStartResponse(Lorg/json/JSONObject;)V
    invoke-static {p1}, Lcom/leanplum/Leanplum;->access$200(Lorg/json/JSONObject;)V

    return-void
.end method
