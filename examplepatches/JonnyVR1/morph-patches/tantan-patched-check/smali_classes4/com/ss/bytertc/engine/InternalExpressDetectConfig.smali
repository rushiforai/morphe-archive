.class public Lcom/ss/bytertc/engine/InternalExpressDetectConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public enableAgeDetect:Z

.field public enableAttractivenessDetect:Z

.field public enableEmotionDetect:Z

.field public enableGenderDetect:Z

.field public enableHappinessDetect:Z


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableAgeDetect:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableGenderDetect:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableEmotionDetect:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableAttractivenessDetect:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableHappinessDetect:Z

    .line 14
    .line 15
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableAgeDetect:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableAgeDetect:Z

    .line 18
    .line 19
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableGenderDetect:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableGenderDetect:Z

    .line 22
    .line 23
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableEmotionDetect:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableEmotionDetect:Z

    .line 26
    .line 27
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableAttractivenessDetect:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableAttractivenessDetect:Z

    .line 30
    .line 31
    iget-boolean p1, p1, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableHappinessDetect:Z

    .line 32
    .line 33
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableHappinessDetect:Z

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public enableAgeDetect()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableAgeDetect:Z

    .line 2
    .line 3
    return p0
.end method

.method public enableAttractivenessDetect()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableAttractivenessDetect:Z

    .line 2
    .line 3
    return p0
.end method

.method public enableEmotionDetect()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableEmotionDetect:Z

    .line 2
    .line 3
    return p0
.end method

.method public enableGenderDetect()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableGenderDetect:Z

    .line 2
    .line 3
    return p0
.end method

.method public enableHappinessDetect()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;->enableHappinessDetect:Z

    .line 2
    .line 3
    return p0
.end method
