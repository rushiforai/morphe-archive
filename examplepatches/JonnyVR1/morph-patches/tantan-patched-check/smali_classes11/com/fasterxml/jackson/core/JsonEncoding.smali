.class public final enum Lcom/fasterxml/jackson/core/JsonEncoding;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/fasterxml/jackson/core/JsonEncoding;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/fasterxml/jackson/core/JsonEncoding;

.field public static final enum UTF16_BE:Lcom/fasterxml/jackson/core/JsonEncoding;

.field public static final enum UTF16_LE:Lcom/fasterxml/jackson/core/JsonEncoding;

.field public static final enum UTF32_BE:Lcom/fasterxml/jackson/core/JsonEncoding;

.field public static final enum UTF32_LE:Lcom/fasterxml/jackson/core/JsonEncoding;

.field public static final enum UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;


# instance fields
.field protected final _bigEndian:Z

.field protected final _bits:I

.field protected final _javaName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/16 v5, 0x8

    .line 5
    .line 6
    const-string v1, "UTF8"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const-string v3, "UTF-8"

    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/JsonEncoding;-><init>(Ljava/lang/String;ILjava/lang/String;ZI)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 15
    .line 16
    new-instance v1, Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    const/16 v6, 0x10

    .line 20
    .line 21
    const-string v2, "UTF16_BE"

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    const-string v4, "UTF-16BE"

    .line 25
    .line 26
    invoke-direct/range {v1 .. v6}, Lcom/fasterxml/jackson/core/JsonEncoding;-><init>(Ljava/lang/String;ILjava/lang/String;ZI)V

    .line 27
    .line 28
    .line 29
    sput-object v1, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF16_BE:Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 30
    .line 31
    new-instance v2, Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 32
    .line 33
    const/4 v6, 0x0

    .line 34
    const/16 v7, 0x10

    .line 35
    .line 36
    const-string v3, "UTF16_LE"

    .line 37
    .line 38
    const/4 v4, 0x2

    .line 39
    const-string v5, "UTF-16LE"

    .line 40
    .line 41
    invoke-direct/range {v2 .. v7}, Lcom/fasterxml/jackson/core/JsonEncoding;-><init>(Ljava/lang/String;ILjava/lang/String;ZI)V

    .line 42
    .line 43
    .line 44
    sput-object v2, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF16_LE:Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 45
    .line 46
    new-instance v3, Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 47
    .line 48
    const/4 v7, 0x1

    .line 49
    const/16 v8, 0x20

    .line 50
    .line 51
    const-string v4, "UTF32_BE"

    .line 52
    .line 53
    const/4 v5, 0x3

    .line 54
    const-string v6, "UTF-32BE"

    .line 55
    .line 56
    invoke-direct/range {v3 .. v8}, Lcom/fasterxml/jackson/core/JsonEncoding;-><init>(Ljava/lang/String;ILjava/lang/String;ZI)V

    .line 57
    .line 58
    .line 59
    sput-object v3, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF32_BE:Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 60
    .line 61
    new-instance v4, Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 62
    .line 63
    const/4 v8, 0x0

    .line 64
    const/16 v9, 0x20

    .line 65
    .line 66
    const-string v5, "UTF32_LE"

    .line 67
    .line 68
    const/4 v6, 0x4

    .line 69
    const-string v7, "UTF-32LE"

    .line 70
    .line 71
    invoke-direct/range {v4 .. v9}, Lcom/fasterxml/jackson/core/JsonEncoding;-><init>(Ljava/lang/String;ILjava/lang/String;ZI)V

    .line 72
    .line 73
    .line 74
    sput-object v4, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF32_LE:Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 75
    .line 76
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sput-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->$VALUES:[Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 81
    .line 82
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZI)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonEncoding;->_javaName:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p4, p0, Lcom/fasterxml/jackson/core/JsonEncoding;->_bigEndian:Z

    .line 7
    .line 8
    iput p5, p0, Lcom/fasterxml/jackson/core/JsonEncoding;->_bits:I

    .line 9
    .line 10
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonEncoding;
    .locals 1

    .line 1
    const-class v0, Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/fasterxml/jackson/core/JsonEncoding;
    .locals 1

    .line 1
    sget-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->$VALUES:[Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/fasterxml/jackson/core/JsonEncoding;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bits()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/fasterxml/jackson/core/JsonEncoding;->_bits:I

    .line 2
    .line 3
    return p0
.end method

.method public getJavaName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/fasterxml/jackson/core/JsonEncoding;->_javaName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isBigEndian()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/fasterxml/jackson/core/JsonEncoding;->_bigEndian:Z

    .line 2
    .line 3
    return p0
.end method
