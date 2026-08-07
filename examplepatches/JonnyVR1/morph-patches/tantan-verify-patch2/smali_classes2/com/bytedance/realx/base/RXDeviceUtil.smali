.class public Lcom/bytedance/realx/base/RXDeviceUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final KEY_COLOROS_VERSION_NAME:Ljava/lang/String; = "ro.build.version.opporom"

.field private static final KEY_EMUI_VERSION_NAME:Ljava/lang/String; = "ro.build.version.emui"

.field private static final KEY_FLYME_VERSION_NAME:Ljava/lang/String; = "ro.build.display.id"

.field private static final KEY_HARMONYOS_VERSION_NAME:Ljava/lang/String; = "hw_sc.build.platform.version"

.field private static final KEY_MAGICUI_VERSION:Ljava/lang/String; = "ro.build.version.magic"

.field private static final KEY_MIUI_VERSION_NAME:Ljava/lang/String; = "ro.miui.ui.version.name"

.field private static final KEY_NUBIA_VERSION_CODE:Ljava/lang/String; = "ro.build.nubia.rom.code"

.field private static final KEY_NUBIA_VERSION_NAME:Ljava/lang/String; = "ro.build.nubia.rom.name"

.field private static final KEY_ONEPLUS_VERSION_NAME:Ljava/lang/String; = "ro.rom.version"

.field private static final KEY_VIVO_VERSION:Ljava/lang/String; = "ro.vivo.os.version"

.field private static final KEY_VIVO_VERSION_NAME:Ljava/lang/String; = "ro.vivo.os.name"

.field private static customOS:Ljava/lang/String; = ""

.field private static customOSVersion:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static deleteSpaceAndToUpperCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    const-string v0, " "

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static getCustomOSVersion(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->setCustomOSInfo(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public static getPhoneSystem(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->setCustomOSInfo(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, "_"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method private static getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "android.os.SystemProperties"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "get"

    .line 8
    .line 9
    const-class v2, Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v1, v0, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    return-object p0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method private static isHarmonyOS()Z
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "com.huawei.system.BuildEx"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "getOsBrand"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    xor-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    return v0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    return v0
.end method

.method private static isMagicUI()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method private static setCustomOSInfo(Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string v0, "ro.build.version.magic"

    .line 2
    .line 3
    :try_start_0
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->deleteSpaceAndToUpperCase(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    const-string v2, "ro.build.version.emui"

    .line 12
    .line 13
    const-string v3, "EMUI"

    .line 14
    .line 15
    const-string v4, "HarmonyOS"

    .line 16
    .line 17
    const-string v5, "hw_sc.build.platform.version"

    .line 18
    .line 19
    sparse-switch v1, :sswitch_data_0

    .line 20
    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :sswitch_0
    :try_start_1
    const-string v0, "HUAWEI"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_4

    .line 31
    .line 32
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceUtil;->isHarmonyOS()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-static {v5}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 43
    .line 44
    sput-object v4, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    sput-object v3, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 54
    .line 55
    return-void

    .line 56
    :sswitch_1
    const-string v0, "REDMI"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_4

    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :sswitch_2
    const-string v0, "NUBIA"

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_4

    .line 73
    .line 74
    const-string p0, "ro.build.nubia.rom.name"

    .line 75
    .line 76
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 81
    .line 82
    const-string p0, "ro.build.nubia.rom.code"

    .line 83
    .line 84
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 89
    .line 90
    return-void

    .line 91
    :sswitch_3
    const-string v0, "MEIZU"

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_4

    .line 98
    .line 99
    const-string p0, "Flyme"

    .line 100
    .line 101
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 102
    .line 103
    const-string p0, "ro.build.display.id"

    .line 104
    .line 105
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 110
    .line 111
    return-void

    .line 112
    :sswitch_4
    const-string v1, "HONOR"

    .line 113
    .line 114
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-eqz p0, :cond_4

    .line 119
    .line 120
    invoke-static {v0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_1

    .line 129
    .line 130
    const-string p0, "MagicUI"

    .line 131
    .line 132
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 139
    .line 140
    return-void

    .line 141
    :cond_1
    invoke-static {}, Lcom/bytedance/realx/base/RXDeviceUtil;->isHarmonyOS()Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-eqz p0, :cond_3

    .line 146
    .line 147
    sput-object v4, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v5}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-nez p0, :cond_2

    .line 158
    .line 159
    invoke-static {v5}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 164
    .line 165
    return-void

    .line 166
    :cond_2
    const-string p0, ""

    .line 167
    .line 168
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 169
    .line 170
    return-void

    .line 171
    :cond_3
    sput-object v3, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v2}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 178
    .line 179
    return-void

    .line 180
    :sswitch_5
    const-string v0, "VIVO"

    .line 181
    .line 182
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-eqz p0, :cond_4

    .line 187
    .line 188
    const-string p0, "Funtouch"

    .line 189
    .line 190
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 191
    .line 192
    const-string p0, "ro.vivo.os.version"

    .line 193
    .line 194
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 199
    .line 200
    return-void

    .line 201
    :sswitch_6
    const-string v0, "OPPO"

    .line 202
    .line 203
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result p0

    .line 207
    if-eqz p0, :cond_4

    .line 208
    .line 209
    goto :goto_1

    .line 210
    :sswitch_7
    const-string v0, "ONEPLUS"

    .line 211
    .line 212
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    if-eqz p0, :cond_4

    .line 217
    .line 218
    const-string p0, "HydrogenOS"

    .line 219
    .line 220
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 221
    .line 222
    const-string p0, "ro.rom.version"

    .line 223
    .line 224
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 229
    .line 230
    return-void

    .line 231
    :sswitch_8
    const-string v0, "XIAOMI"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-eqz p0, :cond_4

    .line 238
    .line 239
    :goto_0
    const-string p0, "MIUI"

    .line 240
    .line 241
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 242
    .line 243
    const-string p0, "ro.miui.ui.version.name"

    .line 244
    .line 245
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 250
    .line 251
    return-void

    .line 252
    :sswitch_9
    const-string v0, "REALME"

    .line 253
    .line 254
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    if-eqz p0, :cond_4

    .line 259
    .line 260
    :goto_1
    const-string p0, "ColorOS"

    .line 261
    .line 262
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 263
    .line 264
    const-string p0, "ro.build.version.opporom"

    .line 265
    .line 266
    invoke-static {p0}, Lcom/bytedance/realx/base/RXDeviceUtil;->getSystemPropertyValue(Ljava/lang/String;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;

    .line 271
    .line 272
    return-void

    .line 273
    :cond_4
    :goto_2
    const-string p0, "Android"

    .line 274
    .line 275
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOS:Ljava/lang/String;

    .line 276
    .line 277
    sget-object p0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 278
    .line 279
    sput-object p0, Lcom/bytedance/realx/base/RXDeviceUtil;->customOSVersion:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 280
    .line 281
    return-void

    .line 282
    :catch_0
    move-exception p0

    .line 283
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 284
    .line 285
    .line 286
    return-void

    .line 287
    :sswitch_data_0
    .sparse-switch
        -0x7027944a -> :sswitch_9
        -0x65b21745 -> :sswitch_8
        -0x23e7db20 -> :sswitch_7
        0x251fa0 -> :sswitch_6
        0x2834ac -> :sswitch_5
        0x41bb44a -> :sswitch_4
        0x45d8cac -> :sswitch_3
        0x472cdb3 -> :sswitch_2
        0x4a3edcd -> :sswitch_1
        0x7fa995e7 -> :sswitch_0
    .end sparse-switch
.end method
