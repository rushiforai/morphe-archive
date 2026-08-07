.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# instance fields
.field public g:Ljava/lang/String;

.field public h:Ll/byd0;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "svip_recover_dlg_show_key"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;->g:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ll/byd0;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;->g:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;->h:Ll/byd0;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;->q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 8

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;->h:Ll/byd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Long;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    return v1

    .line 33
    :cond_2
    invoke-static {}, Ll/s7a;->e()Lcom/p1/mobile/putong/core/data/SvipResumePurchase;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_9

    .line 38
    .line 39
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->o2:Ll/qf7;

    .line 42
    .line 43
    invoke-virtual {v2}, Ll/qf7;->c3()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    iget v0, v0, Lcom/p1/mobile/putong/core/data/SvipResumePurchase;->no_match_swipe_limit:I

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    if-ge v0, v3, :cond_3

    .line 51
    .line 52
    const/16 v0, 0xa

    .line 53
    .line 54
    :cond_3
    if-ge v2, v0, :cond_4

    .line 55
    .line 56
    goto/16 :goto_2

    .line 57
    .line 58
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->o2:Ll/qf7;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/qf7;->b3()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-lez v0, :cond_5

    .line 67
    .line 68
    return v1

    .line 69
    :cond_5
    const-string v0, "svip"

    .line 70
    .line 71
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Ll/joa;->w3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)J

    .line 76
    .line 77
    .line 78
    move-result-wide v4

    .line 79
    const-wide/16 v6, 0x0

    .line 80
    .line 81
    cmp-long v0, v4, v6

    .line 82
    .line 83
    if-lez v0, :cond_9

    .line 84
    .line 85
    invoke-static {}, Ll/pzi0;->o()J

    .line 86
    .line 87
    .line 88
    move-result-wide v6

    .line 89
    const/4 v0, 0x7

    .line 90
    invoke-static {v6, v7, v4, v5, v0}, Ll/tzi0;->g(JJI)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_9

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_6

    .line 109
    .line 110
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_6
    move v0, v1

    .line 122
    :goto_0
    const/4 v2, 0x5

    .line 123
    if-lt v0, v2, :cond_7

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_7
    move v3, v1

    .line 127
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 134
    .line 135
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->o2:Ll/qf7;

    .line 136
    .line 137
    invoke-virtual {v2}, Ll/qf7;->c3()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    const/16 v4, 0x1e

    .line 142
    .line 143
    if-le v2, v4, :cond_8

    .line 144
    .line 145
    return v1

    .line 146
    :cond_8
    if-eqz v3, :cond_9

    .line 147
    .line 148
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_9

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/x0;->h:Ll/byd0;

    .line 155
    .line 156
    invoke-static {}, Ll/pzi0;->o()J

    .line 157
    .line 158
    .line 159
    move-result-wide v2

    .line 160
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    invoke-static {p1, v0}, Ll/hl3;->L(Lcom/p1/mobile/android/app/Act;I)V

    .line 168
    .line 169
    .line 170
    :cond_9
    :goto_2
    return v1
.end method
