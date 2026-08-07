.class public Ll/f4m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private dependChecker:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "depend_checker"
    .end annotation
.end field

.field private detectInterval:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detect_interval"
    .end annotation
.end field

.field private detectUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detect_url"
    .end annotation
.end field

.field private enable:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable"
    .end annotation
.end field

.field private enableDetect:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_detect"
    .end annotation
.end field

.field private enableLocalV6:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_local_v6"
    .end annotation
.end field

.field private enableRootDetect:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_root_detect"
    .end annotation
.end field

.field private enableV6First:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_v6_first"
    .end annotation
.end field

.field private failedPerUrlLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "failed_per_url_limit"
    .end annotation
.end field

.field private failedPushUrlsLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "failed_push_urls_limit"
    .end annotation
.end field

.field private failedUrlsLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "failed_urls_limit"
    .end annotation
.end field

.field private noResponseCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "no_response_count"
    .end annotation
.end field

.field private retryTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "retry_time"
    .end annotation
.end field

.field private rootDependChecker:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "root_depend_checker"
    .end annotation
.end field

.field private rootEnableV6First:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "root_enable_v6_first"
    .end annotation
.end field

.field private rootFailedPerUrlLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "root_failed_per_url_limit"
    .end annotation
.end field

.field private rootFailedPushUrlsLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "root_failed_push_urls_limit"
    .end annotation
.end field

.field private rootFailedUrlsLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "root_failed_urls_limit"
    .end annotation
.end field

.field private rootRetryTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "root_retry_time"
    .end annotation
.end field

.field private rootUrlIntervalLimit:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "root_get_url_interval_limit"
    .end annotation
.end field

.field private urlIntervalLimit:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "get_url_interval_limit"
    .end annotation
.end field

.field private vodEnable:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "vod_enable"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/f4m;->enable:I

    .line 6
    .line 7
    iput v0, p0, Ll/f4m;->vodEnable:I

    .line 8
    .line 9
    iput v0, p0, Ll/f4m;->enableDetect:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput v1, p0, Ll/f4m;->enableRootDetect:I

    .line 13
    .line 14
    const-wide/16 v2, 0xb4

    .line 15
    .line 16
    iput-wide v2, p0, Ll/f4m;->detectInterval:J

    .line 17
    .line 18
    const-string v2, "http://ipv6-detect-a1.immomo.com/check,http://ipv6-detect-a2.immomo.com/check"

    .line 19
    .line 20
    iput-object v2, p0, Ll/f4m;->detectUrl:Ljava/lang/String;

    .line 21
    .line 22
    iput v0, p0, Ll/f4m;->enableV6First:I

    .line 23
    .line 24
    iput v1, p0, Ll/f4m;->rootEnableV6First:I

    .line 25
    .line 26
    const-wide/16 v2, 0x384

    .line 27
    .line 28
    iput-wide v2, p0, Ll/f4m;->retryTime:J

    .line 29
    .line 30
    const-wide/16 v2, 0x12c

    .line 31
    .line 32
    iput-wide v2, p0, Ll/f4m;->rootRetryTime:J

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    iput v2, p0, Ll/f4m;->noResponseCount:I

    .line 36
    .line 37
    iput v0, p0, Ll/f4m;->enableLocalV6:I

    .line 38
    .line 39
    iput v1, p0, Ll/f4m;->dependChecker:I

    .line 40
    .line 41
    iput v0, p0, Ll/f4m;->rootDependChecker:I

    .line 42
    .line 43
    iput v1, p0, Ll/f4m;->failedUrlsLimit:I

    .line 44
    .line 45
    const/16 v0, 0xa

    .line 46
    .line 47
    iput v0, p0, Ll/f4m;->rootFailedUrlsLimit:I

    .line 48
    .line 49
    iput v1, p0, Ll/f4m;->failedPerUrlLimit:I

    .line 50
    .line 51
    iput v2, p0, Ll/f4m;->rootFailedPerUrlLimit:I

    .line 52
    .line 53
    iput v1, p0, Ll/f4m;->failedPushUrlsLimit:I

    .line 54
    .line 55
    iput v2, p0, Ll/f4m;->rootFailedPushUrlsLimit:I

    .line 56
    .line 57
    const-wide/16 v0, 0xe10

    .line 58
    .line 59
    iput-wide v0, p0, Ll/f4m;->urlIntervalLimit:J

    .line 60
    .line 61
    iput-wide v0, p0, Ll/f4m;->rootUrlIntervalLimit:J

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->dependChecker:I

    .line 2
    .line 3
    return p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/f4m;->detectInterval:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f4m;->detectUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->enable:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->enableDetect:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->enableLocalV6:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->enableRootDetect:I

    .line 2
    .line 3
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->enableV6First:I

    .line 2
    .line 3
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->failedPerUrlLimit:I

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->failedPushUrlsLimit:I

    .line 2
    .line 3
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->failedUrlsLimit:I

    .line 2
    .line 3
    return p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->noResponseCount:I

    .line 2
    .line 3
    return p0
.end method

.method public m()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/f4m;->retryTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->rootDependChecker:I

    .line 2
    .line 3
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->rootEnableV6First:I

    .line 2
    .line 3
    return p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->rootFailedPerUrlLimit:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->rootFailedPushUrlsLimit:I

    .line 2
    .line 3
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->rootFailedUrlsLimit:I

    .line 2
    .line 3
    return p0
.end method

.method public s()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/f4m;->rootRetryTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public t()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/f4m;->rootUrlIntervalLimit:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enable === "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/f4m;->enable:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " \nenableDetect === "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/f4m;->enableDetect:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " \nenableRootDetect === "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/f4m;->enableRootDetect:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, " \ndetectInterval === "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Ll/f4m;->detectInterval:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, " \ndetectUrl === "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/f4m;->detectUrl:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, " \nenableV6First === "

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Ll/f4m;->enableV6First:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, " \nretryTime === "

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-wide v1, p0, Ll/f4m;->retryTime:J

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, " \nrootRetryTime === "

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-wide v1, p0, Ll/f4m;->rootRetryTime:J

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, " \nnoResponseCount === "

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/f4m;->noResponseCount:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, " \nenableLocalV6 === "

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget p0, p0, Ll/f4m;->enableLocalV6:I

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method

.method public u()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/f4m;->urlIntervalLimit:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f4m;->vodEnable:I

    .line 2
    .line 3
    return p0
.end method
