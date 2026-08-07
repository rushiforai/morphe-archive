.class public final enum Lio/agora/base/VideoFrame$ColorSpace$Primary;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame$ColorSpace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Primary"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/base/VideoFrame$ColorSpace$Primary;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum BT470BG:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum BT470M:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum BT709:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kBT2020:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kFILM:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kJEDECP22:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kSMPTE170M:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kSMPTE240M:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kSMPTEST428:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kSMPTEST431:Lio/agora/base/VideoFrame$ColorSpace$Primary;

.field public static final enum kSMPTEST432:Lio/agora/base/VideoFrame$ColorSpace$Primary;


# instance fields
.field private final primary:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 2
    .line 3
    const-string v1, "BT709"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->BT709:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 11
    .line 12
    new-instance v1, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 13
    .line 14
    const-string v2, "Unspecified"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lio/agora/base/VideoFrame$ColorSpace$Primary;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 21
    .line 22
    new-instance v2, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 23
    .line 24
    const-string v3, "BT470M"

    .line 25
    .line 26
    const/4 v5, 0x4

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lio/agora/base/VideoFrame$ColorSpace$Primary;->BT470M:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 31
    .line 32
    new-instance v3, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 33
    .line 34
    const-string v4, "BT470BG"

    .line 35
    .line 36
    const/4 v6, 0x3

    .line 37
    const/4 v7, 0x5

    .line 38
    invoke-direct {v3, v4, v6, v7}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lio/agora/base/VideoFrame$ColorSpace$Primary;->BT470BG:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 42
    .line 43
    new-instance v4, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 44
    .line 45
    const-string v6, "kSMPTE170M"

    .line 46
    .line 47
    const/4 v8, 0x6

    .line 48
    invoke-direct {v4, v6, v5, v8}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kSMPTE170M:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 52
    .line 53
    new-instance v5, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 54
    .line 55
    const-string v6, "kSMPTE240M"

    .line 56
    .line 57
    const/4 v9, 0x7

    .line 58
    invoke-direct {v5, v6, v7, v9}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 59
    .line 60
    .line 61
    sput-object v5, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kSMPTE240M:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 62
    .line 63
    new-instance v6, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 64
    .line 65
    const-string v7, "kFILM"

    .line 66
    .line 67
    const/16 v10, 0x8

    .line 68
    .line 69
    invoke-direct {v6, v7, v8, v10}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 70
    .line 71
    .line 72
    sput-object v6, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kFILM:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 73
    .line 74
    new-instance v7, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 75
    .line 76
    const-string v8, "kBT2020"

    .line 77
    .line 78
    const/16 v11, 0x9

    .line 79
    .line 80
    invoke-direct {v7, v8, v9, v11}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 81
    .line 82
    .line 83
    sput-object v7, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kBT2020:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 84
    .line 85
    new-instance v8, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 86
    .line 87
    const-string v9, "kSMPTEST428"

    .line 88
    .line 89
    const/16 v12, 0xa

    .line 90
    .line 91
    invoke-direct {v8, v9, v10, v12}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 92
    .line 93
    .line 94
    sput-object v8, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kSMPTEST428:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 95
    .line 96
    new-instance v9, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 97
    .line 98
    const-string v10, "kSMPTEST431"

    .line 99
    .line 100
    const/16 v13, 0xb

    .line 101
    .line 102
    invoke-direct {v9, v10, v11, v13}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 103
    .line 104
    .line 105
    sput-object v9, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kSMPTEST431:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 106
    .line 107
    new-instance v10, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 108
    .line 109
    const-string v11, "kSMPTEST432"

    .line 110
    .line 111
    const/16 v14, 0xc

    .line 112
    .line 113
    invoke-direct {v10, v11, v12, v14}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 114
    .line 115
    .line 116
    sput-object v10, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kSMPTEST432:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 117
    .line 118
    new-instance v11, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 119
    .line 120
    const-string v12, "kJEDECP22"

    .line 121
    .line 122
    const/16 v14, 0x16

    .line 123
    .line 124
    invoke-direct {v11, v12, v13, v14}, Lio/agora/base/VideoFrame$ColorSpace$Primary;-><init>(Ljava/lang/String;II)V

    .line 125
    .line 126
    .line 127
    sput-object v11, Lio/agora/base/VideoFrame$ColorSpace$Primary;->kJEDECP22:Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 128
    .line 129
    filled-new-array/range {v0 .. v11}, [Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    sput-object v0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->$VALUES:[Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 134
    .line 135
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->primary:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/base/VideoFrame$ColorSpace$Primary;
    .locals 1

    .line 1
    const-class v0, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lio/agora/base/VideoFrame$ColorSpace$Primary;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->$VALUES:[Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lio/agora/base/VideoFrame$ColorSpace$Primary;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lio/agora/base/VideoFrame$ColorSpace$Primary;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getPrimary()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/base/VideoFrame$ColorSpace$Primary;->primary:I

    .line 2
    .line 3
    return p0
.end method
