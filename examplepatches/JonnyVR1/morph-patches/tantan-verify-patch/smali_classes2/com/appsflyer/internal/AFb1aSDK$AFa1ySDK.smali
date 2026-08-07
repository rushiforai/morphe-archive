.class final enum Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFb1aSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AFa1ySDK"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AFAdRevenueData:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum areAllFieldsValid:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum component1:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum component2:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum component3:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum component4:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum copy:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum copydefault:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum equals:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum getMediationNetwork:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum getMonetizationNetwork:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum getRevenue:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static enum toString:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

.field private static final synthetic values:[Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;


# instance fields
.field private final AFInAppEventType:Ljava/lang/String;

.field private final hashCode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 1
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 2
    .line 3
    const-string v1, "android_adobe_air"

    .line 4
    .line 5
    const-string v2, "com.appsflyer.adobeair.AppsFlyerExtension"

    .line 6
    .line 7
    const-string v3, "ADOBE_AIR"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 14
    .line 15
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 16
    .line 17
    const-string v1, "android_adobe_mobile"

    .line 18
    .line 19
    const-string v2, "com.appsflyer.adobeextension.AppsFlyerAdobeExtension"

    .line 20
    .line 21
    const-string v3, "ADOBE_MOBILE_SDK"

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 28
    .line 29
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 30
    .line 31
    const-string v1, "android_cocos2dx"

    .line 32
    .line 33
    const-string v2, "org.cocos2dx.lib.Cocos2dxActivity"

    .line 34
    .line 35
    const-string v3, "COCOS2DX"

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getMediationNetwork:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 42
    .line 43
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 44
    .line 45
    const-string v1, "android_cordova"

    .line 46
    .line 47
    const-string v2, "com.appsflyer.cordova.plugin.AppsFlyerPlugin"

    .line 48
    .line 49
    const-string v3, "CORDOVA"

    .line 50
    .line 51
    const/4 v4, 0x3

    .line 52
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 56
    .line 57
    new-instance v9, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    const-string v1, "android_native"

    .line 61
    .line 62
    const-string v2, "DEFAULT"

    .line 63
    .line 64
    invoke-direct {v9, v2, v0, v1, v1}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v9, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 68
    .line 69
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 70
    .line 71
    const-string v1, "android_flutter"

    .line 72
    .line 73
    const-string v2, "com.appsflyer.appsflyersdk.AppsflyerSdkPlugin"

    .line 74
    .line 75
    const-string v3, "FLUTTER"

    .line 76
    .line 77
    const/4 v4, 0x5

    .line 78
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component4:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 82
    .line 83
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 84
    .line 85
    const-string v1, "android_mparticle"

    .line 86
    .line 87
    const-string v2, "com.mparticle.kits.AppsFlyerKit"

    .line 88
    .line 89
    const-string v3, "M_PARTICLE"

    .line 90
    .line 91
    const/4 v4, 0x6

    .line 92
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component2:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 96
    .line 97
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 98
    .line 99
    const-string v1, "android_native_script"

    .line 100
    .line 101
    const-string v2, "com.tns.NativeScriptActivity"

    .line 102
    .line 103
    const-string v3, "NATIVE_SCRIPT"

    .line 104
    .line 105
    const/4 v4, 0x7

    .line 106
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component1:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 110
    .line 111
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 112
    .line 113
    const-string v1, "android_expo"

    .line 114
    .line 115
    const-string v2, "expo.modules.devmenu.react.DevMenuAwareReactActivity"

    .line 116
    .line 117
    const-string v3, "EXPO"

    .line 118
    .line 119
    const/16 v4, 0x8

    .line 120
    .line 121
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component3:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 125
    .line 126
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 127
    .line 128
    const-string v1, "android_reactNative"

    .line 129
    .line 130
    const-string v2, "com.appsflyer.reactnative.RNAppsFlyerModule"

    .line 131
    .line 132
    const-string v3, "REACT_NATIVE"

    .line 133
    .line 134
    const/16 v4, 0x9

    .line 135
    .line 136
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 140
    .line 141
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 142
    .line 143
    const-string v1, "android_unity"

    .line 144
    .line 145
    const-string v2, "com.appsflyer.unity.AppsFlyerAndroidWrapper"

    .line 146
    .line 147
    const-string v3, "UNITY"

    .line 148
    .line 149
    const/16 v4, 0xa

    .line 150
    .line 151
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->copydefault:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 155
    .line 156
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 157
    .line 158
    const-string v1, "android_unreal"

    .line 159
    .line 160
    const-string v2, "com.epicgames.ue4.GameActivity"

    .line 161
    .line 162
    const-string v3, "UNREAL_ENGINE"

    .line 163
    .line 164
    const/16 v4, 0xb

    .line 165
    .line 166
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->toString:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 170
    .line 171
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 172
    .line 173
    const-string v1, "android_xamarin"

    .line 174
    .line 175
    const-string v2, "mono.android.Runtime"

    .line 176
    .line 177
    const-string v3, "XAMARIN"

    .line 178
    .line 179
    const/16 v4, 0xc

    .line 180
    .line 181
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->copy:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 185
    .line 186
    new-instance v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 187
    .line 188
    const-string v1, "android_capacitor"

    .line 189
    .line 190
    const-string v2, "capacitor.plugin.appsflyer.sdk.AppsFlyerPlugin"

    .line 191
    .line 192
    const-string v3, "CAPACITOR"

    .line 193
    .line 194
    const/16 v4, 0xd

    .line 195
    .line 196
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->equals:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 200
    .line 201
    sget-object v5, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 202
    .line 203
    sget-object v6, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 204
    .line 205
    sget-object v7, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getMediationNetwork:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 206
    .line 207
    sget-object v8, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 208
    .line 209
    sget-object v10, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component4:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 210
    .line 211
    sget-object v11, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component2:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 212
    .line 213
    sget-object v12, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component1:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 214
    .line 215
    sget-object v13, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->component3:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 216
    .line 217
    sget-object v14, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 218
    .line 219
    sget-object v15, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->copydefault:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 220
    .line 221
    sget-object v16, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->toString:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 222
    .line 223
    sget-object v17, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->copy:Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 224
    .line 225
    move-object/from16 v18, v0

    .line 226
    .line 227
    filled-new-array/range {v5 .. v18}, [Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    sput-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->values:[Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 232
    .line 233
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->hashCode:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->AFInAppEventType:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic getMonetizationNetwork(Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->hashCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic getRevenue(Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->AFInAppEventType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;
    .locals 1

    .line 1
    const-class v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;
    .locals 1

    .line 1
    sget-object v0, Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->values:[Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/appsflyer/internal/AFb1aSDK$AFa1ySDK;

    .line 8
    .line 9
    return-object v0
.end method
