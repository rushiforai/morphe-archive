.class public Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "feed\u670d\u52a1"
    path = "/feed_service/service"
.end annotation


# instance fields
.field public a:Ll/m2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dmg;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/dmg;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->a:Ll/m2;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic F(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->supportInvalidateOptionsMenu()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->I:I

    .line 10
    .line 11
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->U0:I

    .line 17
    .line 18
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    :goto_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget v0, Ll/lbc0;->Z1:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p3, p0}, Ll/o1j0;->q(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    xor-int/lit8 p1, p1, 0x1

    .line 40
    .line 41
    invoke-virtual {p0, p2, p1}, Ll/jka;->cc(Ljava/lang/String;Z)Lrx/c;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic L(Ljava/util/Map;)Ll/bkj0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    new-instance p0, Ll/bkj0;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, v0, v0, v0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    new-instance v0, Ll/bkj0;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 35
    .line 36
    invoke-direct {v0, v1, v2, p0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Ll/g90;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p3}, Ll/g90;->c()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p3}, Ll/g90;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p3}, Ll/g90;->b()Lcom/p1/mobile/putong/data/DoublePair;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    iput-object p3, p0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 24
    .line 25
    :cond_0
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->k4(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)Lrx/c;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P(Lcom/tantanapp/common/data/JsonAdapter;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 4
    .line 5
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/feed/api/b;->k4(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic R(Lcom/tantanapp/common/data/JsonAdapter;Ll/vg60;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic S(JLcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 11

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const-string v1, ""

    .line 17
    .line 18
    const/4 v10, 0x0

    .line 19
    if-nez v0, :cond_4

    .line 20
    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Audio;

    .line 28
    .line 29
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/data/Audio;

    .line 38
    .line 39
    iget v0, v0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v2, "%s\'\'"

    .line 54
    .line 55
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v2, 0x4

    .line 60
    move-object v6, v0

    .line 61
    move-object v9, v1

    .line 62
    :goto_0
    move v3, v2

    .line 63
    goto :goto_3

    .line 64
    :cond_1
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 69
    .line 70
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 71
    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 79
    .line 80
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 81
    .line 82
    iget v0, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 83
    .line 84
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v2, "%.1f"

    .line 93
    .line 94
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 105
    .line 106
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 111
    .line 112
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    const/4 v2, 0x2

    .line 116
    move-object v9, v0

    .line 117
    move-object v6, v1

    .line 118
    goto :goto_0

    .line 119
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_3

    .line 128
    .line 129
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 134
    .line 135
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 140
    .line 141
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_3
    const/4 v2, 0x1

    .line 146
    :goto_2
    move-object v6, v1

    .line 147
    move-object v9, v6

    .line 148
    goto :goto_0

    .line 149
    :cond_4
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_5

    .line 156
    .line 157
    const/4 v2, 0x3

    .line 158
    goto :goto_2

    .line 159
    :cond_5
    move-object v6, v1

    .line 160
    move-object v9, v6

    .line 161
    move v3, v10

    .line 162
    :goto_3
    if-lez v3, :cond_7

    .line 163
    .line 164
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Ll/q0i;

    .line 169
    .line 170
    invoke-direct {v1, p2}, Ll/q0i;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 181
    .line 182
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 183
    .line 184
    iget-object v5, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 185
    .line 186
    iget-wide v7, p2, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 187
    .line 188
    invoke-interface/range {v0 .. v9}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->mq(Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;)V

    .line 189
    .line 190
    .line 191
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 192
    .line 193
    iget-object v0, v0, Ll/jka;->s0:Lrx/subjects/a;

    .line 194
    .line 195
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Ljava/util/List;

    .line 200
    .line 201
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-nez v1, :cond_6

    .line 206
    .line 207
    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 212
    .line 213
    iget-wide v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 214
    .line 215
    double-to-long v0, v0

    .line 216
    invoke-static {}, Ll/pzi0;->o()J

    .line 217
    .line 218
    .line 219
    move-result-wide v2

    .line 220
    sub-long/2addr v2, v0

    .line 221
    cmp-long p0, v2, p0

    .line 222
    .line 223
    if-lez p0, :cond_7

    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 230
    .line 231
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ml(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 240
    .line 241
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ml(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :cond_7
    :goto_4
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->uf(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic V(Lcom/tantanapp/common/data/JsonAdapter;Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    const-string v0, "\u53d1\u5e03\u5931\u8d25"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v5, 0x0

    .line 11
    const/4 v6, 0x0

    .line 12
    const-string v3, "p_moment_post"

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move-object v4, p1

    .line 16
    invoke-virtual/range {v1 .. v6}, Ll/er60;->o(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;ZLjava/util/Map;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/feed/data/Moment;JLl/uxj0;)V
    .locals 8

    .line 1
    const-string p3, "\u53d1\u5e03\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p3}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    sub-long/2addr v0, p1

    .line 11
    const-string p1, "nearby"

    .line 12
    .line 13
    invoke-static {p1, p0, v0, v1}, Ll/g9i;->j0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;J)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v7, 0x0

    .line 22
    const-string v4, "p_moment_post"

    .line 23
    .line 24
    const/16 v5, 0xc9

    .line 25
    .line 26
    move-object v3, p0

    .line 27
    invoke-virtual/range {v2 .. v7}, Ll/er60;->n(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLjava/util/Map;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a0(Lrx/subjects/b;Lcom/tantanapp/common/data/JsonAdapter;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-static {p2, p1}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b0(Lcom/tantanapp/common/data/JsonAdapter;Ll/pf60;)Ll/pf60;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic c0(Lcom/tantanapp/common/data/JsonAdapter;Ll/vg60;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic d0(Lcom/tantanapp/common/data/JsonAdapter;Ll/vg60;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic e0(Lcom/tantanapp/common/data/JsonAdapter;Ll/bkj0;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/tantanapp/common/data/ValueObject;

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f0(Lcom/tantanapp/common/data/JsonAdapter;Ll/vg60;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g0(Lcom/tantanapp/common/data/JsonAdapter;Ll/pf60;)Ll/pf60;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/lang/Integer;

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Lcom/tantanapp/common/data/ValueObject;

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static synthetic h0(Ll/bkj0;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public Af(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->h2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Ah()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->g:Ll/jl8;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jl8;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public At()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/vwv;->d0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Bd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->c0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->d0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public Bg(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, p2, v0}, Ll/jka;->Hb(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public Bh(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/wsg;->g()Ll/wsg;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/wsg;->f(Lcom/p1/mobile/android/app/Act;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Bj()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->Z:Ll/jxd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public C6(Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;)Ll/fog;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    if-eq p0, p1, :cond_0

    .line 14
    .line 15
    new-instance p0, Ll/gog;

    .line 16
    .line 17
    invoke-direct {p0}, Ll/gog;-><init>()V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance p0, Ll/eog;

    .line 22
    .line 23
    invoke-direct {p0}, Ll/eog;-><init>()V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    new-instance p0, Ll/gog;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/gog;-><init>()V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public Ca(Lcom/p1/mobile/putong/data/Envelope;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0, p2}, Ll/csj0;->b(Ljava/util/List;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public Co()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Cr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/ksg;->B(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public D8(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/cr00;->L(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->I7()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p2, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    const-string p3, ""

    .line 17
    .line 18
    invoke-static {p1, p2, p0, p3, p4}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r2(Landroid/content/Context;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public E6(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Ea()V
    .locals 0

    .line 1
    invoke-static {}, Ll/b5i;->m()Ll/b5i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/b5i;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Ee(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ljava/util/List;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return-void
.end method

.method public Ek(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hyh;->l(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Fm(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->G:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v0, Ll/pf60;

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {v0, p1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Gc()Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->I7()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Gk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ll/skq0;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public Gm()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/ksg;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public H7()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->B:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public Ha()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->b0:Ll/jxd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public Hj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ib(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "p_meet_greet"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "p_state_explore"

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public In(Landroid/widget/RelativeLayout;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/lbc0;->o5:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget p0, Ll/lbc0;->n5:I

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p2, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Jg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "everyone"

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->nullCheck()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 23
    .line 24
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->new_()Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p3, p1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 31
    .line 32
    const-string p2, "voiceLive"

    .line 33
    .line 34
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceType:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 37
    .line 38
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 39
    .line 40
    .line 41
    move-result-wide p1

    .line 42
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 43
    .line 44
    invoke-virtual {p3, p0}, Ll/jka;->Cc(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    new-instance v0, Ll/t0i;

    .line 49
    .line 50
    invoke-direct {v0, p0, p1, p2}, Ll/t0i;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;J)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ll/u0i;

    .line 54
    .line 55
    invoke-direct {p1, p0}, Ll/u0i;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public K8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->H()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ka(Ljava/lang/String;)Ll/bkj0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/bkj0<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ll/bkj0;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 16
    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 26
    .line 27
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {p1, v0, v1, p0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-object p1

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public Ke()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const-string v0, "limit=20"

    .line 4
    .line 5
    invoke-static {v0}, Ll/dog;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/jka;->yc(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Kk(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    :cond_1
    return p0
.end method

.method public Kn(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jka;->Fb(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/h0i;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/h0i;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public Kr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->new_()Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "aiStory"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceType:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p3, v0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 17
    .line 18
    const/4 p3, 0x0

    .line 19
    new-array p3, p3, [Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    invoke-static {p3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 26
    .line 27
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/data/MessageLocation;->new_()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->nullCheck()V

    .line 34
    .line 35
    .line 36
    const/4 p3, 0x0

    .line 37
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 40
    .line 41
    iput-object p3, v0, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 42
    .line 43
    iput-object p3, v0, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->from:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1}, Ll/vh80;->f(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p3, Ll/r0i;

    .line 52
    .line 53
    invoke-direct {p3, p2, p0, p4}, Ll/r0i;-><init>(Lcom/p1/mobile/putong/data/MessageLocation;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Ll/s0i;

    .line 57
    .line 58
    invoke-direct {v0, p0, p2, p4}, Ll/s0i;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public Lj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->M()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ll(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jka;->W6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Lq()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->v0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public M8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->k0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p2}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public Nh(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Nj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->J()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Nr(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2, p3, p4}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    iput-object p5, v6, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p6, v6, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    const/4 v5, 0x0

    .line 21
    move-object v0, p1

    .line 22
    move-object v1, p2

    .line 23
    move v2, p3

    .line 24
    move-object v3, p4

    .line 25
    move-object v7, p7

    .line 26
    invoke-static/range {v0 .. v7}, Ll/cn40;->n0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public Ns()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    return p0
.end method

.method public Oh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/LruCache2;->cached(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-static {p0, p2}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public Oj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->f:Ll/wzh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    return-object p0
.end method

.method public Ol(Lcom/p1/mobile/putong/data/Music;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Music;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/a;->b2(Lcom/p1/mobile/putong/data/Music;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public P6(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->s2(Landroid/content/Context;ZLcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P9(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/p0i;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ll/p0i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public Pf(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 13
    .line 14
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    xor-int/lit8 v1, p3, 0x1

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/api/b$a;->M(Ljava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ll/i0i;

    .line 23
    .line 24
    invoke-direct {v0, p1, p3, p2}, Ll/i0i;-><init>(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    new-instance p2, Ll/j0i;

    .line 28
    .line 29
    invoke-direct {p2, p1}, Ll/j0i;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public Pm()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Pn(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 18
    .line 19
    return-object p0
.end method

.method public Qm(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ksg;->t(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Qn(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;->i2(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R9(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/ezq;->b(Landroid/view/View;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Rc()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Rd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Re(Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iput-boolean p1, p0, Ll/jka;->H:Z

    .line 4
    .line 5
    return-void
.end method

.method public Rf(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cr00;->I(Ljava/util/ArrayList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S6()Ll/byd0;
    .locals 0

    .line 1
    sget-object p0, Ll/hj00;->K:Ll/byd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public Sd()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ksg;->u()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Sg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p2, p3, p0, p5}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public T7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/hyh;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Tf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 6

    .line 1
    const/4 v3, 0x0

    .line 2
    const/4 v4, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v5, p2

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->Sg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Tg()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->K7()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/Map;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/jka;->J7()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Ll/e0i;

    .line 36
    .line 37
    invoke-direct {v0}, Ll/e0i;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v1, Ll/f0i;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/f0i;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/jka;->K7()Lrx/subjects/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance v0, Ll/g0i;

    .line 59
    .line 60
    invoke-direct {v0}, Ll/g0i;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public Ti(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/d5i;->e()Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Tp()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public U6(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Ui(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "p_meet_greet"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Um(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/FeedModule;->Um(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ur(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/er60;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public V9()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/bch;->b()Ll/bch;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/bch;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Vg()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->S()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Vo()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Vp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p3, p0}, Ll/hyh;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Wd(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->T6(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Wm()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Yb(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->g:Ll/jl8;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/jl8;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Yc(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;ZIZ)V
    .locals 6

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    move-object v1, p0

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    move-object v2, p2

    .line 15
    move v3, p3

    .line 16
    move v4, p4

    .line 17
    move v5, p5

    .line 18
    invoke-virtual/range {v0 .. v5}, Ll/er60;->f(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZIZ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Yr()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->a8()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Z6(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->U7(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Zk(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a6()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->O0:Lrx/subjects/a;

    .line 4
    .line 5
    new-instance v0, Ll/c1i;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/c1i;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public addOnGetMediaAction(Landroid/app/Activity;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->b2()Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->M4(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public argsToMomentActivitiesAct(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public argsToMomentDetailAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public argsToMomentsFeedAct(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;->Y1(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public argsToMomentsFeedPreviewAct(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->b2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public argsToMomentsInProfileAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public argsToMomentsInProfilePreviewAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->K2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public argsToMomentsSimpleTextAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsSimpleTextAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public argsToPhotoAlbumActivitiesAct(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->X1(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public argsToPhotoAlbumFansAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumfans/PhotoAlbumFansAct;->X1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;
    .locals 0
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Z)Landroid/content/Intent;
    .locals 0
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static/range {p1 .. p8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bt()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public buildPhotoAlbumFeedFrag(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Ll/r2m;
    .locals 0

    .line 6
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->n5(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    move-result-object p0

    return-object p0
.end method

.method public buildPhotoAlbumFeedFrag(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ll/r2m;
    .locals 0

    .line 1
    invoke-static/range {p1 .. p7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->o5(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public buildPhotoAlbumFrag()Landroidx/fragment/app/Fragment;
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public cameraSdkLoaded()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/uc4;->n()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public cd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->E()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public cg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object p9, p7

    .line 2
    move-object p7, p2

    .line 3
    new-instance p2, Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 4
    .line 5
    invoke-direct/range {p2 .. p9}, Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "share"

    .line 9
    .line 10
    invoke-static {p1, p0, p2}, Ll/cn40;->R(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public cj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/b5i;->m()Ll/b5i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/b5i;->z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public coreCameraRefreshFilters()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/a;->H:Lcom/p1/mobile/putong/feed/api/a$a;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public coreMomentActivityPoll()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/Exception;

    .line 6
    .line 7
    const-string v0, "coreMomentActivityPoll FeedModule.coreMoment == null"

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->S2()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public coreMomentAddMomentSub(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/subjects/b;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/subjects/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->I:Lrx/subjects/b;

    .line 8
    .line 9
    new-instance v1, Ll/w0i;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/w0i;-><init>(Lrx/subjects/b;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public coreMomentCachedMoments(Ljava/lang/String;ILcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/vg60<",
            "TT;>;>;"
        }
    .end annotation

    .line 27
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->W2(Ljava/lang/String;I)Lrx/c;

    move-result-object p0

    new-instance p1, Ll/a1i;

    invoke-direct {p1, p3}, Ll/a1i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public coreMomentCachedMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/api/b;->W2(Ljava/lang/String;I)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance p1, Ll/d0i;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/d0i;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ll/o0i;

    .line 18
    .line 19
    invoke-direct {p1, p2}, Ll/o0i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public coreMomentDeleteLocal(J)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->h3(J)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public coreMomentDeleteMomentSub()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/b;->J:Lrx/subjects/b;

    .line 4
    .line 5
    return-object p0
.end method

.method public coreMomentHasMoments(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->i3(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public coreMomentLatest(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->P3(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public coreMomentLike(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->R3(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public coreMomentMoments(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/vg60<",
            "TT;>;>;"
        }
    .end annotation

    .line 17
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->Y3()Lrx/c;

    move-result-object p0

    new-instance v0, Ll/z0i;

    invoke-direct {v0, p1}, Ll/z0i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public coreMomentMoments(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/vg60<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->Z3(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/b1i;

    .line 8
    .line 9
    invoke-direct {p1, p2}, Ll/b1i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public coreMomentMutedUsers()Ll/prl;
    .locals 0

    .line 1
    new-instance p0, Ll/rih;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/rih;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public coreMomentNext(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->b4(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public coreMomentPost(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    :try_start_0
    sget-object p0, Lcom/p1/mobile/putong/feed/data/Moment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    :goto_0
    if-nez p0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/api/b;->j4(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public coreMomentPrevious(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 9
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->l4(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public coreMomentPrevious(Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->m4(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public cq(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "TT;>;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p4}, Ll/jka;->rc(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/y0i;

    .line 8
    .line 9
    invoke-direct {p1, p3}, Ll/y0i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public di(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->dc()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/k0i;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/k0i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public dr()Lcom/p1/mobile/putong/newui/main/base/TabName;
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->w()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ll/owi;->l:Ll/wyd0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->transform(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-nez p0, :cond_2

    .line 23
    .line 24
    invoke-static {}, Ll/cmg;->v()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 34
    .line 35
    :cond_2
    return-object p0
.end method

.method public el()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/jka;->i8(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public et()V
    .locals 0

    .line 1
    invoke-static {}, Ll/uc4;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f6(Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->f:Ll/wzh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f9()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->t1:Lrx/subjects/b;

    .line 4
    .line 5
    return-object p0
.end method

.method public fc()I
    .locals 2

    .line 1
    sget-object p0, Ll/owi;->h:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, -0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 24
    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/StateGuide;->configs:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/StateGuide;->configs:Ljava/util/List;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Configs;

    .line 47
    .line 48
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/Configs;->swipeMomentCount:I

    .line 49
    .line 50
    return p0

    .line 51
    :cond_3
    :goto_0
    return v1
.end method

.method public filter()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/a;->f2()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/jka;->g7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public followingToChat(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jka;->l7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public followingWithExtra(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Ll/jka;->h7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public fs()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->y0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getAbHooker()Ll/m2;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->a:Ll/m2;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCaptionActClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/feed/ui/moments/CaptionAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFeedMediaHandler(Lcom/p1/mobile/android/app/Act;)Ll/keh;
    .locals 0

    .line 1
    new-instance p0, Ll/leh;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/leh;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getFollowIncreaseIncomeHelper()Ll/eul;
    .locals 0

    .line 1
    new-instance p0, Ll/c5h;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/c5h;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getFollowTipsPopupManager()Ll/ful;
    .locals 0

    .line 1
    new-instance p0, Ll/d5h;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/d5h;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getFollowingChangedSub()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->Q0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object p0
.end method

.method public getLatestTopicCreateTimeSub()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->F7()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMoMoVerificationAppId()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/uc4;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMomentLikeChangedSub()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->S0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object p0
.end method

.method public getMomentTrack()Ll/rzl;
    .locals 0

    .line 1
    new-instance p0, Ll/jhh;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jhh;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getMomentsPreviousSub()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->y0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object p0
.end method

.method public getTopShowingPageId(Landroidx/fragment/app/Fragment;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->isPhotoAlbumFrag(Landroidx/fragment/app/Fragment;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->k6()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->C6()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    return-object v0
.end method

.method public getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qhk0$a;->a(Ll/qhk0;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getUserByIdInModule(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public gk(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/jka;->Y7(Ljava/lang/String;Ll/jv00;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public h8()I
    .locals 0

    .line 1
    invoke-static {}, Ll/qfh;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public hk(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/owi;->h:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 17
    .line 18
    invoke-static {p0, v0}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/StateGuide;->configs:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    :goto_0
    return-void

    .line 36
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/StateGuide;->configs:Ljava/util/List;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Configs;

    .line 44
    .line 45
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/data/Configs;->title:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/StateGuide;->configs:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Configs;

    .line 54
    .line 55
    iget v5, p0, Lcom/p1/mobile/putong/feed/data/Configs;->defaultEmotionIndex:I

    .line 56
    .line 57
    const/4 v7, 0x0

    .line 58
    const-string v4, "state_explore"

    .line 59
    .line 60
    move-object v2, p1

    .line 61
    move-object v6, p2

    .line 62
    invoke-static/range {v2 .. v7}, Ll/zzg;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public hr(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileTextAct;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public ia(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;I)Landroid/view/View;
    .locals 1

    .line 1
    sget p0, Ll/tec0;->i3:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;

    .line 9
    .line 10
    const/4 p1, 0x6

    .line 11
    invoke-virtual {p0, p2, p1, p3}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserSexAndAgeView;->d(Lcom/p1/mobile/putong/data/User;II)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public ik()Landroidx/fragment/app/Fragment;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public initCameraSdk(Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/uc4;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initMomentPostState()V
    .locals 0

    .line 1
    invoke-static {}, Ll/cn40;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public isCameraSdkLoaded()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/uc4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public isLiveNeedDisableAudio(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/CompactMediaPickerAct;

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    instance-of p0, p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    instance-of p0, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    instance-of p0, p1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    instance-of p0, p1, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 26
    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 30
    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 34
    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 38
    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditAct;

    .line 42
    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;

    .line 46
    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 50
    .line 51
    if-nez p0, :cond_1

    .line 52
    .line 53
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 54
    .line 55
    if-nez p0, :cond_1

    .line 56
    .line 57
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 58
    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    return p0

    .line 64
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 65
    return p0
.end method

.method public isMatchedByFollowship(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/tex;->b(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/tex;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public isMomentDetailAct(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 2
    .line 3
    return p0
.end method

.method public isMomentsFeedAct(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;

    .line 2
    .line 3
    return p0
.end method

.method public isMomentsFeedFrag(Landroidx/fragment/app/Fragment;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 2
    .line 3
    return p0
.end method

.method public isPhotoAlbumFeedFrag(Landroidx/fragment/app/Fragment;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    return p0
.end method

.method public isPhotoAlbumFrag(Landroidx/fragment/app/Fragment;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public isPostAlbumPage(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    instance-of p0, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public isPostingMoment()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public j8(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/h3i;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public jb()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->z0:Lrx/subjects/a;

    .line 4
    .line 5
    return-object p0
.end method

.method public jk()V
    .locals 0

    .line 1
    return-void
.end method

.method public ke()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->w()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public ko()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public kq(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->y1:Lrx/subjects/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l8(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jka;->Z7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public ld()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public le(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    new-array p0, v0, [Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p6, ""

    .line 15
    .line 16
    move-object p4, p3

    .line 17
    move-object p5, p7

    .line 18
    move p3, p2

    .line 19
    move-object p2, p0

    .line 20
    invoke-static/range {p1 .. p6}, Ll/cn40;->l0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    move-object v3, p3

    .line 25
    move-object v4, p7

    .line 26
    move p3, p2

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    iput-object p4, v6, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p5, v6, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 34
    .line 35
    new-array p0, v0, [Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v5, 0x0

    .line 42
    move-object v0, p1

    .line 43
    move v2, p3

    .line 44
    move-object v7, p6

    .line 45
    invoke-static/range {v0 .. v7}, Ll/cn40;->n0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public ln()Ll/jxd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->I:Ll/jxd0;

    .line 4
    .line 5
    return-object p0
.end method

.method public mn(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hyh;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public momentRefresh(Ljava/lang/String;Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jka;->Rb(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/v0i;

    .line 8
    .line 9
    invoke-direct {p1, p3}, Ll/v0i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public momentSeeLikeRefreshLikersData()V
    .locals 0

    .line 1
    invoke-static {}, Ll/zq00;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public mr()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->A()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public mute(Ljava/lang/String;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jka;->cc(Ljava/lang/String;Z)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/doi;->j()Ll/doi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ll/doi;->m(Landroid/content/Context;Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n7()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public needBindPhone()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/jka;->i8(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public needUpdateUser()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public ni(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/a;->Y1(I)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public nm(Lcom/p1/mobile/android/app/Act;I)V
    .locals 1

    .line 1
    new-instance p0, Ll/pvg;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, v0}, Ll/pvg;-><init>(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pvg;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public nq()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/jka;->M1:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public oa(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/os/Bundle;",
            "TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditAct;->Y1(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public observeMomentPostState(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cn40;->Z()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/x0i;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/x0i;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public oh(Landroidx/fragment/app/Fragment;)Ljava/lang/String;
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->B6()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->j6()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, ""

    .line 24
    .line 25
    return-object p0
.end method

.method public or(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p6(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public pd()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/vwv;->c0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public personalMediaMomentsFeedPrevious(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "TT;>;>;>;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->cq(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public po(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Detect;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/ksg;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public processMomentLikeStatusChanged(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jka;->Kc(Lcom/p1/mobile/putong/data/Relationship;Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public qg()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public qn()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->I()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public qo(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p1, p0, v0, v1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->X1(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public refreshTopicFeed(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->Yc(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s9()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->Q0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object p0
.end method

.method public sh()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/jka;->H:Z

    .line 4
    .line 5
    return p0
.end method

.method public so()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public startInnerCameraForResult(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/cn40;->r0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startInstaLikePickerAct(Landroid/app/Activity;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public startInstaLikePickerAct(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 12
    new-instance p0, Landroid/content/Intent;

    const-class v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public syncTryLoadLibs()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public t6(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0, p3}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->s2(Landroid/content/Context;ZLcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public tf()Ll/byd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->L:Ll/byd0;

    .line 4
    .line 5
    return-object p0
.end method

.method public toCaptionPage(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public toCaptionPageWithSendAction(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/cn40;->o0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u0(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 2
    .line 3
    return p0
.end method

.method public u6()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public u9(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 8
    .line 9
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public ua()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->G()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ud(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hyh;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public unReadFansUpdate()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->pd()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public updateLatestTopicCreateTime()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jka;->vd()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateUser(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->Ad(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateUserOnBlock(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->Bd(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public us(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/tantanapp/common/data/ValueObject;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p2}, Ll/csj0;->c(Lcom/tantanapp/common/data/ValueObject;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public varargs useFeedInsertViewProxy(Lcom/p1/mobile/android/app/Act;ILjava/util/Map;[Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p2, p0, :cond_1

    .line 3
    .line 4
    const/4 p0, 0x3

    .line 5
    if-eq p2, p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p2, Ll/o9h;

    .line 9
    .line 10
    invoke-direct {p2, p0}, Ll/o9h;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2, p1, p3, p4}, Ll/o9h;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/Map;[Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_1
    invoke-static {}, Ll/j4h;->d()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_3

    .line 23
    .line 24
    invoke-static {}, Ll/j4h;->c()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_3
    :goto_1
    new-instance p0, Ll/p9h;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/p9h;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1, p3, p4}, Ll/o9h;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/Map;[Landroid/view/View;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method

.method public va(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/ksg;->E()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const v0, 0x36ee80

    .line 6
    .line 7
    .line 8
    mul-int/2addr p0, v0

    .line 9
    int-to-long v0, p0

    .line 10
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const-string v3, ""

    .line 14
    .line 15
    invoke-virtual {p0, p2, p3, v2, v3}, Ll/jka;->Ub(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ll/l0i;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/l0i;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Ll/m0i;

    .line 41
    .line 42
    invoke-direct {p1, v0, v1}, Ll/m0i;-><init>(J)V

    .line 43
    .line 44
    .line 45
    new-instance p2, Ll/n0i;

    .line 46
    .line 47
    invoke-direct {p2}, Ll/n0i;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public vj(Z)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/cmg;->F(Z)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public vm(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->g8(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public xa(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/b5i;->m()Ll/b5i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/b5i;->j()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/d5i;->g(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public xl(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-static {p1}, Ll/dog;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jka;->yc(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public xm(Ljava/lang/Object;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 6
    .line 7
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/wzh0;->insert(Lcom/tantanapp/common/data/DbObject;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public yj(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cr00;->H(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 9
    .line 10
    iget-object p0, p0, Ll/qzg;->d:Ll/kh00;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/kh00;->F(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public yq()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/owi;->g:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public zd(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p2, p1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method
