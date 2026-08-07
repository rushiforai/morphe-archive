.class public Ll/ljj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:[Ljava/lang/String;

.field public static b:[I

.field public static c:[I

.field public static d:[Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ll/bkj0<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static e:[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const-string v0, "new"

    .line 2
    .line 3
    const-string v1, "select"

    .line 4
    .line 5
    const-string v2, "nearby"

    .line 6
    .line 7
    const-string v3, "online"

    .line 8
    .line 9
    const-string v4, "popular"

    .line 10
    .line 11
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/ljj;->a:[Ljava/lang/String;

    .line 16
    .line 17
    sget v0, Ll/dbc0;->bv:I

    .line 18
    .line 19
    sget v1, Ll/dbc0;->dv:I

    .line 20
    .line 21
    sget v2, Ll/dbc0;->ev:I

    .line 22
    .line 23
    sget v3, Ll/dbc0;->cv:I

    .line 24
    .line 25
    sget v4, Ll/dbc0;->fv:I

    .line 26
    .line 27
    filled-new-array {v0, v1, v2, v3, v4}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ll/ljj;->b:[I

    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/core/R$string;->eq:I

    .line 34
    .line 35
    sget v1, Lcom/p1/mobile/putong/core/R$string;->gq:I

    .line 36
    .line 37
    sget v2, Lcom/p1/mobile/putong/core/R$string;->dq:I

    .line 38
    .line 39
    sget v3, Lcom/p1/mobile/putong/core/R$string;->fq:I

    .line 40
    .line 41
    sget v4, Lcom/p1/mobile/putong/core/R$string;->cq:I

    .line 42
    .line 43
    filled-new-array {v0, v1, v2, v3, v4}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Ll/ljj;->c:[I

    .line 48
    .line 49
    sget v0, Lcom/p1/mobile/putong/core/R$string;->rq:I

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget v1, Lcom/p1/mobile/putong/core/R$string;->sq:I

    .line 56
    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget v2, Lcom/p1/mobile/putong/core/R$string;->qq:I

    .line 62
    .line 63
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v0, v1, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sget v1, Lcom/p1/mobile/putong/core/R$string;->xq:I

    .line 72
    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget v2, Lcom/p1/mobile/putong/core/R$string;->yq:I

    .line 78
    .line 79
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    sget v3, Lcom/p1/mobile/putong/core/R$string;->wq:I

    .line 84
    .line 85
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-static {v1, v2, v3}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    sget v2, Lcom/p1/mobile/putong/core/R$string;->oq:I

    .line 94
    .line 95
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    sget v3, Lcom/p1/mobile/putong/core/R$string;->pq:I

    .line 100
    .line 101
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    sget v4, Lcom/p1/mobile/putong/core/R$string;->nq:I

    .line 106
    .line 107
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-static {v2, v3, v4}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    sget v3, Lcom/p1/mobile/putong/core/R$string;->uq:I

    .line 116
    .line 117
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    sget v4, Lcom/p1/mobile/putong/core/R$string;->vq:I

    .line 122
    .line 123
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    sget v5, Lcom/p1/mobile/putong/core/R$string;->tq:I

    .line 128
    .line 129
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-static {v3, v4, v5}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    sget v4, Lcom/p1/mobile/putong/core/R$string;->lq:I

    .line 138
    .line 139
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    sget v5, Lcom/p1/mobile/putong/core/R$string;->mq:I

    .line 144
    .line 145
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    sget v6, Lcom/p1/mobile/putong/core/R$string;->kq:I

    .line 150
    .line 151
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    invoke-static {v4, v5, v6}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    filled-new-array {v0, v1, v2, v3, v4}, [Ll/bkj0;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    sput-object v0, Ll/ljj;->d:[Ll/bkj0;

    .line 164
    .line 165
    sget v0, Lcom/p1/mobile/putong/core/R$string;->jq:I

    .line 166
    .line 167
    sget v1, Lcom/p1/mobile/putong/core/R$string;->iq:I

    .line 168
    .line 169
    sget v2, Lcom/p1/mobile/putong/core/R$string;->hq:I

    .line 170
    .line 171
    filled-new-array {v0, v1, v2, v0, v0}, [I

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    sput-object v0, Ll/ljj;->e:[I

    .line 176
    .line 177
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

.method public static a(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "online"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "popular"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static b(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GPTopicCard;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GPTopicCard;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "female"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 24
    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-ge v0, v3, :cond_4

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Lcom/p1/mobile/putong/core/data/GPTopicCard;

    .line 37
    .line 38
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    sget-object v4, Ll/ljj;->a:[Ljava/lang/String;

    .line 47
    .line 48
    aget-object v4, v4, v0

    .line 49
    .line 50
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 51
    .line 52
    :cond_1
    sget-object v4, Ll/ljj;->c:[I

    .line 53
    .line 54
    aget v4, v4, v0

    .line 55
    .line 56
    iput v4, v3, Lcom/p1/mobile/putong/core/data/GPTopicCard;->topicName:I

    .line 57
    .line 58
    sget-object v4, Ll/ljj;->b:[I

    .line 59
    .line 60
    aget v4, v4, v0

    .line 61
    .line 62
    iput v4, v3, Lcom/p1/mobile/putong/core/data/GPTopicCard;->iconRes:I

    .line 63
    .line 64
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    sget-object v4, Ll/ljj;->d:[Ll/bkj0;

    .line 71
    .line 72
    aget-object v4, v4, v0

    .line 73
    .line 74
    iget-object v4, v4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v4, Ljava/lang/Integer;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    const-string v4, "male"

    .line 80
    .line 81
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-eqz v4, :cond_3

    .line 86
    .line 87
    sget-object v4, Ll/ljj;->d:[Ll/bkj0;

    .line 88
    .line 89
    aget-object v4, v4, v0

    .line 90
    .line 91
    iget-object v4, v4, Ll/bkj0;->b:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v4, Ljava/lang/Integer;

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    sget-object v4, Ll/ljj;->d:[Ll/bkj0;

    .line 97
    .line 98
    aget-object v4, v4, v0

    .line 99
    .line 100
    iget-object v4, v4, Ll/bkj0;->c:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v4, Ljava/lang/Integer;

    .line 103
    .line 104
    :goto_1
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    iput v4, v3, Lcom/p1/mobile/putong/core/data/GPTopicCard;->headerDesc:I

    .line 109
    .line 110
    sget-object v4, Ll/ljj;->e:[I

    .line 111
    .line 112
    aget v4, v4, v0

    .line 113
    .line 114
    iput v4, v3, Lcom/p1/mobile/putong/core/data/GPTopicCard;->payBtnDesc:I

    .line 115
    .line 116
    add-int/lit8 v0, v0, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_4
    return-object p0
.end method
