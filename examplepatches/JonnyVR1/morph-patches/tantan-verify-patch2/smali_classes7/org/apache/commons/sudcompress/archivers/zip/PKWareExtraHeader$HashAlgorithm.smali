.class public final enum Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HashAlgorithm"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum CRC32:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum MD5:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum NONE:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum RIPEND160:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum SHA1:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum SHA256:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum SHA384:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field public static final enum SHA512:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field private static final codeToEnum:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final code:I


# direct methods
.method private static synthetic $values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;
    .locals 8

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->NONE:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->CRC32:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 4
    .line 5
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->MD5:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 6
    .line 7
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA1:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 8
    .line 9
    sget-object v4, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->RIPEND160:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 10
    .line 11
    sget-object v5, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA256:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 12
    .line 13
    sget-object v6, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA384:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 14
    .line 15
    sget-object v7, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA512:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->NONE:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 10
    .line 11
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 12
    .line 13
    const-string v1, "CRC32"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v0, v1, v3, v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->CRC32:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 20
    .line 21
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    const v3, 0x8003

    .line 25
    .line 26
    .line 27
    const-string v4, "MD5"

    .line 28
    .line 29
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->MD5:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 33
    .line 34
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    const v3, 0x8004

    .line 38
    .line 39
    .line 40
    const-string v4, "SHA1"

    .line 41
    .line 42
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA1:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 46
    .line 47
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    const v3, 0x8007

    .line 51
    .line 52
    .line 53
    const-string v4, "RIPEND160"

    .line 54
    .line 55
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->RIPEND160:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 59
    .line 60
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 61
    .line 62
    const/4 v1, 0x5

    .line 63
    const v3, 0x800c

    .line 64
    .line 65
    .line 66
    const-string v4, "SHA256"

    .line 67
    .line 68
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA256:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 72
    .line 73
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 74
    .line 75
    const/4 v1, 0x6

    .line 76
    const v3, 0x800d

    .line 77
    .line 78
    .line 79
    const-string v4, "SHA384"

    .line 80
    .line 81
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 82
    .line 83
    .line 84
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA384:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 85
    .line 86
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 87
    .line 88
    const/4 v1, 0x7

    .line 89
    const v3, 0x800e

    .line 90
    .line 91
    .line 92
    const-string v4, "SHA512"

    .line 93
    .line 94
    invoke-direct {v0, v4, v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 95
    .line 96
    .line 97
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->SHA512:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 98
    .line 99
    invoke-static {}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->$values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 104
    .line 105
    new-instance v0, Ljava/util/HashMap;

    .line 106
    .line 107
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    array-length v3, v1

    .line 115
    :goto_0
    if-ge v2, v3, :cond_0

    .line 116
    .line 117
    aget-object v4, v1, v2

    .line 118
    .line 119
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->getCode()I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    add-int/lit8 v2, v2, 0x1

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->codeToEnum:Ljava/util/Map;

    .line 138
    .line 139
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
    iput p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->code:I

    .line 5
    .line 6
    return-void
.end method

.method public static getAlgorithmByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->codeToEnum:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 12
    .line 13
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;
    .locals 1

    .line 1
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->code:I

    .line 2
    .line 3
    return p0
.end method
