.class public Lcom/ss/bytertc/engine/video/EffectResourceFinderAdapter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sFinder:Lcom/ss/bytertc/engine/video/IRtcResourceFinder;


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

.method public static CreateNativeResourceFinder(J)J
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p0, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    sget-object v2, Lcom/ss/bytertc/engine/video/EffectResourceFinderAdapter;->sFinder:Lcom/ss/bytertc/engine/video/IRtcResourceFinder;

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    return-wide v0

    .line 13
    :cond_1
    invoke-interface {v2, p0, p1}, Lcom/ss/bytertc/engine/video/IRtcResourceFinder;->createNativeResourceFinder(J)J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    return-wide p0
.end method

.method public static ReleaseNativeResourceFinder(J)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/video/EffectResourceFinderAdapter;->sFinder:Lcom/ss/bytertc/engine/video/IRtcResourceFinder;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Lcom/ss/bytertc/engine/video/IRtcResourceFinder;->release(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
