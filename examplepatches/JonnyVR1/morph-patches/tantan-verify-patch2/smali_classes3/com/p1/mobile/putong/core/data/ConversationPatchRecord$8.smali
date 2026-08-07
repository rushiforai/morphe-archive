.class Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$8;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,readUtil_c TEXT,state_c INTEGER,retryCount_c INTEGER,str_state_c TEXT)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 27
    .line 28
    :cond_1
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$8;->init()Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
    .locals 6

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
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "unknown_"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    :try_start_0
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    iput-wide v3, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 19
    .line 20
    add-int/lit8 v3, p2, 0x1

    .line 21
    .line 22
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v5, 0x0

    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    move-object v3, v5

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    :goto_0
    iput-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    add-int/lit8 v3, p2, 0x2

    .line 38
    .line 39
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_2

    .line 44
    .line 45
    move-object v3, v5

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    :goto_1
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 52
    .line 53
    add-int/lit8 v3, p2, 0x3

    .line 54
    .line 55
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_3

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    :goto_2
    add-int/lit8 v3, p2, 0x4

    .line 67
    .line 68
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    iput v3, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 73
    .line 74
    add-int/lit8 v3, p2, 0x5

    .line 75
    .line 76
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_4

    .line 81
    .line 82
    move-object v1, v5

    .line 83
    goto :goto_3

    .line 84
    :cond_4
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    :goto_3
    add-int/lit8 p2, p2, 0x6

    .line 89
    .line 90
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :catch_0
    move-exception p0

    .line 94
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 95
    .line 96
    .line 97
    :goto_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 98
    .line 99
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 104
    .line 105
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 106
    .line 107
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 108
    .line 109
    if-nez p2, :cond_5

    .line 110
    .line 111
    const-string p2, ""

    .line 112
    .line 113
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 114
    .line 115
    :cond_5
    if-nez p1, :cond_6

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 122
    .line 123
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 124
    .line 125
    :cond_6
    return-object v0
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 126
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$8;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;Landroid/content/ContentValues;)V
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
    const-string v0, "readUtil_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "str_state_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "state_c"

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    move-object v1, p0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 48
    .line 49
    .line 50
    const-string v0, "retryCount_c"

    .line 51
    .line 52
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 53
    .line 54
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :catch_0
    move-exception p1

    .line 63
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$8;->write(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;Landroid/content/ContentValues;)V

    return-void
.end method
