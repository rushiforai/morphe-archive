.class public Ll/ikk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/messages/group/b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dek;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/ikk;->c:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/ikk;->d:Lrx/subjects/a;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Ll/ikk;->f:Z

    .line 18
    .line 19
    return-void
.end method

.method private synthetic E0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikk;->c:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/ikk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ikk;->x0()V

    return-void
.end method

.method public static synthetic f0(Ll/ikk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikk;->F0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/ikk;Ljava/util/List;Ljava/util/List;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ikk;->s0(Ljava/util/List;Ljava/util/List;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h0(Ll/dek;Ll/dek;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "#"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/dek;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p1, Ll/dek;->g:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    :cond_1
    iget-object p0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_2
    const/4 p0, -0x1

    .line 46
    return p0

    .line 47
    :cond_3
    iget-object p0, p0, Ll/dek;->g:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p1, Ll/dek;->g:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

.method public static synthetic i0(Ll/ikk;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikk;->D0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j0(Ll/ikk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikk;->t0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/ikk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ikk;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic l0(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikk;->y0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic m0(Ll/ikk;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ikk;->E0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Ll/ikk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikk;->G0()V

    return-void
.end method

.method public static synthetic o0(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;Ll/uxj0;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ikk;->A0(Lcom/p1/mobile/putong/core/data/ChatGroup;Ll/uxj0;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p0(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ikk;->C0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic q0(Ll/ikk;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ikk;->z0(Ljava/util/List;)V

    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic x0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ikk;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ikk;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->dn(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private synthetic z0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikk;->c:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/core/data/ChatGroup;Ll/uxj0;)Ljava/util/List;
    .locals 5

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ikk;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/e;->V8(Ljava/lang/String;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_6

    .line 26
    .line 27
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_3

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-eqz v3, :cond_3

    .line 77
    .line 78
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-nez v3, :cond_2

    .line 85
    .line 86
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 87
    .line 88
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 89
    .line 90
    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-nez v3, :cond_0

    .line 95
    .line 96
    :cond_2
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_3

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    new-instance v3, Ll/dek;

    .line 108
    .line 109
    invoke-direct {v3}, Ll/dek;-><init>()V

    .line 110
    .line 111
    .line 112
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 113
    .line 114
    iput-object v4, v3, Ll/dek;->c:Ljava/lang/String;

    .line 115
    .line 116
    iput v2, v3, Ll/dek;->e:I

    .line 117
    .line 118
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v4, v3, Ll/dek;->g:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    iput-object v4, v3, Ll/dek;->b:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v4, v3, Ll/dek;->a:Ljava/lang/String;

    .line 131
    .line 132
    iget-boolean v4, p0, Ll/ikk;->b:Z

    .line 133
    .line 134
    iput-boolean v4, v3, Ll/dek;->d:Z

    .line 135
    .line 136
    iput-object v1, v3, Ll/dek;->h:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 137
    .line 138
    iget-object v1, v3, Ll/dek;->g:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_4

    .line 145
    .line 146
    iget-object v1, v3, Ll/dek;->g:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    goto :goto_1

    .line 153
    :cond_4
    const/16 v1, 0x23

    .line 154
    .line 155
    :goto_1
    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_5

    .line 160
    .line 161
    new-instance v1, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string v2, "#"

    .line 164
    .line 165
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    iget-object v2, v3, Ll/dek;->g:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    iput-object v1, v3, Ll/dek;->g:Ljava/lang/String;

    .line 178
    .line 179
    :cond_5
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :cond_6
    new-instance p0, Ll/hkk;

    .line 185
    .line 186
    invoke-direct {p0}, Ll/hkk;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-static {v0, p0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 190
    .line 191
    .line 192
    new-instance p0, Ljava/util/ArrayList;

    .line 193
    .line 194
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 195
    .line 196
    .line 197
    const/4 p1, 0x0

    .line 198
    move p2, v2

    .line 199
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-ge p2, v1, :cond_9

    .line 204
    .line 205
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    check-cast v1, Ll/dek;

    .line 210
    .line 211
    const/4 v3, 0x1

    .line 212
    if-eqz p1, :cond_7

    .line 213
    .line 214
    iget-object p1, p1, Ll/dek;->g:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iget-object v4, v1, Ll/dek;->g:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v4, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    invoke-static {p1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    if-nez p1, :cond_8

    .line 231
    .line 232
    :cond_7
    new-instance p1, Ll/dek;

    .line 233
    .line 234
    invoke-direct {p1}, Ll/dek;-><init>()V

    .line 235
    .line 236
    .line 237
    iput v3, p1, Ll/dek;->e:I

    .line 238
    .line 239
    iget-object v4, v1, Ll/dek;->g:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v4, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    iput-object v3, p1, Ll/dek;->f:Ljava/lang/String;

    .line 246
    .line 247
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    :cond_8
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    add-int/lit8 p2, p2, 0x1

    .line 254
    .line 255
    move-object p1, v1

    .line 256
    goto :goto_2

    .line 257
    :cond_9
    return-object p0
.end method

.method public final synthetic C0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/ikk;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic D0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->m(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ikk;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G0()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/ikk;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    add-int/lit8 v2, v2, -0x1

    .line 14
    .line 15
    iget-object v3, p0, Ll/ikk;->e:Ljava/util/List;

    .line 16
    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/dek;

    .line 24
    .line 25
    iget-object v2, v2, Ll/dek;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, ","

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    add-int/lit8 v1, v1, -0x1

    .line 43
    .line 44
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ll/dek;

    .line 49
    .line 50
    iget-object v1, v1, Ll/dek;->a:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, "user_id"

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "e_delete_group_person_confirm"

    .line 70
    .line 71
    const-string v2, "p_delete_group_person"

    .line 72
    .line 73
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/ikk;->d:Lrx/subjects/a;

    .line 77
    .line 78
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public H0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ikk;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->X:I

    .line 19
    .line 20
    iget-object v3, p0, Ll/ikk;->e:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/wjk;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/wjk;-><init>(Ll/ikk;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1, v2}, Ll/tcz;->E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public I0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/dek;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ikk;->e:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "group_id"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/ikk;->a:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vjk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vjk;-><init>(Ll/ikk;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/zjk;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/zjk;-><init>(Ll/ikk;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ikk;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/akk;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/akk;-><init>(Ll/ikk;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 46
    .line 47
    iget-object v1, p0, Ll/ikk;->a:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->W6(Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/bkk;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/bkk;-><init>(Ll/ikk;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 77
    .line 78
    iget-object v1, p0, Ll/ikk;->a:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Ll/ikk;->c:Lrx/subjects/a;

    .line 85
    .line 86
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v2, Ll/ckk;

    .line 95
    .line 96
    invoke-direct {v2, p0, v0}, Ll/ckk;-><init>(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    new-instance v2, Ll/dkk;

    .line 116
    .line 117
    invoke-direct {v2, p0, v0}, Ll/dkk;-><init>(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/ekk;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/ekk;-><init>(Ll/ikk;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->S8()Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ll/fkk;

    .line 149
    .line 150
    invoke-direct {v1, p0}, Ll/fkk;-><init>(Ll/ikk;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/ikk;->d:Lrx/subjects/a;

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    new-instance v1, Ll/gkk;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Ll/gkk;-><init>(Ll/ikk;)V

    .line 169
    .line 170
    .line 171
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Ll/ikk;->c:Lrx/subjects/a;

    .line 179
    .line 180
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 181
    .line 182
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final r0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    const/16 v1, 0x14

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ll/ikk;->e:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v3, 0x0

    .line 33
    :goto_0
    if-ge v3, v1, :cond_0

    .line 34
    .line 35
    iget-object v4, p0, Ll/ikk;->e:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Ll/dek;

    .line 42
    .line 43
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v4, v4, Ll/dek;->a:Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    add-int/lit8 v3, v3, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 57
    .line 58
    iget-object v3, p0, Ll/ikk;->a:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/core/api/e;->O8(Ljava/lang/String;Ljava/util/List;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    new-instance v3, Ll/xjk;

    .line 69
    .line 70
    invoke-direct {v3, p0, v0, v2}, Ll/xjk;-><init>(Ll/ikk;Ljava/util/List;Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ll/yjk;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/yjk;-><init>(Ll/ikk;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic s0(Ljava/util/List;Ljava/util/List;Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p3, 0x1

    .line 2
    iput-boolean p3, p0, Ll/ikk;->f:Z

    .line 3
    .line 4
    iget-object p3, p0, Ll/ikk;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p3, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/group/b;

    .line 12
    .line 13
    iget-object p3, p0, Ll/ikk;->e:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->n(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/group/b;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->k(Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/ikk;->e:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ikk;->r0()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0, p1}, Ll/r97;->d(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->l(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
