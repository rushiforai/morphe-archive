.class public Lcom/p1/mobile/putong/core/data/NewTags;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "newtags"


# instance fields
.field public bgColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public categories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public gender:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public icon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public index:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public isPictureTag:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public loadIcon:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public localCreditScore:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public localIsCommonLabel:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public localShowCreditScore:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public localShowName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public localTagCategories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TagCategories;",
            ">;"
        }
    .end annotation
.end field

.field public localTagUserCounts:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public nameColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public operation:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewTags$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewTags$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/NewTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewTags$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewTags$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/NewTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/TagCategories;)Lcom/p1/mobile/putong/core/data/TagCategories;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TagCategories;->clone()Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/NewTags;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewTags;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/NewTags;->nullCheck()V

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

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewTags;->clone()Lcom/p1/mobile/putong/core/data/NewTags;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/NewTags;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/NewTags;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/vi40;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/vi40;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 40
    .line 41
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 42
    .line 43
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 46
    .line 47
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    new-instance v2, Ll/wi40;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/wi40;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 63
    .line 64
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 71
    .line 72
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 73
    .line 74
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 75
    .line 76
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 77
    .line 78
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 81
    .line 82
    iput v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 89
    .line 90
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 91
    .line 92
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 93
    .line 94
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 97
    .line 98
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 99
    .line 100
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewTags;->clone()Lcom/p1/mobile/putong/core/data/NewTags;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/NewTags;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 74
    .line 75
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 76
    .line 77
    cmp-long v1, v3, v5

    .line 78
    .line 79
    if-nez v1, :cond_2

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 82
    .line 83
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 118
    .line 119
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 120
    .line 121
    if-ne v1, v3, :cond_2

    .line 122
    .line 123
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 124
    .line 125
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 126
    .line 127
    if-ne v1, v3, :cond_2

    .line 128
    .line 129
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 130
    .line 131
    iget v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 132
    .line 133
    if-ne v1, v3, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_2

    .line 154
    .line 155
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 156
    .line 157
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 158
    .line 159
    if-ne v1, v3, :cond_2

    .line 160
    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_2

    .line 170
    .line 171
    return v0

    .line 172
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "newtags"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagUserCounts:J

    .line 87
    .line 88
    const/16 v1, 0x20

    .line 89
    .line 90
    ushr-long v5, v3, v1

    .line 91
    .line 92
    xor-long/2addr v3, v5

    .line 93
    long-to-int v1, v3

    .line 94
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 98
    .line 99
    const/16 v3, 0x4d5

    .line 100
    .line 101
    const/16 v4, 0x4cf

    .line 102
    .line 103
    if-eqz v1, :cond_6

    .line 104
    .line 105
    move v1, v4

    .line 106
    goto :goto_6

    .line 107
    :cond_6
    move v1, v3

    .line 108
    :goto_6
    add-int/2addr v0, v1

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v1, :cond_7

    .line 114
    .line 115
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    goto :goto_7

    .line 120
    :cond_7
    move v1, v2

    .line 121
    :goto_7
    add-int/2addr v0, v1

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v1, :cond_8

    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    goto :goto_8

    .line 133
    :cond_8
    move v1, v2

    .line 134
    :goto_8
    add-int/2addr v0, v1

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz v1, :cond_9

    .line 140
    .line 141
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    goto :goto_9

    .line 146
    :cond_9
    move v1, v2

    .line 147
    :goto_9
    add-int/2addr v0, v1

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->isPictureTag:Z

    .line 151
    .line 152
    if-eqz v1, :cond_a

    .line 153
    .line 154
    move v1, v4

    .line 155
    goto :goto_a

    .line 156
    :cond_a
    move v1, v3

    .line 157
    :goto_a
    add-int/2addr v0, v1

    .line 158
    mul-int/lit8 v0, v0, 0x29

    .line 159
    .line 160
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->index:I

    .line 161
    .line 162
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 166
    .line 167
    add-int/2addr v0, v1

    .line 168
    mul-int/lit8 v0, v0, 0x29

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 171
    .line 172
    if-eqz v1, :cond_b

    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    goto :goto_b

    .line 179
    :cond_b
    move v1, v2

    .line 180
    :goto_b
    add-int/2addr v0, v1

    .line 181
    mul-int/lit8 v0, v0, 0x29

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz v1, :cond_c

    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    goto :goto_c

    .line 192
    :cond_c
    move v1, v2

    .line 193
    :goto_c
    add-int/2addr v0, v1

    .line 194
    mul-int/lit8 v0, v0, 0x29

    .line 195
    .line 196
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowCreditScore:Z

    .line 197
    .line 198
    if-eqz v1, :cond_d

    .line 199
    .line 200
    move v3, v4

    .line 201
    :cond_d
    add-int/2addr v0, v3

    .line 202
    mul-int/lit8 v0, v0, 0x29

    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localCreditScore:Ljava/lang/String;

    .line 205
    .line 206
    if-eqz v1, :cond_e

    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    :cond_e
    add-int/2addr v0, v2

    .line 213
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 214
    .line 215
    :cond_f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->icon:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->operation:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->status:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    new-instance v0, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 54
    .line 55
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_7

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 60
    .line 61
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_8

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->gender:Ljava/lang/String;

    .line 66
    .line 67
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_9

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 72
    .line 73
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 74
    .line 75
    if-nez v0, :cond_a

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 78
    .line 79
    :cond_a
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
