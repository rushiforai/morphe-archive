.class public final enum Lio/agora/rtc2/Constants$VideoStreamType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VideoStreamType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/Constants$VideoStreamType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_HIGH:Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_LAYER_1:Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_LAYER_2:Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_LAYER_3:Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_LAYER_4:Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_LAYER_5:Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_LAYER_6:Lio/agora/rtc2/Constants$VideoStreamType;

.field public static final enum VIDEO_STREAM_LOW:Lio/agora/rtc2/Constants$VideoStreamType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v1, "VIDEO_STREAM_HIGH"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_HIGH:Lio/agora/rtc2/Constants$VideoStreamType;

    new-instance v1, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v2, "VIDEO_STREAM_LOW"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_LOW:Lio/agora/rtc2/Constants$VideoStreamType;

    new-instance v2, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v3, "VIDEO_STREAM_LAYER_1"

    const/4 v4, 0x2

    const/4 v5, 0x4

    invoke-direct {v2, v3, v4, v5}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_LAYER_1:Lio/agora/rtc2/Constants$VideoStreamType;

    new-instance v3, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v4, "VIDEO_STREAM_LAYER_2"

    const/4 v6, 0x3

    const/4 v7, 0x5

    invoke-direct {v3, v4, v6, v7}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_LAYER_2:Lio/agora/rtc2/Constants$VideoStreamType;

    new-instance v4, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v6, "VIDEO_STREAM_LAYER_3"

    const/4 v8, 0x6

    invoke-direct {v4, v6, v5, v8}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_LAYER_3:Lio/agora/rtc2/Constants$VideoStreamType;

    new-instance v5, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v6, "VIDEO_STREAM_LAYER_4"

    const/4 v9, 0x7

    invoke-direct {v5, v6, v7, v9}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_LAYER_4:Lio/agora/rtc2/Constants$VideoStreamType;

    new-instance v6, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v7, "VIDEO_STREAM_LAYER_5"

    const/16 v10, 0x8

    invoke-direct {v6, v7, v8, v10}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_LAYER_5:Lio/agora/rtc2/Constants$VideoStreamType;

    new-instance v7, Lio/agora/rtc2/Constants$VideoStreamType;

    const-string v8, "VIDEO_STREAM_LAYER_6"

    const/16 v10, 0x9

    invoke-direct {v7, v8, v9, v10}, Lio/agora/rtc2/Constants$VideoStreamType;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lio/agora/rtc2/Constants$VideoStreamType;->VIDEO_STREAM_LAYER_6:Lio/agora/rtc2/Constants$VideoStreamType;

    filled-new-array/range {v0 .. v7}, [Lio/agora/rtc2/Constants$VideoStreamType;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/Constants$VideoStreamType;->$VALUES:[Lio/agora/rtc2/Constants$VideoStreamType;

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

    iput p3, p0, Lio/agora/rtc2/Constants$VideoStreamType;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/Constants$VideoStreamType;
    .locals 1

    const-class v0, Lio/agora/rtc2/Constants$VideoStreamType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/Constants$VideoStreamType;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/Constants$VideoStreamType;
    .locals 1

    sget-object v0, Lio/agora/rtc2/Constants$VideoStreamType;->$VALUES:[Lio/agora/rtc2/Constants$VideoStreamType;

    invoke-virtual {v0}, [Lio/agora/rtc2/Constants$VideoStreamType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/Constants$VideoStreamType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/Constants$VideoStreamType;->value:I

    return p0
.end method
