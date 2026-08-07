.class public Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final ADDRESS:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final LATITUDE:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final LONGITUDE:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final POINAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final PUNCHINDATE:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRIGGERDATE:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRIGGERTIMES:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "poimarkinfodata"

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public address:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public latitude:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public longitude:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public poiName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public punchInDate:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public triggerDate:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public triggerTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$5;

    .line 34
    .line 35
    const-string v1, "poiName_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->POINAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$6;

    .line 43
    .line 44
    const-string v1, "latitude_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->LATITUDE:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$7;

    .line 52
    .line 53
    const-string v1, "longitude_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->LONGITUDE:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$8;

    .line 61
    .line 62
    const-string v1, "address_c"

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$8;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->ADDRESS:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$9;

    .line 70
    .line 71
    const-string v1, "triggerDate_c"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->TRIGGERDATE:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$10;

    .line 79
    .line 80
    const-string v1, "punchInDate_c"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$10;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->PUNCHINDATE:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 86
    .line 87
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$11;

    .line 88
    .line 89
    const-string v1, "triggerTimes_c"

    .line 90
    .line 91
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$11;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->TRIGGERTIMES:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 95
    .line 96
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$12;

    .line 97
    .line 98
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData$12;-><init>()V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->DB_ADAPTER:Ll/vzf0;

    .line 102
    .line 103
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->clone()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 37
    .line 38
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 39
    .line 40
    iput p0, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 41
    .line 42
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->clone()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 32
    .line 33
    iget-wide v5, v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 34
    .line 35
    cmpl-double p1, v3, v5

    .line 36
    .line 37
    if-nez p1, :cond_3

    .line 38
    .line 39
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 40
    .line 41
    iget-wide v5, v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 42
    .line 43
    cmpl-double p1, v3, v5

    .line 44
    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 58
    .line 59
    iget-wide v5, v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 60
    .line 61
    cmp-long p1, v3, v5

    .line 62
    .line 63
    if-nez p1, :cond_3

    .line 64
    .line 65
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 66
    .line 67
    iget-wide v5, v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 68
    .line 69
    cmp-long p1, v3, v5

    .line 70
    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 74
    .line 75
    iget p1, v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 76
    .line 77
    if-ne p0, p1, :cond_3

    .line 78
    .line 79
    return v0

    .line 80
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "poimarkinfodata"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 24
    .line 25
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    const/16 v1, 0x20

    .line 32
    .line 33
    ushr-long v5, v3, v1

    .line 34
    .line 35
    xor-long/2addr v3, v5

    .line 36
    long-to-int v3, v3

    .line 37
    add-int/2addr v0, v3

    .line 38
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 39
    .line 40
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    ushr-long v5, v3, v1

    .line 47
    .line 48
    xor-long/2addr v3, v5

    .line 49
    long-to-int v3, v3

    .line 50
    add-int/2addr v0, v3

    .line 51
    mul-int/lit8 v0, v0, 0x29

    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    :cond_1
    add-int/2addr v0, v2

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 65
    .line 66
    ushr-long v4, v2, v1

    .line 67
    .line 68
    xor-long/2addr v2, v4

    .line 69
    long-to-int v2, v2

    .line 70
    add-int/2addr v0, v2

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 74
    .line 75
    ushr-long v4, v2, v1

    .line 76
    .line 77
    xor-long v1, v2, v4

    .line 78
    .line 79
    long-to-int v1, v1

    .line 80
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 84
    .line 85
    add-int/2addr v0, v1

    .line 86
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 87
    .line 88
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
