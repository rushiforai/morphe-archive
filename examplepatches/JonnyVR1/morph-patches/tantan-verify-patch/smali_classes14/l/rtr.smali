.class public Ll/rtr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivity;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;",
            "Ll/ocu;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/putong/data/Pagination;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/rtr;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/rtr;->b:Ljava/util/Map;

    .line 17
    .line 18
    new-instance v1, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/rtr;->c:Ljava/util/Map;

    .line 24
    .line 25
    new-instance v1, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/rtr;->d:Ljava/util/Map;

    .line 31
    .line 32
    new-instance v1, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/rtr;->e:Ljava/util/Map;

    .line 38
    .line 39
    new-instance v1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Ll/rtr;->f:Ljava/util/List;

    .line 45
    .line 46
    new-instance v1, Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Ll/rtr;->g:Ljava/util/Map;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    iput-boolean v1, p0, Ll/rtr;->i:Z

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_0

    .line 65
    .line 66
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 76
    .line 77
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_1

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_1

    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 102
    .line 103
    iget-object v2, p0, Ll/rtr;->c:Ljava/util/Map;

    .line 104
    .line 105
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 106
    .line 107
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_2

    .line 120
    .line 121
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 140
    .line 141
    iget-object v2, p0, Ll/rtr;->d:Ljava/util/Map;

    .line 142
    .line 143
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 144
    .line 145
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 152
    .line 153
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_3

    .line 158
    .line 159
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 160
    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 162
    .line 163
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_3

    .line 172
    .line 173
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    iget-object v2, p0, Ll/rtr;->e:Ljava/util/Map;

    .line 180
    .line 181
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 182
    .line 183
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 188
    .line 189
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    .line 190
    .line 191
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-nez v0, :cond_4

    .line 196
    .line 197
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 198
    .line 199
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    .line 200
    .line 201
    new-instance v1, Ll/ltr;

    .line 202
    .line 203
    invoke-direct {v1, p0}, Ll/ltr;-><init>(Ll/rtr;)V

    .line 204
    .line 205
    .line 206
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 207
    .line 208
    .line 209
    :cond_4
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 210
    .line 211
    iput-object p1, p0, Ll/rtr;->h:Lcom/p1/mobile/putong/data/Pagination;

    .line 212
    .line 213
    invoke-static {p0}, Ll/y6u;->k(Ll/rtr;)Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    iput-boolean p1, p0, Ll/rtr;->i:Z

    .line 218
    .line 219
    invoke-virtual {p0}, Ll/rtr;->g()V

    .line 220
    .line 221
    .line 222
    return-void
.end method

