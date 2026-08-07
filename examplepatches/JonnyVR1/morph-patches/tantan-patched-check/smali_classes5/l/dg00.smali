.class public Ll/dg00;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static volatile h:Ll/dg00;

.field public static i:Z


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/jq2;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;>;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/pr2;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;>;"
        }
    .end annotation
.end field

.field public f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "feed"

    .line 2
    .line 3
    const-string v1, "live"

    .line 4
    .line 5
    const-string v2, "account"

    .line 6
    .line 7
    const-string v3, "core"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/dg00;->g:Ljava/util/List;

    .line 18
    .line 19
    new-instance v0, Ll/dg00;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/dg00;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Ll/dg00;->h:Ll/dg00;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    sput-boolean v0, Ll/dg00;->i:Z

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Ll/dg00;->b:Lrx/subjects/a;

    .line 16
    .line 17
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/dg00;->c:Ljava/util/Map;

    .line 23
    .line 24
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/dg00;->d:Ljava/util/Map;

    .line 30
    .line 31
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v2, p0, Ll/dg00;->e:Ljava/util/Map;

    .line 37
    .line 38
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iput-object v2, p0, Ll/dg00;->f:Lrx/subjects/a;

    .line 43
    .line 44
    new-instance v2, Lcom/tantanapp/putong/module/AccountModuleHolder;

    .line 45
    .line 46
    invoke-direct {v2}, Lcom/tantanapp/putong/module/AccountModuleHolder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v3, "account"

    .line 50
    .line 51
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    new-instance v2, Lcom/tantanapp/putong/module/CoreModuleHolder;

    .line 55
    .line 56
    invoke-direct {v2}, Lcom/tantanapp/putong/module/CoreModuleHolder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v4, "core"

    .line 60
    .line 61
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    new-instance v2, Lcom/tantanapp/putong/module/FeedModuleHolder;

    .line 65
    .line 66
    invoke-direct {v2}, Lcom/tantanapp/putong/module/FeedModuleHolder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v5, "feed"

    .line 70
    .line 71
    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    new-instance v2, Lcom/tantanapp/putong/module/LiveModuleHolder;

    .line 75
    .line 76
    invoke-direct {v2}, Lcom/tantanapp/putong/module/LiveModuleHolder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v6, "live"

    .line 80
    .line 81
    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    new-instance v0, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;

    .line 85
    .line 86
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/serviceprovider/AccountServiceHolder;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    new-instance v0, Lcom/p1/mobile/putong/api/serviceprovider/CoreServiceHolder;

    .line 93
    .line 94
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/serviceprovider/CoreServiceHolder;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    new-instance v0, Lcom/p1/mobile/putong/api/serviceprovider/FeedServiceHolder;

    .line 101
    .line 102
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/serviceprovider/FeedServiceHolder;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-interface {v1, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    new-instance v0, Lcom/p1/mobile/putong/api/serviceprovider/LiveServiceHolder;

    .line 109
    .line 110
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/serviceprovider/LiveServiceHolder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-interface {v1, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    sget-object v0, Ll/dg00;->g:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_0

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    check-cast v1, Ljava/lang/String;

    .line 133
    .line 134
    iget-object v2, p0, Ll/dg00;->c:Ljava/util/Map;

    .line 135
    .line 136
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Ll/dg00;->e:Ljava/util/Map;

    .line 144
    .line 145
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_0
    iget-object v0, p0, Ll/dg00;->c:Ljava/util/Map;

    .line 154
    .line 155
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v1, Ll/xf00;

    .line 160
    .line 161
    invoke-direct {v1}, Ll/xf00;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-static {v0, v1}, Lrx/c;->combineLatest(Ljava/lang/Iterable;Ll/zcj;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Ll/yf00;

    .line 169
    .line 170
    invoke-direct {v1, p0}, Ll/yf00;-><init>(Ll/dg00;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/dg00;->e:Ljava/util/Map;

    .line 177
    .line 178
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    new-instance v1, Ll/zf00;

    .line 183
    .line 184
    invoke-direct {v1}, Ll/zf00;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-static {v0, v1}, Lrx/c;->combineLatest(Ljava/lang/Iterable;Ll/zcj;)Lrx/c;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    new-instance v1, Ll/ag00;

    .line 192
    .line 193
    invoke-direct {v1, p0}, Ll/ag00;-><init>(Ll/dg00;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Ll/dg00;->G()V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public static H()Lrx/c$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c$d<",
            "TT;TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/cg00;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cg00;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic a(Ljava/util/List;Ll/jq2;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jq2;->n()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Ljava/util/List;Ll/jq2;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jq2;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic c([Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/dg00;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dg00;->x(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Object;Ll/uxj0;)Ljava/lang/Object;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f([Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g([Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ll/dg00;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dg00;->w(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i(Lrx/c;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dg00;->b:Lrx/subjects/a;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/tf00;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/tf00;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0, v1}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic j([Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic k(Ll/dg00;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dg00;->a:Ljava/util/Map;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/dg00;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dg00;->s(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static r()Ll/dg00;
    .locals 1

    .line 1
    sget-object v0, Ll/dg00;->h:Ll/dg00;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

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
    check-cast v0, Ll/jq2;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/jq2;->j()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

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
    check-cast v0, Ll/jq2;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/jq2;->k()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public C(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

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
    check-cast v0, Ll/jq2;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/jq2;->l(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public D()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Ll/sf00;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/sf00;-><init>(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/uf00;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/uf00;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->p(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public E()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Ll/vf00;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/vf00;-><init>(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/wf00;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/wf00;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->p(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public F(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dg00;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lrx/subjects/a;

    .line 8
    .line 9
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/dg00;->c:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lrx/subjects/a;

    .line 22
    .line 23
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final G()V
    .locals 1

    .line 1
    new-instance v0, Ll/dg00$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dg00$a;-><init>(Ll/dg00;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/k3d0;->d(Ll/k3d0$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/jq2;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/jq2;->a()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jq2;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jq2;->b()V

    .line 10
    .line 11
    .line 12
    const-string v0, "account"

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/dg00;->F(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public o(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/jq2;

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Ll/jq2;->c(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ll/dg00;->F(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/jq2;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/jq2;->d()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

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
    check-cast v0, Ll/jq2;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/jq2;->f()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/l9c;->i()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final s(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "0x60"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p0, "account"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p1, "0x61"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const-string p0, "core"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p1, "0x62"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    const-string p0, "feed"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    const-string p1, "0x63"

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    const-string p0, "live"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public t(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/dg00;->i:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/dg00;->u(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    sput-boolean p0, Ll/dg00;->i:Z

    .line 9
    .line 10
    return-void
.end method

.method public final u(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dg00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jq2;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jq2;->h()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/bg00;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/bg00;-><init>(Ll/jq2;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/jq2;->e()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/dg00;->v(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "account"

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/jq2;->b()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/dg00;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/pr2;

    .line 8
    .line 9
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 12
    .line 13
    check-cast v2, Ll/dn5;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/pr2;->c()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/4 v4, -0x1

    .line 26
    sparse-switch v3, :sswitch_data_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :sswitch_0
    const-string v3, "live"

    .line 31
    .line 32
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v4, 0x3

    .line 40
    goto :goto_0

    .line 41
    :sswitch_1
    const-string v3, "feed"

    .line 42
    .line 43
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 v4, 0x2

    .line 51
    goto :goto_0

    .line 52
    :sswitch_2
    const-string v3, "core"

    .line 53
    .line 54
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const/4 v4, 0x1

    .line 62
    goto :goto_0

    .line 63
    :sswitch_3
    const-string v3, "account"

    .line 64
    .line 65
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_3

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    const/4 v4, 0x0

    .line 73
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :pswitch_0
    invoke-virtual {v0}, Ll/pr2;->b()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 82
    .line 83
    iput-object v3, v1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/pr2;->a()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;

    .line 90
    .line 91
    iput-object v0, v2, Ll/dn5;->d:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :pswitch_1
    invoke-virtual {v0}, Ll/pr2;->b()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 99
    .line 100
    iput-object v3, v1, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/pr2;->a()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 107
    .line 108
    iput-object v0, v2, Ll/dn5;->c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :pswitch_2
    invoke-virtual {v0}, Ll/pr2;->b()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 116
    .line 117
    iput-object v3, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 118
    .line 119
    invoke-virtual {v0}, Ll/pr2;->a()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 124
    .line 125
    iput-object v0, v2, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :pswitch_3
    invoke-virtual {v0}, Ll/pr2;->b()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    check-cast v3, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 133
    .line 134
    iput-object v3, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/pr2;->a()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 141
    .line 142
    iput-object v0, v2, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 143
    .line 144
    :goto_1
    iget-object p0, p0, Ll/dg00;->e:Ljava/util/Map;

    .line 145
    .line 146
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    check-cast p0, Lrx/subjects/a;

    .line 151
    .line 152
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    nop

    .line 159
    :sswitch_data_0
    .sparse-switch
        -0x462c75d3 -> :sswitch_3
        0x2eaf9f -> :sswitch_2
        0x2fe59e -> :sswitch_1
        0x32b0ec -> :sswitch_0
    .end sparse-switch

    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic w(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dg00;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dg00;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(Ljava/lang/String;)Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dg00;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrx/subjects/a;

    .line 8
    .line 9
    return-object p0
.end method

.method public z(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dg00;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrx/subjects/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method
