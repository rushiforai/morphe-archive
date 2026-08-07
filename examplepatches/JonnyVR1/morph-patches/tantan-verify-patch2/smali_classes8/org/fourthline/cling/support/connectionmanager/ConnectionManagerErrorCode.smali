.class public final enum Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

.field public static final enum ACCESS_DENIED:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

.field public static final enum INCOMPATIBLE_DIRECTIONS:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

.field public static final enum INCOMPATIBLE_PROTOCOL_INFO:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

.field public static final enum INSUFFICIENT_NETWORK_RESOURCES:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

.field public static final enum INVALID_CONNECTION_REFERENCE:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

.field public static final enum LOCAL_RESTRICTIONS:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

.field public static final enum NOT_IN_NETWORK:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;


# instance fields
.field private code:I

.field private description:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 2
    .line 3
    const/16 v1, 0x2bd

    .line 4
    .line 5
    const-string v2, "The connection cannot be established because the protocol info parameter is incompatible"

    .line 6
    .line 7
    const-string v3, "INCOMPATIBLE_PROTOCOL_INFO"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v3, v4, v1, v2}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->INCOMPATIBLE_PROTOCOL_INFO:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 14
    .line 15
    new-instance v1, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 16
    .line 17
    const/16 v2, 0x2be

    .line 18
    .line 19
    const-string v3, "The connection cannot be established because the directions of the involved ConnectionManagers (source/sink) are incompatible"

    .line 20
    .line 21
    const-string v4, "INCOMPATIBLE_DIRECTIONS"

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    invoke-direct {v1, v4, v5, v2, v3}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v1, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->INCOMPATIBLE_DIRECTIONS:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 28
    .line 29
    new-instance v2, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 30
    .line 31
    const/16 v3, 0x2bf

    .line 32
    .line 33
    const-string v4, "The connection cannot be established because there are insufficient network resources"

    .line 34
    .line 35
    const-string v5, "INSUFFICIENT_NETWORK_RESOURCES"

    .line 36
    .line 37
    const/4 v6, 0x2

    .line 38
    invoke-direct {v2, v5, v6, v3, v4}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v2, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->INSUFFICIENT_NETWORK_RESOURCES:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 42
    .line 43
    new-instance v3, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 44
    .line 45
    const/16 v4, 0x2c0

    .line 46
    .line 47
    const-string v5, "The connection cannot be established because of local restrictions in the device"

    .line 48
    .line 49
    const-string v6, "LOCAL_RESTRICTIONS"

    .line 50
    .line 51
    const/4 v7, 0x3

    .line 52
    invoke-direct {v3, v6, v7, v4, v5}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v3, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->LOCAL_RESTRICTIONS:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 56
    .line 57
    new-instance v4, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 58
    .line 59
    const/16 v5, 0x2c1

    .line 60
    .line 61
    const-string v6, "The connection cannot be established because the client is not permitted."

    .line 62
    .line 63
    const-string v7, "ACCESS_DENIED"

    .line 64
    .line 65
    const/4 v8, 0x4

    .line 66
    invoke-direct {v4, v7, v8, v5, v6}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sput-object v4, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->ACCESS_DENIED:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 70
    .line 71
    new-instance v5, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 72
    .line 73
    const/16 v6, 0x2c2

    .line 74
    .line 75
    const-string v7, "Not a valid connection established by this service"

    .line 76
    .line 77
    const-string v8, "INVALID_CONNECTION_REFERENCE"

    .line 78
    .line 79
    const/4 v9, 0x5

    .line 80
    invoke-direct {v5, v8, v9, v6, v7}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v5, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->INVALID_CONNECTION_REFERENCE:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 84
    .line 85
    new-instance v6, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 86
    .line 87
    const/16 v7, 0x2c3

    .line 88
    .line 89
    const-string v8, "The connection cannot be established because the ConnectionManagers are not part of the same physical network."

    .line 90
    .line 91
    const-string v9, "NOT_IN_NETWORK"

    .line 92
    .line 93
    const/4 v10, 0x6

    .line 94
    invoke-direct {v6, v9, v10, v7, v8}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    sput-object v6, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->NOT_IN_NETWORK:Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 98
    .line 99
    filled-new-array/range {v0 .. v6}, [Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sput-object v0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->$VALUES:[Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 104
    .line 105
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->code:I

    .line 5
    .line 6
    iput-object p4, p0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->description:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static getByCode(I)Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;
    .locals 5

    .line 1
    invoke-static {}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->values()[Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

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
    invoke-virtual {v3}, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->getCode()I

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

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->$VALUES:[Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/connectionmanager/ConnectionManagerErrorCode;->description:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
