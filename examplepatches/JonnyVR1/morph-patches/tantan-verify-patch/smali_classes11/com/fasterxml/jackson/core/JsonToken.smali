.class public final enum Lcom/fasterxml/jackson/core/JsonToken;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/fasterxml/jackson/core/JsonToken;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum VALUE_EMBEDDED_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

.field public static final enum VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;


# instance fields
.field final _id:I

.field final _isBoolean:Z

.field final _isNumber:Z

.field final _isScalar:Z

.field final _isStructEnd:Z

.field final _isStructStart:Z

.field final _serialized:Ljava/lang/String;

.field final _serializedBytes:[B

.field final _serializedChars:[C


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 1
    new-instance v0, Lcom/fasterxml/jackson/core/JsonToken;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "NOT_AVAILABLE"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/fasterxml/jackson/core/JsonToken;->NOT_AVAILABLE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 12
    .line 13
    new-instance v1, Lcom/fasterxml/jackson/core/JsonToken;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "{"

    .line 17
    .line 18
    const-string v5, "START_OBJECT"

    .line 19
    .line 20
    invoke-direct {v1, v5, v2, v3, v2}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 24
    .line 25
    new-instance v2, Lcom/fasterxml/jackson/core/JsonToken;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v5, "}"

    .line 29
    .line 30
    const-string v6, "END_OBJECT"

    .line 31
    .line 32
    invoke-direct {v2, v6, v3, v5, v3}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 36
    .line 37
    new-instance v3, Lcom/fasterxml/jackson/core/JsonToken;

    .line 38
    .line 39
    const/4 v5, 0x3

    .line 40
    const-string v6, "["

    .line 41
    .line 42
    const-string v7, "START_ARRAY"

    .line 43
    .line 44
    invoke-direct {v3, v7, v5, v6, v5}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 48
    .line 49
    new-instance v5, Lcom/fasterxml/jackson/core/JsonToken;

    .line 50
    .line 51
    const/4 v6, 0x4

    .line 52
    const-string v7, "]"

    .line 53
    .line 54
    const-string v8, "END_ARRAY"

    .line 55
    .line 56
    invoke-direct {v5, v8, v6, v7, v6}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 60
    .line 61
    move-object v6, v5

    .line 62
    new-instance v5, Lcom/fasterxml/jackson/core/JsonToken;

    .line 63
    .line 64
    const-string v7, "FIELD_NAME"

    .line 65
    .line 66
    const/4 v8, 0x5

    .line 67
    invoke-direct {v5, v7, v8, v4, v8}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    sput-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    .line 71
    .line 72
    move-object v7, v6

    .line 73
    new-instance v6, Lcom/fasterxml/jackson/core/JsonToken;

    .line 74
    .line 75
    const-string v8, "VALUE_EMBEDDED_OBJECT"

    .line 76
    .line 77
    const/4 v9, 0x6

    .line 78
    const/16 v10, 0xc

    .line 79
    .line 80
    invoke-direct {v6, v8, v9, v4, v10}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    sput-object v6, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_EMBEDDED_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 84
    .line 85
    move-object v8, v7

    .line 86
    new-instance v7, Lcom/fasterxml/jackson/core/JsonToken;

    .line 87
    .line 88
    const-string v11, "VALUE_STRING"

    .line 89
    .line 90
    const/4 v12, 0x7

    .line 91
    invoke-direct {v7, v11, v12, v4, v9}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 92
    .line 93
    .line 94
    sput-object v7, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    .line 95
    .line 96
    move-object v9, v8

    .line 97
    new-instance v8, Lcom/fasterxml/jackson/core/JsonToken;

    .line 98
    .line 99
    const-string v11, "VALUE_NUMBER_INT"

    .line 100
    .line 101
    const/16 v13, 0x8

    .line 102
    .line 103
    invoke-direct {v8, v11, v13, v4, v12}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 104
    .line 105
    .line 106
    sput-object v8, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 107
    .line 108
    move-object v11, v9

    .line 109
    new-instance v9, Lcom/fasterxml/jackson/core/JsonToken;

    .line 110
    .line 111
    const-string v12, "VALUE_NUMBER_FLOAT"

    .line 112
    .line 113
    const/16 v14, 0x9

    .line 114
    .line 115
    invoke-direct {v9, v12, v14, v4, v13}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 116
    .line 117
    .line 118
    sput-object v9, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 119
    .line 120
    new-instance v4, Lcom/fasterxml/jackson/core/JsonToken;

    .line 121
    .line 122
    const-string v12, "true"

    .line 123
    .line 124
    const-string v13, "VALUE_TRUE"

    .line 125
    .line 126
    const/16 v15, 0xa

    .line 127
    .line 128
    invoke-direct {v4, v13, v15, v12, v14}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 129
    .line 130
    .line 131
    sput-object v4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 132
    .line 133
    move-object v12, v4

    .line 134
    move-object v4, v11

    .line 135
    new-instance v11, Lcom/fasterxml/jackson/core/JsonToken;

    .line 136
    .line 137
    const-string v13, "false"

    .line 138
    .line 139
    const-string v14, "VALUE_FALSE"

    .line 140
    .line 141
    const/16 v10, 0xb

    .line 142
    .line 143
    invoke-direct {v11, v14, v10, v13, v15}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 144
    .line 145
    .line 146
    sput-object v11, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 147
    .line 148
    move-object v13, v12

    .line 149
    new-instance v12, Lcom/fasterxml/jackson/core/JsonToken;

    .line 150
    .line 151
    const-string v14, "VALUE_NULL"

    .line 152
    .line 153
    const-string v15, "null"

    .line 154
    .line 155
    move-object/from16 v16, v0

    .line 156
    .line 157
    const/16 v0, 0xc

    .line 158
    .line 159
    invoke-direct {v12, v14, v0, v15, v10}, Lcom/fasterxml/jackson/core/JsonToken;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    .line 160
    .line 161
    .line 162
    sput-object v12, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 163
    .line 164
    move-object v10, v13

    .line 165
    move-object/from16 v0, v16

    .line 166
    .line 167
    filled-new-array/range {v0 .. v12}, [Lcom/fasterxml/jackson/core/JsonToken;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    sput-object v0, Lcom/fasterxml/jackson/core/JsonToken;->$VALUES:[Lcom/fasterxml/jackson/core/JsonToken;

    .line 172
    .line 173
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serialized:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedChars:[C

    .line 11
    .line 12
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedBytes:[B

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serialized:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p3}, Ljava/lang/String;->toCharArray()[C

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedChars:[C

    .line 22
    .line 23
    array-length p2, p2

    .line 24
    new-array p3, p2, [B

    .line 25
    .line 26
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedBytes:[B

    .line 27
    .line 28
    move p3, p1

    .line 29
    :goto_0
    if-ge p3, p2, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedBytes:[B

    .line 32
    .line 33
    iget-object v1, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedChars:[C

    .line 34
    .line 35
    aget-char v1, v1, p3

    .line 36
    .line 37
    int-to-byte v1, v1

    .line 38
    aput-byte v1, v0, p3

    .line 39
    .line 40
    add-int/lit8 p3, p3, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    :goto_1
    iput p4, p0, Lcom/fasterxml/jackson/core/JsonToken;->_id:I

    .line 44
    .line 45
    const/16 p2, 0xa

    .line 46
    .line 47
    const/4 p3, 0x1

    .line 48
    if-eq p4, p2, :cond_3

    .line 49
    .line 50
    const/16 p2, 0x9

    .line 51
    .line 52
    if-ne p4, p2, :cond_2

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    move p2, p1

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    :goto_2
    move p2, p3

    .line 58
    :goto_3
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isBoolean:Z

    .line 59
    .line 60
    const/4 p2, 0x7

    .line 61
    if-eq p4, p2, :cond_5

    .line 62
    .line 63
    const/16 p2, 0x8

    .line 64
    .line 65
    if-ne p4, p2, :cond_4

    .line 66
    .line 67
    goto :goto_4

    .line 68
    :cond_4
    move p2, p1

    .line 69
    goto :goto_5

    .line 70
    :cond_5
    :goto_4
    move p2, p3

    .line 71
    :goto_5
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isNumber:Z

    .line 72
    .line 73
    if-eq p4, p3, :cond_7

    .line 74
    .line 75
    const/4 p2, 0x3

    .line 76
    if-ne p4, p2, :cond_6

    .line 77
    .line 78
    goto :goto_6

    .line 79
    :cond_6
    move p2, p1

    .line 80
    goto :goto_7

    .line 81
    :cond_7
    :goto_6
    move p2, p3

    .line 82
    :goto_7
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isStructStart:Z

    .line 83
    .line 84
    const/4 v0, 0x2

    .line 85
    if-eq p4, v0, :cond_9

    .line 86
    .line 87
    const/4 v0, 0x4

    .line 88
    if-ne p4, v0, :cond_8

    .line 89
    .line 90
    goto :goto_8

    .line 91
    :cond_8
    move v0, p1

    .line 92
    goto :goto_9

    .line 93
    :cond_9
    :goto_8
    move v0, p3

    .line 94
    :goto_9
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isStructEnd:Z

    .line 95
    .line 96
    if-nez p2, :cond_a

    .line 97
    .line 98
    if-nez v0, :cond_a

    .line 99
    .line 100
    const/4 p2, 0x5

    .line 101
    if-eq p4, p2, :cond_a

    .line 102
    .line 103
    const/4 p2, -0x1

    .line 104
    if-eq p4, p2, :cond_a

    .line 105
    .line 106
    move p1, p3

    .line 107
    :cond_a
    iput-boolean p1, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isScalar:Z

    .line 108
    .line 109
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1

    .line 1
    const-class v0, Lcom/fasterxml/jackson/core/JsonToken;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/fasterxml/jackson/core/JsonToken;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1

    .line 1
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->$VALUES:[Lcom/fasterxml/jackson/core/JsonToken;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/fasterxml/jackson/core/JsonToken;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/fasterxml/jackson/core/JsonToken;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final asByteArray()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedBytes:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public final asCharArray()[C
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serializedChars:[C

    .line 2
    .line 3
    return-object p0
.end method

.method public final asString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_serialized:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final id()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_id:I

    .line 2
    .line 3
    return p0
.end method

.method public final isBoolean()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isBoolean:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isNumeric()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isNumber:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isScalarValue()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isScalar:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isStructEnd()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isStructEnd:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isStructStart()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/fasterxml/jackson/core/JsonToken;->_isStructStart:Z

    .line 2
    .line 3
    return p0
.end method
