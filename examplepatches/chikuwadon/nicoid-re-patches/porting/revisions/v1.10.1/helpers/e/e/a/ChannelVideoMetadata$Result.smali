.class final Le/e/a/ChannelVideoMetadata$Result;
.super Ljava/lang/Object;
.source "ChannelVideoMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ChannelVideoMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Result"
.end annotation


# instance fields
.field final requestedId:Ljava/lang/String;

.field final response:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 3

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ChannelVideoMetadata$Result;->requestedId:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/ChannelVideoMetadata$Result;->response:Lorg/json/JSONObject;

    return-void
.end method
