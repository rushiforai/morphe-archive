.class public final enum Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/RtpTransceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RtpTransceiverDirection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

.field public static final enum INACTIVE:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

.field public static final enum RECV_ONLY:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

.field public static final enum SEND_ONLY:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

.field public static final enum SEND_RECV:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;


# instance fields
.field private final nativeIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 2
    .line 3
    const-string v1, "SEND_RECV"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->SEND_RECV:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 12
    .line 13
    const-string v2, "SEND_ONLY"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->SEND_ONLY:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 22
    .line 23
    const-string v3, "RECV_ONLY"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->RECV_ONLY:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 30
    .line 31
    new-instance v3, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 32
    .line 33
    const-string v4, "INACTIVE"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->INACTIVE:Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->$VALUES:[Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 46
    .line 47
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
    iput p3, p0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->nativeIndex:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromNativeIndex(I)Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
    .locals 5
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RtpTransceiverDirection"
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->values()[Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->getNativeIndex()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const-string v0, "Uknown native RtpTransceiverDirection type"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->$VALUES:[Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNativeIndex()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RtpTransceiverDirection"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;->nativeIndex:I

    .line 2
    .line 3
    return p0
.end method
