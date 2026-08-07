.class Lcom/p1/mobile/putong/core/data/PrivateQuestion$8;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PrivateQuestion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/PrivateQuestion;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,title_c TEXT,category_c TEXT,options_c BLOB)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/PrivateQuestion;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PrivateQuestion;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->title:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->title:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->category:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->category:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->options:Ljava/util/List;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->options:Ljava/util/List;

    .line 30
    .line 31
    :cond_2
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PrivateQuestion$8;->init()Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/PrivateQuestion;
    .locals 4

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
    new-instance v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PrivateQuestion;-><init>()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 16
    .line 17
    add-int/lit8 v1, p2, 0x1

    .line 18
    .line 19
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    move-object v1, v3

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    :goto_0
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    add-int/lit8 v1, p2, 0x2

    .line 35
    .line 36
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    move-object v1, v3

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :goto_1
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->title:Ljava/lang/String;

    .line 49
    .line 50
    add-int/lit8 v1, p2, 0x3

    .line 51
    .line 52
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_3

    .line 57
    .line 58
    move-object v1, v3

    .line 59
    goto :goto_2

    .line 60
    :cond_3
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    :goto_2
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->category:Ljava/lang/String;

    .line 65
    .line 66
    add-int/lit8 v1, p2, 0x4

    .line 67
    .line 68
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_4

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/Option;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getBlob(I)[B

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    move-object v3, v1

    .line 90
    check-cast v3, Ljava/util/List;

    .line 91
    .line 92
    :goto_3
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->options:Ljava/util/List;

    .line 93
    .line 94
    add-int/lit8 p2, p2, 0x5

    .line 95
    .line 96
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    goto :goto_4

    .line 99
    :catch_0
    move-exception p0

    .line 100
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 101
    .line 102
    .line 103
    :goto_4
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->title:Ljava/lang/String;

    .line 104
    .line 105
    const-string p1, ""

    .line 106
    .line 107
    if-nez p0, :cond_5

    .line 108
    .line 109
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->title:Ljava/lang/String;

    .line 110
    .line 111
    :cond_5
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->category:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p0, :cond_6

    .line 114
    .line 115
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->category:Ljava/lang/String;

    .line 116
    .line 117
    :cond_6
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->options:Ljava/util/List;

    .line 118
    .line 119
    if-nez p0, :cond_7

    .line 120
    .line 121
    new-instance p0, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .line 125
    .line 126
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->options:Ljava/util/List;

    .line 127
    .line 128
    :cond_7
    return-object v0
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 129
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PrivateQuestion$8;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/PrivateQuestion;Landroid/content/ContentValues;)V
    .locals 2

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
    const-string v0, "title_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->title:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "category_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->category:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "options_c"

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->options:Ljava/util/List;

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    move-object p1, p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/Option;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->options:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_0
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p1

    .line 48
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PrivateQuestion$8;->write(Lcom/p1/mobile/putong/core/data/PrivateQuestion;Landroid/content/ContentValues;)V

    return-void
.end method
