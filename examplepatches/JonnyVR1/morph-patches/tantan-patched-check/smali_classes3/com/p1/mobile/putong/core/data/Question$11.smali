.class Lcom/p1/mobile/putong/core/data/Question$11;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Question;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/Question;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vzf0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public CREATE_TABLE(Ll/wzh0;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "CREATE TABLE IF NOT EXISTS "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Ll/wzh0;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,answers_c BLOB,category_c INTEGER,text_c TEXT,title_c TEXT,editable_languages_c BLOB,str_category_c TEXT,source_c TEXT)"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/Question;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Question;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, ""

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->new_()Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 43
    .line 44
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_4

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 49
    .line 50
    :cond_4
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Question$11;->init()Lcom/p1/mobile/putong/core/data/Question;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Question;
    .locals 7

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput v0, p0, Ll/vzf0;->readIndex:I

    .line 5
    .line 6
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Question;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "unknown_"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    :try_start_0
    new-instance v3, Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 15
    .line 16
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/QuestionEditable;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 20
    .line 21
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    iput-wide v3, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 26
    .line 27
    add-int/lit8 v3, p2, 0x1

    .line 28
    .line 29
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/4 v5, 0x0

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    move-object v3, v5

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    :goto_0
    iput-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    add-int/lit8 v3, p2, 0x2

    .line 45
    .line 46
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    move-object v3, v5

    .line 53
    goto :goto_1

    .line 54
    :cond_2
    sget-object v4, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Ljava/util/List;

    .line 69
    .line 70
    :goto_1
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 71
    .line 72
    add-int/lit8 v3, p2, 0x3

    .line 73
    .line 74
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_3

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    :goto_2
    add-int/lit8 v3, p2, 0x4

    .line 86
    .line 87
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_4

    .line 92
    .line 93
    move-object v3, v5

    .line 94
    goto :goto_3

    .line 95
    :cond_4
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    :goto_3
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 100
    .line 101
    add-int/lit8 v3, p2, 0x5

    .line 102
    .line 103
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-eqz v4, :cond_5

    .line 108
    .line 109
    move-object v3, v5

    .line 110
    goto :goto_4

    .line 111
    :cond_5
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    :goto_4
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 116
    .line 117
    add-int/lit8 v3, p2, 0x6

    .line 118
    .line 119
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 120
    .line 121
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-eqz v6, :cond_6

    .line 126
    .line 127
    move-object v3, v5

    .line 128
    goto :goto_5

    .line 129
    :cond_6
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Ljava/util/List;

    .line 144
    .line 145
    :goto_5
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/QuestionEditable;->languages:Ljava/util/List;

    .line 146
    .line 147
    add-int/lit8 v3, p2, 0x7

    .line 148
    .line 149
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    if-eqz v4, :cond_7

    .line 154
    .line 155
    move-object v1, v5

    .line 156
    goto :goto_6

    .line 157
    :cond_7
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    :goto_6
    add-int/lit8 v3, p2, 0x8

    .line 162
    .line 163
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-eqz v4, :cond_8

    .line 168
    .line 169
    goto :goto_7

    .line 170
    :cond_8
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    :goto_7
    iput-object v5, v0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 175
    .line 176
    add-int/lit8 p2, p2, 0x9

    .line 177
    .line 178
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    .line 180
    goto :goto_8

    .line 181
    :catch_0
    move-exception p0

    .line 182
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 183
    .line 184
    .line 185
    :goto_8
    sget-object p0, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 186
    .line 187
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 192
    .line 193
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 194
    .line 195
    if-nez p1, :cond_9

    .line 196
    .line 197
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    check-cast p0, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 202
    .line 203
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 204
    .line 205
    :cond_9
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 206
    .line 207
    const-string p1, ""

    .line 208
    .line 209
    if-nez p0, :cond_a

    .line 210
    .line 211
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 212
    .line 213
    :cond_a
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 214
    .line 215
    if-nez p0, :cond_b

    .line 216
    .line 217
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 218
    .line 219
    :cond_b
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 220
    .line 221
    if-nez p0, :cond_c

    .line 222
    .line 223
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->new_()Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 228
    .line 229
    :cond_c
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 230
    .line 231
    if-nez p0, :cond_d

    .line 232
    .line 233
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 234
    .line 235
    :cond_d
    return-object v0
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 236
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Question$11;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Question;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/Question;Landroid/content/ContentValues;)V
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    const-string v0, "id_c"

    .line 3
    .line 4
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "answers_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    move-object v1, p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 30
    .line 31
    .line 32
    const-string v0, "str_category_c"

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    move-object v1, p0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const-string v0, "category_c"

    .line 48
    .line 49
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 50
    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    move-object v1, p0

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 64
    .line 65
    .line 66
    const-string v0, "text_c"

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const-string v0, "title_c"

    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const-string v0, "editable_languages_c"

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionEditable;->languages:Ljava/util/List;

    .line 85
    .line 86
    if-nez v1, :cond_3

    .line 87
    .line 88
    move-object v1, p0

    .line 89
    goto :goto_3

    .line 90
    :cond_3
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 97
    .line 98
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/QuestionEditable;->languages:Ljava/util/List;

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 105
    .line 106
    .line 107
    const-string v0, "source_c"

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :catch_0
    move-exception p1

    .line 116
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Question$11;->write(Lcom/p1/mobile/putong/core/data/Question;Landroid/content/ContentValues;)V

    return-void
.end method
