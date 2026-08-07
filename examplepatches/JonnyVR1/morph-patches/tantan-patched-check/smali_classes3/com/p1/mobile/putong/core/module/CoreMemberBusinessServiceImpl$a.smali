.class public Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->f0(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PicksUser;Lcom/p1/mobile/android/app/Act;Ll/an70;Ll/sm70;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/data/Relationship;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Z

.field public final synthetic f:Ll/an70;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Z

.field public final synthetic i:Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/an70;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->i:Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->b:Z

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->d:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->e:Z

    .line 12
    .line 13
    iput-object p7, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->f:Ll/an70;

    .line 14
    .line 15
    iput-object p8, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->g:Ljava/lang/String;

    .line 16
    .line 17
    iput-boolean p9, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->h:Z

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    const-string v1, "success"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 9
    .line 10
    const-string v1, "matched"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v3, "superLikedEach"

    .line 35
    .line 36
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    if-ne v0, v3, :cond_0

    .line 41
    .line 42
    const/16 v1, 0xd

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v3, "superLiked"

    .line 60
    .line 61
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    if-ne v0, v3, :cond_2

    .line 66
    .line 67
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->b:Z

    .line 68
    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    const/16 v0, 0xc

    .line 72
    .line 73
    :goto_0
    move v1, v0

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    const/16 v0, 0xb

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v3, "secretcrush"

    .line 93
    .line 94
    invoke-static {v3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    if-ne v0, v3, :cond_3

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    move v1, v2

    .line 102
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 105
    .line 106
    filled-new-array {p1}, [Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    new-instance v2, Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-static {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 124
    .line 125
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 129
    .line 130
    .line 131
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->d:Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C7(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->e:Z

    .line 144
    .line 145
    if-eqz p1, :cond_8

    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->f:Ll/an70;

    .line 148
    .line 149
    invoke-virtual {p1}, Ll/an70;->l()Ll/eo70;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 154
    .line 155
    .line 156
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->b:Z

    .line 157
    .line 158
    if-eqz p1, :cond_7

    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->g:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-nez p1, :cond_5

    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 169
    .line 170
    invoke-static {p1}, Ll/bdr;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 171
    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->h:Z

    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 177
    .line 178
    if-eqz p1, :cond_6

    .line 179
    .line 180
    iget-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->d:Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 183
    .line 184
    .line 185
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 188
    .line 189
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_6
    invoke-static {v0}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 194
    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_7
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->h:Z

    .line 198
    .line 199
    if-eqz p1, :cond_8

    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->c:Lcom/p1/mobile/android/app/Act;

    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->d:Lcom/p1/mobile/putong/data/User;

    .line 204
    .line 205
    invoke-static {p1, v0, v2}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 206
    .line 207
    .line 208
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 209
    .line 210
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 211
    .line 212
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 213
    .line 214
    .line 215
    :cond_8
    :goto_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t()Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-eqz p1, :cond_9

    .line 228
    .line 229
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->h:Z

    .line 230
    .line 231
    if-eqz p0, :cond_9

    .line 232
    .line 233
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 234
    .line 235
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 236
    .line 237
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d9()V

    .line 238
    .line 239
    .line 240
    :cond_9
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl$a;->a(Lcom/p1/mobile/putong/data/Relationship;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
