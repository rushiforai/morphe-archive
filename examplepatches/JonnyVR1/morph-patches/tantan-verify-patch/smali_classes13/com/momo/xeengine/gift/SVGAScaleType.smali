.class public final enum Lcom/momo/xeengine/gift/SVGAScaleType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xeengine/gift/SVGAScaleType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/xeengine/gift/SVGAScaleType;

.field public static final enum ASPECT_FILL:Lcom/momo/xeengine/gift/SVGAScaleType;

.field public static final enum ASPECT_FIT:Lcom/momo/xeengine/gift/SVGAScaleType;

.field public static final enum AUTO:Lcom/momo/xeengine/gift/SVGAScaleType;

.field public static final enum FILL:Lcom/momo/xeengine/gift/SVGAScaleType;

.field public static final enum NONE:Lcom/momo/xeengine/gift/SVGAScaleType;

.field public static final enum WIDTH:Lcom/momo/xeengine/gift/SVGAScaleType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/xeengine/gift/SVGAScaleType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/xeengine/gift/SVGAScaleType;->NONE:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 12
    .line 13
    const-string v2, "FILL"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/momo/xeengine/gift/SVGAScaleType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->FILL:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 22
    .line 23
    const-string v3, "ASPECT_FIT"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/momo/xeengine/gift/SVGAScaleType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/xeengine/gift/SVGAScaleType;->ASPECT_FIT:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 30
    .line 31
    new-instance v3, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 32
    .line 33
    const-string v4, "ASPECT_FILL"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/momo/xeengine/gift/SVGAScaleType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/momo/xeengine/gift/SVGAScaleType;->ASPECT_FILL:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 40
    .line 41
    new-instance v4, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 42
    .line 43
    const/4 v5, 0x4

    .line 44
    const/16 v6, 0x3e8

    .line 45
    .line 46
    const-string v7, "AUTO"

    .line 47
    .line 48
    invoke-direct {v4, v7, v5, v6}, Lcom/momo/xeengine/gift/SVGAScaleType;-><init>(Ljava/lang/String;II)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lcom/momo/xeengine/gift/SVGAScaleType;->AUTO:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 52
    .line 53
    new-instance v5, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 54
    .line 55
    const/4 v6, 0x5

    .line 56
    const/16 v7, 0x3e9

    .line 57
    .line 58
    const-string v8, "WIDTH"

    .line 59
    .line 60
    invoke-direct {v5, v8, v6, v7}, Lcom/momo/xeengine/gift/SVGAScaleType;-><init>(Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    sput-object v5, Lcom/momo/xeengine/gift/SVGAScaleType;->WIDTH:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 64
    .line 65
    filled-new-array/range {v0 .. v5}, [Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sput-object v0, Lcom/momo/xeengine/gift/SVGAScaleType;->$VALUES:[Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 70
    .line 71
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
    iput p3, p0, Lcom/momo/xeengine/gift/SVGAScaleType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/momo/xeengine/gift/SVGAScaleType;
    .locals 5

    .line 1
    invoke-static {}, Lcom/momo/xeengine/gift/SVGAScaleType;->values()[Lcom/momo/xeengine/gift/SVGAScaleType;

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
    iget v4, v3, Lcom/momo/xeengine/gift/SVGAScaleType;->value:I

    .line 12
    .line 13
    if-ne v4, p0, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object p0, Lcom/momo/xeengine/gift/SVGAScaleType;->NONE:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 20
    .line 21
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xeengine/gift/SVGAScaleType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/xeengine/gift/SVGAScaleType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/gift/SVGAScaleType;->$VALUES:[Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/xeengine/gift/SVGAScaleType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/SVGAScaleType;->value:I

    .line 2
    .line 3
    return p0
.end method
