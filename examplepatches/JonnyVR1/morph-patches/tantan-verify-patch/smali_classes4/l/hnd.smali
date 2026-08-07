.class public Ll/hnd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nql;


# static fields
.field public static h:I = 0xa

.field public static i:I = 0x7


# instance fields
.field public a:Z

.field public b:I

.field public final c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/Deque<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

.field public final g:Ll/e3i0$e;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hnd;->a:Z

    .line 6
    .line 7
    iput v0, p0, Ll/hnd;->b:I

    .line 8
    .line 9
    new-instance v1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, p0, Ll/hnd;->d:Lrx/subjects/a;

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/hnd;->e:Z

    .line 23
    .line 24
    new-instance v0, Ll/cnd;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/cnd;-><init>(Ll/hnd;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/hnd;->g:Ll/e3i0$e;

    .line 30
    .line 31
    iput-object p1, p0, Ll/hnd;->f:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic h(Ll/hnd;Landroid/view/View;ILandroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hnd;->n(Landroid/view/View;ILandroid/view/ViewGroup;)V

    return-void
.end method

.method public static synthetic i(ILjava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lt p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic j(Ll/hnd;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnd;->o()V

    return-void
.end method

.method public static synthetic k(Ljava/lang/Integer;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public a(Z)I
    .locals 0

    .line 1
    sget p0, Ll/kec0;->d8:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    const-string v1, "default"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/util/Deque;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/view/View;

    .line 24
    .line 25
    iget-object v2, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/util/Deque;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Deque;->size()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0, v1}, Ll/hnd;->q(I)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public c()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    const-string v1, "default"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/util/Deque;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    xor-int/lit8 p0, p0, 0x1

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public d(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hnd;->d:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v0, Ll/fnd;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/fnd;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/gnd;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/gnd;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Landroid/content/Context;Ll/ner;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/hnd;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/hnd;->e:Z

    .line 8
    .line 9
    new-instance v0, Ll/e3i0;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/e3i0;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    move v1, p1

    .line 16
    :goto_0
    sget v2, Ll/hnd;->h:I

    .line 17
    .line 18
    if-ge v1, v2, :cond_3

    .line 19
    .line 20
    invoke-static {}, Ll/gra;->d()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    if-ne v1, v2, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/hnd;->p(Ll/e3i0;)V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/4 v2, 0x3

    .line 34
    if-ne v1, v2, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/hnd;->p(Ll/e3i0;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_1
    invoke-virtual {p0, p1}, Ll/hnd;->a(Z)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const/4 v3, 0x0

    .line 44
    iget-object v4, p0, Ll/hnd;->g:Ll/e3i0$e;

    .line 45
    .line 46
    invoke-virtual {v0, v2, v3, v4}, Ll/e3i0;->d(ILandroid/view/ViewGroup;Ll/e3i0$e;)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    new-instance p1, Ll/dnd;

    .line 53
    .line 54
    invoke-direct {p1}, Ll/dnd;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/end;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/end;-><init>(Ll/hnd;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {p2, p1, v0}, Ll/ner;->creates(Ll/y20;Ll/x20;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public m()Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnd;->f:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic n(Landroid/view/View;ILandroid/view/ViewGroup;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    const-string p3, "default"

    .line 4
    .line 5
    invoke-virtual {p2, p3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 12
    .line 13
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    instance-of p2, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    move-object p2, p1

    .line 27
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 28
    .line 29
    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->p2:Z

    .line 30
    .line 31
    :cond_1
    iget-object p2, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ljava/util/Deque;

    .line 38
    .line 39
    invoke-interface {p2, p1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget p1, p0, Ll/hnd;->b:I

    .line 43
    .line 44
    add-int/2addr p1, v0

    .line 45
    iput p1, p0, Ll/hnd;->b:I

    .line 46
    .line 47
    invoke-static {}, Ll/gra;->d()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    const/4 p1, 0x3

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const/4 p1, 0x4

    .line 56
    :goto_0
    iget p2, p0, Ll/hnd;->b:I

    .line 57
    .line 58
    if-ne p2, p1, :cond_3

    .line 59
    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide p1

    .line 64
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 67
    .line 68
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y2:J

    .line 69
    .line 70
    sub-long/2addr p1, v0

    .line 71
    iput-wide p1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 72
    .line 73
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 76
    .line 77
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A2:J

    .line 78
    .line 79
    const-wide/16 v0, 0x0

    .line 80
    .line 81
    cmp-long p1, p1, v0

    .line 82
    .line 83
    if-lez p1, :cond_3

    .line 84
    .line 85
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 88
    .line 89
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 90
    .line 91
    cmp-long p1, p1, v0

    .line 92
    .line 93
    if-lez p1, :cond_3

    .line 94
    .line 95
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 98
    .line 99
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A2:J

    .line 100
    .line 101
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 104
    .line 105
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 106
    .line 107
    sub-long/2addr p1, v0

    .line 108
    new-instance p3, Ll/pf60;

    .line 109
    .line 110
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 113
    .line 114
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A2:J

    .line 115
    .line 116
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const-string v1, "suggest_network_time"

    .line 121
    .line 122
    invoke-direct {p3, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Ll/pf60;

    .line 126
    .line 127
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 130
    .line 131
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 132
    .line 133
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const-string v2, "card_layout_time"

    .line 138
    .line 139
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    new-instance v1, Ll/pf60;

    .line 143
    .line 144
    const-string v2, "suggest_network_time_diff_card_layout_time"

    .line 145
    .line 146
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-direct {v1, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    filled-new-array {p3, v0, v1}, [Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    const-string p2, "e_homepage_network_and_layout"

    .line 158
    .line 159
    const-string p3, "p_suggest_users_home_view"

    .line 160
    .line 161
    invoke-static {p2, p3, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 162
    .line 163
    .line 164
    :cond_3
    iget-object p1, p0, Ll/hnd;->d:Lrx/subjects/a;

    .line 165
    .line 166
    iget p0, p0, Ll/hnd;->b:I

    .line 167
    .line 168
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hnd;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hnd;->m()Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/uj4;->c(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final p(Ll/e3i0;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->j()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->getFrameLayoutId()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-lez v2, :cond_0

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->getFrameLayoutId()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    new-instance v3, Ll/hnd$a;

    .line 42
    .line 43
    invoke-direct {v3, p0, v1}, Ll/hnd$a;-><init>(Ll/hnd;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p1, v2, v1, v3}, Ll/e3i0;->d(ILandroid/view/ViewGroup;Ll/e3i0$e;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    return-void
.end method

.method public final q(I)V
    .locals 1

    .line 1
    iget p0, p0, Ll/hnd;->b:I

    .line 2
    .line 3
    sget v0, Ll/hnd;->h:I

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/hnd;->i:I

    .line 8
    .line 9
    if-gt p1, p0, :cond_0

    .line 10
    .line 11
    const-string p0, "left_card_count"

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "e_preload_home_card_used"

    .line 26
    .line 27
    const-string v0, "p_suggest_users_home_view"

    .line 28
    .line 29
    invoke-static {p1, v0, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
