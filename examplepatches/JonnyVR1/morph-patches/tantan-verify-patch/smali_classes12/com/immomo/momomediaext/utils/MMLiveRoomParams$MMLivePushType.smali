.class public final enum Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MMLivePushType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeAid:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeConfWL:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public static final enum MMLiveTypeDefault:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 8

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeDefault:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 4
    .line 5
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 6
    .line 7
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfWL:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 8
    .line 9
    sget-object v4, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 10
    .line 11
    sget-object v5, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 12
    .line 13
    sget-object v6, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 14
    .line 15
    sget-object v7, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeAid:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "MMLiveTypeDefault"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeDefault:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 13
    .line 14
    const-string v1, "MMLiveTypeConfNONE"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 21
    .line 22
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 23
    .line 24
    const-string v1, "MMLiveTypeConfAG"

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    invoke-direct {v0, v1, v3, v2}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 31
    .line 32
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 33
    .line 34
    const-string v1, "MMLiveTypeConfWL"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfWL:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 41
    .line 42
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 43
    .line 44
    const-string v1, "MMLiveTypeConfTX"

    .line 45
    .line 46
    const/4 v3, 0x4

    .line 47
    invoke-direct {v0, v1, v3, v2}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 51
    .line 52
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 53
    .line 54
    const-string v1, "MMLiveTypeConfMM"

    .line 55
    .line 56
    const/4 v2, 0x5

    .line 57
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 61
    .line 62
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 63
    .line 64
    const-string v1, "MMLiveTypeConfVolc"

    .line 65
    .line 66
    const/4 v3, 0x6

    .line 67
    invoke-direct {v0, v1, v3, v2}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 71
    .line 72
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    const/16 v2, 0x14

    .line 76
    .line 77
    const-string v3, "MMLiveTypeAid"

    .line 78
    .line 79
    invoke-direct {v0, v3, v1, v2}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;-><init>(Ljava/lang/String;II)V

    .line 80
    .line 81
    .line 82
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeAid:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 83
    .line 84
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->$values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    sput-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 89
    .line 90
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
    iput p3, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 5

    .line 1
    invoke-static {}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

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
    invoke-virtual {v3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->value()I

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
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->$VALUES:[Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->value:I

    .line 2
    .line 3
    return p0
.end method
