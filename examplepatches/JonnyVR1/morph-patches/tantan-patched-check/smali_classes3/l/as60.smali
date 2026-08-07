.class public Ll/as60;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/as60$a;
    }
.end annotation


# static fields
.field public static final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/as60$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/as60;->c:Ljava/util/Map;

    .line 7
    .line 8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/16 v2, 0x1d

    .line 11
    .line 12
    const-string v3, "android.permission.ACCESS_COARSE_LOCATION"

    .line 13
    .line 14
    const-string v4, "android.permission.ACCESS_FINE_LOCATION"

    .line 15
    .line 16
    if-lt v1, v2, :cond_0

    .line 17
    .line 18
    const-string v2, "android.permission.ACCESS_BACKGROUND_LOCATION"

    .line 19
    .line 20
    filled-new-array {v4, v3, v2}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    filled-new-array {v4, v3}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    :goto_0
    new-instance v3, Ll/as60$a;

    .line 38
    .line 39
    sget v4, Ll/cbc0;->Y:I

    .line 40
    .line 41
    sget v5, Lcom/p1/mobile/putong/common/R$string;->p1:I

    .line 42
    .line 43
    sget v6, Lcom/p1/mobile/putong/common/R$string;->o1:I

    .line 44
    .line 45
    const/4 v7, 0x0

    .line 46
    invoke-direct {v3, v4, v5, v6, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string v2, "android.permission.READ_CONTACTS"

    .line 53
    .line 54
    filled-new-array {v2}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    new-instance v3, Ll/as60$a;

    .line 63
    .line 64
    sget v4, Ll/cbc0;->Y:I

    .line 65
    .line 66
    sget v5, Lcom/p1/mobile/putong/common/R$string;->j1:I

    .line 67
    .line 68
    sget v6, Lcom/p1/mobile/putong/common/R$string;->i1:I

    .line 69
    .line 70
    invoke-direct {v3, v4, v5, v6, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 71
    .line 72
    .line 73
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    const-string v2, "android.permission.CAMERA"

    .line 77
    .line 78
    filled-new-array {v2}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    new-instance v3, Ll/as60$a;

    .line 87
    .line 88
    sget v4, Ll/cbc0;->Y:I

    .line 89
    .line 90
    sget v5, Lcom/p1/mobile/putong/common/R$string;->n1:I

    .line 91
    .line 92
    sget v6, Lcom/p1/mobile/putong/common/R$string;->m1:I

    .line 93
    .line 94
    invoke-direct {v3, v4, v5, v6, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 95
    .line 96
    .line 97
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    const/16 v2, 0x22

    .line 101
    .line 102
    const/16 v3, 0x21

    .line 103
    .line 104
    const-string v4, "android.permission.READ_MEDIA_VIDEO"

    .line 105
    .line 106
    const-string v5, "android.permission.READ_MEDIA_IMAGES"

    .line 107
    .line 108
    if-lt v1, v2, :cond_1

    .line 109
    .line 110
    const-string v2, "android.permission.READ_MEDIA_VISUAL_USER_SELECTED"

    .line 111
    .line 112
    filled-new-array {v5, v4, v2}, [Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    goto :goto_1

    .line 121
    :cond_1
    if-lt v1, v3, :cond_2

    .line 122
    .line 123
    filled-new-array {v5, v4}, [Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    goto :goto_1

    .line 132
    :cond_2
    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 133
    .line 134
    const-string v4, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 135
    .line 136
    filled-new-array {v2, v4}, [Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    :goto_1
    new-instance v4, Ll/as60$a;

    .line 145
    .line 146
    sget v5, Ll/cbc0;->Y:I

    .line 147
    .line 148
    sget v6, Lcom/p1/mobile/putong/common/R$string;->t1:I

    .line 149
    .line 150
    sget v8, Lcom/p1/mobile/putong/common/R$string;->s1:I

    .line 151
    .line 152
    invoke-direct {v4, v5, v6, v8, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 153
    .line 154
    .line 155
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    const-string v2, "android.permission.RECORD_AUDIO"

    .line 159
    .line 160
    filled-new-array {v2}, [Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    new-instance v4, Ll/as60$a;

    .line 169
    .line 170
    sget v5, Ll/cbc0;->Y:I

    .line 171
    .line 172
    sget v6, Lcom/p1/mobile/putong/common/R$string;->v1:I

    .line 173
    .line 174
    sget v8, Lcom/p1/mobile/putong/common/R$string;->u1:I

    .line 175
    .line 176
    invoke-direct {v4, v5, v6, v8, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 177
    .line 178
    .line 179
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    const-string v2, "android.permission.READ_PHONE_STATE"

    .line 183
    .line 184
    filled-new-array {v2}, [Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    new-instance v4, Ll/as60$a;

    .line 193
    .line 194
    sget v5, Ll/cbc0;->Y:I

    .line 195
    .line 196
    sget v6, Lcom/p1/mobile/putong/common/R$string;->r1:I

    .line 197
    .line 198
    sget v8, Lcom/p1/mobile/putong/common/R$string;->q1:I

    .line 199
    .line 200
    invoke-direct {v4, v5, v6, v8, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 201
    .line 202
    .line 203
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    const/16 v2, 0x1f

    .line 207
    .line 208
    if-lt v1, v2, :cond_3

    .line 209
    .line 210
    const-string v2, "android.permission.BLUETOOTH_CONNECT"

    .line 211
    .line 212
    filled-new-array {v2}, [Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    new-instance v4, Ll/as60$a;

    .line 221
    .line 222
    sget v5, Ll/cbc0;->Y:I

    .line 223
    .line 224
    sget v6, Lcom/p1/mobile/putong/common/R$string;->d0:I

    .line 225
    .line 226
    sget v8, Lcom/p1/mobile/putong/common/R$string;->c0:I

    .line 227
    .line 228
    invoke-direct {v4, v5, v6, v8, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 229
    .line 230
    .line 231
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    :cond_3
    const-string v2, "android.permission.READ_CALENDAR"

    .line 235
    .line 236
    const-string v4, "android.permission.WRITE_CALENDAR"

    .line 237
    .line 238
    filled-new-array {v2, v4}, [Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    new-instance v4, Ll/as60$a;

    .line 247
    .line 248
    sget v5, Ll/cbc0;->X:I

    .line 249
    .line 250
    sget v6, Lcom/p1/mobile/putong/common/R$string;->l1:I

    .line 251
    .line 252
    sget v8, Lcom/p1/mobile/putong/common/R$string;->k1:I

    .line 253
    .line 254
    invoke-direct {v4, v5, v6, v8, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 255
    .line 256
    .line 257
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    if-lt v1, v3, :cond_4

    .line 261
    .line 262
    const-string v1, "android.permission.POST_NOTIFICATIONS"

    .line 263
    .line 264
    filled-new-array {v1}, [Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    new-instance v2, Ll/as60$a;

    .line 273
    .line 274
    sget v3, Ll/cbc0;->Y:I

    .line 275
    .line 276
    sget v4, Lcom/p1/mobile/putong/common/R$string;->j0:I

    .line 277
    .line 278
    sget v5, Lcom/p1/mobile/putong/common/R$string;->i0:I

    .line 279
    .line 280
    invoke-direct {v2, v3, v4, v5, v7}, Ll/as60$a;-><init>(IIILl/bs60;)V

    .line 281
    .line 282
    .line 283
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    :cond_4
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/as60;->a:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/as60;Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/as60;->e(Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public final c(Landroid/content/Context;)Ll/as60$a;
    .locals 5

    .line 1
    iget-object p0, p0, Ll/as60;->a:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sget-object v2, Ll/as60;->c:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    new-instance v4, Ll/zr60;

    .line 37
    .line 38
    invoke-direct {v4, v1}, Ll/zr60;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v3, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ljava/util/List;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ll/as60$a;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_3
    return-object v0
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/as60;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->I()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/as60;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic e(Landroid/app/Activity;Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string p2, ""

    .line 9
    .line 10
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->u(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const p2, 0x7fffffff

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const/4 p2, 0x5

    .line 36
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->A(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ll/as60;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 45
    .line 46
    new-instance p2, Ll/b3m;

    .line 47
    .line 48
    const-string v0, "PermissionPushBubble"

    .line 49
    .line 50
    invoke-direct {p2, v0}, Ll/b3m;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/as60;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 57
    .line 58
    const p2, 0xc350

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ll/fqe0;->y(I)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p0, p0, Ll/as60;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public f(Landroid/app/Activity;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/as60;->b:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ll/as60;->c(Landroid/content/Context;)Ll/as60$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/jec0;->l:I

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v2, Ll/ycc0;->F:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lv/VIcon;

    .line 39
    .line 40
    iget v3, v0, Ll/as60$a;->a:I

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    sget v2, Ll/ycc0;->s0:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Lv/VText;

    .line 52
    .line 53
    iget v3, v0, Ll/as60$a;->b:I

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 56
    .line 57
    .line 58
    sget v2, Ll/ycc0;->x:I

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lv/VText;

    .line 65
    .line 66
    iget v0, v0, Ll/as60$a;->c:I

    .line 67
    .line 68
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/yr60;

    .line 72
    .line 73
    invoke-direct {v0, p0, p1, v1}, Ll/yr60;-><init>(Ll/as60;Landroid/app/Activity;Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    :goto_0
    return-void
.end method
