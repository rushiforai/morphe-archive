.class public Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
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
            "Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "postbasepopwindow"


# instance fields
.field public basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public buttons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/ButtonInfo;",
            ">;"
        }
    .end annotation
.end field

.field public close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public mainBody:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public users:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/ButtonInfo;)Lcom/p1/mobile/putong/feed/data/ButtonInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/ButtonInfo;->clone()Lcom/p1/mobile/putong/feed/data/ButtonInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;)Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;->clone()Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->nullCheck()V

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

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->clone()Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->clone()Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->clone()Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    new-instance v2, Ll/nl80;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/nl80;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 40
    .line 41
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->clone()Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 58
    .line 59
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 60
    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/LocationComponent;->clone()Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 68
    .line 69
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 70
    .line 71
    if-eqz v1, :cond_5

    .line 72
    .line 73
    new-instance v2, Ll/ol80;

    .line 74
    .line 75
    invoke-direct {v2}, Ll/ol80;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 83
    .line 84
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 85
    .line 86
    if-eqz v1, :cond_6

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->clone()Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 93
    .line 94
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 95
    .line 96
    if-eqz p0, :cond_7

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->clone()Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 103
    .line 104
    :cond_7
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->clone()Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 96
    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 106
    .line 107
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_2

    .line 112
    .line 113
    return v0

    .line 114
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "postbasepopwindow"

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
    if-nez v0, :cond_a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/LocationComponent;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    goto :goto_7

    .line 108
    :cond_7
    move v1, v2

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v2

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    :cond_9
    add-int/2addr v0, v2

    .line 134
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 135
    .line 136
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->new_()Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->new_()Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 31
    .line 32
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, ""

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 39
    .line 40
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->new_()Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 55
    .line 56
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 57
    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/LocationComponent;->new_()Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 65
    .line 66
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 67
    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    new-instance v0, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 76
    .line 77
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 78
    .line 79
    if-nez v0, :cond_8

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->new_()Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 86
    .line 87
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 88
    .line 89
    if-nez v0, :cond_9

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->new_()Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 96
    .line 97
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
