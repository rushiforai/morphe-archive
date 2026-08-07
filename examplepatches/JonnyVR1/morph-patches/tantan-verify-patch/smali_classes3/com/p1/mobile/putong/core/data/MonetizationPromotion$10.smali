.class Lcom/p1/mobile/putong/core/data/MonetizationPromotion$10;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MonetizationPromotion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/MonetizationPromotion;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,coupons_c BLOB,beginTime_c REAL,endTime_c REAL,userCouponIDs_c BLOB,state_c TEXT)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/MonetizationPromotion;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->coupons:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->coupons:Ljava/util/List;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->userCouponIDs:Ljava/util/List;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->userCouponIDs:Ljava/util/List;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->state:Ljava/lang/String;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    const-string v0, ""

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->state:Ljava/lang/String;

    .line 35
    .line 36
    :cond_2
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MonetizationPromotion$10;->init()Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/MonetizationPromotion;
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;-><init>()V

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
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getBlob(I)[B

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ljava/util/List;

    .line 59
    .line 60
    :goto_1
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->coupons:Ljava/util/List;

    .line 61
    .line 62
    add-int/lit8 v1, p2, 0x3

    .line 63
    .line 64
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->beginTime:D

    .line 69
    .line 70
    add-int/lit8 v1, p2, 0x4

    .line 71
    .line 72
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->endTime:D

    .line 77
    .line 78
    add-int/lit8 v1, p2, 0x5

    .line 79
    .line 80
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_3

    .line 85
    .line 86
    move-object v1, v3

    .line 87
    goto :goto_2

    .line 88
    :cond_3
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getBlob(I)[B

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Ljava/util/List;

    .line 103
    .line 104
    :goto_2
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->userCouponIDs:Ljava/util/List;

    .line 105
    .line 106
    add-int/lit8 v1, p2, 0x6

    .line 107
    .line 108
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_4

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_4
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    :goto_3
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->state:Ljava/lang/String;

    .line 120
    .line 121
    add-int/lit8 p2, p2, 0x7

    .line 122
    .line 123
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    goto :goto_4

    .line 126
    :catch_0
    move-exception p0

    .line 127
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 128
    .line 129
    .line 130
    :goto_4
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->coupons:Ljava/util/List;

    .line 131
    .line 132
    if-nez p0, :cond_5

    .line 133
    .line 134
    new-instance p0, Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .line 138
    .line 139
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->coupons:Ljava/util/List;

    .line 140
    .line 141
    :cond_5
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->userCouponIDs:Ljava/util/List;

    .line 142
    .line 143
    if-nez p0, :cond_6

    .line 144
    .line 145
    new-instance p0, Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .line 149
    .line 150
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->userCouponIDs:Ljava/util/List;

    .line 151
    .line 152
    :cond_6
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->state:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p0, :cond_7

    .line 155
    .line 156
    const-string p0, ""

    .line 157
    .line 158
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->state:Ljava/lang/String;

    .line 159
    .line 160
    :cond_7
    return-object v0
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 161
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MonetizationPromotion$10;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/MonetizationPromotion;Landroid/content/ContentValues;)V
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
    const-string v0, "coupons_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->coupons:Ljava/util/List;

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
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->coupons:Ljava/util/List;

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
    const-string v0, "beginTime_c"

    .line 33
    .line 34
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->beginTime:D

    .line 35
    .line 36
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "endTime_c"

    .line 44
    .line 45
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->endTime:D

    .line 46
    .line 47
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 52
    .line 53
    .line 54
    const-string v0, "userCouponIDs_c"

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->userCouponIDs:Ljava/util/List;

    .line 57
    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    move-object v1, p0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->userCouponIDs:Ljava/util/List;

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 75
    .line 76
    .line 77
    const-string v0, "state_c"

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->state:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :catch_0
    move-exception p1

    .line 86
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 90
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MonetizationPromotion$10;->write(Lcom/p1/mobile/putong/core/data/MonetizationPromotion;Landroid/content/ContentValues;)V

    return-void
.end method
