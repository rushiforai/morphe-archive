.class public final enum Lcom/appsflyer/MediationNetwork;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/MediationNetwork;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\u0008\u0015\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u001a\u0010\u0006\u001a\u00020\u00028\u0007X\u0087\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0006\u0010\u0007\u001a\u0004\u0008\u0008\u0010\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015j\u0002\u0008\u0016j\u0002\u0008\u0017"
    }
    d2 = {
        "Lcom/appsflyer/MediationNetwork;",
        "",
        "",
        "p0",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "value",
        "Ljava/lang/String;",
        "getValue",
        "()Ljava/lang/String;",
        "IRONSOURCE",
        "APPLOVIN_MAX",
        "GOOGLE_ADMOB",
        "FYBER",
        "APPODEAL",
        "ADMOST",
        "TOPON",
        "TRADPLUS",
        "YANDEX",
        "CHARTBOOST",
        "UNITY",
        "TOPON_PTE",
        "CUSTOM_MEDIATION",
        "DIRECT_MONETIZATION_NETWORK"
    }
    k = 0x1
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final enum ADMOST:Lcom/appsflyer/MediationNetwork;

.field public static final enum APPLOVIN_MAX:Lcom/appsflyer/MediationNetwork;

.field public static final enum APPODEAL:Lcom/appsflyer/MediationNetwork;

.field public static final enum CHARTBOOST:Lcom/appsflyer/MediationNetwork;

.field public static final enum CUSTOM_MEDIATION:Lcom/appsflyer/MediationNetwork;

.field public static final enum DIRECT_MONETIZATION_NETWORK:Lcom/appsflyer/MediationNetwork;

.field public static final enum FYBER:Lcom/appsflyer/MediationNetwork;

.field public static final enum GOOGLE_ADMOB:Lcom/appsflyer/MediationNetwork;

.field public static final enum IRONSOURCE:Lcom/appsflyer/MediationNetwork;

.field public static final enum TOPON:Lcom/appsflyer/MediationNetwork;

.field public static final enum TOPON_PTE:Lcom/appsflyer/MediationNetwork;

.field public static final enum TRADPLUS:Lcom/appsflyer/MediationNetwork;

.field public static final enum UNITY:Lcom/appsflyer/MediationNetwork;

.field public static final enum YANDEX:Lcom/appsflyer/MediationNetwork;

