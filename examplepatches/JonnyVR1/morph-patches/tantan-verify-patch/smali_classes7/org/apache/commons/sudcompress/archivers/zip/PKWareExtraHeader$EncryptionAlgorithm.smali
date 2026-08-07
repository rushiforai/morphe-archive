.class public final enum Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EncryptionAlgorithm"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum AES128:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum AES192:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum AES256:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum DES:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum RC2:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum RC2pre52:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum RC4:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum TripleDES168:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum TripleDES192:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field public static final enum UNKNOWN:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field private static final codeToEnum:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final code:I


# direct methods
.method private static synthetic $values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;
    .locals 10

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->DES:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->RC2pre52:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 4
    .line 5
    sget-object v2, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->TripleDES168:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 6
    .line 7
    sget-object v3, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->TripleDES192:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 8
    .line 9
    sget-object v4, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->AES128:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 10
    .line 11
    sget-object v5, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->AES192:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 12
    .line 13
    sget-object v6, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->AES256:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 14
    .line 15
    sget-object v7, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->RC2:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 16
    .line 17
    sget-object v8, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->RC4:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 18
    .line 19
    sget-object v9, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->UNKNOWN:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 2
    .line 3
    const/16 v1, 0x6601

    .line 4
    .line 5
    const-string v2, "DES"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->DES:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 12
    .line 13
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/16 v2, 0x6602

    .line 17
    .line 18
    const-string v4, "RC2pre52"

    .line 19
    .line 20
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->RC2pre52:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 24
    .line 25
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const/16 v2, 0x6603

    .line 29
    .line 30
    const-string v4, "TripleDES168"

    .line 31
    .line 32
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->TripleDES168:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 36
    .line 37
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const/16 v2, 0x6609

    .line 41
    .line 42
    const-string v4, "TripleDES192"

    .line 43
    .line 44
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->TripleDES192:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 48
    .line 49
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const/16 v2, 0x660e

    .line 53
    .line 54
    const-string v4, "AES128"

    .line 55
    .line 56
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->AES128:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 60
    .line 61
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    const/16 v2, 0x660f

    .line 65
    .line 66
    const-string v4, "AES192"

    .line 67
    .line 68
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->AES192:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 72
    .line 73
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 74
    .line 75
    const/4 v1, 0x6

    .line 76
    const/16 v2, 0x6610

    .line 77
    .line 78
    const-string v4, "AES256"

    .line 79
    .line 80
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->AES256:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 84
    .line 85
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 86
    .line 87
    const/4 v1, 0x7

    .line 88
    const/16 v2, 0x6702

    .line 89
    .line 90
    const-string v4, "RC2"

    .line 91
    .line 92
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->RC2:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 96
    .line 97
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 98
    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    const/16 v2, 0x6801

    .line 102
    .line 103
    const-string v4, "RC4"

    .line 104
    .line 105
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->RC4:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 109
    .line 110
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 111
    .line 112
    const/16 v1, 0x9

    .line 113
    .line 114
    const v2, 0xffff

    .line 115
    .line 116
    .line 117
    const-string v4, "UNKNOWN"

    .line 118
    .line 119
    invoke-direct {v0, v4, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;-><init>(Ljava/lang/String;II)V

    .line 120
    .line 121
    .line 122
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->UNKNOWN:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 123
    .line 124
    invoke-static {}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->$values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 129
    .line 130
    new-instance v0, Ljava/util/HashMap;

    .line 131
    .line 132
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    array-length v2, v1

    .line 140
    :goto_0
    if-ge v3, v2, :cond_0

    .line 141
    .line 142
    aget-object v4, v1, v3

    .line 143
    .line 144
    invoke-virtual {v4}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->getCode()I

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    add-int/lit8 v3, v3, 0x1

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->codeToEnum:Ljava/util/Map;

    .line 163
    .line 164
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
    iput p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->code:I

    .line 5
    .line 6
    return-void
.end method

.method public static getAlgorithmByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->codeToEnum:Ljava/util/Map;

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
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 12
    .line 13
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;
    .locals 1

    .line 1
    const-class v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->$VALUES:[Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->code:I

    .line 2
    .line 3
    return p0
.end method
