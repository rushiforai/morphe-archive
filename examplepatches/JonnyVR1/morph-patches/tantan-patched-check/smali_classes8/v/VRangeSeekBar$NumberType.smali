.class final enum Lv/VRangeSeekBar$NumberType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VRangeSeekBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NumberType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lv/VRangeSeekBar$NumberType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lv/VRangeSeekBar$NumberType;

.field public static final enum BIG_DECIMAL:Lv/VRangeSeekBar$NumberType;

.field public static final enum BYTE:Lv/VRangeSeekBar$NumberType;

.field public static final enum DOUBLE:Lv/VRangeSeekBar$NumberType;

.field public static final enum FLOAT:Lv/VRangeSeekBar$NumberType;

.field public static final enum INTEGER:Lv/VRangeSeekBar$NumberType;

.field public static final enum LONG:Lv/VRangeSeekBar$NumberType;

.field public static final enum SHORT:Lv/VRangeSeekBar$NumberType;


# direct methods
.method private static synthetic $values()[Lv/VRangeSeekBar$NumberType;
    .locals 7

    .line 1
    sget-object v0, Lv/VRangeSeekBar$NumberType;->LONG:Lv/VRangeSeekBar$NumberType;

    .line 2
    .line 3
    sget-object v1, Lv/VRangeSeekBar$NumberType;->DOUBLE:Lv/VRangeSeekBar$NumberType;

    .line 4
    .line 5
    sget-object v2, Lv/VRangeSeekBar$NumberType;->INTEGER:Lv/VRangeSeekBar$NumberType;

    .line 6
    .line 7
    sget-object v3, Lv/VRangeSeekBar$NumberType;->FLOAT:Lv/VRangeSeekBar$NumberType;

    .line 8
    .line 9
    sget-object v4, Lv/VRangeSeekBar$NumberType;->SHORT:Lv/VRangeSeekBar$NumberType;

    .line 10
    .line 11
    sget-object v5, Lv/VRangeSeekBar$NumberType;->BYTE:Lv/VRangeSeekBar$NumberType;

    .line 12
    .line 13
    sget-object v6, Lv/VRangeSeekBar$NumberType;->BIG_DECIMAL:Lv/VRangeSeekBar$NumberType;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Lv/VRangeSeekBar$NumberType;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lv/VRangeSeekBar$NumberType;

    .line 2
    .line 3
    const-string v1, "LONG"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lv/VRangeSeekBar$NumberType;->LONG:Lv/VRangeSeekBar$NumberType;

    .line 10
    .line 11
    new-instance v0, Lv/VRangeSeekBar$NumberType;

    .line 12
    .line 13
    const-string v1, "DOUBLE"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lv/VRangeSeekBar$NumberType;->DOUBLE:Lv/VRangeSeekBar$NumberType;

    .line 20
    .line 21
    new-instance v0, Lv/VRangeSeekBar$NumberType;

    .line 22
    .line 23
    const-string v1, "INTEGER"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lv/VRangeSeekBar$NumberType;->INTEGER:Lv/VRangeSeekBar$NumberType;

    .line 30
    .line 31
    new-instance v0, Lv/VRangeSeekBar$NumberType;

    .line 32
    .line 33
    const-string v1, "FLOAT"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lv/VRangeSeekBar$NumberType;->FLOAT:Lv/VRangeSeekBar$NumberType;

    .line 40
    .line 41
    new-instance v0, Lv/VRangeSeekBar$NumberType;

    .line 42
    .line 43
    const-string v1, "SHORT"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lv/VRangeSeekBar$NumberType;->SHORT:Lv/VRangeSeekBar$NumberType;

    .line 50
    .line 51
    new-instance v0, Lv/VRangeSeekBar$NumberType;

    .line 52
    .line 53
    const-string v1, "BYTE"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lv/VRangeSeekBar$NumberType;->BYTE:Lv/VRangeSeekBar$NumberType;

    .line 60
    .line 61
    new-instance v0, Lv/VRangeSeekBar$NumberType;

    .line 62
    .line 63
    const-string v1, "BIG_DECIMAL"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2}, Lv/VRangeSeekBar$NumberType;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lv/VRangeSeekBar$NumberType;->BIG_DECIMAL:Lv/VRangeSeekBar$NumberType;

    .line 70
    .line 71
    invoke-static {}, Lv/VRangeSeekBar$NumberType;->$values()[Lv/VRangeSeekBar$NumberType;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lv/VRangeSeekBar$NumberType;->$VALUES:[Lv/VRangeSeekBar$NumberType;

    .line 76
    .line 77
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

.method public static fromNumber(Ljava/lang/Number;)Lv/VRangeSeekBar$NumberType;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Number;",
            ">(TE;)",
            "Lv/VRangeSeekBar$NumberType;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    instance-of v0, p0, Ljava/lang/Long;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lv/VRangeSeekBar$NumberType;->LONG:Lv/VRangeSeekBar$NumberType;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    instance-of v0, p0, Ljava/lang/Double;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget-object p0, Lv/VRangeSeekBar$NumberType;->DOUBLE:Lv/VRangeSeekBar$NumberType;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    instance-of v0, p0, Ljava/lang/Integer;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    sget-object p0, Lv/VRangeSeekBar$NumberType;->INTEGER:Lv/VRangeSeekBar$NumberType;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    instance-of v0, p0, Ljava/lang/Float;

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    sget-object p0, Lv/VRangeSeekBar$NumberType;->FLOAT:Lv/VRangeSeekBar$NumberType;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_3
    instance-of v0, p0, Ljava/lang/Short;

    .line 30
    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    sget-object p0, Lv/VRangeSeekBar$NumberType;->SHORT:Lv/VRangeSeekBar$NumberType;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    instance-of v0, p0, Ljava/lang/Byte;

    .line 37
    .line 38
    if-eqz v0, :cond_5

    .line 39
    .line 40
    sget-object p0, Lv/VRangeSeekBar$NumberType;->BYTE:Lv/VRangeSeekBar$NumberType;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_5
    instance-of v0, p0, Ljava/math/BigDecimal;

    .line 44
    .line 45
    if-eqz v0, :cond_6

    .line 46
    .line 47
    sget-object p0, Lv/VRangeSeekBar$NumberType;->BIG_DECIMAL:Lv/VRangeSeekBar$NumberType;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string v0, "\' is not supported"

    .line 59
    .line 60
    const-string v1, "Number class \'"

    .line 61
    .line 62
    invoke-static {v1, p0, v0}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lv/VRangeSeekBar$NumberType;
    .locals 1

    .line 1
    const-class v0, Lv/VRangeSeekBar$NumberType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv/VRangeSeekBar$NumberType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lv/VRangeSeekBar$NumberType;
    .locals 1

    .line 1
    sget-object v0, Lv/VRangeSeekBar$NumberType;->$VALUES:[Lv/VRangeSeekBar$NumberType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lv/VRangeSeekBar$NumberType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lv/VRangeSeekBar$NumberType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toNumber(D)Ljava/lang/Number;
    .locals 2

    .line 1
    sget-object v0, Lv/VRangeSeekBar$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    new-instance p1, Ljava/lang/InstantiationError;

    .line 13
    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v0, "can\'t convert "

    .line 17
    .line 18
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p0, " to a Number object"

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {p1, p0}, Ljava/lang/InstantiationError;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p1

    .line 37
    :pswitch_0
    new-instance p0, Ljava/math/BigDecimal;

    .line 38
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/math/BigDecimal;-><init>(D)V

    .line 40
    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_1
    new-instance p0, Ljava/lang/Byte;

    .line 44
    .line 45
    double-to-int p1, p1

    .line 46
    int-to-byte p1, p1

    .line 47
    invoke-direct {p0, p1}, Ljava/lang/Byte;-><init>(B)V

    .line 48
    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_2
    new-instance p0, Ljava/lang/Short;

    .line 52
    .line 53
    double-to-int p1, p1

    .line 54
    int-to-short p1, p1

    .line 55
    invoke-direct {p0, p1}, Ljava/lang/Short;-><init>(S)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :pswitch_3
    new-instance p0, Ljava/lang/Float;

    .line 60
    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Float;-><init>(D)V

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :pswitch_4
    new-instance p0, Ljava/lang/Integer;

    .line 66
    .line 67
    double-to-int p1, p1

    .line 68
    invoke-direct {p0, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 69
    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_5
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :pswitch_6
    new-instance p0, Ljava/lang/Long;

    .line 78
    .line 79
    double-to-long p1, p1

    .line 80
    invoke-direct {p0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    nop

    .line 85
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
