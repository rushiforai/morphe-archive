.class public Ll/kj6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/kj6;


# instance fields
.field public a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/kj6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kj6;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/kj6;->b:Ll/kj6;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/kj6;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static d(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "#4d4d4d"

    .line 8
    .line 9
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/c9c0;->s1:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    :goto_0
    invoke-static {p0, v0}, Ll/kj6;->f(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static f(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;
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
    new-instance v0, Landroid/text/SpannableString;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/16 p1, 0x21

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, v2, p0, p1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_0
    return-object p0
.end method

.method public static g()Ll/kj6;
    .locals 1

    .line 1
    sget-object v0, Ll/kj6;->b:Ll/kj6;

    .line 2
    .line 3
    return-object v0
.end method

.method public static k(Ll/sj6;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "fake_conversation_local_summary_marriage_conversation"

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static m(Ll/sj6;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/core/R$string;->M1:I

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->N1:I

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    iget-object p0, p0, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v1, Ll/c9c0;->I:I

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-static {v0, p0}, Ll/kj6;->f(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method


# virtual methods
.method public final a(J)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/kj6;->a:Z

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/c0;->k(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final b(Ljava/lang/CharSequence;Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    return-object p1
.end method

.method public final c(Ljava/lang/CharSequence;Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    return-object p1
.end method

.method public h(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/kj6;->a:Z

    .line 3
    .line 4
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 5
    .line 6
    invoke-static {p2, v1}, Ll/e1b;->I0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const-string v3, ""

    .line 15
    .line 16
    if-eqz v2, :cond_3

    .line 17
    .line 18
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    const-string v4, "moment_user_state"

    .line 29
    .line 30
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_3

    .line 35
    .line 36
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 37
    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_3

    .line 45
    .line 46
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_3

    .line 51
    .line 52
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/StateData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 53
    .line 54
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 55
    .line 56
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v2, v4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/p1/mobile/putong/core/data/StateData;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catch_0
    const/4 v2, 0x0

    .line 66
    :goto_0
    if-eqz v2, :cond_1

    .line 67
    .line 68
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/StateData;->sourceFlag:Ljava/lang/String;

    .line 69
    .line 70
    const-string v5, "chatPartners"

    .line 71
    .line 72
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-nez v4, :cond_3

    .line 77
    .line 78
    :cond_1
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 85
    .line 86
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 87
    .line 88
    const/4 v5, 0x1

    .line 89
    if-lt v4, v5, :cond_2

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-interface {v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-eqz v4, :cond_2

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-interface {v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    iget-object v4, v4, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 114
    .line 115
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StateData;->emotionId:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v4, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_2

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_2
    move-object v1, v3

    .line 127
    :cond_3
    :goto_1
    instance-of v2, v1, Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v2, :cond_4

    .line 130
    .line 131
    invoke-static {v1}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    :cond_4
    invoke-virtual {p0, v1, p1, p2}, Ll/kj6;->b(Ljava/lang/CharSequence;Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-nez v4, :cond_5

    .line 144
    .line 145
    invoke-static {v2}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    :cond_5
    invoke-virtual {p0, v1, p1, p2}, Ll/kj6;->c(Ljava/lang/CharSequence;Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-nez v4, :cond_6

    .line 158
    .line 159
    invoke-static {v2}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    :cond_6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_7

    .line 168
    .line 169
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-eqz v2, :cond_7

    .line 176
    .line 177
    instance-of v2, v1, Landroid/text/SpannableStringBuilder;

    .line 178
    .line 179
    if-nez v2, :cond_7

    .line 180
    .line 181
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    const-string v2, "\n"

    .line 186
    .line 187
    const-string v4, "<br/>"

    .line 188
    .line 189
    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-static {v1}, Ll/kj6;->d(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-static {v1}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    :cond_7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    if-eqz v2, :cond_a

    .line 206
    .line 207
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    if-eqz v2, :cond_a

    .line 212
    .line 213
    iget-wide v4, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 214
    .line 215
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 216
    .line 217
    iget-wide v6, v2, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 218
    .line 219
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    .line 220
    .line 221
    .line 222
    move-result-wide v6

    .line 223
    cmpl-double v2, v4, v6

    .line 224
    .line 225
    if-nez v2, :cond_a

    .line 226
    .line 227
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 228
    .line 229
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 230
    .line 231
    const-string v4, "male"

    .line 232
    .line 233
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    if-eqz v2, :cond_a

    .line 238
    .line 239
    iget-object v2, p1, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 240
    .line 241
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 242
    .line 243
    const-string v5, "female"

    .line 244
    .line 245
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v2

    .line 249
    if-eqz v2, :cond_a

    .line 250
    .line 251
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 252
    .line 253
    const-string v6, "moment_comment"

    .line 254
    .line 255
    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    if-nez v2, :cond_8

    .line 260
    .line 261
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 262
    .line 263
    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    if-nez v2, :cond_a

    .line 268
    .line 269
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 270
    .line 271
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 272
    .line 273
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    if-eqz v2, :cond_a

    .line 278
    .line 279
    iget-object v2, p1, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 280
    .line 281
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 282
    .line 283
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    if-eqz v2, :cond_a

    .line 288
    .line 289
    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    const-string v2, "\u2190 "

    .line 292
    .line 293
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    iget-object v2, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 297
    .line 298
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 299
    .line 300
    iget-wide v4, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 301
    .line 302
    const-wide/16 v6, 0x0

    .line 303
    .line 304
    cmpg-double v4, v4, v6

    .line 305
    .line 306
    if-gez v4, :cond_9

    .line 307
    .line 308
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Ni:I

    .line 309
    .line 310
    goto :goto_2

    .line 311
    :cond_9
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Pi:I

    .line 312
    .line 313
    :goto_2
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    invoke-static {v1}, Ll/hmj0;->c(Ljava/lang/String;)Landroid/text/Spannable;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    invoke-static {v1}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    :cond_a
    iget-object v2, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 333
    .line 334
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 335
    .line 336
    invoke-interface {v2, v4}, Ll/ue6;->i0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    if-eqz v2, :cond_c

    .line 341
    .line 342
    :try_start_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 343
    .line 344
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 345
    .line 346
    iget-object v2, v2, Ll/dkb;->u3:Ll/wyd0;

    .line 347
    .line 348
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    check-cast v2, Ljava/lang/String;

    .line 353
    .line 354
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 355
    .line 356
    .line 357
    move-result v4

    .line 358
    if-nez v4, :cond_b

    .line 359
    .line 360
    new-instance v4, Lorg/json/JSONObject;

    .line 361
    .line 362
    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    goto :goto_3

    .line 366
    :cond_b
    new-instance v4, Lorg/json/JSONObject;

    .line 367
    .line 368
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 369
    .line 370
    .line 371
    :goto_3
    iget-object v5, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 372
    .line 373
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 374
    .line 375
    const-wide/16 v6, 0x0

    .line 376
    .line 377
    invoke-virtual {v4, v5, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 378
    .line 379
    .line 380
    move-result-wide v4

    .line 381
    iget-object v8, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 382
    .line 383
    iget-object v9, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 384
    .line 385
    iget-object v9, v9, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 386
    .line 387
    invoke-interface {v8, v9, v2}, Ll/ue6;->b0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 388
    .line 389
    .line 390
    move-result v2

    .line 391
    if-eqz v2, :cond_c

    .line 392
    .line 393
    cmp-long v2, v4, v6

    .line 394
    .line 395
    if-eqz v2, :cond_c

    .line 396
    .line 397
    invoke-static {}, Ll/pzi0;->o()J

    .line 398
    .line 399
    .line 400
    move-result-wide v6

    .line 401
    cmp-long v2, v6, v4

    .line 402
    .line 403
    if-gez v2, :cond_c

    .line 404
    .line 405
    invoke-virtual {p0, p1}, Ll/kj6;->i(Ll/sj6;)Ljava/lang/CharSequence;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    invoke-static {v2}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 410
    .line 411
    .line 412
    move-result v4

    .line 413
    if-nez v4, :cond_c

    .line 414
    .line 415
    invoke-static {v2}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 416
    .line 417
    .line 418
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 419
    :catch_1
    :cond_c
    iget-object v2, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 420
    .line 421
    iget-object v4, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 422
    .line 423
    invoke-interface {v2, v4}, Ll/ue6;->X(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 424
    .line 425
    .line 426
    move-result v2

    .line 427
    if-eqz v2, :cond_d

    .line 428
    .line 429
    invoke-virtual {p0, p1, v1}, Ll/kj6;->l(Ll/sj6;Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    invoke-static {v1}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    :cond_d
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    move-result v2

    .line 441
    if-nez v2, :cond_f

    .line 442
    .line 443
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    iget-object v2, v2, Ll/r8n;->m:Ll/xyd0;

    .line 448
    .line 449
    invoke-virtual {v2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v2

    .line 453
    check-cast v2, Ljava/util/HashSet;

    .line 454
    .line 455
    iget-object v4, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 456
    .line 457
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 458
    .line 459
    invoke-virtual {v2, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    move-result v2

    .line 463
    if-eqz v2, :cond_f

    .line 464
    .line 465
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 466
    .line 467
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 468
    .line 469
    if-nez v2, :cond_f

    .line 470
    .line 471
    iget-object v1, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 472
    .line 473
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 474
    .line 475
    .line 476
    move-result v1

    .line 477
    iget-object v2, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 478
    .line 479
    if-eqz v1, :cond_e

    .line 480
    .line 481
    sget v1, Lcom/p1/mobile/putong/core/R$string;->M1:I

    .line 482
    .line 483
    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    goto :goto_4

    .line 488
    :cond_e
    sget v1, Lcom/p1/mobile/putong/core/R$string;->N1:I

    .line 489
    .line 490
    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    :goto_4
    iget-object v2, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 495
    .line 496
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 497
    .line 498
    .line 499
    move-result-object v2

    .line 500
    sget v4, Ll/c9c0;->I:I

    .line 501
    .line 502
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 503
    .line 504
    .line 505
    move-result v2

    .line 506
    invoke-static {v1, v2}, Ll/kj6;->f(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    .line 507
    .line 508
    .line 509
    move-result-object v1

    .line 510
    :cond_f
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 511
    .line 512
    .line 513
    move-result v2

    .line 514
    if-eqz v2, :cond_10

    .line 515
    .line 516
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 517
    .line 518
    invoke-static {v2}, Ll/vb0;->h(Ljava/lang/String;)Z

    .line 519
    .line 520
    .line 521
    move-result v2

    .line 522
    if-eqz v2, :cond_10

    .line 523
    .line 524
    iget-object v1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 525
    .line 526
    sget v2, Lcom/p1/mobile/putong/core/R$string;->I:I

    .line 527
    .line 528
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    iget-object v2, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 533
    .line 534
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 535
    .line 536
    .line 537
    move-result-object v2

    .line 538
    sget v4, Ll/c9c0;->I:I

    .line 539
    .line 540
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 541
    .line 542
    .line 543
    move-result v2

    .line 544
    invoke-static {v1, v2}, Ll/kj6;->f(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    .line 545
    .line 546
    .line 547
    move-result-object v1

    .line 548
    :cond_10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 549
    .line 550
    .line 551
    move-result v2

    .line 552
    if-eqz v2, :cond_11

    .line 553
    .line 554
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 555
    .line 556
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 557
    .line 558
    .line 559
    move-result v2

    .line 560
    if-eqz v2, :cond_11

    .line 561
    .line 562
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 563
    .line 564
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 565
    .line 566
    const-string v4, "fake_one_side_no_match"

    .line 567
    .line 568
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 569
    .line 570
    .line 571
    move-result v2

    .line 572
    if-eqz v2, :cond_11

    .line 573
    .line 574
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 575
    .line 576
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 577
    .line 578
    .line 579
    move-result v2

    .line 580
    if-nez v2, :cond_11

    .line 581
    .line 582
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 583
    .line 584
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;->parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;

    .line 585
    .line 586
    .line 587
    move-result-object v2

    .line 588
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 589
    .line 590
    .line 591
    move-result v4

    .line 592
    if-eqz v4, :cond_11

    .line 593
    .line 594
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;->msgData:Ljava/util/List;

    .line 595
    .line 596
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 597
    .line 598
    .line 599
    move-result v4

    .line 600
    if-nez v4, :cond_11

    .line 601
    .line 602
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClickList;->msgData:Ljava/util/List;

    .line 603
    .line 604
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    move-result-object v0

    .line 608
    check-cast v0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;

    .line 609
    .line 610
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CommonDoubleTitleIconClick;->subtitle:Ljava/lang/String;

    .line 611
    .line 612
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 613
    .line 614
    .line 615
    move-result v2

    .line 616
    if-nez v2, :cond_11

    .line 617
    .line 618
    invoke-static {v0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 619
    .line 620
    .line 621
    move-result-object v1

    .line 622
    :cond_11
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 623
    .line 624
    .line 625
    move-result-object v0

    .line 626
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 627
    .line 628
    iget-object v4, p1, Ll/sj6;->c:Lcom/p1/mobile/putong/data/User;

    .line 629
    .line 630
    invoke-virtual {v0, v2, v4}, Ll/o3z;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 631
    .line 632
    .line 633
    move-result v0

    .line 634
    if-eqz v0, :cond_12

    .line 635
    .line 636
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 637
    .line 638
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 639
    .line 640
    .line 641
    move-result v0

    .line 642
    if-eqz v0, :cond_12

    .line 643
    .line 644
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 645
    .line 646
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 647
    .line 648
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 649
    .line 650
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->stage:Lcom/p1/mobile/putong/core/data/ChatInterruptStage;

    .line 651
    .line 652
    const-string v2, "locked"

    .line 653
    .line 654
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 655
    .line 656
    .line 657
    move-result v0

    .line 658
    if-eqz v0, :cond_12

    .line 659
    .line 660
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 661
    .line 662
    .line 663
    move-result v0

    .line 664
    if-eqz v0, :cond_12

    .line 665
    .line 666
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 667
    .line 668
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 669
    .line 670
    .line 671
    move-result-object v2

    .line 672
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v2

    .line 676
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 677
    .line 678
    .line 679
    move-result v0

    .line 680
    if-nez v0, :cond_12

    .line 681
    .line 682
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 683
    .line 684
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 685
    .line 686
    .line 687
    move-result-object v0

    .line 688
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Yi:I

    .line 689
    .line 690
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 691
    .line 692
    .line 693
    move-result-object v0

    .line 694
    iget-object v1, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 695
    .line 696
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 697
    .line 698
    .line 699
    move-result-object v1

    .line 700
    sget v2, Ll/c9c0;->I:I

    .line 701
    .line 702
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 703
    .line 704
    .line 705
    move-result v1

    .line 706
    invoke-static {v0, v1}, Ll/kj6;->f(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    .line 707
    .line 708
    .line 709
    move-result-object v1

    .line 710
    :cond_12
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 711
    .line 712
    .line 713
    move-result v0

    .line 714
    if-eqz v0, :cond_16

    .line 715
    .line 716
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 717
    .line 718
    .line 719
    move-result-object v0

    .line 720
    const-string v2, "picture_text_style"

    .line 721
    .line 722
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 723
    .line 724
    .line 725
    move-result v0

    .line 726
    const-string v2, "monetization_buy_v2"

    .line 727
    .line 728
    const-string v4, "monetization_buy"

    .line 729
    .line 730
    if-nez v0, :cond_13

    .line 731
    .line 732
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 733
    .line 734
    .line 735
    move-result-object v0

    .line 736
    const-string v5, "moment_inspire"

    .line 737
    .line 738
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 739
    .line 740
    .line 741
    move-result v0

    .line 742
    if-nez v0, :cond_13

    .line 743
    .line 744
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 745
    .line 746
    .line 747
    move-result-object v0

    .line 748
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 749
    .line 750
    .line 751
    move-result v0

    .line 752
    if-nez v0, :cond_13

    .line 753
    .line 754
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 755
    .line 756
    .line 757
    move-result-object v0

    .line 758
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 759
    .line 760
    .line 761
    move-result v0

    .line 762
    if-eqz v0, :cond_16

    .line 763
    .line 764
    :cond_13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 765
    .line 766
    if-eqz v0, :cond_16

    .line 767
    .line 768
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 769
    .line 770
    if-eq v0, v5, :cond_16

    .line 771
    .line 772
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 773
    .line 774
    .line 775
    move-result-object v0

    .line 776
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 777
    .line 778
    .line 779
    move-result v0

    .line 780
    if-nez v0, :cond_15

    .line 781
    .line 782
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 783
    .line 784
    .line 785
    move-result-object v0

    .line 786
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 787
    .line 788
    .line 789
    move-result v0

    .line 790
    if-eqz v0, :cond_14

    .line 791
    .line 792
    goto :goto_5

    .line 793
    :cond_14
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 794
    .line 795
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 796
    .line 797
    .line 798
    move-result v0

    .line 799
    if-nez v0, :cond_16

    .line 800
    .line 801
    :try_start_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 802
    .line 803
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 804
    .line 805
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 806
    .line 807
    .line 808
    move-result-object v0

    .line 809
    check-cast v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 810
    .line 811
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 812
    .line 813
    if-eqz v0, :cond_16

    .line 814
    .line 815
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageView;->text:Ljava/lang/String;

    .line 816
    .line 817
    invoke-static {v0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 818
    .line 819
    .line 820
    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 821
    goto :goto_6

    .line 822
    :catch_2
    move-exception v0

    .line 823
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 824
    .line 825
    .line 826
    goto :goto_6

    .line 827
    :cond_15
    :goto_5
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 828
    .line 829
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 830
    .line 831
    .line 832
    move-result-object v0

    .line 833
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 834
    .line 835
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 836
    .line 837
    .line 838
    move-result-object v0

    .line 839
    invoke-static {v0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 840
    .line 841
    .line 842
    move-result-object v1

    .line 843
    :cond_16
    :goto_6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 844
    .line 845
    .line 846
    move-result v0

    .line 847
    if-eqz v0, :cond_18

    .line 848
    .line 849
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 850
    .line 851
    .line 852
    move-result-object v0

    .line 853
    const-string v2, "monetization_pending_payment_guidance"

    .line 854
    .line 855
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 856
    .line 857
    .line 858
    move-result v0

    .line 859
    if-eqz v0, :cond_18

    .line 860
    .line 861
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 862
    .line 863
    if-eqz v0, :cond_18

    .line 864
    .line 865
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 866
    .line 867
    if-eq v0, v4, :cond_18

    .line 868
    .line 869
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 870
    .line 871
    .line 872
    move-result-object v0

    .line 873
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 874
    .line 875
    .line 876
    move-result v0

    .line 877
    if-eqz v0, :cond_17

    .line 878
    .line 879
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 880
    .line 881
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 882
    .line 883
    .line 884
    move-result-object v0

    .line 885
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 886
    .line 887
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 888
    .line 889
    .line 890
    move-result-object v0

    .line 891
    invoke-static {v0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 892
    .line 893
    .line 894
    move-result-object v1

    .line 895
    goto :goto_7

    .line 896
    :cond_17
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 897
    .line 898
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 899
    .line 900
    .line 901
    move-result v0

    .line 902
    if-nez v0, :cond_18

    .line 903
    .line 904
    :try_start_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 905
    .line 906
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 907
    .line 908
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 909
    .line 910
    .line 911
    move-result-object v0

    .line 912
    check-cast v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 913
    .line 914
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 915
    .line 916
    .line 917
    move-result v2

    .line 918
    if-eqz v2, :cond_18

    .line 919
    .line 920
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->paymentFailMsg:Ljava/lang/String;

    .line 921
    .line 922
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 923
    .line 924
    .line 925
    move-result v2

    .line 926
    if-nez v2, :cond_18

    .line 927
    .line 928
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->paymentFailMsg:Ljava/lang/String;

    .line 929
    .line 930
    invoke-static {v0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 931
    .line 932
    .line 933
    move-result-object v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 934
    goto :goto_7

    .line 935
    :catch_3
    move-exception v0

    .line 936
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 937
    .line 938
    .line 939
    :cond_18
    :goto_7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 940
    .line 941
    .line 942
    move-result v0

    .line 943
    if-eqz v0, :cond_1a

    .line 944
    .line 945
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 946
    .line 947
    .line 948
    move-result-object v0

    .line 949
    const-string v2, "chatroom_share"

    .line 950
    .line 951
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 952
    .line 953
    .line 954
    move-result v0

    .line 955
    if-eqz v0, :cond_1a

    .line 956
    .line 957
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 958
    .line 959
    invoke-static {v0}, Ll/vb0;->h(Ljava/lang/String;)Z

    .line 960
    .line 961
    .line 962
    move-result v0

    .line 963
    if-nez v0, :cond_1a

    .line 964
    .line 965
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 966
    .line 967
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 968
    .line 969
    .line 970
    move-result v0

    .line 971
    if-nez v0, :cond_1a

    .line 972
    .line 973
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 974
    .line 975
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 976
    .line 977
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->lp()Z

    .line 978
    .line 979
    .line 980
    move-result v0

    .line 981
    if-eqz v0, :cond_19

    .line 982
    .line 983
    :try_start_4
    new-instance v0, Lorg/json/JSONObject;

    .line 984
    .line 985
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 986
    .line 987
    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 988
    .line 989
    .line 990
    const-string v2, "title"

    .line 991
    .line 992
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 993
    .line 994
    .line 995
    move-result-object v0

    .line 996
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 997
    .line 998
    .line 999
    move-result v2

    .line 1000
    if-nez v2, :cond_1a

    .line 1001
    .line 1002
    invoke-static {v0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 1006
    goto :goto_8

    .line 1007
    :catch_4
    move-exception v0

    .line 1008
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1009
    .line 1010
    .line 1011
    goto :goto_8

    .line 1012
    :cond_19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1013
    .line 1014
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1015
    .line 1016
    .line 1017
    move-result-object v0

    .line 1018
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 1019
    .line 1020
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v1

    .line 1024
    :cond_1a
    :goto_8
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1025
    .line 1026
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1027
    .line 1028
    .line 1029
    move-result v0

    .line 1030
    if-eqz v0, :cond_1b

    .line 1031
    .line 1032
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1033
    .line 1034
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 1035
    .line 1036
    const-string v2, "intlSeeChatRequest"

    .line 1037
    .line 1038
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1039
    .line 1040
    .line 1041
    move-result v0

    .line 1042
    if-eqz v0, :cond_1b

    .line 1043
    .line 1044
    invoke-static {p1}, Ll/kj6;->m(Ll/sj6;)Ljava/lang/CharSequence;

    .line 1045
    .line 1046
    .line 1047
    move-result-object p0

    .line 1048
    return-object p0

    .line 1049
    :cond_1b
    iget-object v0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 1050
    .line 1051
    iget-object v2, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1052
    .line 1053
    invoke-interface {v0, v2}, Ll/ue6;->A0(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 1054
    .line 1055
    .line 1056
    move-result v0

    .line 1057
    if-eqz v0, :cond_1c

    .line 1058
    .line 1059
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1060
    .line 1061
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 1062
    .line 1063
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->loveScript:Lcom/p1/mobile/putong/core/data/LoveScript;

    .line 1064
    .line 1065
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/LoveScript;->expireTime:J

    .line 1066
    .line 1067
    invoke-static {}, Ll/pzi0;->o()J

    .line 1068
    .line 1069
    .line 1070
    move-result-wide v4

    .line 1071
    sub-long/2addr v0, v4

    .line 1072
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1073
    .line 1074
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1075
    .line 1076
    .line 1077
    invoke-virtual {p0, v0, v1}, Ll/kj6;->a(J)Ljava/lang/String;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v0

    .line 1081
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1082
    .line 1083
    .line 1084
    const-string v0, " \u540e\u5931\u6548"

    .line 1085
    .line 1086
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1087
    .line 1088
    .line 1089
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1090
    .line 1091
    .line 1092
    move-result-object v0

    .line 1093
    invoke-static {v0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v1

    .line 1097
    :cond_1c
    iget-object v0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 1098
    .line 1099
    invoke-interface {v0, p1, p2}, Ll/ue6;->L0(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 1100
    .line 1101
    .line 1102
    move-result v0

    .line 1103
    const-string v2, " \u00b7 "

    .line 1104
    .line 1105
    if-eqz v0, :cond_1f

    .line 1106
    .line 1107
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 1108
    .line 1109
    invoke-direct {v0, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1110
    .line 1111
    .line 1112
    iget-object v4, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 1113
    .line 1114
    invoke-interface {v4, p2}, Ll/ue6;->s(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 1115
    .line 1116
    .line 1117
    move-result v4

    .line 1118
    if-eqz v4, :cond_1d

    .line 1119
    .line 1120
    const-string v4, "\u4ee5\u56fe\u6362\u56fe"

    .line 1121
    .line 1122
    invoke-static {v4}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1123
    .line 1124
    .line 1125
    move-result-object v4

    .line 1126
    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1127
    .line 1128
    .line 1129
    goto :goto_9

    .line 1130
    :cond_1d
    const-string v4, "\u53d1\u6765\u56fe\u7247\u60f3\u548c\u4f60\u4ea4\u6362"

    .line 1131
    .line 1132
    invoke-static {v4}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1133
    .line 1134
    .line 1135
    move-result-object v4

    .line 1136
    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1137
    .line 1138
    .line 1139
    :goto_9
    invoke-virtual {p0, v1}, Ll/kj6;->j(Ljava/lang/CharSequence;)Z

    .line 1140
    .line 1141
    .line 1142
    move-result v4

    .line 1143
    if-eqz v4, :cond_1e

    .line 1144
    .line 1145
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1146
    .line 1147
    .line 1148
    move-result-object v4

    .line 1149
    invoke-virtual {v4, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1150
    .line 1151
    .line 1152
    :cond_1e
    move-object v1, v0

    .line 1153
    :cond_1f
    iget-object v0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 1154
    .line 1155
    invoke-interface {v0, p1, p2}, Ll/ue6;->o0(Ll/sj6;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 1156
    .line 1157
    .line 1158
    move-result v0

    .line 1159
    if-eqz v0, :cond_22

    .line 1160
    .line 1161
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 1162
    .line 1163
    invoke-direct {v0, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1164
    .line 1165
    .line 1166
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 1167
    .line 1168
    .line 1169
    move-result v3

    .line 1170
    if-eqz v3, :cond_20

    .line 1171
    .line 1172
    const-string v3, "\u9650\u65f6\u5feb\u62cd"

    .line 1173
    .line 1174
    invoke-static {v3}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1175
    .line 1176
    .line 1177
    move-result-object v3

    .line 1178
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1179
    .line 1180
    .line 1181
    goto :goto_a

    .line 1182
    :cond_20
    const-string v3, "\u9650\u65f6\u5185\u672a\u67e5\u770b\u5c06\u8fc7\u671f"

    .line 1183
    .line 1184
    invoke-static {v3}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1185
    .line 1186
    .line 1187
    move-result-object v3

    .line 1188
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1189
    .line 1190
    .line 1191
    :goto_a
    invoke-virtual {p0, v1}, Ll/kj6;->j(Ljava/lang/CharSequence;)Z

    .line 1192
    .line 1193
    .line 1194
    move-result p0

    .line 1195
    if-eqz p0, :cond_21

    .line 1196
    .line 1197
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1198
    .line 1199
    .line 1200
    move-result-object p0

    .line 1201
    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1202
    .line 1203
    .line 1204
    :cond_21
    move-object v1, v0

    .line 1205
    :cond_22
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1206
    .line 1207
    .line 1208
    move-result p0

    .line 1209
    if-eqz p0, :cond_23

    .line 1210
    .line 1211
    iget-object p0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 1212
    .line 1213
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1214
    .line 1215
    invoke-interface {p0, v0}, Ll/ue6;->S(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 1216
    .line 1217
    .line 1218
    move-result p0

    .line 1219
    if-nez p0, :cond_24

    .line 1220
    .line 1221
    :cond_23
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1222
    .line 1223
    .line 1224
    move-result p0

    .line 1225
    if-eqz p0, :cond_25

    .line 1226
    .line 1227
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 1228
    .line 1229
    .line 1230
    move-result p0

    .line 1231
    if-eqz p0, :cond_25

    .line 1232
    .line 1233
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1234
    .line 1235
    .line 1236
    move-result-object p0

    .line 1237
    const-string v0, "prologue"

    .line 1238
    .line 1239
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1240
    .line 1241
    .line 1242
    move-result p0

    .line 1243
    if-eqz p0, :cond_25

    .line 1244
    .line 1245
    iget-object p0, p1, Ll/sj6;->D:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 1246
    .line 1247
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1248
    .line 1249
    invoke-interface {p0, v0}, Ll/ue6;->l(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 1250
    .line 1251
    .line 1252
    move-result p0

    .line 1253
    if-eqz p0, :cond_25

    .line 1254
    .line 1255
    :cond_24
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1256
    .line 1257
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 1258
    .line 1259
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->conversationTag:Lcom/p1/mobile/putong/core/data/ConversationTag;

    .line 1260
    .line 1261
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationTag;->guide:Ljava/lang/String;

    .line 1262
    .line 1263
    :cond_25
    invoke-static {p1}, Ll/kj6;->k(Ll/sj6;)Z

    .line 1264
    .line 1265
    .line 1266
    move-result p0

    .line 1267
    if-eqz p0, :cond_27

    .line 1268
    .line 1269
    if-eqz p2, :cond_27

    .line 1270
    .line 1271
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 1272
    .line 1273
    .line 1274
    move-result-object p0

    .line 1275
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 1276
    .line 1277
    .line 1278
    move-result-object p0

    .line 1279
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 1280
    .line 1281
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1282
    .line 1283
    .line 1284
    move-result p0

    .line 1285
    if-nez p0, :cond_27

    .line 1286
    .line 1287
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 1288
    .line 1289
    invoke-direct {p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 1290
    .line 1291
    .line 1292
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1293
    .line 1294
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1295
    .line 1296
    iget-object v2, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 1297
    .line 1298
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1299
    .line 1300
    invoke-virtual {v0, v2}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 1301
    .line 1302
    .line 1303
    move-result-object v0

    .line 1304
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1305
    .line 1306
    .line 1307
    move-result v2

    .line 1308
    const-string v3, "\uff1a"

    .line 1309
    .line 1310
    if-eqz v2, :cond_26

    .line 1311
    .line 1312
    iget-object v0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 1313
    .line 1314
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 1315
    .line 1316
    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1317
    .line 1318
    .line 1319
    move-result-object p0

    .line 1320
    invoke-virtual {p0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1321
    .line 1322
    .line 1323
    move-result-object p0

    .line 1324
    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1325
    .line 1326
    .line 1327
    move-result-object v1

    .line 1328
    goto :goto_b

    .line 1329
    :cond_26
    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1330
    .line 1331
    .line 1332
    move-result-object p0

    .line 1333
    invoke-virtual {p0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1334
    .line 1335
    .line 1336
    move-result-object p0

    .line 1337
    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1338
    .line 1339
    .line 1340
    move-result-object v1

    .line 1341
    :cond_27
    :goto_b
    invoke-static {p1}, Ll/kj6;->k(Ll/sj6;)Z

    .line 1342
    .line 1343
    .line 1344
    move-result p0

    .line 1345
    if-eqz p0, :cond_28

    .line 1346
    .line 1347
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1348
    .line 1349
    .line 1350
    move-result p0

    .line 1351
    if-eqz p0, :cond_28

    .line 1352
    .line 1353
    iget-object p0, p1, Ll/sj6;->O:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1354
    .line 1355
    if-eqz p0, :cond_28

    .line 1356
    .line 1357
    iget-object v0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 1358
    .line 1359
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Rh:I

    .line 1360
    .line 1361
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 1362
    .line 1363
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 1364
    .line 1365
    .line 1366
    move-result-object p0

    .line 1367
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 1368
    .line 1369
    .line 1370
    move-result-object p0

    .line 1371
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 1372
    .line 1373
    .line 1374
    move-result-object v1

    .line 1375
    :cond_28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1376
    .line 1377
    .line 1378
    move-result-object p0

    .line 1379
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 1380
    .line 1381
    .line 1382
    move-result-object p0

    .line 1383
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 1384
    .line 1385
    .line 1386
    move-result p0

    .line 1387
    if-eqz p0, :cond_2a

    .line 1388
    .line 1389
    invoke-static {}, Ll/joa;->M3()Z

    .line 1390
    .line 1391
    .line 1392
    move-result p0

    .line 1393
    if-nez p0, :cond_2a

    .line 1394
    .line 1395
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 1396
    .line 1397
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1398
    .line 1399
    sget-object v0, Lcom/p1/mobile/putong/core/api/g;->Y2:Ljava/lang/String;

    .line 1400
    .line 1401
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1402
    .line 1403
    .line 1404
    move-result p0

    .line 1405
    if-eqz p0, :cond_2a

    .line 1406
    .line 1407
    iget-object p0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 1408
    .line 1409
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 1410
    .line 1411
    .line 1412
    move-result p0

    .line 1413
    if-eqz p0, :cond_29

    .line 1414
    .line 1415
    const-string p0, "\u5979"

    .line 1416
    .line 1417
    goto :goto_c

    .line 1418
    :cond_29
    const-string p0, "\u4ed6"

    .line 1419
    .line 1420
    :goto_c
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 1421
    .line 1422
    .line 1423
    move-result-object p0

    .line 1424
    const-string v0, "\u70b9\u51fb\u67e5\u770b%s\u7684\u8fd1\u671f\u6d3b\u8dc3\u72b6\u6001"

    .line 1425
    .line 1426
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 1427
    .line 1428
    .line 1429
    move-result-object p0

    .line 1430
    invoke-static {p0}, Ll/kj6;->e(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v1

    .line 1434
    :cond_2a
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1435
    .line 1436
    .line 1437
    move-result p0

    .line 1438
    if-eqz p0, :cond_2d

    .line 1439
    .line 1440
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1441
    .line 1442
    .line 1443
    move-result-object p0

    .line 1444
    const-string v0, "icebreak_qa"

    .line 1445
    .line 1446
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1447
    .line 1448
    .line 1449
    move-result p0

    .line 1450
    if-eqz p0, :cond_2d

    .line 1451
    .line 1452
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1453
    .line 1454
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1455
    .line 1456
    .line 1457
    move-result p0

    .line 1458
    if-eqz p0, :cond_2d

    .line 1459
    .line 1460
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1461
    .line 1462
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 1463
    .line 1464
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1465
    .line 1466
    .line 1467
    move-result p0

    .line 1468
    if-eqz p0, :cond_2d

    .line 1469
    .line 1470
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 1471
    .line 1472
    .line 1473
    move-result p0

    .line 1474
    if-nez p0, :cond_2c

    .line 1475
    .line 1476
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1477
    .line 1478
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 1479
    .line 1480
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->state:Ljava/lang/String;

    .line 1481
    .line 1482
    const-string v0, "replied"

    .line 1483
    .line 1484
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1485
    .line 1486
    .line 1487
    move-result p0

    .line 1488
    if-eqz p0, :cond_2b

    .line 1489
    .line 1490
    goto :goto_d

    .line 1491
    :cond_2b
    iget-object p0, p1, Ll/sj6;->b:Lcom/p1/mobile/putong/data/User;

    .line 1492
    .line 1493
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 1494
    .line 1495
    .line 1496
    move-result-object p0

    .line 1497
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 1498
    .line 1499
    .line 1500
    move-result-object p0

    .line 1501
    const-string p1, "\u56de\u7b54\u540e\u63ed\u6653%s\u7684\u7b54\u6848"

    .line 1502
    .line 1503
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 1504
    .line 1505
    .line 1506
    move-result-object v1

    .line 1507
    goto :goto_e

    .line 1508
    :cond_2c
    :goto_d
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1509
    .line 1510
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 1511
    .line 1512
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->answer:Ljava/lang/String;

    .line 1513
    .line 1514
    :cond_2d
    :goto_e
    return-object v1
.end method

.method public final i(Ll/sj6;)Ljava/lang/CharSequence;
    .locals 8

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->p3:Ll/xyd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/HashSet;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dkb;->q3:Ll/xyd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/HashSet;

    .line 24
    .line 25
    iget-object v1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_a

    .line 34
    .line 35
    iget-object p0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_a

    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    iget-object v0, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_a

    .line 62
    .line 63
    const/4 v0, 0x6

    .line 64
    const/16 v1, 0xc

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/pzi0;->x(II)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    const-string v3, "\u8ddf\u4ed6\u6253\u4e2a\u62db\u547c"

    .line 71
    .line 72
    const-string v4, "\u8ddf\u5979\u6253\u4e2a\u62db\u547c"

    .line 73
    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_0

    .line 81
    .line 82
    move-object v3, v4

    .line 83
    :cond_0
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string v1, "\u65e9\u4e0a\u597d \u00b7 %s"

    .line 88
    .line 89
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    goto/16 :goto_1

    .line 94
    .line 95
    :cond_1
    const/16 v2, 0xe

    .line 96
    .line 97
    invoke-static {v1, v2}, Ll/pzi0;->x(II)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_2

    .line 108
    .line 109
    move-object v3, v4

    .line 110
    :cond_2
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const-string v1, "\u4e2d\u5348\u597d \u00b7 %s"

    .line 115
    .line 116
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    goto :goto_1

    .line 121
    :cond_3
    const/16 v1, 0x12

    .line 122
    .line 123
    invoke-static {v2, v1}, Ll/pzi0;->x(II)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_5

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_4

    .line 134
    .line 135
    move-object v3, v4

    .line 136
    :cond_4
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    const-string v1, "\u4e0b\u5348\u597d \u00b7 %s"

    .line 141
    .line 142
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    goto :goto_1

    .line 147
    :cond_5
    const/16 v2, 0x16

    .line 148
    .line 149
    invoke-static {v1, v2}, Ll/pzi0;->x(II)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_7

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-eqz p0, :cond_6

    .line 160
    .line 161
    move-object v3, v4

    .line 162
    :cond_6
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    const-string v1, "\u665a\u4e0a\u597d \u00b7 %s"

    .line 167
    .line 168
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    goto :goto_1

    .line 173
    :cond_7
    invoke-static {v2, v0}, Ll/pzi0;->x(II)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_9

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-eqz p0, :cond_8

    .line 184
    .line 185
    const-string p0, "\u63d0\u9192\u5979\u65e9\u7761"

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_8
    const-string p0, "\u63d0\u9192\u4ed6\u65e9\u7761"

    .line 189
    .line 190
    :goto_0
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    const-string v1, "\u591c\u6df1\u4e86 \u00b7 %s"

    .line 195
    .line 196
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    goto :goto_1

    .line 201
    :cond_9
    const-string p0, "\u65e9\u4e0a\u597d \u00b7 \u8ddf\u4ed6\u6253\u4e2a\u62db\u547c"

    .line 202
    .line 203
    :goto_1
    new-instance v1, Landroid/text/SpannableString;

    .line 204
    .line 205
    invoke-direct {v1, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    new-instance v2, Landroid/text/style/TextAppearanceSpan;

    .line 209
    .line 210
    const/high16 p0, 0x41500000    # 13.0f

    .line 211
    .line 212
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 213
    .line 214
    .line 215
    move-result v5

    .line 216
    iget-object p0, p1, Ll/sj6;->x:Lcom/p1/mobile/android/app/Act;

    .line 217
    .line 218
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    sget p1, Ll/c9c0;->u0:I

    .line 223
    .line 224
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    const/4 v7, 0x0

    .line 233
    const/4 v3, 0x0

    .line 234
    const/4 v4, 0x1

    .line 235
    invoke-direct/range {v2 .. v7}, Landroid/text/style/TextAppearanceSpan;-><init>(Ljava/lang/String;IILandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    .line 236
    .line 237
    .line 238
    const/4 p0, 0x0

    .line 239
    const/16 p1, 0x21

    .line 240
    .line 241
    invoke-virtual {v1, v2, p0, v0, p1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 242
    .line 243
    .line 244
    return-object v1

    .line 245
    :cond_a
    const-string p0, ""

    .line 246
    .line 247
    return-object p0
.end method

.method public j(Ljava/lang/CharSequence;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kj6;->a:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, ":"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    array-length p0, p0

    .line 22
    const/4 p1, 0x2

    .line 23
    if-lt p0, p1, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final l(Ll/sj6;Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    .locals 4

    .line 1
    iget-object p1, p1, Ll/sj6;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 6
    .line 7
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->expireTime:D

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    long-to-double v2, v2

    .line 14
    sub-double/2addr v0, v2

    .line 15
    double-to-long v0, v0

    .line 16
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Ll/kj6;->a(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, "\u540e\u5931\u6548 \u00b7 "

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 35
    .line 36
    .line 37
    return-object p1
.end method
