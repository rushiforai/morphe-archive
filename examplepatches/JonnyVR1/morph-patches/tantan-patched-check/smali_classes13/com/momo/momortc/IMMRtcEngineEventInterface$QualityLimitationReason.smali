.class public final enum Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/momortc/IMMRtcEngineEventInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "QualityLimitationReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

.field public static final enum LIMITATION_REASON_BANDWIDTH:Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

.field public static final enum LIMITATION_REASON_NONE:Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 2
    .line 3
    const-string v1, "LIMITATION_REASON_NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;->LIMITATION_REASON_NONE:Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 12
    .line 13
    const-string v2, "LIMITATION_REASON_BANDWIDTH"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;->LIMITATION_REASON_BANDWIDTH:Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 20
    .line 21
    filled-new-array {v0, v1}, [Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;->$VALUES:[Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 26
    .line 27
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
    iput p3, p0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static getValue(Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;->value:I

    .line 2
    .line 3
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;->$VALUES:[Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;

    .line 8
    .line 9
    return-object v0
.end method
