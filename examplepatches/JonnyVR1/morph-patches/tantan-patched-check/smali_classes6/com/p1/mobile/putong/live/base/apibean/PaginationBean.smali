.class public Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;
    }
.end annotation


# instance fields
.field private lastId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lastId"
    .end annotation
.end field

.field private lastPage:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lastPage"
    .end annotation
.end field

.field private lastTimestamp:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lastTimestamp"
    .end annotation
.end field

.field private limit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "limit"
    .end annotation
.end field

.field private links:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "links"
    .end annotation
.end field

.field private total:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "total"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static normalize(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->a(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->normalizeUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->c(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->b(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->normalizeUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->d(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static normalizeUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    invoke-static {p0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_4

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/rnl;->m()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "graph.facebook.com"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0}, Ll/rnl;->E()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    new-instance v2, Ll/rnl$a;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/rnl$a;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v3, "http"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ll/rnl$a;->v(Ljava/lang/String;)Ll/rnl$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "a.b.com"

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ll/rnl$a;->h(Ljava/lang/String;)Ll/rnl$a;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v3, "a"

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ll/rnl$a;->b(Ljava/lang/String;)Ll/rnl$a;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/4 v3, 0x0

    .line 47
    :goto_0
    if-ge v3, v1, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0, v3}, Ll/rnl;->B(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    const-string v5, "after"

    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0, v3}, Ll/rnl;->D(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_0
    const-string v5, "since"

    .line 69
    .line 70
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-nez v5, :cond_1

    .line 75
    .line 76
    const-string v5, "until"

    .line 77
    .line 78
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-nez v5, :cond_1

    .line 83
    .line 84
    const-string v5, "limit"

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-nez v5, :cond_1

    .line 91
    .line 92
    const-string v5, "offset"

    .line 93
    .line 94
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-nez v5, :cond_1

    .line 99
    .line 100
    const-string v5, "page"

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-nez v5, :cond_1

    .line 107
    .line 108
    const-string v5, "gid"

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-nez v5, :cond_1

    .line 115
    .line 116
    const-string v5, "countle"

    .line 117
    .line 118
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    if-nez v5, :cond_1

    .line 123
    .line 124
    const-string v5, "query"

    .line 125
    .line 126
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    if-nez v5, :cond_1

    .line 131
    .line 132
    const-string v5, "untilFeedId"

    .line 133
    .line 134
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    if-nez v5, :cond_1

    .line 139
    .line 140
    const-string v5, "sort"

    .line 141
    .line 142
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    if-nez v5, :cond_1

    .line 147
    .line 148
    const-string v5, "haveRead"

    .line 149
    .line 150
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    if-nez v5, :cond_1

    .line 155
    .line 156
    const-string v5, "untilSortId"

    .line 157
    .line 158
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    if-nez v5, :cond_1

    .line 163
    .line 164
    const-string v5, "maxHaveReadSortId"

    .line 165
    .line 166
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    if-eqz v5, :cond_2

    .line 171
    .line 172
    :cond_1
    invoke-virtual {p0, v3}, Ll/rnl;->D(I)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    invoke-virtual {v2, v4, v5}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :cond_3
    invoke-virtual {v2}, Ll/rnl$a;->d()Ll/rnl;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-virtual {p0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    const-string v0, "http://a.b.com/a"

    .line 193
    .line 194
    invoke-static {p0, v0}, Ll/jyb;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    const-string v0, "?"

    .line 199
    .line 200
    invoke-static {p0, v0}, Ll/jyb;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    return-object p0

    .line 205
    :cond_4
    const/4 p0, 0x0

    .line 206
    return-object p0
.end method


# virtual methods
.method public getLastId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->lastId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLastTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->lastTimestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLimit()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->limit:I

    .line 2
    .line 3
    return p0
.end method

.method public getLinks()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->links:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProcessedNext()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->links:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->a(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getProcessedPrevious()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->links:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;->b(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getTotal()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->total:I

    .line 2
    .line 3
    return p0
.end method

.method public isLastPage()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->lastPage:Z

    .line 2
    .line 3
    return p0
.end method

.method public setLastId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->lastId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLastPage(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->lastPage:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLastTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->lastTimestamp:J

    .line 2
    .line 3
    return-void
.end method

.method public setLimit(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->limit:I

    .line 2
    .line 3
    return-void
.end method

.method public setLinks(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->links:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean$Links;

    .line 2
    .line 3
    return-void
.end method

.method public setTotal(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->total:I

    .line 2
    .line 3
    return-void
.end method
