.class public final enum Landroidx/datastore/preferences/protobuf/Value$KindCase;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/datastore/preferences/protobuf/Value$KindCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/datastore/preferences/protobuf/Value$KindCase;

.field public static final enum BOOL_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

.field public static final enum KIND_NOT_SET:Landroidx/datastore/preferences/protobuf/Value$KindCase;

.field public static final enum LIST_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

.field public static final enum NULL_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

.field public static final enum NUMBER_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

.field public static final enum STRING_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

.field public static final enum STRUCT_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 2
    .line 3
    const-string v1, "NULL_VALUE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Landroidx/datastore/preferences/protobuf/Value$KindCase;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->NULL_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 11
    .line 12
    new-instance v1, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 13
    .line 14
    const-string v4, "NUMBER_VALUE"

    .line 15
    .line 16
    const/4 v5, 0x2

    .line 17
    invoke-direct {v1, v4, v3, v5}, Landroidx/datastore/preferences/protobuf/Value$KindCase;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Landroidx/datastore/preferences/protobuf/Value$KindCase;->NUMBER_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 21
    .line 22
    move v3, v2

    .line 23
    new-instance v2, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 24
    .line 25
    const-string v4, "STRING_VALUE"

    .line 26
    .line 27
    const/4 v6, 0x3

    .line 28
    invoke-direct {v2, v4, v5, v6}, Landroidx/datastore/preferences/protobuf/Value$KindCase;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Landroidx/datastore/preferences/protobuf/Value$KindCase;->STRING_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 32
    .line 33
    move v4, v3

    .line 34
    new-instance v3, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 35
    .line 36
    const-string v5, "BOOL_VALUE"

    .line 37
    .line 38
    const/4 v7, 0x4

    .line 39
    invoke-direct {v3, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Value$KindCase;-><init>(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    sput-object v3, Landroidx/datastore/preferences/protobuf/Value$KindCase;->BOOL_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 43
    .line 44
    move v5, v4

    .line 45
    new-instance v4, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 46
    .line 47
    const-string v6, "STRUCT_VALUE"

    .line 48
    .line 49
    const/4 v8, 0x5

    .line 50
    invoke-direct {v4, v6, v7, v8}, Landroidx/datastore/preferences/protobuf/Value$KindCase;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Landroidx/datastore/preferences/protobuf/Value$KindCase;->STRUCT_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 54
    .line 55
    move v6, v5

    .line 56
    new-instance v5, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 57
    .line 58
    const-string v7, "LIST_VALUE"

    .line 59
    .line 60
    const/4 v9, 0x6

    .line 61
    invoke-direct {v5, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Value$KindCase;-><init>(Ljava/lang/String;II)V

    .line 62
    .line 63
    .line 64
    sput-object v5, Landroidx/datastore/preferences/protobuf/Value$KindCase;->LIST_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 65
    .line 66
    move v7, v6

    .line 67
    new-instance v6, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 68
    .line 69
    const-string v8, "KIND_NOT_SET"

    .line 70
    .line 71
    invoke-direct {v6, v8, v9, v7}, Landroidx/datastore/preferences/protobuf/Value$KindCase;-><init>(Ljava/lang/String;II)V

    .line 72
    .line 73
    .line 74
    sput-object v6, Landroidx/datastore/preferences/protobuf/Value$KindCase;->KIND_NOT_SET:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 75
    .line 76
    filled-new-array/range {v0 .. v6}, [Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sput-object v0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->$VALUES:[Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 81
    .line 82
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
    iput p3, p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Landroidx/datastore/preferences/protobuf/Value$KindCase;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :pswitch_0
    sget-object p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->LIST_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_1
    sget-object p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->STRUCT_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    sget-object p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->BOOL_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    sget-object p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->STRING_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    sget-object p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->NUMBER_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    sget-object p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->NULL_VALUE:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    sget-object p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->KIND_NOT_SET:Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(I)Landroidx/datastore/preferences/protobuf/Value$KindCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/Value$KindCase;->forNumber(I)Landroidx/datastore/preferences/protobuf/Value$KindCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/datastore/preferences/protobuf/Value$KindCase;
    .locals 1

    .line 1
    const-class v0, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Landroidx/datastore/preferences/protobuf/Value$KindCase;
    .locals 1

    .line 1
    sget-object v0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->$VALUES:[Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 2
    .line 3
    invoke-virtual {v0}, [Landroidx/datastore/preferences/protobuf/Value$KindCase;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Landroidx/datastore/preferences/protobuf/Value$KindCase;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/datastore/preferences/protobuf/Value$KindCase;->value:I

    .line 2
    .line 3
    return p0
.end method
