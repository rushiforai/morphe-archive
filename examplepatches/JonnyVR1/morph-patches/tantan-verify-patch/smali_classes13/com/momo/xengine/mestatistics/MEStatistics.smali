.class public interface abstract Lcom/momo/xengine/mestatistics/MEStatistics;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getInstance()Lcom/momo/xengine/mestatistics/MEStatistics;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->getInstance()Lcom/momo/xengine/mestatistics/MEStatisticsImpl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public abstract flush()V
.end method

.method public abstract init(Landroid/content/Context;)V
.end method

.method public abstract realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V
.end method

.method public abstract realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V
.end method

.method public abstract report(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V
.end method

.method public abstract report(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V
.end method

.method public abstract setMMCVVersion(I)V
.end method

.method public abstract setMagicEffectVersion(I)V
.end method

.method public abstract setRecorderSDKVersion(I)V
.end method

.method public abstract setUID(Ljava/lang/String;)V
.end method

.method public abstract setXEngineVersion(I)V
.end method
