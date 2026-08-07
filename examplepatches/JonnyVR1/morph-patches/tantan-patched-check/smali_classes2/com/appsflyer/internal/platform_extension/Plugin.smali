.class public final enum Lcom/appsflyer/internal/platform_extension/Plugin;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/platform_extension/Plugin;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\u0008\u0016\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u001a\u0010\u0006\u001a\u00020\u00028\u0007X\u0087\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0006\u0010\u0007\u001a\u0004\u0008\u0008\u0010\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015j\u0002\u0008\u0016j\u0002\u0008\u0017j\u0002\u0008\u0018"
    }
    d2 = {
        "Lcom/appsflyer/internal/platform_extension/Plugin;",
        "",
        "",
        "p0",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "pluginName",
        "Ljava/lang/String;",
        "getPluginName",
        "()Ljava/lang/String;",
        "NATIVE",
        "UNITY",
        "FLUTTER",
        "REACT_NATIVE",
        "ADOBE_AIR",
        "ADOBE_MOBILE",
        "COCOS_2DX",
        "CORDOVA",
        "MPARTICLE",
        "NATIVE_SCRIPT",
        "EXPO",
        "UNREAL",
        "XAMARIN",
        "CAPACITOR",
        "SEGMENT"
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
.field public static final enum ADOBE_AIR:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum ADOBE_MOBILE:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum CAPACITOR:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum COCOS_2DX:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum CORDOVA:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum EXPO:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum FLUTTER:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum MPARTICLE:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum NATIVE:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum NATIVE_SCRIPT:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum REACT_NATIVE:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum SEGMENT:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum UNITY:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum UNREAL:Lcom/appsflyer/internal/platform_extension/Plugin;

.field public static final enum XAMARIN:Lcom/appsflyer/internal/platform_extension/Plugin;

.field private static final synthetic getMonetizationNetwork:[Lcom/appsflyer/internal/platform_extension/Plugin;


# instance fields
.field private final pluginName:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 1
    new-instance v0, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "android_native"

    .line 5
    .line 6
    const-string v3, "NATIVE"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/appsflyer/internal/platform_extension/Plugin;->NATIVE:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 12
    .line 13
    new-instance v1, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "android_unity"

    .line 17
    .line 18
    const-string v4, "UNITY"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/appsflyer/internal/platform_extension/Plugin;->UNITY:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 24
    .line 25
    new-instance v2, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "android_flutter"

    .line 29
    .line 30
    const-string v5, "FLUTTER"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/appsflyer/internal/platform_extension/Plugin;->FLUTTER:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 36
    .line 37
    new-instance v3, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "android_react_native"

    .line 41
    .line 42
    const-string v6, "REACT_NATIVE"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/appsflyer/internal/platform_extension/Plugin;->REACT_NATIVE:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 48
    .line 49
    new-instance v4, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    const-string v6, "android_adobe_air"

    .line 53
    .line 54
    const-string v7, "ADOBE_AIR"

    .line 55
    .line 56
    invoke-direct {v4, v7, v5, v6}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v4, Lcom/appsflyer/internal/platform_extension/Plugin;->ADOBE_AIR:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 60
    .line 61
    new-instance v5, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 62
    .line 63
    const/4 v6, 0x5

    .line 64
    const-string v7, "android_adobe_mobile"

    .line 65
    .line 66
    const-string v8, "ADOBE_MOBILE"

    .line 67
    .line 68
    invoke-direct {v5, v8, v6, v7}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v5, Lcom/appsflyer/internal/platform_extension/Plugin;->ADOBE_MOBILE:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 72
    .line 73
    new-instance v6, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 74
    .line 75
    const/4 v7, 0x6

    .line 76
    const-string v8, "android_cocos2dx"

    .line 77
    .line 78
    const-string v9, "COCOS_2DX"

    .line 79
    .line 80
    invoke-direct {v6, v9, v7, v8}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v6, Lcom/appsflyer/internal/platform_extension/Plugin;->COCOS_2DX:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 84
    .line 85
    new-instance v7, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 86
    .line 87
    const/4 v8, 0x7

    .line 88
    const-string v9, "android_cordova"

    .line 89
    .line 90
    const-string v10, "CORDOVA"

    .line 91
    .line 92
    invoke-direct {v7, v10, v8, v9}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v7, Lcom/appsflyer/internal/platform_extension/Plugin;->CORDOVA:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 96
    .line 97
    new-instance v8, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 98
    .line 99
    const/16 v9, 0x8

    .line 100
    .line 101
    const-string v10, "android_mparticle"

    .line 102
    .line 103
    const-string v11, "MPARTICLE"

    .line 104
    .line 105
    invoke-direct {v8, v11, v9, v10}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sput-object v8, Lcom/appsflyer/internal/platform_extension/Plugin;->MPARTICLE:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 109
    .line 110
    new-instance v9, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 111
    .line 112
    const/16 v10, 0x9

    .line 113
    .line 114
    const-string v11, "android_native_script"

    .line 115
    .line 116
    const-string v12, "NATIVE_SCRIPT"

    .line 117
    .line 118
    invoke-direct {v9, v12, v10, v11}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sput-object v9, Lcom/appsflyer/internal/platform_extension/Plugin;->NATIVE_SCRIPT:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 122
    .line 123
    new-instance v10, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 124
    .line 125
    const/16 v11, 0xa

    .line 126
    .line 127
    const-string v12, "android_expo"

    .line 128
    .line 129
    const-string v13, "EXPO"

    .line 130
    .line 131
    invoke-direct {v10, v13, v11, v12}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v10, Lcom/appsflyer/internal/platform_extension/Plugin;->EXPO:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 135
    .line 136
    new-instance v11, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 137
    .line 138
    const/16 v12, 0xb

    .line 139
    .line 140
    const-string v13, "android_unreal"

    .line 141
    .line 142
    const-string v14, "UNREAL"

    .line 143
    .line 144
    invoke-direct {v11, v14, v12, v13}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sput-object v11, Lcom/appsflyer/internal/platform_extension/Plugin;->UNREAL:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 148
    .line 149
    new-instance v12, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 150
    .line 151
    const/16 v13, 0xc

    .line 152
    .line 153
    const-string v14, "android_xamarin"

    .line 154
    .line 155
    const-string v15, "XAMARIN"

    .line 156
    .line 157
    invoke-direct {v12, v15, v13, v14}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sput-object v12, Lcom/appsflyer/internal/platform_extension/Plugin;->XAMARIN:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 161
    .line 162
    new-instance v13, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 163
    .line 164
    const/16 v14, 0xd

    .line 165
    .line 166
    const-string v15, "android_capacitor"

    .line 167
    .line 168
    move-object/from16 v16, v0

    .line 169
    .line 170
    const-string v0, "CAPACITOR"

    .line 171
    .line 172
    invoke-direct {v13, v0, v14, v15}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sput-object v13, Lcom/appsflyer/internal/platform_extension/Plugin;->CAPACITOR:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 176
    .line 177
    new-instance v14, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 178
    .line 179
    const/16 v0, 0xe

    .line 180
    .line 181
    const-string v15, "android_segment"

    .line 182
    .line 183
    move-object/from16 v17, v1

    .line 184
    .line 185
    const-string v1, "SEGMENT"

    .line 186
    .line 187
    invoke-direct {v14, v1, v0, v15}, Lcom/appsflyer/internal/platform_extension/Plugin;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 188
    .line 189
    .line 190
    sput-object v14, Lcom/appsflyer/internal/platform_extension/Plugin;->SEGMENT:Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 191
    .line 192
    move-object/from16 v0, v16

    .line 193
    .line 194
    move-object/from16 v1, v17

    .line 195
    .line 196
    filled-new-array/range {v0 .. v14}, [Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    sput-object v0, Lcom/appsflyer/internal/platform_extension/Plugin;->getMonetizationNetwork:[Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 201
    .line 202
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
    iput-object p3, p0, Lcom/appsflyer/internal/platform_extension/Plugin;->pluginName:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/platform_extension/Plugin;
    .locals 1

    .line 1
    const-class v0, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/platform_extension/Plugin;
    .locals 1

    .line 1
    sget-object v0, Lcom/appsflyer/internal/platform_extension/Plugin;->getMonetizationNetwork:[Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 2
    .line 3
    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/appsflyer/internal/platform_extension/Plugin;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getPluginName()Ljava/lang/String;
    .locals 0
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/platform_extension/Plugin;->pluginName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
