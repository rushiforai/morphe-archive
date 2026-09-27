.class interface abstract Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;
.super Ljava/lang/Object;
.source "DeepSeekApiClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "RequestControl"
.end annotation


# virtual methods
.method public abstract isCancelled()Z
.end method

.method public abstract onConnection(Ljava/net/HttpURLConnection;)V
.end method

.method public abstract onQualityEvidence(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onRequestBodySent()V
.end method
