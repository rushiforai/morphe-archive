.class public final enum Lcom/p1/mobile/putong/data/PaymentStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/data/PaymentStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/EnumJsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/EnumJsonAdapter<",
            "Lcom/p1/mobile/putong/data/PaymentStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/EnumProtobufAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/EnumProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/PaymentStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static STRS:[Ljava/lang/String;

.field public static VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

.field public static final enum closed:Lcom/p1/mobile/putong/data/PaymentStatus;

.field public static final enum pending:Lcom/p1/mobile/putong/data/PaymentStatus;

.field public static final enum success:Lcom/p1/mobile/putong/data/PaymentStatus;

.field public static final enum unknown_:Lcom/p1/mobile/putong/data/PaymentStatus;


# instance fields
.field private ordinal:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/data/PaymentStatus;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->unknown_:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/data/PaymentStatus;->pending:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/data/PaymentStatus;->success:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/data/PaymentStatus;->closed:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "unknown_"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/data/PaymentStatus;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->unknown_:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 13
    .line 14
    const-string v1, "pending"

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-direct {v0, v1, v4, v3}, Lcom/p1/mobile/putong/data/PaymentStatus;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->pending:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 23
    .line 24
    const-string v3, "success"

    .line 25
    .line 26
    const/4 v5, 0x2

    .line 27
    invoke-direct {v0, v3, v5, v4}, Lcom/p1/mobile/putong/data/PaymentStatus;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->success:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 33
    .line 34
    const/4 v4, 0x3

    .line 35
    const-string v6, "closed"

    .line 36
    .line 37
    invoke-direct {v0, v6, v4, v5}, Lcom/p1/mobile/putong/data/PaymentStatus;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->closed:Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentStatus;->$values()[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->$VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentStatus;->values()[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 53
    .line 54
    filled-new-array {v2, v1, v3, v6}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->STRS:[Ljava/lang/String;

    .line 59
    .line 60
    new-instance v0, Lcom/tantanapp/common/data/EnumJsonAdapter;

    .line 61
    .line 62
    sget-object v1, Lcom/p1/mobile/putong/data/PaymentStatus;->STRS:[Ljava/lang/String;

    .line 63
    .line 64
    sget-object v2, Lcom/p1/mobile/putong/data/PaymentStatus;->VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 65
    .line 66
    invoke-direct {v0, v1, v2}, Lcom/tantanapp/common/data/EnumJsonAdapter;-><init>([Ljava/lang/String;[Ljava/lang/Enum;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/EnumJsonAdapter;

    .line 70
    .line 71
    new-instance v0, Lcom/tantanapp/common/data/EnumProtobufAdapter;

    .line 72
    .line 73
    sget-object v1, Lcom/p1/mobile/putong/data/PaymentStatus;->VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 74
    .line 75
    new-instance v2, Ll/mp60;

    .line 76
    .line 77
    invoke-direct {v2}, Ll/mp60;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-direct {v0, v1, v2}, Lcom/tantanapp/common/data/EnumProtobufAdapter;-><init>([Ljava/lang/Enum;Ll/qcj;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/EnumProtobufAdapter;

    .line 84
    .line 85
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
    iput p3, p0, Lcom/p1/mobile/putong/data/PaymentStatus;->ordinal:I

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/PaymentStatus;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PaymentStatus;->getOrdinal()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static fromString(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PaymentStatus;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/data/PaymentStatus;->STRS:[Ljava/lang/String;

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_1

    .line 7
    .line 8
    aget-object v2, v2, v1

    .line 9
    .line 10
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/data/PaymentStatus;->VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 17
    .line 18
    aget-object p0, p0, v1

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/data/PaymentStatus;->VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 25
    .line 26
    aget-object p0, p0, v0

    .line 27
    .line 28
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PaymentStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/data/PaymentStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->$VALUES:[Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/data/PaymentStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/data/PaymentStatus;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getOrdinal()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/data/PaymentStatus;->ordinal:I

    .line 2
    .line 3
    return p0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/EnumJsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/PaymentStatus;->STRS:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PaymentStatus;->getOrdinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    aget-object p0, v0, p0

    .line 10
    .line 11
    return-object p0
.end method
