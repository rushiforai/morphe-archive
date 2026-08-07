.class interface abstract Lcom/immomo/mmdns/DNSLogger$LogCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmdns/DNSLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LogCallback"
.end annotation


# virtual methods
.method public abstract onLog(Ljava/lang/String;Lorg/json/JSONObject;)V
.end method

.method public abstract onLogOverflow(Ljava/lang/String;Lorg/json/JSONArray;)V
.end method
