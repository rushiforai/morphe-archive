.class public final enum Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/utils/sensors/MotionDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DeviceMotionState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

.field public static final enum MOVING:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

.field public static final enum STILL:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

.field public static final enum UNKNOWN:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

.field public static final enum VIBRATING:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    new-array v1, v1, [B

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, -0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct {v0, v1, v3, v2}, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;-><init>(Ljava/lang/String;II)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->UNKNOWN:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 19
    .line 20
    new-instance v1, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 21
    .line 22
    const/4 v2, 0x5

    .line 23
    new-array v2, v2, [B

    .line 24
    .line 25
    fill-array-data v2, :array_1

    .line 26
    .line 27
    .line 28
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const/4 v4, 0x1

    .line 33
    invoke-direct {v1, v2, v4, v3}, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;-><init>(Ljava/lang/String;II)V

    .line 34
    .line 35
    .line 36
    sput-object v1, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->STILL:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 37
    .line 38
    new-instance v2, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 39
    .line 40
    const/16 v3, 0x9

    .line 41
    .line 42
    new-array v3, v3, [B

    .line 43
    .line 44
    fill-array-data v3, :array_2

    .line 45
    .line 46
    .line 47
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const/4 v5, 0x2

    .line 52
    invoke-direct {v2, v3, v5, v4}, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;-><init>(Ljava/lang/String;II)V

    .line 53
    .line 54
    .line 55
    sput-object v2, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->VIBRATING:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 56
    .line 57
    new-instance v3, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 58
    .line 59
    const/4 v4, 0x6

    .line 60
    new-array v4, v4, [B

    .line 61
    .line 62
    fill-array-data v4, :array_3

    .line 63
    .line 64
    .line 65
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    const/4 v6, 0x3

    .line 70
    invoke-direct {v3, v4, v6, v5}, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;-><init>(Ljava/lang/String;II)V

    .line 71
    .line 72
    .line 73
    sput-object v3, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->MOVING:Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 74
    .line 75
    filled-new-array {v0, v1, v2, v3}, [Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sput-object v0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->$VALUES:[Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :array_0
    .array-data 1
        0x65t
        0x28t
        0x7at
        0x79t
        0x2et
        0x31t
        0x7et
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    :array_1
    .array-data 1
        0x63t
        0x32t
        0x78t
        0x7bt
        0x2dt
    .end array-data

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    nop

    .line 99
    :array_2
    .array-data 1
        0x66t
        0x2ft
        0x73t
        0x65t
        0x20t
        0x32t
        0x79t
        0x28t
        0x76t
    .end array-data

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    nop

    .line 109
    :array_3
    .array-data 1
        0x7dt
        0x29t
        0x67t
        0x7et
        0x2ft
        0x21t
    .end array-data
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
    iput p3, p0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->$VALUES:[Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/utils/sensors/MotionDetector$DeviceMotionState;->value:I

    .line 2
    .line 3
    return p0
.end method
