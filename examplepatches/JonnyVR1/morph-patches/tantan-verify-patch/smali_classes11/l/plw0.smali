.class public final Ll/plw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:I = 0x4000000

.field public static final b:Landroid/content/ClipData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    invoke-static {v1, v0}, Landroid/content/ClipData;->newIntent(Ljava/lang/CharSequence;Landroid/content/Intent;)Landroid/content/ClipData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/plw0;->b:Landroid/content/ClipData;

    .line 13
    .line 14
    return-void
.end method

.method public static a(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    const/high16 p1, 0xc000000

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-static {p2, p1, p3}, Ll/plw0;->c(Landroid/content/Intent;II)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-static {p0, p3, p2, p1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static b(Landroid/content/Context;ILandroid/content/Intent;II)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p2, p3, p1}, Ll/plw0;->c(Landroid/content/Intent;II)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    invoke-static {p0, p1, p2, p3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static c(Landroid/content/Intent;II)Landroid/content/Intent;
    .locals 7

    .line 1
    and-int/lit8 p2, p1, 0x58

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    move p2, v0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p2, v1

    .line 10
    :goto_0
    const-string v2, "Cannot set any dangerous parts of intent to be mutable."

    .line 11
    .line 12
    invoke-static {p2, v2}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    and-int/lit8 p2, p1, 0x1

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/plw0;->d(II)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_2

    .line 25
    .line 26
    :cond_1
    move p2, v0

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    move p2, v1

    .line 29
    :goto_1
    const-string v3, "Cannot use Intent.FILL_IN_ACTION unless the action is marked as mutable."

    .line 30
    .line 31
    invoke-static {p2, v3}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    and-int/lit8 p2, p1, 0x2

    .line 35
    .line 36
    const/4 v3, 0x5

    .line 37
    if-eqz p2, :cond_3

    .line 38
    .line 39
    invoke-static {v1, v3}, Ll/plw0;->d(II)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_4

    .line 44
    .line 45
    :cond_3
    move p2, v0

    .line 46
    goto :goto_2

    .line 47
    :cond_4
    move p2, v1

    .line 48
    :goto_2
    const-string v4, "Cannot use Intent.FILL_IN_DATA unless the data is marked as mutable."

    .line 49
    .line 50
    invoke-static {p2, v4}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    and-int/lit8 p2, p1, 0x4

    .line 54
    .line 55
    const/16 v4, 0x9

    .line 56
    .line 57
    if-eqz p2, :cond_5

    .line 58
    .line 59
    invoke-static {v1, v4}, Ll/plw0;->d(II)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_6

    .line 64
    .line 65
    :cond_5
    move p2, v0

    .line 66
    goto :goto_3

    .line 67
    :cond_6
    move p2, v1

    .line 68
    :goto_3
    const-string v5, "Cannot use Intent.FILL_IN_CATEGORIES unless the category is marked as mutable."

    .line 69
    .line 70
    invoke-static {p2, v5}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    and-int/lit16 p2, p1, 0x80

    .line 74
    .line 75
    const/16 v5, 0x11

    .line 76
    .line 77
    if-eqz p2, :cond_7

    .line 78
    .line 79
    invoke-static {v1, v5}, Ll/plw0;->d(II)Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_8

    .line 84
    .line 85
    :cond_7
    move p2, v0

    .line 86
    goto :goto_4

    .line 87
    :cond_8
    move p2, v1

    .line 88
    :goto_4
    const-string v6, "Cannot use Intent.FILL_IN_CLIP_DATA unless the clip data is marked as mutable."

    .line 89
    .line 90
    invoke-static {p2, v6}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    if-eqz p2, :cond_9

    .line 98
    .line 99
    move p2, v0

    .line 100
    goto :goto_5

    .line 101
    :cond_9
    move p2, v1

    .line 102
    :goto_5
    const-string v6, "Must set component on Intent."

    .line 103
    .line 104
    invoke-static {p2, v6}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v1, v0}, Ll/plw0;->d(II)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    const/high16 v6, 0x4000000

    .line 112
    .line 113
    if-eqz p2, :cond_a

    .line 114
    .line 115
    invoke-static {p1, v6}, Ll/plw0;->d(II)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    xor-int/2addr p2, v0

    .line 120
    const-string v0, "Cannot set mutability flags if PendingIntent.FLAG_IMMUTABLE is set."

    .line 121
    .line 122
    invoke-static {p2, v0}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    goto :goto_6

    .line 126
    :cond_a
    invoke-static {p1, v6}, Ll/plw0;->d(II)Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    const-string v0, "Must set PendingIntent.FLAG_IMMUTABLE for SDK >= 23 if no parts of intent are mutable."

    .line 131
    .line 132
    invoke-static {p2, v0}, Ll/tow0;->f(ZLjava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    :goto_6
    new-instance p2, Landroid/content/Intent;

    .line 136
    .line 137
    invoke-direct {p2, p0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p1, v6}, Ll/plw0;->d(II)Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-nez p0, :cond_f

    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    if-nez p0, :cond_b

    .line 151
    .line 152
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p2, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 161
    .line 162
    .line 163
    :cond_b
    invoke-static {v1, v2}, Ll/plw0;->d(II)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    const-string p1, ""

    .line 168
    .line 169
    if-nez p0, :cond_c

    .line 170
    .line 171
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    if-nez p0, :cond_c

    .line 176
    .line 177
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 178
    .line 179
    .line 180
    :cond_c
    invoke-static {v1, v4}, Ll/plw0;->d(II)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-nez p0, :cond_d

    .line 185
    .line 186
    invoke-virtual {p2}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    if-nez p0, :cond_d

    .line 191
    .line 192
    invoke-virtual {p2, p1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 193
    .line 194
    .line 195
    :cond_d
    invoke-static {v1, v3}, Ll/plw0;->d(II)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-nez p0, :cond_e

    .line 200
    .line 201
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    if-nez p0, :cond_e

    .line 206
    .line 207
    sget-object p0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 208
    .line 209
    const-string p1, "*/*"

    .line 210
    .line 211
    invoke-virtual {p2, p0, p1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 212
    .line 213
    .line 214
    :cond_e
    invoke-static {v1, v5}, Ll/plw0;->d(II)Z

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    if-nez p0, :cond_f

    .line 219
    .line 220
    invoke-virtual {p2}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    if-nez p0, :cond_f

    .line 225
    .line 226
    sget-object p0, Ll/plw0;->b:Landroid/content/ClipData;

    .line 227
    .line 228
    invoke-virtual {p2, p0}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    .line 229
    .line 230
    .line 231
    :cond_f
    return-object p2
.end method

.method public static d(II)Z
    .locals 0

    .line 1
    and-int/2addr p0, p1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method