.field private static final synthetic getMonetizationNetwork:[Lcom/appsflyer/MediationNetwork;


# instance fields
.field private final value:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 1
    new-instance v0, Lcom/appsflyer/MediationNetwork;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "ironsource"

    .line 5
    .line 6
    const-string v3, "IRONSOURCE"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/appsflyer/MediationNetwork;->IRONSOURCE:Lcom/appsflyer/MediationNetwork;

    .line 12
    .line 13
    new-instance v1, Lcom/appsflyer/MediationNetwork;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "applovinmax"

    .line 17
    .line 18
    const-string v4, "APPLOVIN_MAX"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/appsflyer/MediationNetwork;->APPLOVIN_MAX:Lcom/appsflyer/MediationNetwork;

    .line 24
    .line 25
    new-instance v2, Lcom/appsflyer/MediationNetwork;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "googleadmob"

    .line 29
    .line 30
    const-string v5, "GOOGLE_ADMOB"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/appsflyer/MediationNetwork;->GOOGLE_ADMOB:Lcom/appsflyer/MediationNetwork;

    .line 36
    .line 37
    new-instance v3, Lcom/appsflyer/MediationNetwork;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "fyber"

    .line 41
    .line 42
    const-string v6, "FYBER"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/appsflyer/MediationNetwork;->FYBER:Lcom/appsflyer/MediationNetwork;

    .line 48
    .line 49
    new-instance v4, Lcom/appsflyer/MediationNetwork;

    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    const-string v6, "appodeal"

    .line 53
    .line 54
    const-string v7, "APPODEAL"

    .line 55
    .line 56
    invoke-direct {v4, v7, v5, v6}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v4, Lcom/appsflyer/MediationNetwork;->APPODEAL:Lcom/appsflyer/MediationNetwork;

    .line 60
    .line 61
    new-instance v5, Lcom/appsflyer/MediationNetwork;

    .line 62
    .line 63
    const/4 v6, 0x5

    .line 64
    const-string v7, "Admost"

    .line 65
    .line 66
    const-string v8, "ADMOST"

    .line 67
    .line 68
    invoke-direct {v5, v8, v6, v7}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v5, Lcom/appsflyer/MediationNetwork;->ADMOST:Lcom/appsflyer/MediationNetwork;

    .line 72
    .line 73
    new-instance v6, Lcom/appsflyer/MediationNetwork;

    .line 74
    .line 75
    const/4 v7, 0x6

    .line 76
    const-string v8, "Topon"

    .line 77
    .line 78
    const-string v9, "TOPON"

    .line 79
    .line 80
    invoke-direct {v6, v9, v7, v8}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v6, Lcom/appsflyer/MediationNetwork;->TOPON:Lcom/appsflyer/MediationNetwork;

    .line 84
    .line 85
    new-instance v7, Lcom/appsflyer/MediationNetwork;

    .line 86
    .line 87
    const/4 v8, 0x7

    .line 88
    const-string v9, "Tradplus"

    .line 89
    .line 90
    const-string v10, "TRADPLUS"

    .line 91
    .line 92
    invoke-direct {v7, v10, v8, v9}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v7, Lcom/appsflyer/MediationNetwork;->TRADPLUS:Lcom/appsflyer/MediationNetwork;

    .line 96
    .line 97
    new-instance v8, Lcom/appsflyer/MediationNetwork;

    .line 98
    .line 99
    const/16 v9, 0x8

    .line 100
    .line 101
    const-string v10, "Yandex"

    .line 102
    .line 103
    const-string v11, "YANDEX"

    .line 104
    .line 105
    invoke-direct {v8, v11, v9, v10}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sput-object v8, Lcom/appsflyer/MediationNetwork;->YANDEX:Lcom/appsflyer/MediationNetwork;

    .line 109
    .line 110
    new-instance v9, Lcom/appsflyer/MediationNetwork;

    .line 111
    .line 112
    const/16 v10, 0x9

    .line 113
    .line 114
    const-string v11, "chartboost"

    .line 115
    .line 116
    const-string v12, "CHARTBOOST"

    .line 117
    .line 118
    invoke-direct {v9, v12, v10, v11}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sput-object v9, Lcom/appsflyer/MediationNetwork;->CHARTBOOST:Lcom/appsflyer/MediationNetwork;

    .line 122
    .line 123
    new-instance v10, Lcom/appsflyer/MediationNetwork;

    .line 124
    .line 125
    const/16 v11, 0xa

    .line 126
    .line 127
    const-string v12, "Unity"

    .line 128
    .line 129
    const-string v13, "UNITY"

    .line 130
    .line 131
    invoke-direct {v10, v13, v11, v12}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v10, Lcom/appsflyer/MediationNetwork;->UNITY:Lcom/appsflyer/MediationNetwork;

    .line 135
    .line 136
    new-instance v11, Lcom/appsflyer/MediationNetwork;

    .line 137
    .line 138
    const/16 v12, 0xb

    .line 139
    .line 140
    const-string v13, "toponpte"

    .line 141
    .line 142
    const-string v14, "TOPON_PTE"

    .line 143
    .line 144
    invoke-direct {v11, v14, v12, v13}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sput-object v11, Lcom/appsflyer/MediationNetwork;->TOPON_PTE:Lcom/appsflyer/MediationNetwork;

    .line 148
    .line 149
    new-instance v12, Lcom/appsflyer/MediationNetwork;

    .line 150
    .line 151
    const/16 v13, 0xc

    .line 152
    .line 153
    const-string v14, "customMediation"

    .line 154
    .line 155
    const-string v15, "CUSTOM_MEDIATION"

    .line 156
    .line 157
    invoke-direct {v12, v15, v13, v14}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sput-object v12, Lcom/appsflyer/MediationNetwork;->CUSTOM_MEDIATION:Lcom/appsflyer/MediationNetwork;

    .line 161
    .line 162
    new-instance v13, Lcom/appsflyer/MediationNetwork;

    .line 163
    .line 164
    const/16 v14, 0xd

    .line 165
    .line 166
    const-string v15, "directMonetizationNetwork"

    .line 167
    .line 168
    move-object/from16 v16, v0

    .line 169
    .line 170
    const-string v0, "DIRECT_MONETIZATION_NETWORK"

    .line 171
    .line 172
    invoke-direct {v13, v0, v14, v15}, Lcom/appsflyer/MediationNetwork;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sput-object v13, Lcom/appsflyer/MediationNetwork;->DIRECT_MONETIZATION_NETWORK:Lcom/appsflyer/MediationNetwork;

    .line 176
    .line 177
    move-object/from16 v0, v16

    .line 178
    .line 179
    filled-new-array/range {v0 .. v13}, [Lcom/appsflyer/MediationNetwork;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    sput-object v0, Lcom/appsflyer/MediationNetwork;->getMonetizationNetwork:[Lcom/appsflyer/MediationNetwork;

    .line 184
    .line 185
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/appsflyer/MediationNetwork;->value:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/MediationNetwork;
    .locals 1

    .line 1
    const-class v0, Lcom/appsflyer/MediationNetwork;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/appsflyer/MediationNetwork;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/appsflyer/MediationNetwork;
    .locals 1

    .line 1
    sget-object v0, Lcom/appsflyer/MediationNetwork;->getMonetizationNetwork:[Lcom/appsflyer/MediationNetwork;

    .line 2
    .line 3
    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/appsflyer/MediationNetwork;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getValue()Ljava/lang/String;
    .locals 0
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/appsflyer/MediationNetwork;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
