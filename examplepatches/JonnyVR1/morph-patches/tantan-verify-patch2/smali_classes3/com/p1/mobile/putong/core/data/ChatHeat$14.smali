.class Lcom/p1/mobile/putong/core/data/ChatHeat$14;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatHeat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/ChatHeat;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,degree_c REAL,levelUp_c INTEGER,specialRemind_c INTEGER,exclusiveChatInviteTime_c REAL,exclusiveChatInviteExpireTime_c REAL,exclusiveChatStartTime_c REAL,exclusiveChatEndTime_c REAL,showLevelDown_c INTEGER,tempDownDegree_c REAL)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat$14;->init()Lcom/p1/mobile/putong/core/data/ChatHeat;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 6

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
    new-instance v1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ChatHeat;-><init>()V

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
    if-eqz v3, :cond_1

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    :goto_0
    iput-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    add-int/lit8 v2, p2, 0x2

    .line 34
    .line 35
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    iput-wide v2, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 40
    .line 41
    add-int/lit8 v2, p2, 0x3

    .line 42
    .line 43
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v3, 0x1

    .line 48
    if-ne v2, v3, :cond_2

    .line 49
    .line 50
    move v2, v3

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    move v2, v0

    .line 53
    :goto_1
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 54
    .line 55
    add-int/lit8 v2, p2, 0x4

    .line 56
    .line 57
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-ne v2, v3, :cond_3

    .line 62
    .line 63
    move v2, v3

    .line 64
    goto :goto_2

    .line 65
    :cond_3
    move v2, v0

    .line 66
    :goto_2
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 67
    .line 68
    add-int/lit8 v2, p2, 0x5

    .line 69
    .line 70
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 71
    .line 72
    .line 73
    move-result-wide v4

    .line 74
    iput-wide v4, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 75
    .line 76
    add-int/lit8 v2, p2, 0x6

    .line 77
    .line 78
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    iput-wide v4, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 83
    .line 84
    add-int/lit8 v2, p2, 0x7

    .line 85
    .line 86
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 87
    .line 88
    .line 89
    move-result-wide v4

    .line 90
    iput-wide v4, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 91
    .line 92
    add-int/lit8 v2, p2, 0x8

    .line 93
    .line 94
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 95
    .line 96
    .line 97
    move-result-wide v4

    .line 98
    iput-wide v4, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 99
    .line 100
    add-int/lit8 v2, p2, 0x9

    .line 101
    .line 102
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-ne v2, v3, :cond_4

    .line 107
    .line 108
    move v0, v3

    .line 109
    :cond_4
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 110
    .line 111
    add-int/lit8 v0, p2, 0xa

    .line 112
    .line 113
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    .line 114
    .line 115
    .line 116
    move-result-wide v2

    .line 117
    iput-wide v2, v1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 118
    .line 119
    add-int/lit8 p2, p2, 0xb

    .line 120
    .line 121
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .line 123
    return-object v1

    .line 124
    :catch_0
    move-exception p0

    .line 125
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 126
    .line 127
    .line 128
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 129
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatHeat$14;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ChatHeat;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/ChatHeat;Landroid/content/ContentValues;)V
    .locals 2

    .line 1
    :try_start_0
    const-string p0, "id_c"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "degree_c"

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 11
    .line 12
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "levelUp_c"

    .line 20
    .line 21
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->levelUp:Z

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "specialRemind_c"

    .line 31
    .line 32
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 39
    .line 40
    .line 41
    const-string p0, "exclusiveChatInviteTime_c"

    .line 42
    .line 43
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteTime:D

    .line 44
    .line 45
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 50
    .line 51
    .line 52
    const-string p0, "exclusiveChatInviteExpireTime_c"

    .line 53
    .line 54
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatInviteExpireTime:D

    .line 55
    .line 56
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 61
    .line 62
    .line 63
    const-string p0, "exclusiveChatStartTime_c"

    .line 64
    .line 65
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatStartTime:D

    .line 66
    .line 67
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 72
    .line 73
    .line 74
    const-string p0, "exclusiveChatEndTime_c"

    .line 75
    .line 76
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 77
    .line 78
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 83
    .line 84
    .line 85
    const-string p0, "showLevelDown_c"

    .line 86
    .line 87
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->showLevelDown:Z

    .line 88
    .line 89
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 94
    .line 95
    .line 96
    const-string p0, "tempDownDegree_c"

    .line 97
    .line 98
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->tempDownDegree:D

    .line 99
    .line 100
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p2, p0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :catch_0
    move-exception p0

    .line 109
    const/4 p1, 0x0

    .line 110
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatHeat$14;->write(Lcom/p1/mobile/putong/core/data/ChatHeat;Landroid/content/ContentValues;)V

    return-void
.end method
