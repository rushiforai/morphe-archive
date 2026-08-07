.class public Lcom/momo/rtcbase/Metrics;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/Metrics$HistogramInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Metrics"


# instance fields
.field public final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/momo/rtcbase/Metrics$HistogramInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/Metrics;->map:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method private add(Ljava/lang/String;Lcom/momo/rtcbase/Metrics$HistogramInfo;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Metrics;->map:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static enable()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/Metrics;->nativeEnable()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getAndReset()Lcom/momo/rtcbase/Metrics;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/Metrics;->nativeGetAndReset()Lcom/momo/rtcbase/Metrics;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private static native nativeEnable()V
.end method

.method private static native nativeGetAndReset()Lcom/momo/rtcbase/Metrics;
.end method
