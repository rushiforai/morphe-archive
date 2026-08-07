.class public final enum Lcom/momo/rtcbase/RendererCommon$ScalingType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/RendererCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ScalingType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/rtcbase/RendererCommon$ScalingType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/rtcbase/RendererCommon$ScalingType;

.field public static final enum SCALE_ASPECT_BALANCED:Lcom/momo/rtcbase/RendererCommon$ScalingType;

.field public static final enum SCALE_ASPECT_FILL:Lcom/momo/rtcbase/RendererCommon$ScalingType;

.field public static final enum SCALE_ASPECT_FIT:Lcom/momo/rtcbase/RendererCommon$ScalingType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 2
    .line 3
    const-string v1, "SCALE_ASPECT_FIT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/momo/rtcbase/RendererCommon$ScalingType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/rtcbase/RendererCommon$ScalingType;->SCALE_ASPECT_FIT:Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 12
    .line 13
    const-string v2, "SCALE_ASPECT_FILL"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lcom/momo/rtcbase/RendererCommon$ScalingType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/rtcbase/RendererCommon$ScalingType;->SCALE_ASPECT_FILL:Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 22
    .line 23
    const-string v3, "SCALE_ASPECT_BALANCED"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lcom/momo/rtcbase/RendererCommon$ScalingType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/rtcbase/RendererCommon$ScalingType;->SCALE_ASPECT_BALANCED:Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/momo/rtcbase/RendererCommon$ScalingType;->$VALUES:[Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/rtcbase/RendererCommon$ScalingType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/rtcbase/RendererCommon$ScalingType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/RendererCommon$ScalingType;->$VALUES:[Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/rtcbase/RendererCommon$ScalingType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/rtcbase/RendererCommon$ScalingType;

    .line 8
    .line 9
    return-object v0
.end method
