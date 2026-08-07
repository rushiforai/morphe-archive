.class public final Ll/d36;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d36$a;,
        Ll/d36$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Ll/d36$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    iput-object v0, p0, Ll/d36;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 31
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    iput-object v0, p0, Ll/d36;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    return-void
.end method

.method public constructor <init>(Ll/d36$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/d36;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    invoke-static {p1}, Ll/d36$a;->a(Ll/d36$a;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/d36$a;->a(Ll/d36$a;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1}, Ll/d36$a;->b(Ll/d36$a;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0, v0, p1}, Ll/d36;->f(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;)Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;)Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public e()Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Ll/d36$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d36;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    invoke-static {p1}, Ll/w6o0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/HashMap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 28
    .line 29
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_1

    .line 36
    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    .line 40
    .line 41
    new-instance v3, Ll/z26;

    .line 42
    .line 43
    invoke-direct {v3}, Ll/z26;-><init>()V

    .line 44
    .line 45
    .line 46
    new-instance v4, Ll/a36;

    .line 47
    .line 48
    invoke-direct {v4}, Ll/a36;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v2, v3, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    :cond_1
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_2

    .line 64
    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    .line 68
    .line 69
    new-instance v3, Ll/b36;

    .line 70
    .line 71
    invoke-direct {v3}, Ll/b36;-><init>()V

    .line 72
    .line 73
    .line 74
    new-instance v4, Ll/c36;

    .line 75
    .line 76
    invoke-direct {v4}, Ll/c36;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, v3, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    :cond_2
    new-instance v3, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 84
    .line 85
    invoke-direct {v3}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v3, p0, Ll/d36;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 89
    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_4

    .line 103
    .line 104
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 109
    .line 110
    new-instance v4, Ll/d36$b;

    .line 111
    .line 112
    invoke-direct {v4}, Ll/d36$b;-><init>()V

    .line 113
    .line 114
    .line 115
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 116
    .line 117
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 118
    .line 119
    iput-object v5, v4, Ll/d36$b;->a:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v3, v4, Ll/d36$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 122
    .line 123
    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;

    .line 128
    .line 129
    iput-object v3, v4, Ll/d36$b;->c:Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;

    .line 130
    .line 131
    iget-object v3, v4, Ll/d36$b;->a:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 138
    .line 139
    iput-object v3, v4, Ll/d36$b;->d:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 140
    .line 141
    iget-object v3, p0, Ll/d36;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 142
    .line 143
    if-eqz p2, :cond_3

    .line 144
    .line 145
    invoke-static {v4}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    iget-object v4, v4, Ll/d36$b;->a:Ljava/lang/String;

    .line 150
    .line 151
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 156
    .line 157
    const/4 v7, 0x1

    .line 158
    invoke-virtual {v5, v4, v6, v7}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-virtual {v3, v4}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_3
    invoke-static {v4}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    iget-object v4, v4, Ll/d36$b;->a:Ljava/lang/String;

    .line 171
    .line 172
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 177
    .line 178
    invoke-virtual {v5, v4}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-virtual {v3, v4}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_4
    :goto_1
    return-void
.end method
