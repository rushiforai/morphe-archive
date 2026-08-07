.class public Lcom/p1/mobile/putong/data/OMSDialog;
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
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omsdialog"


# instance fields
.field public actions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSAction;",
            ">;"
        }
    .end annotation
.end field

.field public baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public bgImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public child:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public childJson:Lcom/p1/mobile/putong/data/OMSDialog;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public content:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSResourceContent;",
            ">;"
        }
    .end annotation
.end field

.field public foreImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public image:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public needApplyChild:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public nodes:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public nodesJson:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;"
        }
    .end annotation
.end field

.field public src:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public style:Lcom/p1/mobile/putong/data/OMSBaseStyle;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialog$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialog$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSDialog;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialog$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialog$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OMSDialog;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/OMSResourceContent;)Lcom/p1/mobile/putong/data/OMSResourceContent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSResourceContent;->clone()Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/OMSDialog;)Lcom/p1/mobile/putong/data/OMSDialog;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSDialog;->clone()Lcom/p1/mobile/putong/data/OMSDialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/OMSAction;)Lcom/p1/mobile/putong/data/OMSAction;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSAction;->clone()Lcom/p1/mobile/putong/data/OMSAction;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/OMSDialog;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialog;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSDialog;->nullCheck()V

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

    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSDialog;->clone()Lcom/p1/mobile/putong/data/OMSDialog;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OMSDialog;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSDialog;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->clone()Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    new-instance v2, Ll/f750;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/f750;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 34
    .line 35
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 60
    .line 61
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->clone()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 72
    .line 73
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 74
    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    new-instance v2, Ll/g750;

    .line 78
    .line 79
    invoke-direct {v2}, Ll/g750;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 87
    .line 88
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 89
    .line 90
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 93
    .line 94
    if-eqz v1, :cond_4

    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSLanguageContent;->clone()Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 101
    .line 102
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 103
    .line 104
    if-eqz v1, :cond_5

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDialog;->clone()Lcom/p1/mobile/putong/data/OMSDialog;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 111
    .line 112
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 113
    .line 114
    if-eqz p0, :cond_6

    .line 115
    .line 116
    new-instance v1, Ll/h750;

    .line 117
    .line 118
    invoke-direct {v1}, Ll/h750;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 126
    .line 127
    :cond_6
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSDialog;->clone()Lcom/p1/mobile/putong/data/OMSDialog;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 104
    .line 105
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 112
    .line 113
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 122
    .line 123
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 132
    .line 133
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_2

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 142
    .line 143
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 152
    .line 153
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_2

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 162
    .line 163
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_2

    .line 168
    .line 169
    return v0

    .line 170
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omsdialog"

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
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    const/16 v1, 0x4cf

    .line 130
    .line 131
    goto :goto_9

    .line 132
    :cond_9
    const/16 v1, 0x4d5

    .line 133
    .line 134
    :goto_9
    add-int/2addr v0, v1

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 138
    .line 139
    if-eqz v1, :cond_a

    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->hashCode()I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    goto :goto_a

    .line 146
    :cond_a
    move v1, v2

    .line 147
    :goto_a
    add-int/2addr v0, v1

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 151
    .line 152
    if-eqz v1, :cond_b

    .line 153
    .line 154
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    goto :goto_b

    .line 159
    :cond_b
    move v1, v2

    .line 160
    :goto_b
    add-int/2addr v0, v1

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 164
    .line 165
    if-eqz v1, :cond_c

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    goto :goto_c

    .line 172
    :cond_c
    move v1, v2

    .line 173
    :goto_c
    add-int/2addr v0, v1

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 177
    .line 178
    if-eqz v1, :cond_d

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSLanguageContent;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    goto :goto_d

    .line 185
    :cond_d
    move v1, v2

    .line 186
    :goto_d
    add-int/2addr v0, v1

    .line 187
    mul-int/lit8 v0, v0, 0x29

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 190
    .line 191
    if-eqz v1, :cond_e

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDialog;->hashCode()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    goto :goto_e

    .line 198
    :cond_e
    move v1, v2

    .line 199
    :goto_e
    add-int/2addr v0, v1

    .line 200
    mul-int/lit8 v0, v0, 0x29

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 203
    .line 204
    if-eqz v1, :cond_f

    .line 205
    .line 206
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    :cond_f
    add-int/2addr v0, v2

    .line 211
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 212
    .line 213
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/OMSTemplateModeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->new_()Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, ""

    .line 39
    .line 40
    if-nez v0, :cond_3

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 43
    .line 44
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_4

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 49
    .line 50
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_5

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 55
    .line 56
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 61
    .line 62
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 63
    .line 64
    if-nez v0, :cond_7

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 67
    .line 68
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 69
    .line 70
    if-nez v0, :cond_8

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 73
    .line 74
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 75
    .line 76
    if-nez v0, :cond_9

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->new_()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 83
    .line 84
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 85
    .line 86
    if-nez v0, :cond_a

    .line 87
    .line 88
    new-instance v0, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 94
    .line 95
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 96
    .line 97
    if-nez v0, :cond_b

    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 108
    .line 109
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 110
    .line 111
    if-nez v0, :cond_c

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSLanguageContent;->new_()Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 118
    .line 119
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialog;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
