.class public Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public enableAgeDetect:Z

.field public enableAttractivenessDetect:Z

.field public enableEmotionDetect:Z

.field public enableGenderDetect:Z

.field public enableHappinessDetect:Z


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
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableAgeDetect:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableGenderDetect:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableEmotionDetect:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableAttractivenessDetect:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;->enableHappinessDetect:Z

    .line 14
    .line 15
    return-void
.end method
