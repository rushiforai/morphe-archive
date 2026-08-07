.class public Lcom/p1/mobile/putong/core/data/Question;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final ANSWERS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Answer;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final CATEGORY:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            "Lcom/p1/mobile/putong/core/data/QuestionCategory;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public static final EDITABLE_LANGUAGES:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEXT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public static final TITLE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "question"

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public answers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Answer;",
            ">;"
        }
    .end annotation
.end field

.field public category:Lcom/p1/mobile/putong/core/data/QuestionCategory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public text:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Question$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Question$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Question$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Question$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$5;

    .line 34
    .line 35
    const-string v1, "answers_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Question$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->ANSWERS:Lcom/tantanapp/common/data/orm/Column;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$6;

    .line 43
    .line 44
    const-string v1, "category_c"

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 47
    .line 48
    const-string v3, "str_category_c"

    .line 49
    .line 50
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Question$6;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->CATEGORY:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 54
    .line 55
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$7;

    .line 56
    .line 57
    const-string v1, "text_c"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Question$7;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->TEXT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 63
    .line 64
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$8;

    .line 65
    .line 66
    const-string v1, "title_c"

    .line 67
    .line 68
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Question$8;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->TITLE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$9;

    .line 74
    .line 75
    const-string v1, "editable_languages_c"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Question$9;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->EDITABLE_LANGUAGES:Lcom/tantanapp/common/data/orm/Column;

    .line 81
    .line 82
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$10;

    .line 83
    .line 84
    const-string v1, "source_c"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Question$10;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->SOURCE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 90
    .line 91
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question$11;

    .line 92
    .line 93
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Question$11;-><init>()V

    .line 94
    .line 95
    .line 96
    sput-object v0, Lcom/p1/mobile/putong/core/data/Question;->DB_ADAPTER:Ll/vzf0;

    .line 97
    .line 98
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

.method public static synthetic a(Lcom/p1/mobile/putong/data/Answer;)Lcom/p1/mobile/putong/data/Answer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Answer;->clone()Lcom/p1/mobile/putong/data/Answer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/Question;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Question;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Question;->nullCheck()V

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

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Question;->clone()Lcom/p1/mobile/putong/core/data/Question;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/Question;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Question;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/awb0;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/awb0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->clone()Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 54
    .line 55
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Question;->clone()Lcom/p1/mobile/putong/core/data/Question;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/Question;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/Question;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 64
    .line 65
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 72
    .line 73
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_3

    .line 80
    .line 81
    return v0

    .line 82
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "question"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->answers:Ljava/util/List;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    move v1, v2

    .line 61
    :goto_3
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    goto :goto_4

    .line 73
    :cond_4
    move v1, v2

    .line 74
    :goto_4
    add-int/2addr v0, v1

    .line 75
    mul-int/lit8 v0, v0, 0x29

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    :cond_5
    add-int/2addr v0, v2

    .line 86
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 87
    .line 88
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuestionCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, ""

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->title:Ljava/lang/String;

    .line 31
    .line 32
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->new_()Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 47
    .line 48
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Question;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
