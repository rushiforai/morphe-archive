.class public Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;
    }
.end annotation


# direct methods
.method public static a()V
    .locals 0

    .line 88
    invoke-static {}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeSendCacheReport()V

    return-void
.end method

.method public static a(I)V
    .locals 0

    .line 91
    invoke-static {p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeTagKeyPointStart(I)V

    return-void
.end method

.method public static a(II)V
    .locals 0

    .line 90
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeSetCpu(II)V

    return-void
.end method

.method public static a(III)V
    .locals 0

    .line 93
    invoke-static {p0, p1, p2}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeSetLocalQuality(III)V

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .locals 4

    .line 1
    const-string v0, "TXCKeyPointReportProxy"

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, "/txrtmp/ssoreport.txt"

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v1, Ljava/io/File;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_2

    .line 49
    .line 50
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    const-string v1, "can not create sso file path"

    .line 57
    .line 58
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :catch_0
    move-exception v1

    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v3, "create sso file exception:"

    .line 66
    .line 67
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    invoke-static {p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeInit(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static a(Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;)V
    .locals 8

    .line 89
    iget v0, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->a:I

    iget v1, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->b:I

    iget v2, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->c:I

    iget v3, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->d:I

    iget-object v4, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->e:Ljava/lang/String;

    iget-object v5, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->f:Ljava/lang/String;

    iget-object v6, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->g:Ljava/lang/String;

    iget-object v7, p0, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy$a;->h:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeSetDeviceInfo(IIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static a(Ljava/lang/String;IJI)V
    .locals 0

    .line 92
    invoke-static {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativesetRemoteQuality(Ljava/lang/String;IJI)V

    return-void
.end method

.method public static b(I)V
    .locals 0

    .line 5
    invoke-static {p0}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeSetErrorCode(I)V

    return-void
.end method

.method public static b(II)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeTagKeyPointEnd(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(II)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->nativeSetBasicInfo(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native nativeInit(Ljava/lang/String;)V
.end method

.method private static native nativeSendCacheReport()V
.end method

.method private static native nativeSetBasicInfo(II)V
.end method

.method private static native nativeSetCpu(II)V
.end method

.method private static native nativeSetDeviceInfo(IIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private static native nativeSetErrorCode(I)V
.end method

.method private static native nativeSetLocalQuality(III)V
.end method

.method private static native nativeTagKeyPointEnd(II)V
.end method

.method private static native nativeTagKeyPointStart(I)V
.end method

.method private static native nativesetRemoteQuality(Ljava/lang/String;IJI)V
.end method
