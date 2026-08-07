.class public final Ltech/sud/base/utils/RomUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/base/utils/RomUtils$RomInfo;
    }
.end annotation


# static fields
.field private static final ROM_360:[Ljava/lang/String;

.field private static final ROM_COOLPAD:[Ljava/lang/String;

.field private static final ROM_GIONEE:[Ljava/lang/String;

.field private static final ROM_GOOGLE:[Ljava/lang/String;

.field private static final ROM_HTC:[Ljava/lang/String;

.field private static final ROM_HUAWEI:[Ljava/lang/String;

.field private static final ROM_LEECO:[Ljava/lang/String;

.field private static final ROM_LENOVO:[Ljava/lang/String;

.field private static final ROM_LG:[Ljava/lang/String;

.field private static final ROM_MEIZU:[Ljava/lang/String;

.field private static final ROM_MOTOROLA:[Ljava/lang/String;

.field private static final ROM_NUBIA:[Ljava/lang/String;

.field private static final ROM_ONEPLUS:[Ljava/lang/String;

.field private static final ROM_OPPO:[Ljava/lang/String;

.field private static final ROM_SAMSUNG:[Ljava/lang/String;

.field private static final ROM_SMARTISAN:[Ljava/lang/String;

.field private static final ROM_SONY:[Ljava/lang/String;

.field private static final ROM_VIVO:[Ljava/lang/String;

.field private static final ROM_XIAOMI:[Ljava/lang/String;

.field private static final ROM_ZTE:[Ljava/lang/String;

.field private static final UNKNOWN:Ljava/lang/String; = "unknown"

.field private static final VERSION_PROPERTY_360:Ljava/lang/String; = "ro.build.uiversion"

.field private static final VERSION_PROPERTY_HUAWEI:Ljava/lang/String; = "ro.build.version.emui"

.field private static final VERSION_PROPERTY_LEECO:Ljava/lang/String; = "ro.letv.release.version"

.field private static final VERSION_PROPERTY_NUBIA:Ljava/lang/String; = "ro.build.rom.id"

.field private static final VERSION_PROPERTY_ONEPLUS:Ljava/lang/String; = "ro.rom.version"

.field private static final VERSION_PROPERTY_OPPO:Ljava/lang/String; = "ro.build.version.opporom"

.field private static final VERSION_PROPERTY_VIVO:Ljava/lang/String; = "ro.vivo.os.build.display.id"

.field private static final VERSION_PROPERTY_XIAOMI:Ljava/lang/String; = "ro.build.version.incremental"

.field private static final VERSION_PROPERTY_ZTE:Ljava/lang/String; = "ro.build.MiFavor_version"

.field private static bean:Ltech/sud/base/utils/RomUtils$RomInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "huawei"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_HUAWEI:[Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "vivo"

    .line 10
    .line 11
    filled-new-array {v0}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_VIVO:[Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "xiaomi"

    .line 18
    .line 19
    filled-new-array {v0}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_XIAOMI:[Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "oppo"

    .line 26
    .line 27
    filled-new-array {v0}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_OPPO:[Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "leeco"

    .line 34
    .line 35
    const-string v1, "letv"

    .line 36
    .line 37
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_LEECO:[Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "360"

    .line 44
    .line 45
    const-string v1, "qiku"

    .line 46
    .line 47
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_360:[Ljava/lang/String;

    .line 52
    .line 53
    const-string v0, "zte"

    .line 54
    .line 55
    filled-new-array {v0}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_ZTE:[Ljava/lang/String;

    .line 60
    .line 61
    const-string v0, "oneplus"

    .line 62
    .line 63
    filled-new-array {v0}, [Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_ONEPLUS:[Ljava/lang/String;

    .line 68
    .line 69
    const-string v0, "nubia"

    .line 70
    .line 71
    filled-new-array {v0}, [Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_NUBIA:[Ljava/lang/String;

    .line 76
    .line 77
    const-string v0, "coolpad"

    .line 78
    .line 79
    const-string v1, "yulong"

    .line 80
    .line 81
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_COOLPAD:[Ljava/lang/String;

    .line 86
    .line 87
    const-string v0, "lg"

    .line 88
    .line 89
    const-string v1, "lge"

    .line 90
    .line 91
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_LG:[Ljava/lang/String;

    .line 96
    .line 97
    const-string v0, "google"

    .line 98
    .line 99
    filled-new-array {v0}, [Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_GOOGLE:[Ljava/lang/String;

    .line 104
    .line 105
    const-string v0, "samsung"

    .line 106
    .line 107
    filled-new-array {v0}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_SAMSUNG:[Ljava/lang/String;

    .line 112
    .line 113
    const-string v0, "meizu"

    .line 114
    .line 115
    filled-new-array {v0}, [Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_MEIZU:[Ljava/lang/String;

    .line 120
    .line 121
    const-string v0, "lenovo"

    .line 122
    .line 123
    filled-new-array {v0}, [Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_LENOVO:[Ljava/lang/String;

    .line 128
    .line 129
    const-string v0, "smartisan"

    .line 130
    .line 131
    const-string v1, "deltainno"

    .line 132
    .line 133
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_SMARTISAN:[Ljava/lang/String;

    .line 138
    .line 139
    const-string v0, "htc"

    .line 140
    .line 141
    filled-new-array {v0}, [Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_HTC:[Ljava/lang/String;

    .line 146
    .line 147
    const-string v0, "sony"

    .line 148
    .line 149
    filled-new-array {v0}, [Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_SONY:[Ljava/lang/String;

    .line 154
    .line 155
    const-string v0, "gionee"

    .line 156
    .line 157
    const-string v1, "amigo"

    .line 158
    .line 159
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_GIONEE:[Ljava/lang/String;

    .line 164
    .line 165
    const-string v0, "motorola"

    .line 166
    .line 167
    filled-new-array {v0}, [Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    sput-object v0, Ltech/sud/base/utils/RomUtils;->ROM_MOTOROLA:[Ljava/lang/String;

    .line 172
    .line 173
    const/4 v0, 0x0

    .line 174
    sput-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 175
    .line 176
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 5
    .line 6
    const-string v0, "u can\'t instantiate me..."

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    throw p0
.end method

.method private static getBrand()Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    return-object v0

    .line 14
    :catchall_0
    :cond_0
    const-string v0, "unknown"

    .line 15
    .line 16
    return-object v0
.end method

.method private static getManufacturer()Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    return-object v0

    .line 14
    :catchall_0
    :cond_0
    const-string v0, "unknown"

    .line 15
    .line 16
    return-object v0
.end method

.method public static getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;
    .locals 5

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    invoke-direct {v0}, Ltech/sud/base/utils/RomUtils$RomInfo;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 12
    .line 13
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getBrand()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getManufacturer()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_HUAWEI:[Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x0

    .line 28
    if-eqz v3, :cond_2

    .line 29
    .line 30
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 31
    .line 32
    aget-object v1, v2, v4

    .line 33
    .line 34
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v0, "ro.build.version.emui"

    .line 38
    .line 39
    invoke-static {v0}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "_"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    array-length v2, v1

    .line 50
    const/4 v3, 0x1

    .line 51
    if-le v2, v3, :cond_1

    .line 52
    .line 53
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 54
    .line 55
    aget-object v1, v1, v3

    .line 56
    .line 57
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    sget-object v1, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 62
    .line 63
    invoke-static {v1, v0}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_2
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_VIVO:[Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_3

    .line 76
    .line 77
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 78
    .line 79
    aget-object v1, v2, v4

    .line 80
    .line 81
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const-string v1, "ro.vivo.os.build.display.id"

    .line 85
    .line 86
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 94
    .line 95
    return-object v0

    .line 96
    :cond_3
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_XIAOMI:[Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_4

    .line 103
    .line 104
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 105
    .line 106
    aget-object v1, v2, v4

    .line 107
    .line 108
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const-string v1, "ro.build.version.incremental"

    .line 112
    .line 113
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 121
    .line 122
    return-object v0

    .line 123
    :cond_4
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_OPPO:[Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-eqz v3, :cond_5

    .line 130
    .line 131
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 132
    .line 133
    aget-object v1, v2, v4

    .line 134
    .line 135
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const-string v1, "ro.build.version.opporom"

    .line 139
    .line 140
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 148
    .line 149
    return-object v0

    .line 150
    :cond_5
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_LEECO:[Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    if-eqz v3, :cond_6

    .line 157
    .line 158
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 159
    .line 160
    aget-object v1, v2, v4

    .line 161
    .line 162
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    const-string v1, "ro.letv.release.version"

    .line 166
    .line 167
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 175
    .line 176
    return-object v0

    .line 177
    :cond_6
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_360:[Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    if-eqz v3, :cond_7

    .line 184
    .line 185
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 186
    .line 187
    aget-object v1, v2, v4

    .line 188
    .line 189
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    const-string v1, "ro.build.uiversion"

    .line 193
    .line 194
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 202
    .line 203
    return-object v0

    .line 204
    :cond_7
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_ZTE:[Ljava/lang/String;

    .line 205
    .line 206
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-eqz v3, :cond_8

    .line 211
    .line 212
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 213
    .line 214
    aget-object v1, v2, v4

    .line 215
    .line 216
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    const-string v1, "ro.build.MiFavor_version"

    .line 220
    .line 221
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 229
    .line 230
    return-object v0

    .line 231
    :cond_8
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_ONEPLUS:[Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    if-eqz v3, :cond_9

    .line 238
    .line 239
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 240
    .line 241
    aget-object v1, v2, v4

    .line 242
    .line 243
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    const-string v1, "ro.rom.version"

    .line 247
    .line 248
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 256
    .line 257
    return-object v0

    .line 258
    :cond_9
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_NUBIA:[Ljava/lang/String;

    .line 259
    .line 260
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    if-eqz v3, :cond_a

    .line 265
    .line 266
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 267
    .line 268
    aget-object v1, v2, v4

    .line 269
    .line 270
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    const-string v1, "ro.build.rom.id"

    .line 274
    .line 275
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 283
    .line 284
    return-object v0

    .line 285
    :cond_a
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_COOLPAD:[Ljava/lang/String;

    .line 286
    .line 287
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    if-eqz v3, :cond_b

    .line 292
    .line 293
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 294
    .line 295
    aget-object v1, v2, v4

    .line 296
    .line 297
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    goto/16 :goto_1

    .line 301
    .line 302
    :cond_b
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_LG:[Ljava/lang/String;

    .line 303
    .line 304
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 305
    .line 306
    .line 307
    move-result v3

    .line 308
    if-eqz v3, :cond_c

    .line 309
    .line 310
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 311
    .line 312
    aget-object v1, v2, v4

    .line 313
    .line 314
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    goto/16 :goto_1

    .line 318
    .line 319
    :cond_c
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_GOOGLE:[Ljava/lang/String;

    .line 320
    .line 321
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 322
    .line 323
    .line 324
    move-result v3

    .line 325
    if-eqz v3, :cond_d

    .line 326
    .line 327
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 328
    .line 329
    aget-object v1, v2, v4

    .line 330
    .line 331
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    goto/16 :goto_1

    .line 335
    .line 336
    :cond_d
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_SAMSUNG:[Ljava/lang/String;

    .line 337
    .line 338
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 339
    .line 340
    .line 341
    move-result v3

    .line 342
    if-eqz v3, :cond_e

    .line 343
    .line 344
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 345
    .line 346
    aget-object v1, v2, v4

    .line 347
    .line 348
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    goto/16 :goto_1

    .line 352
    .line 353
    :cond_e
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_MEIZU:[Ljava/lang/String;

    .line 354
    .line 355
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    if-eqz v3, :cond_f

    .line 360
    .line 361
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 362
    .line 363
    aget-object v1, v2, v4

    .line 364
    .line 365
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    goto :goto_1

    .line 369
    :cond_f
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_LENOVO:[Ljava/lang/String;

    .line 370
    .line 371
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 372
    .line 373
    .line 374
    move-result v3

    .line 375
    if-eqz v3, :cond_10

    .line 376
    .line 377
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 378
    .line 379
    aget-object v1, v2, v4

    .line 380
    .line 381
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    goto :goto_1

    .line 385
    :cond_10
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_SMARTISAN:[Ljava/lang/String;

    .line 386
    .line 387
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 388
    .line 389
    .line 390
    move-result v3

    .line 391
    if-eqz v3, :cond_11

    .line 392
    .line 393
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 394
    .line 395
    aget-object v1, v2, v4

    .line 396
    .line 397
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    goto :goto_1

    .line 401
    :cond_11
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_HTC:[Ljava/lang/String;

    .line 402
    .line 403
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 404
    .line 405
    .line 406
    move-result v3

    .line 407
    if-eqz v3, :cond_12

    .line 408
    .line 409
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 410
    .line 411
    aget-object v1, v2, v4

    .line 412
    .line 413
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    goto :goto_1

    .line 417
    :cond_12
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_SONY:[Ljava/lang/String;

    .line 418
    .line 419
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    if-eqz v3, :cond_13

    .line 424
    .line 425
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 426
    .line 427
    aget-object v1, v2, v4

    .line 428
    .line 429
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    goto :goto_1

    .line 433
    :cond_13
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_GIONEE:[Ljava/lang/String;

    .line 434
    .line 435
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 436
    .line 437
    .line 438
    move-result v3

    .line 439
    if-eqz v3, :cond_14

    .line 440
    .line 441
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 442
    .line 443
    aget-object v1, v2, v4

    .line 444
    .line 445
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    goto :goto_1

    .line 449
    :cond_14
    sget-object v2, Ltech/sud/base/utils/RomUtils;->ROM_MOTOROLA:[Ljava/lang/String;

    .line 450
    .line 451
    invoke-static {v0, v1, v2}, Ltech/sud/base/utils/RomUtils;->isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z

    .line 452
    .line 453
    .line 454
    move-result v0

    .line 455
    if-eqz v0, :cond_15

    .line 456
    .line 457
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 458
    .line 459
    aget-object v1, v2, v4

    .line 460
    .line 461
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 462
    .line 463
    .line 464
    goto :goto_1

    .line 465
    :cond_15
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 466
    .line 467
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->b(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    :goto_1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 471
    .line 472
    const-string v1, ""

    .line 473
    .line 474
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils;->getRomVersion(Ljava/lang/String;)Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    invoke-static {v0, v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->c(Ltech/sud/base/utils/RomUtils$RomInfo;Ljava/lang/String;)V

    .line 479
    .line 480
    .line 481
    sget-object v0, Ltech/sud/base/utils/RomUtils;->bean:Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 482
    .line 483
    return-object v0
.end method

.method private static getRomVersion(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ltech/sud/base/utils/RomUtils;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, ""

    .line 13
    .line 14
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, "unknown"

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    :cond_1
    :try_start_0
    sget-object v0, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    :catchall_0
    :cond_2
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    return-object v1

    .line 47
    :cond_3
    return-object p0
.end method

.method private static getSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Ltech/sud/base/utils/RomUtils;->getSystemPropertyByShell(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-static {p0}, Ltech/sud/base/utils/RomUtils;->getSystemPropertyByStream(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 24
    .line 25
    const/16 v2, 0x1c

    .line 26
    .line 27
    if-ge v1, v2, :cond_2

    .line 28
    .line 29
    invoke-static {p0}, Ltech/sud/base/utils/RomUtils;->getSystemPropertyByReflect(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_2
    :goto_0
    return-object v0
.end method

.method private static getSystemPropertyByReflect(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    const-string v1, "android.os.SystemProperties"

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "get"

    .line 10
    .line 11
    const-class v3, Ljava/lang/String;

    .line 12
    .line 13
    filled-new-array {v3, v3}, [Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v2, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    return-object p0

    .line 32
    :catch_0
    return-object v0
.end method

.method private static getSystemPropertyByShell(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, "getprop "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v2, p0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ljava/io/BufferedReader;

    .line 25
    .line 26
    new-instance v2, Ljava/io/InputStreamReader;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-direct {v2, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 33
    .line 34
    .line 35
    const/16 p0, 0x400

    .line 36
    .line 37
    invoke-direct {v0, v2, p0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 38
    .line 39
    .line 40
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 47
    .line 48
    .line 49
    :catch_0
    return-object p0

    .line 50
    :cond_0
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    move-object v1, v0

    .line 56
    goto :goto_0

    .line 57
    :catch_1
    move-object v1, v0

    .line 58
    goto :goto_1

    .line 59
    :catchall_1
    move-exception p0

    .line 60
    :goto_0
    if-eqz v1, :cond_1

    .line 61
    .line 62
    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 63
    .line 64
    .line 65
    :catch_2
    :cond_1
    throw p0

    .line 66
    :catch_3
    :goto_1
    if-eqz v1, :cond_2

    .line 67
    .line 68
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 69
    .line 70
    .line 71
    :catch_4
    :cond_2
    :goto_2
    const-string p0, ""

    .line 72
    .line 73
    return-object p0
.end method

.method private static getSystemPropertyByStream(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/util/Properties;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ljava/io/FileInputStream;

    .line 9
    .line 10
    new-instance v3, Ljava/io/File;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    const-string v5, "build.prop"

    .line 17
    .line 18
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p0, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return-object p0

    .line 32
    :catch_0
    return-object v0
.end method

.method public static is360()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_360:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isCoolpad()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_COOLPAD:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isGionee()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_GIONEE:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isGoogle()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_GOOGLE:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isHtc()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_HTC:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isHuawei()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_HUAWEI:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isLeeco()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_LEECO:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isLenovo()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_LENOVO:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isLg()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_LG:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isMeizu()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_MEIZU:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isMotorola()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_MOTOROLA:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isNubia()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_NUBIA:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isOneplus()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_ONEPLUS:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isOppo()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_OPPO:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method private static varargs isRightRom(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 5

    .line 1
    array-length v0, p2

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_2

    .line 5
    .line 6
    aget-object v3, p2, v2

    .line 7
    .line 8
    invoke-virtual {p0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    if-nez v4, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    :goto_1
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_2
    return v1
.end method

.method public static isSamsung()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_SAMSUNG:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isSmartisan()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_SMARTISAN:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isSony()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_SONY:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isVivo()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_VIVO:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isXiaomi()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_XIAOMI:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method

.method public static isZte()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/base/utils/RomUtils;->ROM_ZTE:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    invoke-static {}, Ltech/sud/base/utils/RomUtils;->getRomInfo()Ltech/sud/base/utils/RomUtils$RomInfo;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ltech/sud/base/utils/RomUtils$RomInfo;->a(Ltech/sud/base/utils/RomUtils$RomInfo;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    return v0
.end method
