.class public Lio/agora/rtc2/PublisherConfiguration;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/PublisherConfiguration$Builder;
    }
.end annotation


# instance fields
.field private jsonObject:Lorg/json/JSONObject;


# direct methods
.method private constructor <init>(Lio/agora/rtc2/PublisherConfiguration$Builder;)V
    .locals 7

    .line 1
    const-string v0, "height"

    const-string v1, "width"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "owner"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget-boolean v4, v4, Lio/agora/rtc2/PublisherParameters;->owner:Z

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "lifecycle"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget v4, v4, Lio/agora/rtc2/PublisherParameters;->lifecycle:I

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "defaultLayout"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget v4, v4, Lio/agora/rtc2/PublisherParameters;->defaultLayout:I

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v3

    iget v3, v3, Lio/agora/rtc2/PublisherParameters;->width:I

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v3

    iget v3, v3, Lio/agora/rtc2/PublisherParameters;->height:I

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "framerate"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget v4, v4, Lio/agora/rtc2/PublisherParameters;->framerate:I

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "bitrate"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget v4, v4, Lio/agora/rtc2/PublisherParameters;->bitrate:I

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "mosaicStream"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget-object v4, v4, Lio/agora/rtc2/PublisherParameters;->publishUrl:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "rawStream"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget-object v4, v4, Lio/agora/rtc2/PublisherParameters;->rawStreamUrl:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "extraInfo"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v4

    iget-object v4, v4, Lio/agora/rtc2/PublisherParameters;->extraInfo:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, p0, Lio/agora/rtc2/PublisherConfiguration;->jsonObject:Lorg/json/JSONObject;

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v2

    iget-object v2, v2, Lio/agora/rtc2/PublisherParameters;->injectStreamUrl:Ljava/lang/String;

    if-eqz v2, :cond_0

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v2

    iget v2, v2, Lio/agora/rtc2/PublisherParameters;->injectStreamWidth:I

    if-eqz v2, :cond_0

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v2

    iget v2, v2, Lio/agora/rtc2/PublisherParameters;->injectStreamHeight:I

    if-eqz v2, :cond_0

    iget-object v2, p0, Lio/agora/rtc2/PublisherConfiguration;->jsonObject:Lorg/json/JSONObject;

    const-string v3, "injectInfo"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "injectStream"

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v6

    iget-object v6, v6, Lio/agora/rtc2/PublisherParameters;->injectStreamUrl:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object v5

    iget v5, v5, Lio/agora/rtc2/PublisherParameters;->injectStreamWidth:I

    invoke-virtual {v4, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {p1}, Lio/agora/rtc2/PublisherConfiguration$Builder;->access$000(Lio/agora/rtc2/PublisherConfiguration$Builder;)Lio/agora/rtc2/PublisherParameters;

    move-result-object p1

    iget p1, p1, Lio/agora/rtc2/PublisherParameters;->injectStreamHeight:I

    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    const/4 p1, 0x0

    iput-object p1, p0, Lio/agora/rtc2/PublisherConfiguration;->jsonObject:Lorg/json/JSONObject;

    const-string p0, "failed to create PublisherConfiguration"

    invoke-static {p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;)V

    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/rtc2/PublisherConfiguration$Builder;Lio/agora/rtc2/PublisherConfiguration$1;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lio/agora/rtc2/PublisherConfiguration;-><init>(Lio/agora/rtc2/PublisherConfiguration$Builder;)V

    return-void
.end method


# virtual methods
.method public toJsonString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lio/agora/rtc2/PublisherConfiguration;->validate()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lio/agora/rtc2/PublisherConfiguration;->jsonObject:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public validate()Z
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/PublisherConfiguration;->jsonObject:Lorg/json/JSONObject;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
