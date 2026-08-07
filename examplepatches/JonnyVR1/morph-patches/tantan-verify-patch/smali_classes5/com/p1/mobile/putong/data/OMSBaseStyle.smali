.class public Lcom/p1/mobile/putong/data/OMSBaseStyle;
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
            "Lcom/p1/mobile/putong/data/OMSBaseStyle;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSBaseStyle;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omsbasestyle"


# instance fields
.field public alignment:Lcom/p1/mobile/putong/data/OMSLocationType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public autoSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public autoSwitchTime:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public bgColors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public blurColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation
.end field

.field public blurRadius:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation
.end field

.field public borderColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public borderWidth:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public canSlide:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public checked:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public cornerRadius:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public direction:Lcom/p1/mobile/putong/data/ResourceDirection;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public distribution:Lcom/p1/mobile/putong/data/OMSLocationType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public height:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public heightType:Lcom/p1/mobile/putong/data/OMSSizeType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public imageSize:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public indicatorBgColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation
.end field

.field public indicatorColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field

.field public indicatorRadius:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation
.end field

.field public leftCapLayoutWidth:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public leftCapWidth:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public lineSpacing:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public location:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSLocationType;",
            ">;"
        }
    .end annotation
.end field

.field public marginBottom:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public marginLeft:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public marginRight:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public marginTop:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public maxHeight:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public maxWidth:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public minHeight:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public minWidth:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public numberOfLines:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public offsetX:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public offsetY:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public paddingBottom:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public paddingLeft:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public paddingRight:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public paddingTop:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public ratio:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public shadowColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation
.end field

.field public shadowOpacity:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation
.end field

.field public shadowRadius:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation
.end field

.field public showIndicator:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public spacing:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public stayTime:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation
.end field

