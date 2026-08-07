.class public final Lcom/clevertap/android/sdk/inapp/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0019\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001f\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0019\u0010\u0013\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u000f\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0019\u0010\u0017\u001a\u0004\u0018\u00010\u00162\u0006\u0010\u0015\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\'\u0010 \u001a\u0004\u0018\u00010\u001f2\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\u001d\u00a2\u0006\u0004\u0008 \u0010!\u00a8\u0006\""
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/c;",
        "",
        "<init>",
        "()V",
        "",
        "position",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "d",
        "(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "Lorg/json/JSONObject;",
        "animJson",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;",
        "b",
        "(Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;",
        "easing",
        "bezier",
        "Landroid/animation/TimeInterpolator;",
        "c",
        "(Ljava/lang/String;Ljava/lang/String;)Landroid/animation/TimeInterpolator;",
        "e",
        "(Ljava/lang/String;)Landroid/animation/TimeInterpolator;",
        "hex",
        "",
        "f",
        "(Ljava/lang/String;)Ljava/lang/Integer;",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
        "inAppNotification",
        "Ll/m960;",
        "callbacks",
        "Ll/axl;",
        "logger",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/a;",
        "a",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Ll/m960;Ll/axl;)Lcom/clevertap/android/sdk/inapp/pipsdk/a;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Lcom/clevertap/android/sdk/inapp/c;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/clevertap/android/sdk/inapp/c;

    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/c;-><init>()V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/c;->INSTANCE:Lcom/clevertap/android/sdk/inapp/c;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final b(Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "type"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 15
    .line 16
    invoke-virtual {v1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const/4 v5, 0x0

    .line 28
    sparse-switch v4, :sswitch_data_0

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :sswitch_0
    const-string v4, "instant"

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    sget-object v1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;->INSTANT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;

    .line 42
    .line 43
    :goto_0
    move-object v7, v1

    .line 44
    goto :goto_2

    .line 45
    :sswitch_1
    const-string v4, "move_in"

    .line 46
    .line 47
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :sswitch_2
    const-string v4, "move-in"

    .line 55
    .line 56
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :sswitch_3
    const-string v4, "dissolve"

    .line 64
    .line 65
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    sget-object v1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;->DISSOLVE:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :sswitch_4
    const-string v4, "movein"

    .line 76
    .line 77
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_2

    .line 82
    .line 83
    :goto_1
    return-object v5

    .line 84
    :cond_2
    sget-object v1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;->MOVE_IN:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :goto_2
    const-string v1, "duration"

    .line 88
    .line 89
    const-wide/16 v8, 0x12c

    .line 90
    .line 91
    invoke-virtual {v0, v1, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 92
    .line 93
    .line 94
    move-result-wide v10

    .line 95
    const-wide/16 v12, 0x0

    .line 96
    .line 97
    const-wide/16 v14, 0x1388

    .line 98
    .line 99
    invoke-static/range {v10 .. v15}, Lkotlin/ranges/a;->i(JJJ)J

    .line 100
    .line 101
    .line 102
    move-result-wide v8

    .line 103
    const-string v1, "easing"

    .line 104
    .line 105
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    const-string v4, "bezier"

    .line 113
    .line 114
    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    .line 120
    .line 121
    move-object/from16 v6, p0

    .line 122
    .line 123
    invoke-direct {v6, v1, v4}, Lcom/clevertap/android/sdk/inapp/c;->c(Ljava/lang/String;Ljava/lang/String;)Landroid/animation/TimeInterpolator;

    .line 124
    .line 125
    .line 126
    move-result-object v10

    .line 127
    const-string v1, "moveInDirection"

    .line 128
    .line 129
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    sparse-switch v1, :sswitch_data_1

    .line 148
    .line 149
    .line 150
    goto :goto_4

    .line 151
    :sswitch_5
    const-string v1, "right"

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_3

    .line 158
    .line 159
    goto :goto_4

    .line 160
    :cond_3
    sget-object v5, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 161
    .line 162
    :goto_3
    move-object v11, v5

    .line 163
    goto :goto_5

    .line 164
    :sswitch_6
    const-string v1, "left"

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-nez v0, :cond_4

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :cond_4
    sget-object v5, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :sswitch_7
    const-string v1, "top"

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-nez v0, :cond_5

    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_5
    sget-object v5, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->TOP:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 186
    .line 187
    goto :goto_3

    .line 188
    :sswitch_8
    const-string v1, "bottom"

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-nez v0, :cond_6

    .line 195
    .line 196
    :goto_4
    goto :goto_3

    .line 197
    :cond_6
    sget-object v5, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->BOTTOM:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 198
    .line 199
    goto :goto_3

    .line 200
    :goto_5
    new-instance v6, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 201
    .line 202
    invoke-direct/range {v6 .. v11}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;JLandroid/animation/TimeInterpolator;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;)V

    .line 203
    .line 204
    .line 205
    return-object v6

    .line 206
    nop

    .line 207
    :sswitch_data_0
    .sparse-switch
        -0x3fac674a -> :sswitch_4
        0x1129cc71 -> :sswitch_3
        0x4a1e9ca1 -> :sswitch_2
        0x4a1f5853 -> :sswitch_1
        0x74ae25e1 -> :sswitch_0
    .end sparse-switch

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    :sswitch_data_1
    .sparse-switch
        -0x527265d5 -> :sswitch_8
        0x1c155 -> :sswitch_7
        0x32a007 -> :sswitch_6
        0x677c21c -> :sswitch_5
    .end sparse-switch
.end method

.method private final c(Ljava/lang/String;Ljava/lang/String;)Landroid/animation/TimeInterpolator;
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    sparse-switch v0, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :sswitch_0
    const-string v0, "cubic-bezier"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-direct {p0, p2}, Lcom/clevertap/android/sdk/inapp/c;->e(Ljava/lang/String;)Landroid/animation/TimeInterpolator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;->Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$a;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$a;->a()Landroid/animation/TimeInterpolator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :cond_1
    return-object p0

    .line 40
    :sswitch_1
    const-string p0, "ease-in-out"

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    new-instance p0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 50
    .line 51
    invoke-direct {p0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 52
    .line 53
    .line 54
    return-object p0

    .line 55
    :sswitch_2
    const-string p0, "ease-out"

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_3

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    new-instance p0, Landroid/view/animation/DecelerateInterpolator;

    .line 65
    .line 66
    invoke-direct {p0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :sswitch_3
    const-string p0, "linear"

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_4

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    new-instance p0, Landroid/view/animation/LinearInterpolator;

    .line 80
    .line 81
    invoke-direct {p0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 82
    .line 83
    .line 84
    return-object p0

    .line 85
    :sswitch_4
    const-string p0, "ease-in"

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_5

    .line 92
    .line 93
    :goto_0
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;->Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$a;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$a;->a()Landroid/animation/TimeInterpolator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_5
    new-instance p0, Landroid/view/animation/AccelerateInterpolator;

    .line 101
    .line 102
    invoke-direct {p0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 103
    .line 104
    .line 105
    return-object p0

    .line 106
    nop

    .line 107
    :sswitch_data_0
    .sparse-switch
        -0x75215c9c -> :sswitch_4
        -0x41b970db -> :sswitch_3
        -0x2f0a1f11 -> :sswitch_2
        -0x15938a9b -> :sswitch_1
        0x7ff77ec2 -> :sswitch_0
    .end sparse-switch
.end method

.method private final d(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;
    .locals 0

    .line 1
    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    sparse-switch p1, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :sswitch_0
    const-string p1, "top-center"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->TOP_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 29
    .line 30
    return-object p0

    .line 31
    :sswitch_1
    const-string p1, "center-left"

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->LEFT_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 41
    .line 42
    return-object p0

    .line 43
    :sswitch_2
    const-string p1, "bottom-center"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 53
    .line 54
    return-object p0

    .line 55
    :sswitch_3
    const-string p1, "bottom-right"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_3

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 65
    .line 66
    return-object p0

    .line 67
    :sswitch_4
    const-string p1, "bottom-left"

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 77
    .line 78
    return-object p0

    .line 79
    :sswitch_5
    const-string p1, "top-left"

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_5

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->TOP_LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 89
    .line 90
    return-object p0

    .line 91
    :sswitch_6
    const-string p1, "center-right"

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_6

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_6
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->RIGHT_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 101
    .line 102
    return-object p0

    .line 103
    :sswitch_7
    const-string p1, "top-right"

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-nez p0, :cond_7

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->TOP_RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 113
    .line 114
    return-object p0

    .line 115
    :sswitch_8
    const-string p1, "center"

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-nez p0, :cond_8

    .line 122
    .line 123
    :goto_0
    const/4 p0, 0x0

    .line 124
    return-object p0

    .line 125
    :cond_8
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 126
    .line 127
    return-object p0

    .line 128
    nop

    .line 129
    :sswitch_data_0
    .sparse-switch
        -0x514d33ab -> :sswitch_8
        -0x4e5f7c5c -> :sswitch_7
        -0x43e2b15c -> :sswitch_6
        -0x3c587281 -> :sswitch_5
        -0x27103597 -> :sswitch_4
        0x455fe3fa -> :sswitch_3
        0x4ccee637 -> :sswitch_2
        0x60e5627f -> :sswitch_1
        0x68a23bcd -> :sswitch_0
    .end sparse-switch
.end method

.method private final e(Ljava/lang/String;)Landroid/animation/TimeInterpolator;
    .locals 6

    .line 1
    const-string p0, ","

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v4, 0x6

    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    move-object v0, p1

    .line 12
    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZIILjava/lang/Object;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Iterable;

    .line 17
    .line 18
    new-instance p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Lkotlin/text/StringsKt;->Z0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lkotlin/text/c;->n(Ljava/lang/String;)Ljava/lang/Float;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    const/4 v0, 0x4

    .line 62
    const/4 v1, 0x0

    .line 63
    if-eq p0, v0, :cond_2

    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_2
    :try_start_0
    new-instance p0, Landroid/view/animation/PathInterpolator;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ljava/lang/Number;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/4 v2, 0x1

    .line 80
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ljava/lang/Number;

    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    const/4 v3, 0x2

    .line 91
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ljava/lang/Number;

    .line 96
    .line 97
    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    const/4 v4, 0x3

    .line 102
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Ljava/lang/Number;

    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    invoke-direct {p0, v0, v2, v3, p1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    .line 115
    return-object p0

    .line 116
    :catch_0
    return-object v1
.end method

.method private final f(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1

    .line 1
    invoke-static {p1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    :try_start_0
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return-object p0

    .line 18
    :catch_0
    return-object v0
.end method


# virtual methods
.method public final a(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;Ll/m960;Ll/axl;)Lcom/clevertap/android/sdk/inapp/pipsdk/a;
    .locals 36
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/m960;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    move-object/from16 v1, p3

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->y()Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v2, "PIPConfigFactory"

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "No pip config JSON found"

    .line 22
    .line 23
    invoke-interface {v1, v2, v0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_0
    const/4 v4, 0x1

    .line 28
    move-object/from16 v5, p1

    .line 29
    .line 30
    invoke-virtual {v5, v4}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->q(I)Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    if-eqz v6, :cond_1

    .line 35
    .line 36
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->c()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    invoke-static {v7}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    if-eqz v7, :cond_2

    .line 45
    .line 46
    :cond_1
    move-object/from16 p0, v3

    .line 47
    .line 48
    goto/16 :goto_15

    .line 49
    .line 50
    :cond_2
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->h()Z

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    if-eqz v7, :cond_3

    .line 55
    .line 56
    sget-object v7, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;->VIDEO:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 57
    .line 58
    :goto_0
    move-object v10, v7

    .line 59
    goto :goto_1

    .line 60
    :cond_3
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->f()Z

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    if-eqz v7, :cond_4

    .line 65
    .line 66
    sget-object v7, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;->GIF:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->g()Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-eqz v7, :cond_1a

    .line 74
    .line 75
    sget-object v7, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;->IMAGE:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :goto_1
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->a()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-static {v7}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-nez v8, :cond_5

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_5
    move-object v7, v3

    .line 90
    :goto_2
    const-string v8, ""

    .line 91
    .line 92
    if-nez v7, :cond_6

    .line 93
    .line 94
    move-object v12, v8

    .line 95
    goto :goto_3

    .line 96
    :cond_6
    move-object v12, v7

    .line 97
    :goto_3
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->s()Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    const-string v9, "media"

    .line 102
    .line 103
    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    if-eqz v7, :cond_7

    .line 108
    .line 109
    const-string v9, "fallback_url"

    .line 110
    .line 111
    invoke-virtual {v7, v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    if-eqz v7, :cond_7

    .line 116
    .line 117
    invoke-static {v7}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v9

    .line 121
    if-nez v9, :cond_7

    .line 122
    .line 123
    move-object v11, v7

    .line 124
    goto :goto_4

    .line 125
    :cond_7
    move-object v11, v3

    .line 126
    :goto_4
    const-string v7, "position"

    .line 127
    .line 128
    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    invoke-static {v7}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v9

    .line 139
    if-nez v9, :cond_8

    .line 140
    .line 141
    goto :goto_5

    .line 142
    :cond_8
    move-object v7, v3

    .line 143
    :goto_5
    if-eqz v7, :cond_9

    .line 144
    .line 145
    sget-object v9, Lcom/clevertap/android/sdk/inapp/c;->INSTANCE:Lcom/clevertap/android/sdk/inapp/c;

    .line 146
    .line 147
    invoke-direct {v9, v7}, Lcom/clevertap/android/sdk/inapp/c;->d(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    if-eqz v7, :cond_9

    .line 152
    .line 153
    :goto_6
    move-object/from16 v18, v7

    .line 154
    .line 155
    goto :goto_7

    .line 156
    :cond_9
    sget-object v7, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 157
    .line 158
    goto :goto_6

    .line 159
    :goto_7
    const-string v7, "margins"

    .line 160
    .line 161
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    const/4 v9, 0x3

    .line 166
    if-eqz v7, :cond_a

    .line 167
    .line 168
    const-string v13, "vertical"

    .line 169
    .line 170
    invoke-virtual {v7, v13, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 171
    .line 172
    .line 173
    move-result v13

    .line 174
    move/from16 v20, v13

    .line 175
    .line 176
    goto :goto_8

    .line 177
    :cond_a
    move/from16 v20, v9

    .line 178
    .line 179
    :goto_8
    if-eqz v7, :cond_b

    .line 180
    .line 181
    const-string v13, "horizontal"

    .line 182
    .line 183
    invoke-virtual {v7, v13, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 184
    .line 185
    .line 186
    move-result v9

    .line 187
    :cond_b
    move/from16 v19, v9

    .line 188
    .line 189
    const/16 v7, 0x23

    .line 190
    .line 191
    const-string v9, "width"

    .line 192
    .line 193
    invoke-virtual {v0, v9, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 194
    .line 195
    .line 196
    move-result v13

    .line 197
    const-string v7, "aspectRatio"

    .line 198
    .line 199
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 200
    .line 201
    .line 202
    move-result-object v7

    .line 203
    const-wide/16 v16, 0x0

    .line 204
    .line 205
    const-wide/high16 v14, 0x4030000000000000L    # 16.0

    .line 206
    .line 207
    move-object/from16 p0, v3

    .line 208
    .line 209
    if-eqz v7, :cond_d

    .line 210
    .line 211
    const-string v3, "numerator"

    .line 212
    .line 213
    invoke-virtual {v7, v3, v14, v15}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 214
    .line 215
    .line 216
    move-result-wide v21

    .line 217
    invoke-static/range {v21 .. v22}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    .line 222
    .line 223
    .line 224
    move-result-wide v21

    .line 225
    cmpl-double v21, v21, v16

    .line 226
    .line 227
    if-lez v21, :cond_c

    .line 228
    .line 229
    goto :goto_9

    .line 230
    :cond_c
    move-object/from16 v3, p0

    .line 231
    .line 232
    :goto_9
    if-eqz v3, :cond_d

    .line 233
    .line 234
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 235
    .line 236
    .line 237
    move-result-wide v14

    .line 238
    :cond_d
    const-wide/high16 v4, 0x4022000000000000L    # 9.0

    .line 239
    .line 240
    if-eqz v7, :cond_f

    .line 241
    .line 242
    const-string v3, "denominator"

    .line 243
    .line 244
    invoke-virtual {v7, v3, v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 245
    .line 246
    .line 247
    move-result-wide v22

    .line 248
    invoke-static/range {v22 .. v23}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    .line 253
    .line 254
    .line 255
    move-result-wide v22

    .line 256
    cmpl-double v7, v22, v16

    .line 257
    .line 258
    if-lez v7, :cond_e

    .line 259
    .line 260
    goto :goto_a

    .line 261
    :cond_e
    move-object/from16 v3, p0

    .line 262
    .line 263
    :goto_a
    if-eqz v3, :cond_f

    .line 264
    .line 265
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 266
    .line 267
    .line 268
    move-result-wide v4

    .line 269
    :cond_f
    move-wide/from16 v16, v4

    .line 270
    .line 271
    const-string v3, "controls"

    .line 272
    .line 273
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    if-eqz v3, :cond_10

    .line 278
    .line 279
    const-string v4, "drag"

    .line 280
    .line 281
    const/4 v5, 0x1

    .line 282
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 283
    .line 284
    .line 285
    move-result v4

    .line 286
    move/from16 v24, v4

    .line 287
    .line 288
    goto :goto_b

    .line 289
    :cond_10
    const/4 v5, 0x1

    .line 290
    move/from16 v24, v5

    .line 291
    .line 292
    :goto_b
    if-eqz v3, :cond_11

    .line 293
    .line 294
    const-string v4, "playPause"

    .line 295
    .line 296
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    move/from16 v25, v4

    .line 301
    .line 302
    goto :goto_c

    .line 303
    :cond_11
    move/from16 v25, v5

    .line 304
    .line 305
    :goto_c
    if-eqz v3, :cond_12

    .line 306
    .line 307
    const-string v4, "mute"

    .line 308
    .line 309
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    move/from16 v26, v4

    .line 314
    .line 315
    goto :goto_d

    .line 316
    :cond_12
    move/from16 v26, v5

    .line 317
    .line 318
    :goto_d
    if-eqz v3, :cond_13

    .line 319
    .line 320
    const-string v4, "expandCollapse"

    .line 321
    .line 322
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 323
    .line 324
    .line 325
    move-result v21

    .line 326
    move/from16 v27, v21

    .line 327
    .line 328
    goto :goto_e

    .line 329
    :cond_13
    const/16 v27, 0x1

    .line 330
    .line 331
    :goto_e
    const-string v4, "animation"

    .line 332
    .line 333
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    if-eqz v4, :cond_15

    .line 338
    .line 339
    sget-object v5, Lcom/clevertap/android/sdk/inapp/c;->INSTANCE:Lcom/clevertap/android/sdk/inapp/c;

    .line 340
    .line 341
    invoke-direct {v5, v4}, Lcom/clevertap/android/sdk/inapp/c;->b(Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    if-nez v4, :cond_14

    .line 346
    .line 347
    goto :goto_f

    .line 348
    :cond_14
    move-object/from16 v21, v4

    .line 349
    .line 350
    goto :goto_10

    .line 351
    :cond_15
    :goto_f
    new-instance v28, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 352
    .line 353
    const/16 v34, 0xf

    .line 354
    .line 355
    const/16 v35, 0x0

    .line 356
    .line 357
    const/16 v29, 0x0

    .line 358
    .line 359
    const-wide/16 v30, 0x0

    .line 360
    .line 361
    const/16 v32, 0x0

    .line 362
    .line 363
    const/16 v33, 0x0

    .line 364
    .line 365
    invoke-direct/range {v28 .. v35}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;JLandroid/animation/TimeInterpolator;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 366
    .line 367
    .line 368
    move-object/from16 v21, v28

    .line 369
    .line 370
    :goto_10
    const-string v4, "onClick"

    .line 371
    .line 372
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 373
    .line 374
    .line 375
    move-result-object v4

    .line 376
    if-eqz v4, :cond_16

    .line 377
    .line 378
    sget-object v5, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->CREATOR:Lcom/clevertap/android/sdk/inapp/CTInAppAction$a;

    .line 379
    .line 380
    invoke-virtual {v5, v4}, Lcom/clevertap/android/sdk/inapp/CTInAppAction$a;->b(Lorg/json/JSONObject;)Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    if-eqz v4, :cond_16

    .line 385
    .line 386
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/inapp/CTInAppAction;->g()Lcom/clevertap/android/sdk/inapp/InAppActionType;

    .line 387
    .line 388
    .line 389
    move-result-object v5

    .line 390
    if-eqz v5, :cond_16

    .line 391
    .line 392
    move-object/from16 v22, v4

    .line 393
    .line 394
    goto :goto_11

    .line 395
    :cond_16
    move-object/from16 v22, p0

    .line 396
    .line 397
    :goto_11
    const-string v4, "cornerRadius"

    .line 398
    .line 399
    const/4 v5, 0x0

    .line 400
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 401
    .line 402
    .line 403
    move-result v28

    .line 404
    const-string v4, "border"

    .line 405
    .line 406
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    if-eqz v0, :cond_17

    .line 411
    .line 412
    const-string v4, "enabled"

    .line 413
    .line 414
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 415
    .line 416
    .line 417
    move-result v4

    .line 418
    move/from16 v29, v4

    .line 419
    .line 420
    goto :goto_12

    .line 421
    :cond_17
    move/from16 v29, v5

    .line 422
    .line 423
    :goto_12
    if-eqz v0, :cond_18

    .line 424
    .line 425
    const-string v4, "color"

    .line 426
    .line 427
    invoke-virtual {v0, v4, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v4

    .line 431
    if-eqz v4, :cond_18

    .line 432
    .line 433
    sget-object v7, Lcom/clevertap/android/sdk/inapp/c;->INSTANCE:Lcom/clevertap/android/sdk/inapp/c;

    .line 434
    .line 435
    invoke-direct {v7, v4}, Lcom/clevertap/android/sdk/inapp/c;->f(Ljava/lang/String;)Ljava/lang/Integer;

    .line 436
    .line 437
    .line 438
    move-result-object v4

    .line 439
    if-eqz v4, :cond_18

    .line 440
    .line 441
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 442
    .line 443
    .line 444
    move-result v4

    .line 445
    :goto_13
    move/from16 v30, v4

    .line 446
    .line 447
    goto :goto_14

    .line 448
    :cond_18
    const/high16 v4, -0x1000000

    .line 449
    .line 450
    goto :goto_13

    .line 451
    :goto_14
    if-eqz v0, :cond_19

    .line 452
    .line 453
    invoke-virtual {v0, v9, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 454
    .line 455
    .line 456
    move-result v5

    .line 457
    :cond_19
    move/from16 v31, v5

    .line 458
    .line 459
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->s()Lorg/json/JSONObject;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    const-string v4, "close"

    .line 464
    .line 465
    const/4 v3, 0x1

    .line 466
    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 467
    .line 468
    .line 469
    move-result v23

    .line 470
    :try_start_0
    new-instance v8, Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 471
    .line 472
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->c()Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v9

    .line 476
    move-object/from16 v32, p2

    .line 477
    .line 478
    invoke-direct/range {v8 .. v32}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;-><init>(Ljava/lang/String;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Ljava/lang/String;Ljava/lang/String;IDDLcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;IILcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;Lcom/clevertap/android/sdk/inapp/CTInAppAction;ZZZZZIZIILl/m960;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 479
    .line 480
    .line 481
    return-object v8

    .line 482
    :catch_0
    move-exception v0

    .line 483
    new-instance v3, Ljava/lang/StringBuilder;

    .line 484
    .line 485
    const-string v4, "Failed to build PIPConfig: "

    .line 486
    .line 487
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 488
    .line 489
    .line 490
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 495
    .line 496
    .line 497
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 498
    .line 499
    .line 500
    move-result-object v0

    .line 501
    invoke-interface {v1, v2, v0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    return-object p0

    .line 505
    :cond_1a
    move-object/from16 p0, v3

    .line 506
    .line 507
    new-instance v0, Ljava/lang/StringBuilder;

    .line 508
    .line 509
    const-string v3, "Unsupported media type: "

    .line 510
    .line 511
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->b()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v3

    .line 518
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    invoke-interface {v1, v2, v0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    return-object p0

    .line 529
    :goto_15
    const-string v0, "No media found for PIP"

    .line 530
    .line 531
    invoke-interface {v1, v2, v0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    .line 533
    .line 534
    return-object p0
.end method
