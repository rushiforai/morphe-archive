.class public final enum Ljavax/validation/constraints/Pattern$Flag;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Ljavax/validation/constraints/Pattern$Flag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Ljavax/validation/constraints/Pattern$Flag;

.field public static final enum CANON_EQ:Ljavax/validation/constraints/Pattern$Flag;

.field public static final enum CASE_INSENSITIVE:Ljavax/validation/constraints/Pattern$Flag;

.field public static final enum COMMENTS:Ljavax/validation/constraints/Pattern$Flag;

.field public static final enum DOTALL:Ljavax/validation/constraints/Pattern$Flag;

.field public static final enum MULTILINE:Ljavax/validation/constraints/Pattern$Flag;

.field public static final enum UNICODE_CASE:Ljavax/validation/constraints/Pattern$Flag;

.field public static final enum UNIX_LINES:Ljavax/validation/constraints/Pattern$Flag;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Ljavax/validation/constraints/Pattern$Flag;

    .line 2
    .line 3
    const-string v1, "UNIX_LINES"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Ljavax/validation/constraints/Pattern$Flag;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ljavax/validation/constraints/Pattern$Flag;->UNIX_LINES:Ljavax/validation/constraints/Pattern$Flag;

    .line 11
    .line 12
    new-instance v1, Ljavax/validation/constraints/Pattern$Flag;

    .line 13
    .line 14
    const-string v2, "CASE_INSENSITIVE"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Ljavax/validation/constraints/Pattern$Flag;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Ljavax/validation/constraints/Pattern$Flag;->CASE_INSENSITIVE:Ljavax/validation/constraints/Pattern$Flag;

    .line 21
    .line 22
    new-instance v2, Ljavax/validation/constraints/Pattern$Flag;

    .line 23
    .line 24
    const-string v3, "COMMENTS"

    .line 25
    .line 26
    const/4 v5, 0x4

    .line 27
    invoke-direct {v2, v3, v4, v5}, Ljavax/validation/constraints/Pattern$Flag;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Ljavax/validation/constraints/Pattern$Flag;->COMMENTS:Ljavax/validation/constraints/Pattern$Flag;

    .line 31
    .line 32
    new-instance v3, Ljavax/validation/constraints/Pattern$Flag;

    .line 33
    .line 34
    const/4 v4, 0x3

    .line 35
    const/16 v6, 0x8

    .line 36
    .line 37
    const-string v7, "MULTILINE"

    .line 38
    .line 39
    invoke-direct {v3, v7, v4, v6}, Ljavax/validation/constraints/Pattern$Flag;-><init>(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    sput-object v3, Ljavax/validation/constraints/Pattern$Flag;->MULTILINE:Ljavax/validation/constraints/Pattern$Flag;

    .line 43
    .line 44
    new-instance v4, Ljavax/validation/constraints/Pattern$Flag;

    .line 45
    .line 46
    const-string v6, "DOTALL"

    .line 47
    .line 48
    const/16 v7, 0x20

    .line 49
    .line 50
    invoke-direct {v4, v6, v5, v7}, Ljavax/validation/constraints/Pattern$Flag;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Ljavax/validation/constraints/Pattern$Flag;->DOTALL:Ljavax/validation/constraints/Pattern$Flag;

    .line 54
    .line 55
    new-instance v5, Ljavax/validation/constraints/Pattern$Flag;

    .line 56
    .line 57
    const/4 v6, 0x5

    .line 58
    const/16 v7, 0x40

    .line 59
    .line 60
    const-string v8, "UNICODE_CASE"

    .line 61
    .line 62
    invoke-direct {v5, v8, v6, v7}, Ljavax/validation/constraints/Pattern$Flag;-><init>(Ljava/lang/String;II)V

    .line 63
    .line 64
    .line 65
    sput-object v5, Ljavax/validation/constraints/Pattern$Flag;->UNICODE_CASE:Ljavax/validation/constraints/Pattern$Flag;

    .line 66
    .line 67
    new-instance v6, Ljavax/validation/constraints/Pattern$Flag;

    .line 68
    .line 69
    const/4 v7, 0x6

    .line 70
    const/16 v8, 0x80

    .line 71
    .line 72
    const-string v9, "CANON_EQ"

    .line 73
    .line 74
    invoke-direct {v6, v9, v7, v8}, Ljavax/validation/constraints/Pattern$Flag;-><init>(Ljava/lang/String;II)V

    .line 75
    .line 76
    .line 77
    sput-object v6, Ljavax/validation/constraints/Pattern$Flag;->CANON_EQ:Ljavax/validation/constraints/Pattern$Flag;

    .line 78
    .line 79
    filled-new-array/range {v0 .. v6}, [Ljavax/validation/constraints/Pattern$Flag;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sput-object v0, Ljavax/validation/constraints/Pattern$Flag;->$VALUES:[Ljavax/validation/constraints/Pattern$Flag;

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
    iput p3, p0, Ljavax/validation/constraints/Pattern$Flag;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljavax/validation/constraints/Pattern$Flag;
    .locals 1

    .line 1
    const-class v0, Ljavax/validation/constraints/Pattern$Flag;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljavax/validation/constraints/Pattern$Flag;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Ljavax/validation/constraints/Pattern$Flag;
    .locals 1

    .line 1
    sget-object v0, Ljavax/validation/constraints/Pattern$Flag;->$VALUES:[Ljavax/validation/constraints/Pattern$Flag;

    .line 2
    .line 3
    invoke-virtual {v0}, [Ljavax/validation/constraints/Pattern$Flag;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Ljavax/validation/constraints/Pattern$Flag;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Ljavax/validation/constraints/Pattern$Flag;->value:I

    .line 2
    .line 3
    return p0
.end method
