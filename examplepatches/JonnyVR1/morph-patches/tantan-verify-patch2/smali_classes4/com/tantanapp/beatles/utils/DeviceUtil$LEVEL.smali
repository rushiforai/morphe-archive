.class public final enum Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/utils/DeviceUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LEVEL"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

.field public static final enum BAD:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

.field public static final enum BEST:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

.field public static final enum HIGH:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

.field public static final enum LOW:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

.field public static final enum MIDDLE:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

.field public static final enum UN_KNOW:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;


# instance fields
.field value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 2
    .line 3
    const-string v1, "BEST"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x5

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->BEST:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 11
    .line 12
    new-instance v1, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 13
    .line 14
    const-string v2, "HIGH"

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    const/4 v5, 0x4

    .line 18
    invoke-direct {v1, v2, v4, v5}, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->HIGH:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 22
    .line 23
    new-instance v2, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 24
    .line 25
    const-string v6, "MIDDLE"

    .line 26
    .line 27
    const/4 v7, 0x2

    .line 28
    const/4 v8, 0x3

    .line 29
    invoke-direct {v2, v6, v7, v8}, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;-><init>(Ljava/lang/String;II)V

    .line 30
    .line 31
    .line 32
    sput-object v2, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->MIDDLE:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 33
    .line 34
    move v6, v3

    .line 35
    new-instance v3, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 36
    .line 37
    const-string v9, "LOW"

    .line 38
    .line 39
    invoke-direct {v3, v9, v8, v7}, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;-><init>(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    sput-object v3, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->LOW:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 43
    .line 44
    move v7, v4

    .line 45
    new-instance v4, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 46
    .line 47
    const-string v8, "BAD"

    .line 48
    .line 49
    invoke-direct {v4, v8, v5, v7}, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;-><init>(Ljava/lang/String;II)V

    .line 50
    .line 51
    .line 52
    sput-object v4, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->BAD:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 53
    .line 54
    new-instance v5, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 55
    .line 56
    const-string v7, "UN_KNOW"

    .line 57
    .line 58
    const/4 v8, -0x1

    .line 59
    invoke-direct {v5, v7, v6, v8}, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;-><init>(Ljava/lang/String;II)V

    .line 60
    .line 61
    .line 62
    sput-object v5, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->UN_KNOW:Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 63
    .line 64
    filled-new-array/range {v0 .. v5}, [Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sput-object v0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->$VALUES:[Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 69
    .line 70
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
    iput p3, p0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;
    .locals 1

    .line 1
    const-class v0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->$VALUES:[Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/beatles/utils/DeviceUtil$LEVEL;->value:I

    .line 2
    .line 3
    return p0
.end method
