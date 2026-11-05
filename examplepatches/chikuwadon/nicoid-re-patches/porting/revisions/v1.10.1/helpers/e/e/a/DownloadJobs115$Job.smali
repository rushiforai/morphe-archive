.class final Le/e/a/DownloadJobs115$Job;
.super Ljava/lang/Object;
.source "DownloadJobs115.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DownloadJobs115;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Job"
.end annotation


# instance fields
.field volatile assetBytes:J

.field volatile assetSize:J

.field assets:I

.field volatile bytes:J

.field volatile cancelled:Z

.field volatile error:Ljava/lang/String;

.field finishedAssets:I

.field height:I

.field id:Ljava/lang/String;

.field volatile paused:Z

.field volatile phase:Ljava/lang/String;

.field volatile quality:Ljava/lang/String;

.field savedAt:J

.field volatile started:J

.field volatile title:Ljava/lang/String;

.field token:Ljava/lang/String;

.field volatile total:J

.field tree:Ljava/lang/String;

.field volatile uri:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 3

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/DownloadJobs115$Job;->quality:Ljava/lang/String;

    const-string v1, "\u30ad\u30e5\u30fc\u5f85\u3061"

    iput-object v1, p0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/DownloadJobs115$Job;->total:J

    iput-wide v0, p0, Le/e/a/DownloadJobs115$Job;->assetSize:J

    return-void
.end method


# virtual methods
.method json()Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 5
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "token"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "title"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "tree"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->tree:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "quality"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->quality:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "height"

    iget v2, p0, Le/e/a/DownloadJobs115$Job;->height:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "phase"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "uri"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "error"

    iget-object v2, p0, Le/e/a/DownloadJobs115$Job;->error:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "bytes"

    iget-wide v2, p0, Le/e/a/DownloadJobs115$Job;->bytes:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "savedAt"

    iget-wide v2, p0, Le/e/a/DownloadJobs115$Job;->savedAt:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method percent()I
    .registers 11

    .line 5
    const-string v0, "\u4fdd\u5b58\u6e08\u307f"

    iget-object v1, p0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/16 v0, 0x64

    return v0

    :cond_d
    iget-wide v0, p0, Le/e/a/DownloadJobs115$Job;->total:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    const-wide v6, 0x4058c00000000000L    # 99.0

    if-lez v0, :cond_2a

    iget-wide v0, p0, Le/e/a/DownloadJobs115$Job;->bytes:J

    long-to-double v0, v0

    mul-double/2addr v0, v4

    iget-wide v2, p0, Le/e/a/DownloadJobs115$Job;->total:J

    long-to-double v2, v2

    :goto_23
    div-double/2addr v0, v2

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    double-to-int v0, v0

    return v0

    :cond_2a
    iget v0, p0, Le/e/a/DownloadJobs115$Job;->assets:I

    if-lez v0, :cond_4d

    iget v0, p0, Le/e/a/DownloadJobs115$Job;->finishedAssets:I

    int-to-double v0, v0

    iget-wide v8, p0, Le/e/a/DownloadJobs115$Job;->assetSize:J

    cmp-long v2, v8, v2

    if-lez v2, :cond_45

    iget-wide v2, p0, Le/e/a/DownloadJobs115$Job;->assetBytes:J

    long-to-double v2, v2

    iget-wide v8, p0, Le/e/a/DownloadJobs115$Job;->assetSize:J

    long-to-double v8, v8

    div-double/2addr v2, v8

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    goto :goto_47

    :cond_45
    const-wide/16 v2, 0x0

    :goto_47
    add-double/2addr v0, v2

    mul-double/2addr v0, v4

    iget v2, p0, Le/e/a/DownloadJobs115$Job;->assets:I

    int-to-double v2, v2

    goto :goto_23

    :cond_4d
    const/4 v0, -0x1

    return v0
.end method