.field public topCapHeight:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public topCapLayoutHeight:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public uiType:Lcom/p1/mobile/putong/data/OMSUIType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public width:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public widthType:Lcom/p1/mobile/putong/data/OMSSizeType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSBaseStyle$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSBaseStyle$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OMSBaseStyle$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSBaseStyle$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic b(Lcom/p1/mobile/putong/data/OMSLocationType;)Lcom/p1/mobile/putong/data/OMSLocationType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/OMSBaseStyle;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSBaseStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->nullCheck()V

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

    .line 249
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->clone()Lcom/p1/mobile/putong/data/OMSBaseStyle;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OMSBaseStyle;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSBaseStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 37
    .line 38
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 39
    .line 40
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 49
    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 51
    .line 52
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 55
    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 57
    .line 58
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 59
    .line 60
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 63
    .line 64
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 65
    .line 66
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 67
    .line 68
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 69
    .line 70
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 71
    .line 72
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 75
    .line 76
    if-eqz v1, :cond_0

    .line 77
    .line 78
    new-instance v2, Ll/o650;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/o650;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 88
    .line 89
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 90
    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 94
    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 96
    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 98
    .line 99
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 100
    .line 101
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 102
    .line 103
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 106
    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 110
    .line 111
    if-eqz v1, :cond_1

    .line 112
    .line 113
    new-instance v2, Ll/p650;

    .line 114
    .line 115
    invoke-direct {v2}, Ll/p650;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 123
    .line 124
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 125
    .line 126
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 127
    .line 128
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 129
    .line 130
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 133
    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 135
    .line 136
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 137
    .line 138
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 139
    .line 140
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 141
    .line 142
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 143
    .line 144
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 145
    .line 146
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 147
    .line 148
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 149
    .line 150
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 151
    .line 152
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 153
    .line 154
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 157
    .line 158
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 161
    .line 162
    if-eqz v1, :cond_2

    .line 163
    .line 164
    new-instance v2, Ll/q650;

    .line 165
    .line 166
    invoke-direct {v2}, Ll/q650;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 174
    .line 175
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 176
    .line 177
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 178
    .line 179
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 180
    .line 181
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 184
    .line 185
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 186
    .line 187
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 188
    .line 189
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 190
    .line 191
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 192
    .line 193
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 194
    .line 195
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 196
    .line 197
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 198
    .line 199
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 200
    .line 201
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 202
    .line 203
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 204
    .line 205
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 208
    .line 209
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 212
    .line 213
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 214
    .line 215
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 216
    .line 217
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 218
    .line 219
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 220
    .line 221
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 224
    .line 225
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 228
    .line 229
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 230
    .line 231
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 232
    .line 233
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 234
    .line 235
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 236
    .line 237
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 238
    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 240
    .line 241
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 242
    .line 243
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 244
    .line 245
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 246
    .line 247
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 248
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSBaseStyle;->clone()Lcom/p1/mobile/putong/data/OMSBaseStyle;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 16
    .line 17
    cmpl-float v1, v1, v3

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 22
    .line 23
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 24
    .line 25
    cmpl-float v1, v1, v3

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 32
    .line 33
    cmpl-float v1, v1, v3

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 40
    .line 41
    cmpl-float v1, v1, v3

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 46
    .line 47
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 48
    .line 49
    cmpl-float v1, v1, v3

    .line 50
    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 54
    .line 55
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 56
    .line 57
    cmpl-float v1, v1, v3

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 82
    .line 83
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 84
    .line 85
    cmpl-float v1, v1, v3

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 90
    .line 91
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 92
    .line 93
    cmpl-float v1, v1, v3

    .line 94
    .line 95
    if-nez v1, :cond_2

    .line 96
    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 98
    .line 99
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 100
    .line 101
    cmpl-float v1, v1, v3

    .line 102
    .line 103
    if-nez v1, :cond_2

    .line 104
    .line 105
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 106
    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 108
    .line 109
    cmpl-float v1, v1, v3

    .line 110
    .line 111
    if-nez v1, :cond_2

    .line 112
    .line 113
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 114
    .line 115
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 116
    .line 117
    cmpl-float v1, v1, v3

    .line 118
    .line 119
    if-nez v1, :cond_2

    .line 120
    .line 121
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 122
    .line 123
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 124
    .line 125
    cmpl-float v1, v1, v3

    .line 126
    .line 127
    if-nez v1, :cond_2

    .line 128
    .line 129
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 130
    .line 131
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 132
    .line 133
    cmpl-float v1, v1, v3

    .line 134
    .line 135
    if-nez v1, :cond_2

    .line 136
    .line 137
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 138
    .line 139
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 140
    .line 141
    cmpl-float v1, v1, v3

    .line 142
    .line 143
    if-nez v1, :cond_2

    .line 144
    .line 145
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 146
    .line 147
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 148
    .line 149
    cmpl-float v1, v1, v3

    .line 150
    .line 151
    if-nez v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 156
    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_2

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 166
    .line 167
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_2

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_2

    .line 182
    .line 183
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 184
    .line 185
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 186
    .line 187
    cmpl-float v1, v1, v3

    .line 188
    .line 189
    if-nez v1, :cond_2

    .line 190
    .line 191
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 192
    .line 193
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 194
    .line 195
    cmpl-float v1, v1, v3

    .line 196
    .line 197
    if-nez v1, :cond_2

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 202
    .line 203
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_2

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 210
    .line 211
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 212
    .line 213
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-eqz v1, :cond_2

    .line 218
    .line 219
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 220
    .line 221
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 222
    .line 223
    if-ne v1, v3, :cond_2

    .line 224
    .line 225
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 226
    .line 227
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 228
    .line 229
    cmpl-float v1, v1, v3

    .line 230
    .line 231
    if-nez v1, :cond_2

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 234
    .line 235
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 236
    .line 237
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_2

    .line 242
    .line 243
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 244
    .line 245
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 246
    .line 247
    cmpl-float v1, v1, v3

    .line 248
    .line 249
    if-nez v1, :cond_2

    .line 250
    .line 251
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 252
    .line 253
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 254
    .line 255
    cmpl-float v1, v1, v3

    .line 256
    .line 257
    if-nez v1, :cond_2

    .line 258
    .line 259
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 260
    .line 261
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 262
    .line 263
    cmpl-float v1, v1, v3

    .line 264
    .line 265
    if-nez v1, :cond_2

    .line 266
    .line 267
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 268
    .line 269
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 270
    .line 271
    cmpl-float v1, v1, v3

    .line 272
    .line 273
    if-nez v1, :cond_2

    .line 274
    .line 275
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 276
    .line 277
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 278
    .line 279
    cmpl-float v1, v1, v3

    .line 280
    .line 281
    if-nez v1, :cond_2

    .line 282
    .line 283
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 284
    .line 285
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 286
    .line 287
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-eqz v1, :cond_2

    .line 292
    .line 293
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 294
    .line 295
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 296
    .line 297
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-eqz v1, :cond_2

    .line 302
    .line 303
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 304
    .line 305
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 306
    .line 307
    cmpl-float v1, v1, v3

    .line 308
    .line 309
    if-nez v1, :cond_2

    .line 310
    .line 311
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 312
    .line 313
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 314
    .line 315
    cmpl-float v1, v1, v3

    .line 316
    .line 317
    if-nez v1, :cond_2

    .line 318
    .line 319
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 320
    .line 321
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 322
    .line 323
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    if-eqz v1, :cond_2

    .line 328
    .line 329
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 330
    .line 331
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 332
    .line 333
    if-ne v1, v3, :cond_2

    .line 334
    .line 335
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 336
    .line 337
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 338
    .line 339
    if-ne v1, v3, :cond_2

    .line 340
    .line 341
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 342
    .line 343
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 344
    .line 345
    if-ne v1, v3, :cond_2

    .line 346
    .line 347
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 348
    .line 349
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 350
    .line 351
    if-ne v1, v3, :cond_2

    .line 352
    .line 353
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 354
    .line 355
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 356
    .line 357
    if-ne v1, v3, :cond_2

    .line 358
    .line 359
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 360
    .line 361
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 362
    .line 363
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    if-eqz v1, :cond_2

    .line 368
    .line 369
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 370
    .line 371
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 372
    .line 373
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    if-eqz v1, :cond_2

    .line 378
    .line 379
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 380
    .line 381
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 382
    .line 383
    cmpl-float v1, v1, v3

    .line 384
    .line 385
    if-nez v1, :cond_2

    .line 386
    .line 387
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 388
    .line 389
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 390
    .line 391
    cmpl-float v1, v1, v3

    .line 392
    .line 393
    if-nez v1, :cond_2

    .line 394
    .line 395
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 396
    .line 397
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 398
    .line 399
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    move-result v1

    .line 403
    if-eqz v1, :cond_2

    .line 404
    .line 405
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 406
    .line 407
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 408
    .line 409
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    if-eqz v1, :cond_2

    .line 414
    .line 415
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 416
    .line 417
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 418
    .line 419
    cmpl-float v1, v1, v3

    .line 420
    .line 421
    if-nez v1, :cond_2

    .line 422
    .line 423
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 424
    .line 425
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 426
    .line 427
    cmpl-float v1, v1, v3

    .line 428
    .line 429
    if-nez v1, :cond_2

    .line 430
    .line 431
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 432
    .line 433
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 434
    .line 435
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    if-eqz v1, :cond_2

    .line 440
    .line 441
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 442
    .line 443
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 444
    .line 445
    if-ne p0, p1, :cond_2

    .line 446
    .line 447
    return v0

    .line 448
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omsbasestyle"

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
    if-nez v0, :cond_14

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    mul-int/lit8 v0, v0, 0x29

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 17
    .line 18
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 26
    .line 27
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    add-int/2addr v0, v1

    .line 41
    mul-int/lit8 v0, v0, 0x29

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    if-eqz v1, :cond_0

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    move v1, v2

    .line 72
    :goto_0
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 76
    .line 77
    if-eqz v1, :cond_1

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    goto :goto_1

    .line 84
    :cond_1
    move v1, v2

    .line 85
    :goto_1
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 89
    .line 90
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 98
    .line 99
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    add-int/2addr v0, v1

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 107
    .line 108
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    add-int/2addr v0, v1

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 116
    .line 117
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    add-int/2addr v0, v1

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 125
    .line 126
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    add-int/2addr v0, v1

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 134
    .line 135
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    add-int/2addr v0, v1

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 143
    .line 144
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 152
    .line 153
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    add-int/2addr v0, v1

    .line 158
    mul-int/lit8 v0, v0, 0x29

    .line 159
    .line 160
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 161
    .line 162
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    add-int/2addr v0, v1

    .line 167
    mul-int/lit8 v0, v0, 0x29

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 170
    .line 171
    if-eqz v1, :cond_2

    .line 172
    .line 173
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    goto :goto_2

    .line 178
    :cond_2
    move v1, v2

    .line 179
    :goto_2
    add-int/2addr v0, v1

    .line 180
    mul-int/lit8 v0, v0, 0x29

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 183
    .line 184
    if-eqz v1, :cond_3

    .line 185
    .line 186
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    goto :goto_3

    .line 191
    :cond_3
    move v1, v2

    .line 192
    :goto_3
    add-int/2addr v0, v1

    .line 193
    mul-int/lit8 v0, v0, 0x29

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 196
    .line 197
    if-eqz v1, :cond_4

    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    goto :goto_4

    .line 204
    :cond_4
    move v1, v2

    .line 205
    :goto_4
    add-int/2addr v0, v1

    .line 206
    mul-int/lit8 v0, v0, 0x29

    .line 207
    .line 208
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 209
    .line 210
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    add-int/2addr v0, v1

    .line 215
    mul-int/lit8 v0, v0, 0x29

    .line 216
    .line 217
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 218
    .line 219
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    add-int/2addr v0, v1

    .line 224
    mul-int/lit8 v0, v0, 0x29

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 227
    .line 228
    if-eqz v1, :cond_5

    .line 229
    .line 230
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    goto :goto_5

    .line 235
    :cond_5
    move v1, v2

    .line 236
    :goto_5
    add-int/2addr v0, v1

    .line 237
    mul-int/lit8 v0, v0, 0x29

    .line 238
    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 240
    .line 241
    if-eqz v1, :cond_6

    .line 242
    .line 243
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    goto :goto_6

    .line 248
    :cond_6
    move v1, v2

    .line 249
    :goto_6
    add-int/2addr v0, v1

    .line 250
    mul-int/lit8 v0, v0, 0x29

    .line 251
    .line 252
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 253
    .line 254
    add-int/2addr v0, v1

    .line 255
    mul-int/lit8 v0, v0, 0x29

    .line 256
    .line 257
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 258
    .line 259
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    add-int/2addr v0, v1

    .line 264
    mul-int/lit8 v0, v0, 0x29

    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 267
    .line 268
    if-eqz v1, :cond_7

    .line 269
    .line 270
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    goto :goto_7

    .line 275
    :cond_7
    move v1, v2

    .line 276
    :goto_7
    add-int/2addr v0, v1

    .line 277
    mul-int/lit8 v0, v0, 0x29

    .line 278
    .line 279
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 280
    .line 281
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    add-int/2addr v0, v1

    .line 286
    mul-int/lit8 v0, v0, 0x29

    .line 287
    .line 288
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 289
    .line 290
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    add-int/2addr v0, v1

    .line 295
    mul-int/lit8 v0, v0, 0x29

    .line 296
    .line 297
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 298
    .line 299
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    add-int/2addr v0, v1

    .line 304
    mul-int/lit8 v0, v0, 0x29

    .line 305
    .line 306
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 307
    .line 308
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 309
    .line 310
    .line 311
    move-result v1

    .line 312
    add-int/2addr v0, v1

    .line 313
    mul-int/lit8 v0, v0, 0x29

    .line 314
    .line 315
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 316
    .line 317
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    add-int/2addr v0, v1

    .line 322
    mul-int/lit8 v0, v0, 0x29

    .line 323
    .line 324
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 325
    .line 326
    if-eqz v1, :cond_8

    .line 327
    .line 328
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    goto :goto_8

    .line 333
    :cond_8
    move v1, v2

    .line 334
    :goto_8
    add-int/2addr v0, v1

    .line 335
    mul-int/lit8 v0, v0, 0x29

    .line 336
    .line 337
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 338
    .line 339
    if-eqz v1, :cond_9

    .line 340
    .line 341
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    goto :goto_9

    .line 346
    :cond_9
    move v1, v2

    .line 347
    :goto_9
    add-int/2addr v0, v1

    .line 348
    mul-int/lit8 v0, v0, 0x29

    .line 349
    .line 350
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 351
    .line 352
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 353
    .line 354
    .line 355
    move-result v1

    .line 356
    add-int/2addr v0, v1

    .line 357
    mul-int/lit8 v0, v0, 0x29

    .line 358
    .line 359
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 360
    .line 361
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 362
    .line 363
    .line 364
    move-result v1

    .line 365
    add-int/2addr v0, v1

    .line 366
    mul-int/lit8 v0, v0, 0x29

    .line 367
    .line 368
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 369
    .line 370
    if-eqz v1, :cond_a

    .line 371
    .line 372
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 373
    .line 374
    .line 375
    move-result v1

    .line 376
    goto :goto_a

    .line 377
    :cond_a
    move v1, v2

    .line 378
    :goto_a
    add-int/2addr v0, v1

    .line 379
    mul-int/lit8 v0, v0, 0x29

    .line 380
    .line 381
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 382
    .line 383
    const/16 v3, 0x4d5

    .line 384
    .line 385
    const/16 v4, 0x4cf

    .line 386
    .line 387
    if-eqz v1, :cond_b

    .line 388
    .line 389
    move v1, v4

    .line 390
    goto :goto_b

    .line 391
    :cond_b
    move v1, v3

    .line 392
    :goto_b
    add-int/2addr v0, v1

    .line 393
    mul-int/lit8 v0, v0, 0x29

    .line 394
    .line 395
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 396
    .line 397
    if-eqz v1, :cond_c

    .line 398
    .line 399
    move v1, v4

    .line 400
    goto :goto_c

    .line 401
    :cond_c
    move v1, v3

    .line 402
    :goto_c
    add-int/2addr v0, v1

    .line 403
    mul-int/lit8 v0, v0, 0x29

    .line 404
    .line 405
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 406
    .line 407
    add-int/2addr v0, v1

    .line 408
    mul-int/lit8 v0, v0, 0x29

    .line 409
    .line 410
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 411
    .line 412
    add-int/2addr v0, v1

    .line 413
    mul-int/lit8 v0, v0, 0x29

    .line 414
    .line 415
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 416
    .line 417
    if-eqz v1, :cond_d

    .line 418
    .line 419
    move v1, v4

    .line 420
    goto :goto_d

    .line 421
    :cond_d
    move v1, v3

    .line 422
    :goto_d
    add-int/2addr v0, v1

    .line 423
    mul-int/lit8 v0, v0, 0x29

    .line 424
    .line 425
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 426
    .line 427
    if-eqz v1, :cond_e

    .line 428
    .line 429
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 430
    .line 431
    .line 432
    move-result v1

    .line 433
    goto :goto_e

    .line 434
    :cond_e
    move v1, v2

    .line 435
    :goto_e
    add-int/2addr v0, v1

    .line 436
    mul-int/lit8 v0, v0, 0x29

    .line 437
    .line 438
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 439
    .line 440
    if-eqz v1, :cond_f

    .line 441
    .line 442
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 443
    .line 444
    .line 445
    move-result v1

    .line 446
    goto :goto_f

    .line 447
    :cond_f
    move v1, v2

    .line 448
    :goto_f
    add-int/2addr v0, v1

    .line 449
    mul-int/lit8 v0, v0, 0x29

    .line 450
    .line 451
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 452
    .line 453
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 454
    .line 455
    .line 456
    move-result v1

    .line 457
    add-int/2addr v0, v1

    .line 458
    mul-int/lit8 v0, v0, 0x29

    .line 459
    .line 460
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 461
    .line 462
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 463
    .line 464
    .line 465
    move-result v1

    .line 466
    add-int/2addr v0, v1

    .line 467
    mul-int/lit8 v0, v0, 0x29

    .line 468
    .line 469
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 470
    .line 471
    if-eqz v1, :cond_10

    .line 472
    .line 473
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 474
    .line 475
    .line 476
    move-result v1

    .line 477
    goto :goto_10

    .line 478
    :cond_10
    move v1, v2

    .line 479
    :goto_10
    add-int/2addr v0, v1

    .line 480
    mul-int/lit8 v0, v0, 0x29

    .line 481
    .line 482
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 483
    .line 484
    if-eqz v1, :cond_11

    .line 485
    .line 486
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 487
    .line 488
    .line 489
    move-result v1

    .line 490
    goto :goto_11

    .line 491
    :cond_11
    move v1, v2

    .line 492
    :goto_11
    add-int/2addr v0, v1

    .line 493
    mul-int/lit8 v0, v0, 0x29

    .line 494
    .line 495
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 496
    .line 497
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 498
    .line 499
    .line 500
    move-result v1

    .line 501
    add-int/2addr v0, v1

    .line 502
    mul-int/lit8 v0, v0, 0x29

    .line 503
    .line 504
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 505
    .line 506
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 507
    .line 508
    .line 509
    move-result v1

    .line 510
    add-int/2addr v0, v1

    .line 511
    mul-int/lit8 v0, v0, 0x29

    .line 512
    .line 513
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 514
    .line 515
    if-eqz v1, :cond_12

    .line 516
    .line 517
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 518
    .line 519
    .line 520
    move-result v2

    .line 521
    :cond_12
    add-int/2addr v0, v2

    .line 522
    mul-int/lit8 v0, v0, 0x29

    .line 523
    .line 524
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 525
    .line 526
    if-eqz v1, :cond_13

    .line 527
    .line 528
    move v3, v4

    .line 529
    :cond_13
    add-int/2addr v0, v3

    .line 530
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 531
    .line 532
    :cond_14
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 41
    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 53
    .line 54
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 55
    .line 56
    const-string v1, ""

    .line 57
    .line 58
    if-nez v0, :cond_4

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 61
    .line 62
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 63
    .line 64
    if-nez v0, :cond_5

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 75
    .line 76
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 77
    .line 78
    if-nez v0, :cond_6

    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 86
    .line 87
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 88
    .line 89
    if-nez v0, :cond_7

    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/data/OMSImageScaleType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 100
    .line 101
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 102
    .line 103
    if-nez v0, :cond_8

    .line 104
    .line 105
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 114
    .line 115
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 116
    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    new-instance v0, Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .line 123
    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 125
    .line 126
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 127
    .line 128
    if-nez v0, :cond_a

    .line 129
    .line 130
    sget-object v0, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 137
    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 139
    .line 140
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 141
    .line 142
    if-nez v0, :cond_b

    .line 143
    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 145
    .line 146
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 147
    .line 148
    if-nez v0, :cond_c

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 151
    .line 152
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 153
    .line 154
    if-nez v0, :cond_d

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 157
    .line 158
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 159
    .line 160
    if-nez v0, :cond_e

    .line 161
    .line 162
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 163
    .line 164
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 165
    .line 166
    if-nez v0, :cond_f

    .line 167
    .line 168
    sget-object v0, Lcom/p1/mobile/putong/data/OMSUIType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    check-cast v0, Lcom/p1/mobile/putong/data/OMSUIType;

    .line 175
    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 177
    .line 178
    :cond_f
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
