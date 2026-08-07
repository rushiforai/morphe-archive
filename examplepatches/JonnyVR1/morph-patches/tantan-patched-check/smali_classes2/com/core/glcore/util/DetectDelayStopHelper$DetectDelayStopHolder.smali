.class Lcom/core/glcore/util/DetectDelayStopHelper$DetectDelayStopHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/core/glcore/util/DetectDelayStopHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DetectDelayStopHolder"
.end annotation


# static fields
.field public static detectDelayStop:Lcom/core/glcore/util/DetectDelayStopHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;-><init>(Lcom/core/glcore/util/DetectDelayStopHelper$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/core/glcore/util/DetectDelayStopHelper$DetectDelayStopHolder;->detectDelayStop:Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
