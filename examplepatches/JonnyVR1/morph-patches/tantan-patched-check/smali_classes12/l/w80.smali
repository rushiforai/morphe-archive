.class public Ll/w80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w80$a;
    }
.end annotation


# instance fields
.field private animojiDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "animojiDetectEnable"
    .end annotation
.end field

.field private backTip:Ll/w80$a;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "backTips"
    .end annotation
.end field

.field private bodyDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bodyDetectEnable"
    .end annotation
.end field

.field private bodySegmentDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bodySegmentDetectEnable"
    .end annotation
.end field

.field private boogerpickingSwitch:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "boogerpickingSwitch"
    .end annotation
.end field

.field private cartoonFaceEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cartoonFaceEnable"
    .end annotation
.end field

.field private cartoonFaceType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cartoonFaceType"
    .end annotation
.end field

.field private comic:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comic"
    .end annotation
.end field

.field private detectARGift:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detectARGift"
    .end annotation
.end field

.field private detectGanCryingFace:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detectGanCryingFace"
    .end annotation
.end field

.field private detectQRCode:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "detectQRCode"
    .end annotation
.end field

.field private engineAr:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "engineAr"
    .end annotation
.end field

.field private expressionDetectEnable:Z

.field private frontTip:Ll/w80$a;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frontTips"
    .end annotation
.end field

.field private gestureDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "gestureDetectEnable"
    .end annotation
.end field

.field private handSegmentDetector:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "handSegmentDetector"
    .end annotation
.end field

.field private heartProgressDetector:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "heartProgressDetector"
    .end annotation
.end field

.field private makeUpSwitch:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "makeUpSwitch"
    .end annotation
.end field

.field private multiFaceSwitchEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "multiFaceSwitchEnable"
    .end annotation
.end field

.field private multiFaces:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "multiFaces"
    .end annotation
.end field

.field private objectDetectEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "objectDetectEnable"
    .end annotation
.end field

.field private stylizeFaceEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "stylizeFaceEnable"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/w80;->bodyDetectEnable:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/w80;->engineAr:Z

    .line 2
    .line 3
    return p0
.end method
