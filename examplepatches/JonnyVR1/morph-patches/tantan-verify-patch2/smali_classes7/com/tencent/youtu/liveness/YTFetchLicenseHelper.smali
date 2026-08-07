.class public Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;
    }
.end annotation


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
.method public fetchLicenseOnline(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/youtu/liveness/YTDeviceInfo;)Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;
    .locals 12

    .line 1
    move-object/from16 v0, p5

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move-object v8, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v2, v0, Lcom/tencent/youtu/liveness/YTDeviceInfo;->device_id:Ljava/lang/String;

    .line 10
    .line 11
    move-object v8, v2

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string v2, "ANDROID"

    .line 15
    .line 16
    :goto_1
    move-object v7, v2

    .line 17
    goto :goto_2

    .line 18
    :cond_1
    iget-object v2, v0, Lcom/tencent/youtu/liveness/YTDeviceInfo;->platform:Ljava/lang/String;

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :goto_2
    if-nez v0, :cond_2

    .line 22
    .line 23
    :goto_3
    move-object v9, v1

    .line 24
    goto :goto_4

    .line 25
    :cond_2
    iget-object v1, v0, Lcom/tencent/youtu/liveness/YTDeviceInfo;->device_info_encrypted:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_3

    .line 28
    :goto_4
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v10

    .line 32
    new-instance v3, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;

    .line 33
    .line 34
    move-object v4, p0

    .line 35
    move-object v11, p2

    .line 36
    move-object v5, p3

    .line 37
    move-object/from16 v6, p4

    .line 38
    .line 39
    invoke-direct/range {v3 .. v11}, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;-><init>(Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Ljava/lang/Thread;

    .line 43
    .line 44
    invoke-direct {p0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_5

    .line 54
    :catch_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 57
    .line 58
    .line 59
    :goto_5
    iget-object p0, v3, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 60
    .line 61
    return-object p0
.end method
