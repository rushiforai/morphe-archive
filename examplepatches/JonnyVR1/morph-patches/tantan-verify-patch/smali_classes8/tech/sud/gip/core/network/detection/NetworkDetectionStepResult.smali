.class public Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public code:I

.field public msg:Ljava/lang/String;


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


# virtual methods
.method public deepCopy()Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;
    .locals 2

    .line 1
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 7
    .line 8
    iput v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 9
    .line 10
    iget-object p0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p0, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
.end method

.method public toJsonObject()Lorg/json/JSONObject;
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->code:I

    .line 7
    .line 8
    const-string v2, "code"

    .line 9
    .line 10
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStepResult;->msg:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "msg"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    return-object v0
.end method
