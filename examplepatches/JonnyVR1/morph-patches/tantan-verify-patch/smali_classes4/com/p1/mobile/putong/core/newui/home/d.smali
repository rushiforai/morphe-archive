.class public Lcom/p1/mobile/putong/core/newui/home/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

.field public h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Z

.field public x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const-string v0, ""

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->a:Ljava/lang/String;

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->b:Ljava/lang/String;

    .line 89
    const-string v1, "click"

    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->c:Ljava/lang/String;

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->d:Ljava/lang/String;

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->e:Ljava/lang/String;

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->f:Ljava/lang/String;

    .line 93
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->g:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 94
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    const/4 v1, 0x0

    .line 95
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 96
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->j:I

    const/4 v2, 0x1

    .line 97
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->k:I

    .line 98
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->l:I

    .line 99
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->m:I

    .line 100
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->n:I

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->o:Ljava/lang/String;

    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->t:Ljava/lang/String;

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->u:Ljava/lang/String;

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->v:Ljava/lang/String;

    .line 105
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->w:Z

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->x:Ljava/util/List;

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->y:Ljava/util/ArrayList;

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->a:Ljava/lang/String;

    .line 109
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->f:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->b:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "click"

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->c:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->d:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->e:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->f:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->g:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 30
    .line 31
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->j:I

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->k:I

    .line 35
    .line 36
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->l:I

    .line 37
    .line 38
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->m:I

    .line 39
    .line 40
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->n:I

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->o:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->t:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->u:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->v:Ljava/lang/String;

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->w:Z

    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->x:Ljava/util/List;

    .line 58
    .line 59
    new-instance v0, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->y:Ljava/util/ArrayList;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->a:Ljava/lang/String;

    .line 67
    .line 68
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 69
    .line 70
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->d:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {}, Ll/pzi0;->o()J

    .line 73
    .line 74
    .line 75
    move-result-wide p1

    .line 76
    const-wide/16 v0, 0x3e8

    .line 77
    .line 78
    div-long/2addr p1, v0

    .line 79
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->f:Ljava/lang/String;

    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public A(I)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->m:I

    .line 2
    .line 3
    return-object p0
.end method