.method public static synthetic a(Ll/gur;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gur;->c:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b(Ll/rtr;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rtr;->n(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/rtr;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rtr;->q(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;)V

    return-void
.end method

.method public static synthetic d(Ll/rtr;Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rtr;->o(Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/rtr;Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rtr;->p(Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V

    return-void
.end method


# virtual methods
.method public final g()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/rtr;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_3

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 23
    .line 24
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->reference:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 25
    .line 26
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v3}, Ll/rtr;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {v3}, Ll/y6u;->r(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_2

    .line 40
    .line 41
    sget-object v4, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 44
    .line 45
    .line 46
    move-result-wide v4

    .line 47
    long-to-double v4, v4

    .line 48
    iget-wide v6, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 49
    .line 50
    sub-double/2addr v4, v6

    .line 51
    const-wide v6, 0x41d34fd900000000L    # 1.296E9

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    cmpg-double v3, v4, v6

    .line 57
    .line 58
    if-gtz v3, :cond_0

    .line 59
    .line 60
    :cond_2
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    iget-object v1, p0, Ll/rtr;->a:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/rtr;->a:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public h()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rtr;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivity;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rtr;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rtr;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/otr;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/otr;-><init>(Ll/rtr;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public k()Lcom/p1/mobile/putong/data/Pagination;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rtr;->h:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;",
            "Ll/ocu;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rtr;->g:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/rtr;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/rtr;->h:Lcom/p1/mobile/putong/data/Pagination;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->reference:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/rtr;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->isMultiCallAudience()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->isMultiCallAudienceGoing()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {p0}, Ll/y6u;->r(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    return-object p0
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->liveActivities:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/rtr;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rtr;->g:Ljava/util/Map;

    .line 2
    .line 3
    new-instance v0, Ll/ocu;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ocu;-><init>(Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rtr;->b:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->liveId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r(Ll/rtr;)Ll/rtr;
    .locals 3
    .param p1    # Ll/rtr;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/y6u;->k(Ll/rtr;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/rtr;->i:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/rtr;->a:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p1, Ll/rtr;->a:Ljava/util/List;

    .line 13
    .line 14
    new-instance v2, Ll/ptr;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/ptr;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Ll/y6u;->d(Ljava/util/Collection;Ljava/util/Collection;Ll/qcj;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/rtr;->c:Ljava/util/Map;

    .line 23
    .line 24
    iget-object v1, p1, Ll/rtr;->c:Ljava/util/Map;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/rtr;->d:Ljava/util/Map;

    .line 30
    .line 31
    iget-object v1, p1, Ll/rtr;->d:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/rtr;->e:Ljava/util/Map;

    .line 37
    .line 38
    iget-object v1, p1, Ll/rtr;->e:Ljava/util/Map;

    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p1, Ll/rtr;->h:Lcom/p1/mobile/putong/data/Pagination;

    .line 44
    .line 45
    iput-object p1, p0, Ll/rtr;->h:Lcom/p1/mobile/putong/data/Pagination;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/rtr;->g()V

    .line 48
    .line 49
    .line 50
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/rtr;
    .locals 9
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_b

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_8

    .line 8
    .line 9
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iget-object v2, p0, Ll/rtr;->e:Ljava/util/Map;

    .line 38
    .line 39
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    .line 48
    .line 49
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 74
    .line 75
    iget-object v2, p0, Ll/rtr;->d:Ljava/util/Map;

    .line 76
    .line 77
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 78
    .line 79
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 86
    .line 87
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_3

    .line 92
    .line 93
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_3

    .line 106
    .line 107
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 112
    .line 113
    iget-object v2, p0, Ll/rtr;->c:Ljava/util/Map;

    .line 114
    .line 115
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_3
    invoke-virtual {p0}, Ll/rtr;->j()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 126
    .line 127
    invoke-virtual {v1}, Ll/vwt;->C4()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    new-instance v2, Ljava/util/ArrayList;

    .line 132
    .line 133
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .line 135
    .line 136
    new-instance v3, Ljava/util/ArrayList;

    .line 137
    .line 138
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 139
    .line 140
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    .line 141
    .line 142
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 143
    .line 144
    .line 145
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 146
    .line 147
    .line 148
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    const/4 v5, 0x0

    .line 153
    move v6, v5

    .line 154
    :goto_3
    if-ge v6, v4, :cond_5

    .line 155
    .line 156
    new-instance v7, Ljava/util/Random;

    .line 157
    .line 158
    invoke-direct {v7}, Ljava/util/Random;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 162
    .line 163
    .line 164
    move-result v8

    .line 165
    invoke-virtual {v7, v8}, Ljava/util/Random;->nextInt(I)I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    invoke-interface {v3, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    check-cast v7, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 174
    .line 175
    iget-object v8, v7, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->liveActivities:Ljava/util/List;

    .line 176
    .line 177
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    if-nez v8, :cond_4

    .line 182
    .line 183
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result v7

    .line 190
    const/4 v8, 0x2

    .line 191
    if-ne v7, v8, :cond_4

    .line 192
    .line 193
    goto :goto_4

    .line 194
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_5
    :goto_4
    if-lez v0, :cond_a

    .line 198
    .line 199
    if-ge v0, v1, :cond_a

    .line 200
    .line 201
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    if-nez v3, :cond_a

    .line 206
    .line 207
    move v3, v5

    .line 208
    :goto_5
    if-ge v0, v1, :cond_a

    .line 209
    .line 210
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    if-eqz v4, :cond_6

    .line 215
    .line 216
    goto :goto_7

    .line 217
    :cond_6
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    if-lt v3, v4, :cond_7

    .line 222
    .line 223
    move v3, v5

    .line 224
    :cond_7
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 229
    .line 230
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->liveActivities:Ljava/util/List;

    .line 231
    .line 232
    new-instance v6, Ljava/util/Random;

    .line 233
    .line 234
    invoke-direct {v6}, Ljava/util/Random;-><init>()V

    .line 235
    .line 236
    .line 237
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    check-cast v7, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 242
    .line 243
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->liveActivities:Ljava/util/List;

    .line 244
    .line 245
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 246
    .line 247
    .line 248
    move-result v7

    .line 249
    invoke-virtual {v6, v7}, Ljava/util/Random;->nextInt(I)I

    .line 250
    .line 251
    .line 252
    move-result v6

    .line 253
    invoke-interface {v4, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 258
    .line 259
    iget-object v6, p0, Ll/rtr;->a:Ljava/util/List;

    .line 260
    .line 261
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 262
    .line 263
    .line 264
    move-result v6

    .line 265
    iget-object v7, p0, Ll/rtr;->a:Ljava/util/List;

    .line 266
    .line 267
    if-le v6, v0, :cond_8

    .line 268
    .line 269
    invoke-interface {v7, v0, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    goto :goto_6

    .line 273
    :cond_8
    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    :goto_6
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 281
    .line 282
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->liveActivities:Ljava/util/List;

    .line 283
    .line 284
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 285
    .line 286
    .line 287
    move-result v4

    .line 288
    if-eqz v4, :cond_9

    .line 289
    .line 290
    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    :cond_9
    add-int/lit8 v3, v3, 0x1

    .line 294
    .line 295
    add-int/lit8 v0, v0, 0x1

    .line 296
    .line 297
    goto :goto_5

    .line 298
    :cond_a
    :goto_7
    iget-object v0, p0, Ll/rtr;->f:Ljava/util/List;

    .line 299
    .line 300
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 301
    .line 302
    .line 303
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 304
    .line 305
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    .line 306
    .line 307
    new-instance v0, Ll/mtr;

    .line 308
    .line 309
    invoke-direct {v0, p0}, Ll/mtr;-><init>(Ll/rtr;)V

    .line 310
    .line 311
    .line 312
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 313
    .line 314
    .line 315
    iget-object p1, p0, Ll/rtr;->f:Ljava/util/List;

    .line 316
    .line 317
    new-instance v0, Ll/ntr;

    .line 318
    .line 319
    invoke-direct {v0, p0}, Ll/ntr;-><init>(Ll/rtr;)V

    .line 320
    .line 321
    .line 322
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 323
    .line 324
    .line 325
    :cond_b
    :goto_8
    return-object p0
.end method

.method public t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rtr;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    return-object p0
.end method

.method public u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rtr;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 8
    .line 9
    return-object p0
.end method

.method public v(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rtr;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/rtr;->e:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rtr;->g:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/ocu;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/ocu;->b()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public x(Ll/gur;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rtr;->g:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v1, p1, Ll/gur;->e:Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/ocu;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v1, p1, Ll/gur;->c:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/ocu;->d(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/rtr;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v2, p0, Ll/rtr;->a:Ljava/util/List;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p1, Ll/gur;->c:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 32
    .line 33
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v1, Ll/qtr;

    .line 38
    .line 39
    invoke-direct {v1, p1}, Ll/qtr;-><init>(Ll/gur;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v2, v1}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Ll/rtr;->a:Ljava/util/List;

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    iget-object v3, p1, Ll/gur;->c:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 52
    .line 53
    invoke-interface {v1, v2, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ll/ocu;->a()Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Ll/rtr;->g:Ljava/util/Map;

    .line 67
    .line 68
    iget-object v1, p1, Ll/gur;->e:Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 69
    .line 70
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/rtr;->f:Ljava/util/List;

    .line 74
    .line 75
    iget-object p1, p1, Ll/gur;->e:Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 76
    .line 77
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method
