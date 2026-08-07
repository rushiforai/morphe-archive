.class public Ll/zq90$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zq90;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/zq90;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Z

.field public k:Lcom/p1/mobile/putong/data/User;

.field public l:I

.field public m:Lcom/p1/mobile/putong/data/RelationshipStatus;

.field public n:Z

.field public o:Lcom/p1/mobile/putong/core/data/LikedUser;


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/zq90$a;->d:I

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Ll/zq90$a;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/zq90$a;->g:Z

    .line 12
    .line 13
    iput-object v1, p0, Ll/zq90$a;->h:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/zq90$a;->i:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/zq90$a;->j:Z

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    iput v1, p0, Ll/zq90$a;->l:I

    .line 24
    .line 25
    const-string v1, "unknown_"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Ll/zq90$a;->m:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 32
    .line 33
    iput-boolean v0, p0, Ll/zq90$a;->n:Z

    .line 34
    .line 35
    iput-object p1, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "init arguments : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[core][profile]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "user_id"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "from"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/zq90$a;->b:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 41
    .line 42
    iget-object v2, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v2, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "live_room_info"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, v1, Ll/zq90;->c:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v0, p0, Ll/zq90$a;->b:Ljava/lang/String;

    .line 57
    .line 58
    const-string v1, "preview_card"

    .line 59
    .line 60
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v2, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 65
    .line 66
    const-string v3, "preview_user_info"

    .line 67
    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    invoke-virtual {v2, v0}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v4, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 85
    .line 86
    invoke-interface {v0, v4}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v2, v0}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 91
    .line 92
    .line 93
    :goto_0
    const-string v0, "show_buttons"

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput-boolean v0, p0, Ll/zq90$a;->f:Z

    .line 100
    .line 101
    const-string v0, "pushReason"

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    iput v0, p0, Ll/zq90$a;->d:I

    .line 108
    .line 109
    const-string v0, "pushTag"

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Ll/zq90$a;->e:Ljava/lang/String;

    .line 116
    .line 117
    const-string v0, "long_time_no_see"

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput-boolean v0, p0, Ll/zq90$a;->n:Z

    .line 124
    .line 125
    const-string v0, "pic_index"

    .line 126
    .line 127
    const/4 v2, -0x1

    .line 128
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iput v0, p0, Ll/zq90$a;->l:I

    .line 133
    .line 134
    const-string v0, "relationship_status"

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Ll/zq90$a;->m:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 145
    .line 146
    const-string v0, "live_profile_voice_mask_mode"

    .line 147
    .line 148
    iget-object v2, p0, Ll/zq90$a;->b:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    xor-int/lit8 v0, v0, 0x1

    .line 155
    .line 156
    iput-boolean v0, p0, Ll/zq90$a;->g:Z

    .line 157
    .line 158
    const-string v0, "profile_like_id"

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Ll/zq90$a;->h:Ljava/lang/String;

    .line 165
    .line 166
    const-string v0, "canShowFollowButton"

    .line 167
    .line 168
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    iput-boolean v0, p0, Ll/zq90$a;->i:Z

    .line 173
    .line 174
    const-string v0, "from_gp_live"

    .line 175
    .line 176
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    iput-boolean v0, p0, Ll/zq90$a;->j:Z

    .line 181
    .line 182
    iget-object v0, p0, Ll/zq90$a;->b:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_1

    .line 189
    .line 190
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 195
    .line 196
    iput-object v0, p0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 197
    .line 198
    :cond_1
    iget-object v0, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 199
    .line 200
    invoke-virtual {v0}, Ll/zq90;->B()Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_2

    .line 205
    .line 206
    iget-object v0, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 207
    .line 208
    invoke-virtual {v0}, Ll/zq90;->r()Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-nez v0, :cond_2

    .line 213
    .line 214
    iget-object v0, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 215
    .line 216
    invoke-virtual {v0}, Ll/zq90;->v()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-nez v0, :cond_2

    .line 221
    .line 222
    iget-object v0, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 223
    .line 224
    invoke-virtual {v0}, Ll/zq90;->w()Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-eqz v0, :cond_4

    .line 229
    .line 230
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 231
    .line 232
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 233
    .line 234
    iget-object v1, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v0, v1}, Ll/xf9;->C3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    const-string v1, "liked_user"

    .line 245
    .line 246
    if-eqz v0, :cond_3

    .line 247
    .line 248
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 249
    .line 250
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 251
    .line 252
    iget-object v2, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v0, v2}, Ll/xf9;->C3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    iput-object v0, p0, Ll/zq90$a;->o:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 259
    .line 260
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 261
    .line 262
    .line 263
    goto :goto_1

    .line 264
    :cond_3
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v0

    .line 272
    if-eqz v0, :cond_4

    .line 273
    .line 274
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    check-cast v0, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 279
    .line 280
    iput-object v0, p0, Ll/zq90$a;->o:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 281
    .line 282
    :cond_4
    :goto_1
    invoke-virtual {p0, p1}, Ll/zq90$a;->b(Landroid/os/Bundle;)V

    .line 283
    .line 284
    .line 285
    return-void
.end method

.method public final b(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "saved_user"

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {v0, v2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    move-object v0, p1

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 v0, 0x0

    .line 52
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/tl9;->b()Ll/skk0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object v0, p1, Ll/skk0;->c:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/tl9;->b()Ll/skk0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object v0, p1, Ll/skk0;->d:Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/tl9;->b()Ll/skk0;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object v0, p1, Ll/skk0;->e:Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    iget-object p1, p0, Ll/zq90$a;->a:Ll/zq90;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/zq90;->o()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    sget-object p1, Lcom/p1/mobile/putong/core/CoreBusinessModule;->g:Ll/tl9;

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/tl9;->b()Ll/skk0;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p0, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p0, p1, Ll/skk0;->b:Ljava/lang/String;

    .line 93
    .line 94
    :cond_2
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/zq90$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Ll/zq90$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Ll/zq90$a;->d:I

    .line 9
    .line 10
    iput-object v0, p0, Ll/zq90$a;->e:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean v1, p0, Ll/zq90$a;->f:Z

    .line 13
    .line 14
    iput-boolean v1, p0, Ll/zq90$a;->g:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    iput v2, p0, Ll/zq90$a;->l:I

    .line 21
    .line 22
    const-string v2, "unknown_"

    .line 23
    .line 24
    invoke-static {v2}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iput-object v2, p0, Ll/zq90$a;->m:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 29
    .line 30
    iput-boolean v1, p0, Ll/zq90$a;->n:Z

    .line 31
    .line 32
    iput-object v0, p0, Ll/zq90$a;->o:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 33
    .line 34
    return-void
.end method
