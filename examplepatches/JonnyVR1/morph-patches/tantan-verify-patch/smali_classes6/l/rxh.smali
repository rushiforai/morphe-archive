.class public Ll/rxh;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static a(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_c

    .line 7
    .line 8
    const-string v0, "moment.single.like"

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/mrb0;->I()Lrx/c;

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/b;->S2()Lrx/c;

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/cmb0;->N()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    return v2

    .line 36
    :cond_0
    :goto_0
    move v1, v2

    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :cond_1
    const-string v0, "moment.single.comment"

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-static {}, Ll/mrb0;->I()Lrx/c;

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/b;->S2()Lrx/c;

    .line 55
    .line 56
    .line 57
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/cmb0;->N()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    return v2

    .line 66
    :cond_2
    const-string v0, "moment.single.unlike"

    .line 67
    .line 68
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 77
    .line 78
    invoke-static {}, Ll/vqb0;->a()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageContent;->parent:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->s4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/cmb0;->N()Z

    .line 94
    .line 95
    .line 96
    return v2

    .line 97
    :cond_3
    const-string v0, "followship.conversation.list"

    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_4

    .line 106
    .line 107
    invoke-static {}, Ll/mrb0;->I()Lrx/c;

    .line 108
    .line 109
    .line 110
    return v2

    .line 111
    :cond_4
    const-string v0, "followship.single"

    .line 112
    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    invoke-static {}, Ll/mrb0;->I()Lrx/c;

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_5
    const-string v0, "moment.match.post"

    .line 126
    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_6

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_6
    const-string v0, "moment.match.like"

    .line 137
    .line 138
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_7

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_7
    const-string v0, "moment.match.comment"

    .line 148
    .line 149
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-eqz v0, :cond_8

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_8
    const-string v0, "moment.match.post.feed"

    .line 159
    .line 160
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-eqz v0, :cond_9

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_9
    const-string v0, "state.match.post"

    .line 171
    .line 172
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_a

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :cond_a
    const-string v0, "moment.match.post.like_feed"

    .line 183
    .line 184
    iget-object v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_b

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_b
    :goto_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 195
    .line 196
    if-nez v0, :cond_c

    .line 197
    .line 198
    if-eqz v1, :cond_c

    .line 199
    .line 200
    invoke-static {p0, p1}, Ll/l6i;->d(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 201
    .line 202
    .line 203
    :cond_c
    return v1
.end method

.method public static b()V
    .locals 13

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    new-instance v1, Ll/rxh$a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/rxh$a;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v11, "state.match.post"

    .line 9
    .line 10
    const-string v12, "moment.match.post.like_feed"

    .line 11
    .line 12
    const-string v2, "moment.single.unlike"

    .line 13
    .line 14
    const-string v3, "moment.single.like"

    .line 15
    .line 16
    const-string v4, "moment.single.comment"

    .line 17
    .line 18
    const-string v5, "followship.single"

    .line 19
    .line 20
    const-string v6, "followship.conversation.list"

    .line 21
    .line 22
    const-string v7, "moment.match.like"

    .line 23
    .line 24
    const-string v8, "moment.match.comment"

    .line 25
    .line 26
    const-string v9, "moment.match.post"

    .line 27
    .line 28
    const-string v10, "moment.match.post.feed"

    .line 29
    .line 30
    filled-new-array/range {v2 .. v12}, [Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v1, v2}, Ll/cmb0;->a0(Ll/cmb0$g;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