.method public B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public C(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->x:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public D(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public E(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->d:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/pf60;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/p1/mobile/putong/core/newui/home/d;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->y:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public c(Ll/f1g0;Ll/ik4;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    invoke-interface {p1}, Ll/f1g0;->l()Ll/ik4;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/d;->n(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_0
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v0, v0, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 95
    .line 96
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_1

    .line 107
    .line 108
    move v0, v2

    .line 109
    goto :goto_0

    .line 110
    :cond_1
    move v0, v1

    .line 111
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 112
    .line 113
    :goto_1
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v0, v0, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iget-object p1, p1, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 130
    .line 131
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    check-cast p1, Ljava/lang/Boolean;

    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_2

    .line 142
    .line 143
    move p1, v1

    .line 144
    goto :goto_2

    .line 145
    :cond_2
    move p1, v2

    .line 146
    :goto_2
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->k:I

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    const/4 v3, 0x2

    .line 154
    if-eqz v0, :cond_4

    .line 155
    .line 156
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->n(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_4

    .line 177
    .line 178
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_4
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 182
    .line 183
    :goto_3
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->k:I

    .line 184
    .line 185
    :cond_5
    :goto_4
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_7

    .line 190
    .line 191
    invoke-virtual {p2}, Ll/ik4;->b()Ll/ik4$a;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    if-eqz p1, :cond_7

    .line 200
    .line 201
    invoke-virtual {p2}, Ll/ik4;->b()Ll/ik4$a;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iget-object p1, p1, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 206
    .line 207
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-eqz p1, :cond_7

    .line 212
    .line 213
    invoke-virtual {p2}, Ll/ik4;->b()Ll/ik4$a;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iget-object p1, p1, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 218
    .line 219
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    if-eqz p1, :cond_7

    .line 224
    .line 225
    invoke-virtual {p2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    if-eqz p1, :cond_6

    .line 234
    .line 235
    invoke-virtual {p2}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->n(Ljava/lang/String;)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-eqz p1, :cond_6

    .line 246
    .line 247
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->j:I

    .line 248
    .line 249
    goto :goto_5

    .line 250
    :cond_6
    invoke-virtual {p2}, Ll/ik4;->b()Ll/ik4$a;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iget-object p1, p1, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 255
    .line 256
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    check-cast p1, Ljava/lang/Boolean;

    .line 261
    .line 262
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 263
    .line 264
    .line 265
    move-result p1

    .line 266
    xor-int/2addr p1, v1

    .line 267
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->j:I

    .line 268
    .line 269
    :goto_5
    invoke-virtual {p2}, Ll/ik4;->b()Ll/ik4$a;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    iget-object p1, p1, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 274
    .line 275
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    check-cast p1, Ljava/lang/Boolean;

    .line 280
    .line 281
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->l:I

    .line 286
    .line 287
    :cond_7
    return-object p0
.end method

.method public d(Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-interface {p1}, Ll/f1g0;->o()Ll/ik4;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/d;->n(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_0

    .line 73
    .line 74
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 82
    .line 83
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ljava/lang/Boolean;

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    xor-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 96
    .line 97
    :goto_0
    invoke-virtual {p1}, Ll/ik4;->b()Ll/ik4$a;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iget-object p1, p1, Ll/ik4$a;->b:Lrx/subjects/a;

    .line 102
    .line 103
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Ljava/lang/Boolean;

    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->k:I

    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    const/4 v2, 0x2

    .line 121
    if-eqz v0, :cond_2

    .line 122
    .line 123
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_2

    .line 132
    .line 133
    invoke-virtual {p1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->n(Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_2

    .line 144
    .line 145
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_2
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 149
    .line 150
    :goto_1
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->k:I

    .line 151
    .line 152
    :cond_3
    return-object p0
.end method

.method public e(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "pageId"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->g:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "action_name"

    .line 15
    .line 16
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    const-string v0, "action_type"

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    const-string v0, "version"

    .line 27
    .line 28
    sget-object v1, Ll/uqb0;->s:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "update_relationships_source"

    .line 40
    .line 41
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    const-string p0, "os"

    .line 45
    .line 46
    const-string v0, "android"

    .line 47
    .line 48
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->g:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()[Ll/pf60;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
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
    new-instance v1, Ll/pf60;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->g:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const-string v3, "actionname"

    .line 15
    .line 16
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/pf60;

    .line 23
    .line 24
    const-string v2, "moments_user_id"

    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->d:Ljava/lang/String;

    .line 27
    .line 28
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->i:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "next_IsWhiteBlock"

    .line 41
    .line 42
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->j:I

    .line 50
    .line 51
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "IsWhiteBlock"

    .line 56
    .line 57
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->l:I

    .line 65
    .line 66
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v2, "normal_pic"

    .line 71
    .line 72
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->k:I

    .line 80
    .line 81
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const-string v2, "next_normal_pic"

    .line 86
    .line 87
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    new-instance v1, Ll/pf60;

    .line 95
    .line 96
    const-string v2, "actiontype"

    .line 97
    .line 98
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->c:Ljava/lang/String;

    .line 99
    .line 100
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    new-instance v1, Ll/pf60;

    .line 107
    .line 108
    const-string v2, "code"

    .line 109
    .line 110
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->e:Ljava/lang/String;

    .line 111
    .line 112
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance v1, Ll/pf60;

    .line 119
    .line 120
    const-string v2, "create_time"

    .line 121
    .line 122
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->f:Ljava/lang/String;

    .line 123
    .line 124
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    new-instance v1, Ll/pf60;

    .line 131
    .line 132
    const-string v2, "update_relationships_module_id"

    .line 133
    .line 134
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->b:Ljava/lang/String;

    .line 135
    .line 136
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    new-instance v1, Ll/pf60;

    .line 143
    .line 144
    const-string v2, "update_relationships_page_id"

    .line 145
    .line 146
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->a:Ljava/lang/String;

    .line 147
    .line 148
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    new-instance v1, Ll/pf60;

    .line 155
    .line 156
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 157
    .line 158
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    const-string v3, "update_relationships_source"

    .line 163
    .line 164
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    new-instance v1, Ll/pf60;

    .line 171
    .line 172
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->m:I

    .line 173
    .line 174
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    const-string v3, "pic_uploads"

    .line 179
    .line 180
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    new-instance v1, Ll/pf60;

    .line 187
    .line 188
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->n:I

    .line 189
    .line 190
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    const-string v3, "pic_num"

    .line 195
    .line 196
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    new-instance v1, Ll/pf60;

    .line 203
    .line 204
    const-string v2, "pic_url"

    .line 205
    .line 206
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->o:Ljava/lang/String;

    .line 207
    .line 208
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    new-instance v1, Ll/pf60;

    .line 215
    .line 216
    const-string v2, "suggest_info"

    .line 217
    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->p:Ljava/lang/String;

    .line 219
    .line 220
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    new-instance v1, Ll/pf60;

    .line 227
    .line 228
    const-string v2, "swipe_scene"

    .line 229
    .line 230
    const-string v3, "default"

    .line 231
    .line 232
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    new-instance v1, Ll/pf60;

    .line 239
    .line 240
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->q:Z

    .line 241
    .line 242
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    const-string v3, "city_cover"

    .line 247
    .line 248
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    new-instance v1, Ll/pf60;

    .line 255
    .line 256
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->r:Z

    .line 257
    .line 258
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    const-string v3, "is_selected_users"

    .line 263
    .line 264
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    new-instance v1, Ll/pf60;

    .line 271
    .line 272
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->s:Z

    .line 273
    .line 274
    if-eqz v2, :cond_0

    .line 275
    .line 276
    const-string v2, "mystery"

    .line 277
    .line 278
    goto :goto_0

    .line 279
    :cond_0
    const-string v2, "normal"

    .line 280
    .line 281
    :goto_0
    const-string v3, "mystery_status"

    .line 282
    .line 283
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    new-instance v1, Ll/pf60;

    .line 290
    .line 291
    const-string v2, ","

    .line 292
    .line 293
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->x:Ljava/util/List;

    .line 294
    .line 295
    invoke-static {v2, v3}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    const-string v3, "profile_list_showed"

    .line 300
    .line 301
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    new-instance v1, Ll/pf60;

    .line 308
    .line 309
    const-string v2, "card_name"

    .line 310
    .line 311
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/d;->v:Ljava/lang/String;

    .line 312
    .line 313
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    new-instance v1, Ll/pf60;

    .line 320
    .line 321
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->w:Z

    .line 322
    .line 323
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    const-string v3, "online_like"

    .line 328
    .line 329
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 333
    .line 334
    .line 335
    invoke-static {}, Ll/gra;->J3()Z

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    if-eqz v1, :cond_2

    .line 340
    .line 341
    new-instance v1, Ll/pf60;

    .line 342
    .line 343
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 344
    .line 345
    invoke-static {v2}, Ll/jj40;->a(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Z

    .line 346
    .line 347
    .line 348
    move-result v2

    .line 349
    if-eqz v2, :cond_1

    .line 350
    .line 351
    const-string v2, "verified"

    .line 352
    .line 353
    goto :goto_1

    .line 354
    :cond_1
    const-string v2, "tantan"

    .line 355
    .line 356
    :goto_1
    const-string v3, "from_top_tab"

    .line 357
    .line 358
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 365
    .line 366
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    if-eqz v1, :cond_3

    .line 371
    .line 372
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 373
    .line 374
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 375
    .line 376
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result v1

    .line 380
    if-eqz v1, :cond_3

    .line 381
    .line 382
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->d:Ljava/lang/String;

    .line 383
    .line 384
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    if-nez v1, :cond_3

    .line 389
    .line 390
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 391
    .line 392
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 393
    .line 394
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/d;->d:Ljava/lang/String;

    .line 395
    .line 396
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 397
    .line 398
    .line 399
    move-result-object v1

    .line 400
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 401
    .line 402
    .line 403
    move-result v2

    .line 404
    if-eqz v2, :cond_3

    .line 405
    .line 406
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 407
    .line 408
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    move-result v2

    .line 412
    if-eqz v2, :cond_3

    .line 413
    .line 414
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 415
    .line 416
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 417
    .line 418
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 419
    .line 420
    .line 421
    move-result v2

    .line 422
    if-nez v2, :cond_3

    .line 423
    .line 424
    new-instance v2, Ll/pf60;

    .line 425
    .line 426
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 427
    .line 428
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 429
    .line 430
    const-string v3, "portrait_id"

    .line 431
    .line 432
    invoke-direct {v2, v3, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->y:Ljava/util/ArrayList;

    .line 439
    .line 440
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    if-nez v1, :cond_4

    .line 445
    .line 446
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->y:Ljava/util/ArrayList;

    .line 447
    .line 448
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 449
    .line 450
    .line 451
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 452
    .line 453
    .line 454
    move-result p0

    .line 455
    new-array p0, p0, [Ll/pf60;

    .line 456
    .line 457
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 458
    .line 459
    .line 460
    move-result-object p0

    .line 461
    check-cast p0, [Ll/pf60;

    .line 462
    .line 463
    return-object p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->o(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, Ll/d09;->g()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final o(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const-string p0, "VirtualCard"

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public p()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/d;->f:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->g:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Z)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->w:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public z(I)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/d;->n:I

    .line 4
    .line 5
    return-object p0
.end method
