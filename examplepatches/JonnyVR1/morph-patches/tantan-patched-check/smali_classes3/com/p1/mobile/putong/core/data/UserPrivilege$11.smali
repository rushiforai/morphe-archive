.class Lcom/p1/mobile/putong/core/data/UserPrivilege$11;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/UserPrivilege;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,content_expiredTime_c INTEGER,content_inExperience_c INTEGER,content_remaining_c INTEGER,content_unlimit_c INTEGER,content_beginTime_c INTEGER,content_refreshMaxRemaining_c INTEGER)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/UserPrivilege;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->new_()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege$11;->init()Lcom/p1/mobile/putong/core/data/UserPrivilege;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/UserPrivilege;
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
    new-instance v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/UserPrivilege;-><init>()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    new-instance v2, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 17
    .line 18
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    iput-wide v2, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 23
    .line 24
    add-int/lit8 v2, p2, 0x1

    .line 25
    .line 26
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    :goto_0
    iput-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    add-int/lit8 v2, p2, 0x2

    .line 41
    .line 42
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 43
    .line 44
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    iput-wide v4, v3, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 49
    .line 50
    add-int/lit8 v2, p2, 0x3

    .line 51
    .line 52
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 53
    .line 54
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    const/4 v4, 0x1

    .line 59
    if-ne v2, v4, :cond_2

    .line 60
    .line 61
    move v2, v4

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v2, v0

    .line 64
    :goto_1
    iput-boolean v2, v3, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->inExperience:Z

    .line 65
    .line 66
    add-int/lit8 v2, p2, 0x4

    .line 67
    .line 68
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 69
    .line 70
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    iput v2, v3, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 75
    .line 76
    add-int/lit8 v2, p2, 0x5

    .line 77
    .line 78
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 79
    .line 80
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-ne v2, v4, :cond_3

    .line 85
    .line 86
    move v0, v4

    .line 87
    :cond_3
    iput-boolean v0, v3, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->unlimit:Z

    .line 88
    .line 89
    add-int/lit8 v0, p2, 0x6

    .line 90
    .line 91
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 92
    .line 93
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    iput-wide v3, v2, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->beginTime:J

    .line 98
    .line 99
    add-int/lit8 v0, p2, 0x7

    .line 100
    .line 101
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 102
    .line 103
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iput v0, v2, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 108
    .line 109
    add-int/lit8 p2, p2, 0x8

    .line 110
    .line 111
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :catch_0
    move-exception p0

    .line 115
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 116
    .line 117
    .line 118
    :goto_2
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 119
    .line 120
    if-nez p0, :cond_4

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->new_()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 127
    .line 128
    :cond_4
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 129
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/UserPrivilege$11;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/UserPrivilege;Landroid/content/ContentValues;)V
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
    const-string p0, "content_expiredTime_c"

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 11
    .line 12
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 13
    .line 14
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "content_inExperience_c"

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 24
    .line 25
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->inExperience:Z

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "content_remaining_c"

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 37
    .line 38
    iget v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 45
    .line 46
    .line 47
    const-string p0, "content_unlimit_c"

    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 50
    .line 51
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->unlimit:Z

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 58
    .line 59
    .line 60
    const-string p0, "content_beginTime_c"

    .line 61
    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 63
    .line 64
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->beginTime:J

    .line 65
    .line 66
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 71
    .line 72
    .line 73
    const-string p0, "content_refreshMaxRemaining_c"

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 76
    .line 77
    iget p1, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 78
    .line 79
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p2, p0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :catch_0
    move-exception p0

    .line 88
    const/4 p1, 0x0

    .line 89
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/UserPrivilege$11;->write(Lcom/p1/mobile/putong/core/data/UserPrivilege;Landroid/content/ContentValues;)V

    return-void
.end method
