.class Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/core/glcore/util/DetectDelayStopHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DelayReleaseData"
.end annotation


# instance fields
.field frameCount:I

.field runnable:Ljava/lang/Runnable;

.field volatile startDelay:Z

.field final synthetic this$0:Lcom/core/glcore/util/DetectDelayStopHelper;


# direct methods
.method private constructor <init>(Lcom/core/glcore/util/DetectDelayStopHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->this$0:Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->frameCount:I

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;->startDelay:Z

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lcom/core/glcore/util/DetectDelayStopHelper;Lcom/core/glcore/util/DetectDelayStopHelper$1;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/core/glcore/util/DetectDelayStopHelper$DelayReleaseData;-><init>(Lcom/core/glcore/util/DetectDelayStopHelper;)V

    return-void
.end method
