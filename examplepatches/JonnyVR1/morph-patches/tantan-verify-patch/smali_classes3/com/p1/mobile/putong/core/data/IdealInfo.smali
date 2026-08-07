.class public Lcom/p1/mobile/putong/core/data/IdealInfo;
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
            "Lcom/p1/mobile/putong/core/data/IdealInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/IdealInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "idealinfo"


# instance fields
.field public fitIdealDetails:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field

.field public fitIdeals:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field

.field public highlightIdeals:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field

.field public highlightProfileTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserTagData;",
            ">;"
        }
    .end annotation
.end field

.field public highlightProfiles:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public idealProfiles:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IdealProfile;",
            ">;"
        }
    .end annotation
.end field

.field public profileTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserTagData;",
            ">;"
        }
    .end annotation
.end field

.field public targetFitIdeals:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IdealInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IdealInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/IdealInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IdealInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/IdealProfile;)Lcom/p1/mobile/putong/core/data/IdealProfile;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IdealProfile;->clone()Lcom/p1/mobile/putong/core/data/IdealProfile;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/UserTagData;)Lcom/p1/mobile/putong/core/data/UserTagData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserTagData;->clone()Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/UserTagData;)Lcom/p1/mobile/putong/core/data/UserTagData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserTagData;->clone()Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/IdealTag;->clone()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/IdealTag;->clone()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/IdealTag;->clone()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/IdealTag;->clone()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/IdealInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IdealInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/IdealInfo;->nullCheck()V

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

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IdealInfo;->clone()Lcom/p1/mobile/putong/core/data/IdealInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/IdealInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IdealInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance v2, Ll/fem;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/fem;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdealDetails:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    new-instance v2, Ll/gem;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/gem;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdealDetails:Ljava/util/List;

    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfiles:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    new-instance v2, Ll/hem;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/hem;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfiles:Ljava/util/List;

    .line 54
    .line 55
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightIdeals:Ljava/util/List;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    new-instance v2, Ll/iem;

    .line 60
    .line 61
    invoke-direct {v2}, Ll/iem;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightIdeals:Ljava/util/List;

    .line 69
    .line 70
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    new-instance v2, Ll/jem;

    .line 75
    .line 76
    invoke-direct {v2}, Ll/jem;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 84
    .line 85
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->idealProfiles:Ljava/util/List;

    .line 86
    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    new-instance v2, Ll/kem;

    .line 90
    .line 91
    invoke-direct {v2}, Ll/kem;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->idealProfiles:Ljava/util/List;

    .line 99
    .line 100
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->profileTags:Ljava/util/List;

    .line 101
    .line 102
    if-eqz v1, :cond_6

    .line 103
    .line 104
    new-instance v2, Ll/lem;

    .line 105
    .line 106
    invoke-direct {v2}, Ll/lem;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->profileTags:Ljava/util/List;

    .line 114
    .line 115
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfileTags:Ljava/util/List;

    .line 116
    .line 117
    if-eqz p0, :cond_7

    .line 118
    .line 119
    new-instance v1, Ll/mem;

    .line 120
    .line 121
    invoke-direct {v1}, Ll/mem;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfileTags:Ljava/util/List;

    .line 129
    .line 130
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

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IdealInfo;->clone()Lcom/p1/mobile/putong/core/data/IdealInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdealDetails:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdealDetails:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfiles:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfiles:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightIdeals:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightIdeals:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->idealProfiles:Ljava/util/List;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->idealProfiles:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->profileTags:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->profileTags:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfileTags:Ljava/util/List;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfileTags:Ljava/util/List;

    .line 96
    .line 97
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    return v0

    .line 104
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "idealinfo"

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
    if-nez v0, :cond_9

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdealDetails:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfiles:Ljava/util/List;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightIdeals:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->idealProfiles:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->profileTags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfileTags:Ljava/util/List;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    :cond_8
    add-int/2addr v0, v2

    .line 121
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 122
    .line 123
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdealDetails:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdealDetails:Ljava/util/List;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfiles:Ljava/util/List;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfiles:Ljava/util/List;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightIdeals:Ljava/util/List;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightIdeals:Ljava/util/List;

    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 63
    .line 64
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->idealProfiles:Ljava/util/List;

    .line 65
    .line 66
    if-nez v0, :cond_6

    .line 67
    .line 68
    new-instance v0, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->idealProfiles:Ljava/util/List;

    .line 74
    .line 75
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->profileTags:Ljava/util/List;

    .line 76
    .line 77
    if-nez v0, :cond_7

    .line 78
    .line 79
    new-instance v0, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->profileTags:Ljava/util/List;

    .line 85
    .line 86
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfileTags:Ljava/util/List;

    .line 87
    .line 88
    if-nez v0, :cond_8

    .line 89
    .line 90
    new-instance v0, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->highlightProfileTags:Ljava/util/List;

    .line 96
    .line 97
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/IdealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
