.class public final enum Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MEDIA_TRACE_EVENT"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

.field public static final enum MEDIA_TRACE_EVENT_VIDEO_DECODED:Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

.field public static final enum MEDIA_TRACE_EVENT_VIDEO_RENDERED:Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    const-string v1, "MEDIA_TRACE_EVENT_VIDEO_RENDERED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->MEDIA_TRACE_EVENT_VIDEO_RENDERED:Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    new-instance v1, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    const-string v2, "MEDIA_TRACE_EVENT_VIDEO_DECODED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->MEDIA_TRACE_EVENT_VIDEO_DECODED:Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    filled-new-array {v0, v1}, [Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->$VALUES:[Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->value:I

    return-void
.end method

.method public static fromInt(I)Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;
    .locals 5

    invoke-static {}, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->values()[Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->$VALUES:[Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$MEDIA_TRACE_EVENT;->value:I

    return p0
.end method
