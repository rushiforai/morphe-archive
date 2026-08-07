.class public Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$PoseDetectResult;,
        Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;
    }
.end annotation


# static fields
.field public static final BEF_AI_ACTION_RECOGNITION_MAX_POINT_NUM:I = 0x12

.field public static final FEEDBACK_PART_LEFT_ARM:I = 0x1

.field public static final FEEDBACK_PART_LEFT_LEG:I = 0x3

.field public static final FEEDBACK_PART_NONE:I = 0x0

.field public static final FEEDBACK_PART_RIGHT_ARM:I = 0x2

.field public static final FEEDBACK_PART_RIGHT_LEG:I = 0x4


# instance fields
.field public feedbackKeyPoints:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;

.field public feedbackPart:I

.field public isFeedbackValid:Z

.field public keyPoints:[Lcom/effectsar/labcv/effectsdk/BefPublicDefine$BefKeyPoint;

.field public recognizeSucceed:Z


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
