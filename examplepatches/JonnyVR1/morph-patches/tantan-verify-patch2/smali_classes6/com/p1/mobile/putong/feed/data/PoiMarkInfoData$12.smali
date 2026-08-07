.class Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$12;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,poiName_c TEXT,latitude_c REAL,longitude_c REAL,address_c TEXT,triggerDate_c INTEGER,punchInDate_c INTEGER,triggerTimes_c INTEGER)"

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
    const-class p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$12;->init()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
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
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;-><init>()V

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
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 49
    .line 50
    add-int/lit8 v1, p2, 0x3

    .line 51
    .line 52
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 57
    .line 58
    add-int/lit8 v1, p2, 0x4

    .line 59
    .line 60
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 65
    .line 66
    add-int/lit8 v1, p2, 0x5

    .line 67
    .line 68
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_3

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_3
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    :goto_2
    iput-object v3, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 80
    .line 81
    add-int/lit8 v1, p2, 0x6

    .line 82
    .line 83
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    .line 84
    .line 85
    .line 86
    move-result-wide v1

    .line 87
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 88
    .line 89
    add-int/lit8 v1, p2, 0x7

    .line 90
    .line 91
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    .line 92
    .line 93
    .line 94
    move-result-wide v1

    .line 95
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 96
    .line 97
    add-int/lit8 v1, p2, 0x8

    .line 98
    .line 99
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 104
    .line 105
    add-int/lit8 p2, p2, 0x9

    .line 106
    .line 107
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :catch_0
    move-exception p0

    .line 111
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 112
    .line 113
    .line 114
    :goto_3
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 115
    .line 116
    const-string p1, ""

    .line 117
    .line 118
    if-nez p0, :cond_4

    .line 119
    .line 120
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 121
    .line 122
    :cond_4
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p0, :cond_5

    .line 125
    .line 126
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 127
    .line 128
    :cond_5
    return-object v0
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 129
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$12;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;Landroid/content/ContentValues;)V
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
    const-string p0, "poiName_c"

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "latitude_c"

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "longitude_c"

    .line 27
    .line 28
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 29
    .line 30
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 35
    .line 36
    .line 37
    const-string p0, "address_c"

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string p0, "triggerDate_c"

    .line 45
    .line 46
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 47
    .line 48
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 53
    .line 54
    .line 55
    const-string p0, "punchInDate_c"

    .line 56
    .line 57
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 58
    .line 59
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 64
    .line 65
    .line 66
    const-string p0, "triggerTimes_c"

    .line 67
    .line 68
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 69
    .line 70
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p2, p0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :catch_0
    move-exception p0

    .line 79
    const/4 p1, 0x0

    .line 80
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 84
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$12;->write(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;Landroid/content/ContentValues;)V

    return-void
.end method
