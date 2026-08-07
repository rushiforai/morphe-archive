.class public final enum Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ActionRecognitionPoseType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

.field public static final enum LYING:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

.field public static final enum SIDELEFT:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

.field public static final enum SIDERIGHT:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

.field public static final enum SITTING:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

.field public static final enum STAND:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;


# instance fields
.field public id:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 2
    .line 3
    const-string v1, "STAND"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->STAND:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 11
    .line 12
    new-instance v1, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 13
    .line 14
    const-string v2, "LYING"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->LYING:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 21
    .line 22
    new-instance v2, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 23
    .line 24
    const-string v3, "SITTING"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->SITTING:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 31
    .line 32
    new-instance v3, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 33
    .line 34
    const-string v4, "SIDELEFT"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v3, v4, v5, v6}, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->SIDELEFT:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 41
    .line 42
    new-instance v4, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 43
    .line 44
    const-string v5, "SIDERIGHT"

    .line 45
    .line 46
    const/4 v7, 0x5

    .line 47
    invoke-direct {v4, v5, v6, v7}, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v4, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->SIDERIGHT:Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 51
    .line 52
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 57
    .line 58
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->id:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;
    .locals 1

    .line 1
    const-class v0, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;
    .locals 1

    .line 1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->$VALUES:[Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/effectsar/labcv/effectsdk/BefActionRecognitionInfo$ActionRecognitionPoseType;

    .line 8
    .line 9
    return-object v0
.end method
