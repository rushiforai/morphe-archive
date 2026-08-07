.class public final enum Lio/agora/rtc2/Constants$BytesPerSample;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BytesPerSample"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$BytesPerSample;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$BytesPerSample;

.field public static final enum TWO_BYTES_PER_SAMPLE:Lio/agora/rtc2/Constants$BytesPerSample;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lio/agora/rtc2/Constants$BytesPerSample;

    const/4 v1, 0x0

    const/4 v2, 0x2

    const-string v3, "TWO_BYTES_PER_SAMPLE"

    invoke-direct {v0, v3, v1, v2}, Lio/agora/rtc2/Constants$BytesPerSample;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$BytesPerSample;->TWO_BYTES_PER_SAMPLE:Lio/agora/rtc2/Constants$BytesPerSample;

    filled-new-array {v0}, [Lio/agora/rtc2/Constants$BytesPerSample;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$BytesPerSample;->$VALUES:[Lio/agora/rtc2/Constants$BytesPerSample;

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

    iput p3, p0, Lio/agora/rtc2/Constants$BytesPerSample;->value:I

    return-void
.end method

.method public static getValue(Lio/agora/rtc2/Constants$BytesPerSample;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$BytesPerSample;->value:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$BytesPerSample;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$BytesPerSample;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$BytesPerSample;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$BytesPerSample;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$BytesPerSample;->$VALUES:[Lio/agora/rtc2/Constants$BytesPerSample;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$BytesPerSample;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$BytesPerSample;

    return-object v0
.end method
