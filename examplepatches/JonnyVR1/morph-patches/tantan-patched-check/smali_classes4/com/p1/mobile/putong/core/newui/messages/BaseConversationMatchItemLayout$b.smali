.class public Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final synthetic b(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->D:I

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->hp(Z)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide p1

    .line 27
    long-to-double p1, p1

    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 29
    .line 30
    .line 31
    :cond_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 39
    .line 40
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v1, "moments_user_id"

    .line 46
    .line 47
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    new-array v1, v1, [Ll/sfj0$a;

    .line 59
    .line 60
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, [Ll/sfj0$a;

    .line 65
    .line 66
    const-string v1, "e_new_match_notification"

    .line 67
    .line 68
    const-string v2, "p_messages_view"

    .line 69
    .line 70
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->z(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_1

    .line 86
    .line 87
    new-instance v1, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 95
    .line 96
    const-string v4, "other_user_id"

    .line 97
    .line 98
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    const-string v3, "no_chat_entrance_type"

    .line 106
    .line 107
    invoke-static {v3, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    new-array v0, v0, [Ll/sfj0$a;

    .line 119
    .line 120
    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, [Ll/sfj0$a;

    .line 125
    .line 126
    const-string v1, "e_nochat_match_entrance"

    .line 127
    .line 128
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 129
    .line 130
    .line 131
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 132
    .line 133
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 134
    .line 135
    sget v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->D:I

    .line 136
    .line 137
    if-ne v0, v1, :cond_2

    .line 138
    .line 139
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->m1:Ll/mxd0;

    .line 144
    .line 145
    invoke-static {}, Ll/pzi0;->o()J

    .line 146
    .line 147
    .line 148
    move-result-wide v1

    .line 149
    long-to-double v1, v1

    .line 150
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 158
    .line 159
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 160
    .line 161
    sget v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 162
    .line 163
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 164
    .line 165
    if-ne v0, v1, :cond_3

    .line 166
    .line 167
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->g:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;->b2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    goto :goto_1

    .line 178
    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    const/16 v1, 0x1a

    .line 183
    .line 184
    const/4 v2, 0x0

    .line 185
    invoke-static {v0, p1, v2, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    :goto_1
    invoke-static {}, Ll/gra;->C1()Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_4

    .line 194
    .line 195
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v1, p1}, Ll/k05;->d(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    const-string v1, "all_new_match"

    .line 203
    .line 204
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u2(Landroid/content/Intent;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 208
    .line 209
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 214
    .line 215
    new-instance v2, Ll/ti2;

    .line 216
    .line 217
    invoke-direct {v2, p0}, Ll/ti2;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 221
    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 224
    .line 225
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 226
    .line 227
    sget v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->E:I

    .line 228
    .line 229
    if-ne v0, v1, :cond_5

    .line 230
    .line 231
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;->b:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 232
    .line 233
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->B(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :cond_5
    return-void
.end method
