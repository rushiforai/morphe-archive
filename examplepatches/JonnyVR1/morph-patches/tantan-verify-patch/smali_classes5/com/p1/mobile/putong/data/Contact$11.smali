.class Lcom/p1/mobile/putong/data/Contact$11;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Contact;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/data/Contact;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,name_c TEXT,thumbnailUri_c TEXT,phoneNumbers_c BLOB,source_c TEXT,secretCrush_c INTEGER,match_c TEXT)"

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
    const-class p0, Lcom/p1/mobile/putong/data/Contact;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/data/Contact;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Contact;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Contact;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 16
    .line 17
    :cond_0
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Contact$11;->init()Lcom/p1/mobile/putong/data/Contact;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/data/Contact;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iput v0, p0, Ll/vzf0;->readIndex:I

    .line 5
    .line 6
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/data/Contact;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Contact;-><init>()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    iput-wide v2, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 16
    .line 17
    add-int/lit8 v2, p2, 0x1

    .line 18
    .line 19
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v4, 0x0

    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    move-object v2, v4

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    :goto_0
    iput-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    add-int/lit8 v2, p2, 0x2

    .line 35
    .line 36
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    move-object v2, v4

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    :goto_1
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 49
    .line 50
    add-int/lit8 v2, p2, 0x3

    .line 51
    .line 52
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_3

    .line 57
    .line 58
    move-object v2, v4

    .line 59
    goto :goto_2

    .line 60
    :cond_3
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    :goto_2
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Contact;->thumbnailUri:Ljava/lang/String;

    .line 65
    .line 66
    add-int/lit8 v2, p2, 0x4

    .line 67
    .line 68
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_4

    .line 73
    .line 74
    move-object v2, v4

    .line 75
    goto :goto_3

    .line 76
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/data/ContactNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    check-cast v2, Ljava/util/List;

    .line 91
    .line 92
    :goto_3
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 93
    .line 94
    add-int/lit8 v2, p2, 0x5

    .line 95
    .line 96
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_5

    .line 101
    .line 102
    move-object v2, v4

    .line 103
    goto :goto_4

    .line 104
    :cond_5
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    :goto_4
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Contact;->source:Ljava/lang/String;

    .line 109
    .line 110
    add-int/lit8 v2, p2, 0x6

    .line 111
    .line 112
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_6

    .line 117
    .line 118
    move-object v0, v4

    .line 119
    goto :goto_5

    .line 120
    :cond_6
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    const/4 v3, 0x1

    .line 125
    if-ne v2, v3, :cond_7

    .line 126
    .line 127
    move v0, v3

    .line 128
    :cond_7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    :goto_5
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Contact;->secretCrush:Ljava/lang/Boolean;

    .line 133
    .line 134
    add-int/lit8 v0, p2, 0x7

    .line 135
    .line 136
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-eqz v2, :cond_8

    .line 141
    .line 142
    goto :goto_6

    .line 143
    :cond_8
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    :goto_6
    iput-object v4, v1, Lcom/p1/mobile/putong/data/Contact;->match:Ljava/lang/String;

    .line 148
    .line 149
    add-int/lit8 p2, p2, 0x8

    .line 150
    .line 151
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .line 153
    goto :goto_7

    .line 154
    :catch_0
    move-exception p0

    .line 155
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 156
    .line 157
    .line 158
    :goto_7
    iget-object p0, v1, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 159
    .line 160
    if-nez p0, :cond_9

    .line 161
    .line 162
    new-instance p0, Ljava/util/ArrayList;

    .line 163
    .line 164
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .line 166
    .line 167
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 168
    .line 169
    :cond_9
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 170
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Contact$11;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/data/Contact;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/data/Contact;Landroid/content/ContentValues;)V
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
    const-string v0, "name_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "thumbnailUri_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Contact;->thumbnailUri:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "phoneNumbers_c"

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    move-object v1, p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/data/ContactNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Contact;->phoneNumbers:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 44
    .line 45
    .line 46
    const-string v0, "source_c"

    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Contact;->source:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-string v0, "secretCrush_c"

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Contact;->secretCrush:Ljava/lang/Boolean;

    .line 56
    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    move-object v1, p0

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 70
    .line 71
    .line 72
    const-string v0, "match_c"

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Contact;->match:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :catch_0
    move-exception p1

    .line 81
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/data/Contact;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Contact$11;->write(Lcom/p1/mobile/putong/data/Contact;Landroid/content/ContentValues;)V

    return-void
.end method
