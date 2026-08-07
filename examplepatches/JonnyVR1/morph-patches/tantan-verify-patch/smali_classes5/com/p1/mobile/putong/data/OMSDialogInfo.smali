.class public Lcom/p1/mobile/putong/data/OMSDialogInfo;
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
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omsdialoginfo"


# instance fields
.field public blockCard:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public cancelAble:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public content:Lcom/p1/mobile/putong/data/OMSDialogContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public contentType:Lcom/p1/mobile/putong/data/OMSDialogType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public events:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/TriggerEvent;",
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

.field public identifier:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public independent:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public needLanguage:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public position:Lcom/p1/mobile/putong/data/OMSPositionInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public remote:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public variableMap:Ljava/util/Map;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public version:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialogInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialogInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialogInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialogInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/TriggerEvent;)Lcom/p1/mobile/putong/data/TriggerEvent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/TriggerEvent;->clone()Lcom/p1/mobile/putong/data/TriggerEvent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/OMSDialogInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialogInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSDialogInfo;->nullCheck()V

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

    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSDialogInfo;->clone()Lcom/p1/mobile/putong/data/OMSDialogInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OMSDialogInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialogInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->clone()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSTriggerRule;->clone()Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 41
    .line 42
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    new-instance v2, Ll/i750;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/i750;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 56
    .line 57
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSPositionInfo;->clone()Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 66
    .line 67
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 68
    .line 69
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 72
    .line 73
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 76
    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->clone()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 84
    .line 85
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 86
    .line 87
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 90
    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 94
    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDialogContent;->clone()Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 102
    .line 103
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 104
    .line 105
    if-eqz v1, :cond_6

    .line 106
    .line 107
    new-instance v2, Ll/j750;

    .line 108
    .line 109
    invoke-direct {v2}, Ll/j750;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/Map;Ll/qcj;)Ljava/util/Map;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 117
    .line 118
    :cond_6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 119
    .line 120
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 123
    .line 124
    if-eqz p0, :cond_7

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->clone()Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 131
    .line 132
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

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSDialogInfo;->clone()Lcom/p1/mobile/putong/data/OMSDialogInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 40
    .line 41
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 86
    .line 87
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 88
    .line 89
    if-ne v1, v3, :cond_2

    .line 90
    .line 91
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 92
    .line 93
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 108
    .line 109
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 110
    .line 111
    if-ne v1, v3, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 144
    .line 145
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 146
    .line 147
    if-ne v1, v3, :cond_2

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 152
    .line 153
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-eqz p0, :cond_2

    .line 158
    .line 159
    return v0

    .line 160
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omsdialoginfo"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->version:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->independent:Z

    .line 40
    .line 41
    const/16 v3, 0x4d5

    .line 42
    .line 43
    const/16 v4, 0x4cf

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    move v1, v4

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v1, v3

    .line 50
    :goto_2
    add-int/2addr v0, v1

    .line 51
    mul-int/lit8 v0, v0, 0x29

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->hashCode()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_3

    .line 62
    :cond_3
    move v1, v2

    .line 63
    :goto_3
    add-int/2addr v0, v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 67
    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSTriggerRule;->hashCode()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    goto :goto_4

    .line 75
    :cond_4
    move v1, v2

    .line 76
    :goto_4
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    goto :goto_5

    .line 88
    :cond_5
    move v1, v2

    .line 89
    :goto_5
    add-int/2addr v0, v1

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 93
    .line 94
    if-eqz v1, :cond_6

    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSPositionInfo;->hashCode()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    goto :goto_6

    .line 101
    :cond_6
    move v1, v2

    .line 102
    :goto_6
    add-int/2addr v0, v1

    .line 103
    mul-int/lit8 v0, v0, 0x29

    .line 104
    .line 105
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->remote:Z

    .line 106
    .line 107
    if-eqz v1, :cond_7

    .line 108
    .line 109
    move v1, v4

    .line 110
    goto :goto_7

    .line 111
    :cond_7
    move v1, v3

    .line 112
    :goto_7
    add-int/2addr v0, v1

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->blockCard:Z

    .line 116
    .line 117
    if-eqz v1, :cond_8

    .line 118
    .line 119
    move v1, v4

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v3

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_9

    .line 134
    :cond_9
    move v1, v2

    .line 135
    :goto_9
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    move v1, v4

    .line 143
    goto :goto_a

    .line 144
    :cond_a
    move v1, v3

    .line 145
    :goto_a
    add-int/2addr v0, v1

    .line 146
    mul-int/lit8 v0, v0, 0x29

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 149
    .line 150
    if-eqz v1, :cond_b

    .line 151
    .line 152
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    goto :goto_b

    .line 157
    :cond_b
    move v1, v2

    .line 158
    :goto_b
    add-int/2addr v0, v1

    .line 159
    mul-int/lit8 v0, v0, 0x29

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 162
    .line 163
    if-eqz v1, :cond_c

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDialogContent;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    goto :goto_c

    .line 170
    :cond_c
    move v1, v2

    .line 171
    :goto_c
    add-int/2addr v0, v1

    .line 172
    mul-int/lit8 v0, v0, 0x29

    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 175
    .line 176
    if-eqz v1, :cond_d

    .line 177
    .line 178
    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    goto :goto_d

    .line 183
    :cond_d
    move v1, v2

    .line 184
    :goto_d
    add-int/2addr v0, v1

    .line 185
    mul-int/lit8 v0, v0, 0x29

    .line 186
    .line 187
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 188
    .line 189
    if-eqz v1, :cond_e

    .line 190
    .line 191
    move v3, v4

    .line 192
    :cond_e
    add-int/2addr v0, v3

    .line 193
    mul-int/lit8 v0, v0, 0x29

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 196
    .line 197
    if-eqz v1, :cond_f

    .line 198
    .line 199
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->hashCode()I

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    :cond_f
    add-int/2addr v0, v2

    .line 204
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 205
    .line 206
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSTriggerRule;->new_()Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->rule:Lcom/p1/mobile/putong/data/OMSTriggerRule;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->events:Ljava/util/List;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSPositionInfo;->new_()Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->position:Lcom/p1/mobile/putong/data/OMSPositionInfo;

    .line 55
    .line 56
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 57
    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 65
    .line 66
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 67
    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialogType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->contentType:Lcom/p1/mobile/putong/data/OMSDialogType;

    .line 79
    .line 80
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 81
    .line 82
    if-nez v0, :cond_8

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDialogContent;->new_()Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 89
    .line 90
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 91
    .line 92
    if-nez v0, :cond_9

    .line 93
    .line 94
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->variableMap:Ljava/util/Map;

    .line 97
    .line 98
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 99
    .line 100
    if-nez v0, :cond_a

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->new_()Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 107
    .line 108
    :cond_a
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
