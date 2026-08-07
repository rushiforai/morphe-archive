.class public final Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Landroid/content/Context;

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/Boolean;

.field public e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public f:Ljava/lang/Boolean;

.field public g:Ljava/lang/Boolean;

.field public h:Ljava/lang/Boolean;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/Boolean;

.field public m:Landroid/os/Parcelable;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ljava/lang/Boolean;

.field public r:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "other"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->b:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Landroid/content/Intent;
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->b:Landroid/content/Context;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->c:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string v1, "extra_images"

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->c:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->d:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    const-string v1, "read_draft"

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->d:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->i:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    const-string v1, "extra_selected_folder_path"

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->i:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->h:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    const-string v1, "extra_show_only_photo"

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->h:Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->f:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    const-string v1, "extra_from_attend_btn"

    .line 79
    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->f:Ljava/lang/Boolean;

    .line 81
    .line 82
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->g:Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_5

    .line 92
    .line 93
    const-string v1, "extra_show_audio_input"

    .line 94
    .line 95
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->g:Ljava/lang/Boolean;

    .line 96
    .line 97
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->a:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_6

    .line 107
    .line 108
    const-string v1, "extra_from"

    .line 109
    .line 110
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->a:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->p:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_7

    .line 122
    .line 123
    const-string v1, "extra_group_hot_topics"

    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->p:Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 131
    .line 132
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_8

    .line 137
    .line 138
    const-string v1, "extra_topic"

    .line 139
    .line 140
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 141
    .line 142
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->j:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    const-string v1, "extra_moment_value"

    .line 154
    .line 155
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->j:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->k:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-eqz v1, :cond_a

    .line 167
    .line 168
    const-string v1, "extra_guide_type"

    .line 169
    .line 170
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->k:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 173
    .line 174
    .line 175
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->l:Ljava/lang/Boolean;

    .line 176
    .line 177
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_b

    .line 182
    .line 183
    const-string v1, "extra_from_photo_to_video"

    .line 184
    .line 185
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->l:Ljava/lang/Boolean;

    .line 186
    .line 187
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 188
    .line 189
    .line 190
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->m:Landroid/os/Parcelable;

    .line 191
    .line 192
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-eqz v1, :cond_c

    .line 197
    .line 198
    const-string v1, "extra_moment_share_info"

    .line 199
    .line 200
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->m:Landroid/os/Parcelable;

    .line 201
    .line 202
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 203
    .line 204
    .line 205
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->o:Ljava/lang/String;

    .line 206
    .line 207
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_d

    .line 212
    .line 213
    const-string v1, "EXTRA_EDIT_VIEW_HINT"

    .line 214
    .line 215
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->o:Ljava/lang/String;

    .line 216
    .line 217
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    .line 219
    .line 220
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->n:Ljava/lang/String;

    .line 221
    .line 222
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-eqz v1, :cond_e

    .line 227
    .line 228
    const-string v1, "groupId"

    .line 229
    .line 230
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->n:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 233
    .line 234
    .line 235
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->q:Ljava/lang/Boolean;

    .line 236
    .line 237
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_f

    .line 242
    .line 243
    const-string v1, "DIRECT_TO_TAKE_VIDEO_PAGE"

    .line 244
    .line 245
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->q:Ljava/lang/Boolean;

    .line 246
    .line 247
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 248
    .line 249
    .line 250
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->r:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    if-eqz v1, :cond_10

    .line 257
    .line 258
    const-string v1, "extra_at_user_id"

    .line 259
    .line 260
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->r:Ljava/lang/String;

    .line 261
    .line 262
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 263
    .line 264
    .line 265
    :cond_10
    return-object v0
.end method

.method public b(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "from_h5_moment_level_open_camera"

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->q:Ljava/lang/Boolean;

    .line 14
    .line 15
    :cond_0
    return-object p0
.end method

.method public d(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)",
            "Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->f:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public h(Landroid/os/Parcelable;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->m:Landroid/os/Parcelable;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->l:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public j(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->d:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public k(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->h:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    return-object p0
.end method
