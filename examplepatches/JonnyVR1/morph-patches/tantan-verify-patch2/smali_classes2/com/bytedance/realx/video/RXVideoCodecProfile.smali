.class final enum Lcom/bytedance/realx/video/RXVideoCodecProfile;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/RXVideoCodecProfile;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ByteVC1ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ByteVC1ProfileMain10:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ByteVC1ProfileMain10HDR10:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ByteVC1ProfileMax:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ByteVC1ProfileUnknown:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ProfileBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ProfileConstrainedBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ProfileConstrainedHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ProfileHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum Unknown:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public static final enum VP8ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 2
    .line 3
    const-string v1, "Unknown"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->Unknown:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 12
    .line 13
    const-string v2, "ProfileConstrainedBaseline"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileConstrainedBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 20
    .line 21
    new-instance v2, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 22
    .line 23
    const-string v3, "ProfileBaseline"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 30
    .line 31
    new-instance v3, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 32
    .line 33
    const-string v4, "ProfileMain"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 40
    .line 41
    new-instance v4, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 42
    .line 43
    const-string v5, "ProfileConstrainedHigh"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileConstrainedHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 50
    .line 51
    new-instance v5, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 52
    .line 53
    const-string v6, "ProfileHigh"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 60
    .line 61
    new-instance v6, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 62
    .line 63
    const-string v7, "ByteVC1ProfileUnknown"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    const/16 v9, 0xa

    .line 67
    .line 68
    invoke-direct {v6, v7, v8, v9}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    sput-object v6, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileUnknown:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 72
    .line 73
    new-instance v7, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 74
    .line 75
    const-string v8, "ByteVC1ProfileMain"

    .line 76
    .line 77
    const/4 v10, 0x7

    .line 78
    const/16 v11, 0xb

    .line 79
    .line 80
    invoke-direct {v7, v8, v10, v11}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 81
    .line 82
    .line 83
    sput-object v7, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 84
    .line 85
    new-instance v8, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 86
    .line 87
    const/16 v10, 0x8

    .line 88
    .line 89
    const/16 v12, 0xc

    .line 90
    .line 91
    const-string v13, "ByteVC1ProfileMain10"

    .line 92
    .line 93
    invoke-direct {v8, v13, v10, v12}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 94
    .line 95
    .line 96
    sput-object v8, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMain10:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 97
    .line 98
    move v10, v9

    .line 99
    new-instance v9, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 100
    .line 101
    const/16 v12, 0x9

    .line 102
    .line 103
    const/16 v13, 0x50

    .line 104
    .line 105
    const-string v14, "VP8ProfileMain"

    .line 106
    .line 107
    invoke-direct {v9, v14, v12, v13}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 108
    .line 109
    .line 110
    sput-object v9, Lcom/bytedance/realx/video/RXVideoCodecProfile;->VP8ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 111
    .line 112
    move v12, v10

    .line 113
    new-instance v10, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 114
    .line 115
    const-string v13, "ByteVC1ProfileMain10HDR10"

    .line 116
    .line 117
    const/16 v14, 0x64

    .line 118
    .line 119
    invoke-direct {v10, v13, v12, v14}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 120
    .line 121
    .line 122
    sput-object v10, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMain10HDR10:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 123
    .line 124
    move v12, v11

    .line 125
    new-instance v11, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 126
    .line 127
    const-string v13, "ByteVC1ProfileMax"

    .line 128
    .line 129
    const/16 v14, 0x80

    .line 130
    .line 131
    invoke-direct {v11, v13, v12, v14}, Lcom/bytedance/realx/video/RXVideoCodecProfile;-><init>(Ljava/lang/String;II)V

    .line 132
    .line 133
    .line 134
    sput-object v11, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMax:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 135
    .line 136
    filled-new-array/range {v0 .. v11}, [Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sput-object v0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->$VALUES:[Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 141
    .line 142
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
    iput p3, p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/bytedance/realx/video/RXVideoCodecProfile;
    .locals 1

    .line 1
    if-eqz p0, :cond_8

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_7

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_6

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_5

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-eq p0, v0, :cond_4

    .line 14
    .line 15
    const/4 v0, 0x5

    .line 16
    if-eq p0, v0, :cond_3

    .line 17
    .line 18
    const/16 v0, 0x50

    .line 19
    .line 20
    if-eq p0, v0, :cond_2

    .line 21
    .line 22
    const/16 v0, 0x64

    .line 23
    .line 24
    if-eq p0, v0, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x80

    .line 27
    .line 28
    if-eq p0, v0, :cond_0

    .line 29
    .line 30
    packed-switch p0, :pswitch_data_0

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->Unknown:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_0
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMain10:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_1
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_2
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileUnknown:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_0
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMax:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_1
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ByteVC1ProfileMain10HDR10:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_2
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->VP8ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_3
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_4
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileConstrainedHigh:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileMain:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_6
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_7
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->ProfileConstrainedBaseline:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_8
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->Unknown:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 70
    .line 71
    return-object p0

    .line 72
    nop

    .line 73
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/RXVideoCodecProfile;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/RXVideoCodecProfile;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->$VALUES:[Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/RXVideoCodecProfile;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toInt()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->value:I

    .line 2
    .line 3
    return p0
.end method

.method public toSystemProfile()I
    .locals 4

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/RXVideoCodecProfile;->value:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_5

    .line 5
    .line 6
    if-eq p0, v0, :cond_5

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq p0, v1, :cond_5

    .line 10
    .line 11
    const/4 v2, 0x3

    .line 12
    if-eq p0, v2, :cond_4

    .line 13
    .line 14
    const/4 v2, 0x4

    .line 15
    if-eq p0, v2, :cond_3

    .line 16
    .line 17
    const/4 v3, 0x5

    .line 18
    if-eq p0, v3, :cond_3

    .line 19
    .line 20
    const/16 v3, 0x50

    .line 21
    .line 22
    if-eq p0, v3, :cond_2

    .line 23
    .line 24
    const/16 v3, 0x64

    .line 25
    .line 26
    if-eq p0, v3, :cond_1

    .line 27
    .line 28
    const/16 v3, 0x80

    .line 29
    .line 30
    if-eq p0, v3, :cond_0

    .line 31
    .line 32
    packed-switch p0, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    const-string p0, "profile not match system!"

    .line 36
    .line 37
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :pswitch_0
    return v1

    .line 43
    :pswitch_1
    return v0

    .line 44
    :cond_0
    return v2

    .line 45
    :cond_1
    const/16 p0, 0x1000

    .line 46
    .line 47
    return p0

    .line 48
    :cond_2
    return v0

    .line 49
    :cond_3
    const/16 p0, 0x8

    .line 50
    .line 51
    return p0

    .line 52
    :cond_4
    return v1

    .line 53
    :cond_5
    return v0

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
