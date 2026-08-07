.class public abstract Ll/i4;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private duration:J

.field protected mOptions:Lproject/android/imageprocessing/model/FilterOptions;

.field private renderFinishListener:Ll/ssl;

.field private startTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/i4;->duration:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/i4;->startTime:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/i4;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEscapedTime()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/i4;->startTime:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Ll/i4;->duration:J

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    return-wide v2

    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-wide v2, p0, Ll/i4;->startTime:J

    .line 20
    .line 21
    sub-long/2addr v0, v2

    .line 22
    return-wide v0
.end method

.method public getFilterOptions()Lproject/android/imageprocessing/model/FilterOptions;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i4;->mOptions:Lproject/android/imageprocessing/model/FilterOptions;

    .line 2
    .line 3
    return-object p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    iget-wide p1, p0, Ll/i4;->duration:J

    .line 5
    .line 6
    const-wide/16 v0, -0x1

    .line 7
    .line 8
    cmp-long p1, p1, v0

    .line 9
    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    iget-wide p1, p0, Ll/i4;->startTime:J

    .line 13
    .line 14
    cmp-long p1, p1, v0

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    iget-wide v2, p0, Ll/i4;->startTime:J

    .line 23
    .line 24
    sub-long/2addr p1, v2

    .line 25
    iget-wide v2, p0, Ll/i4;->duration:J

    .line 26
    .line 27
    cmp-long p1, p1, v2

    .line 28
    .line 29
    if-lez p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/i4;->renderFinishListener:Ll/ssl;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-interface {p1}, Ll/ssl;->onRenderFinish()V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-wide p1, p0, Ll/i4;->startTime:J

    .line 39
    .line 40
    cmp-long p1, p1, v0

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide p1

    .line 48
    iput-wide p1, p0, Ll/i4;->startTime:J

    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public resetFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/i4;->duration:J

    .line 2
    .line 3
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i4;->mOptions:Lproject/android/imageprocessing/model/FilterOptions;

    .line 2
    .line 3
    return-void
.end method

.method public setRenderFinishListener(Ll/ssl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i4;->renderFinishListener:Ll/ssl;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    return-void
.end method
