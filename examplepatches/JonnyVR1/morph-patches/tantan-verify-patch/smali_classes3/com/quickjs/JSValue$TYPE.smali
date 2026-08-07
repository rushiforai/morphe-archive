.class public final enum Lcom/quickjs/JSValue$TYPE;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/quickjs/JSValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/quickjs/JSValue$TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/quickjs/JSValue$TYPE;

.field public static final enum BOOLEAN:Lcom/quickjs/JSValue$TYPE;

.field public static final enum DOUBLE:Lcom/quickjs/JSValue$TYPE;

.field public static final enum INTEGER:Lcom/quickjs/JSValue$TYPE;

.field public static final enum JS_ARRAY:Lcom/quickjs/JSValue$TYPE;

.field public static final enum JS_FUNCTION:Lcom/quickjs/JSValue$TYPE;

.field public static final enum JS_OBJECT:Lcom/quickjs/JSValue$TYPE;

.field public static final enum NULL:Lcom/quickjs/JSValue$TYPE;

.field public static final enum STRING:Lcom/quickjs/JSValue$TYPE;

.field public static final enum UNDEFINED:Lcom/quickjs/JSValue$TYPE;

.field public static final enum UNKNOWN:Lcom/quickjs/JSValue$TYPE;


# instance fields
.field final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    const-string v1, "NULL"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/quickjs/JSValue$TYPE;->NULL:Lcom/quickjs/JSValue$TYPE;

    .line 10
    .line 11
    new-instance v1, Lcom/quickjs/JSValue$TYPE;

    .line 12
    .line 13
    const-string v3, "UNKNOWN"

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    invoke-direct {v1, v3, v4, v2}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    .line 20
    .line 21
    new-instance v2, Lcom/quickjs/JSValue$TYPE;

    .line 22
    .line 23
    const/16 v3, 0x63

    .line 24
    .line 25
    const-string v5, "UNDEFINED"

    .line 26
    .line 27
    const/4 v6, 0x2

    .line 28
    invoke-direct {v2, v5, v6, v3}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/quickjs/JSValue$TYPE;->UNDEFINED:Lcom/quickjs/JSValue$TYPE;

    .line 32
    .line 33
    new-instance v3, Lcom/quickjs/JSValue$TYPE;

    .line 34
    .line 35
    const-string v5, "INTEGER"

    .line 36
    .line 37
    const/4 v7, 0x3

    .line 38
    invoke-direct {v3, v5, v7, v4}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/quickjs/JSValue$TYPE;->INTEGER:Lcom/quickjs/JSValue$TYPE;

    .line 42
    .line 43
    new-instance v4, Lcom/quickjs/JSValue$TYPE;

    .line 44
    .line 45
    const-string v5, "DOUBLE"

    .line 46
    .line 47
    const/4 v8, 0x4

    .line 48
    invoke-direct {v4, v5, v8, v6}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lcom/quickjs/JSValue$TYPE;->DOUBLE:Lcom/quickjs/JSValue$TYPE;

    .line 52
    .line 53
    new-instance v5, Lcom/quickjs/JSValue$TYPE;

    .line 54
    .line 55
    const-string v6, "BOOLEAN"

    .line 56
    .line 57
    const/4 v9, 0x5

    .line 58
    invoke-direct {v5, v6, v9, v7}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 59
    .line 60
    .line 61
    sput-object v5, Lcom/quickjs/JSValue$TYPE;->BOOLEAN:Lcom/quickjs/JSValue$TYPE;

    .line 62
    .line 63
    new-instance v6, Lcom/quickjs/JSValue$TYPE;

    .line 64
    .line 65
    const-string v7, "STRING"

    .line 66
    .line 67
    const/4 v10, 0x6

    .line 68
    invoke-direct {v6, v7, v10, v8}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    sput-object v6, Lcom/quickjs/JSValue$TYPE;->STRING:Lcom/quickjs/JSValue$TYPE;

    .line 72
    .line 73
    new-instance v7, Lcom/quickjs/JSValue$TYPE;

    .line 74
    .line 75
    const-string v8, "JS_ARRAY"

    .line 76
    .line 77
    const/4 v11, 0x7

    .line 78
    invoke-direct {v7, v8, v11, v9}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v7, Lcom/quickjs/JSValue$TYPE;->JS_ARRAY:Lcom/quickjs/JSValue$TYPE;

    .line 82
    .line 83
    new-instance v8, Lcom/quickjs/JSValue$TYPE;

    .line 84
    .line 85
    const-string v9, "JS_OBJECT"

    .line 86
    .line 87
    const/16 v12, 0x8

    .line 88
    .line 89
    invoke-direct {v8, v9, v12, v10}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 90
    .line 91
    .line 92
    sput-object v8, Lcom/quickjs/JSValue$TYPE;->JS_OBJECT:Lcom/quickjs/JSValue$TYPE;

    .line 93
    .line 94
    new-instance v9, Lcom/quickjs/JSValue$TYPE;

    .line 95
    .line 96
    const-string v10, "JS_FUNCTION"

    .line 97
    .line 98
    const/16 v12, 0x9

    .line 99
    .line 100
    invoke-direct {v9, v10, v12, v11}, Lcom/quickjs/JSValue$TYPE;-><init>(Ljava/lang/String;II)V

    .line 101
    .line 102
    .line 103
    sput-object v9, Lcom/quickjs/JSValue$TYPE;->JS_FUNCTION:Lcom/quickjs/JSValue$TYPE;

    .line 104
    .line 105
    filled-new-array/range {v0 .. v9}, [Lcom/quickjs/JSValue$TYPE;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    sput-object v0, Lcom/quickjs/JSValue$TYPE;->$VALUES:[Lcom/quickjs/JSValue$TYPE;

    .line 110
    .line 111
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
    iput p3, p0, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/quickjs/JSValue$TYPE;
    .locals 1

    .line 1
    const-class v0, Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/quickjs/JSValue$TYPE;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/quickjs/JSValue$TYPE;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->$VALUES:[Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/quickjs/JSValue$TYPE;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/quickjs/JSValue$TYPE;

    .line 8
    .line 9
    return-object v0
.end method
