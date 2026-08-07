.class public Ll/i4e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(ZLl/abe0;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const-string p1, "p_home,femalevip_score"

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->pick_tantan_credits_users:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "title"

    .line 6
    .line 7
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "buttonText"

    .line 18
    .line 19
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "showCreditScore"

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "creditScore"

    .line 46
    .line 47
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Ljava/lang/String;

    .line 52
    .line 53
    const-string v2, "\u63a2\u63a2\u4fe1\u7528\u5206"

    .line 54
    .line 55
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    const/4 v3, 0x1

    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    invoke-static {}, Ll/s7a;->k()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_0

    .line 67
    .line 68
    invoke-static {}, Ll/joa;->C3()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-nez v2, :cond_0

    .line 73
    .line 74
    if-nez v0, :cond_0

    .line 75
    .line 76
    move v0, v3

    .line 77
    goto :goto_0

    .line 78
    :cond_0
    const/4 v0, 0x0

    .line 79
    :goto_0
    if-eqz v0, :cond_1

    .line 80
    .line 81
    const-string p2, "\u70b9\u51fb\u89e3\u9501"

    .line 82
    .line 83
    const/4 v1, 0x0

    .line 84
    :cond_1
    new-instance v2, Ll/jl80$a;

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-direct {v2, v4}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 91
    .line 92
    .line 93
    sget v4, Ll/kec0;->q3:I

    .line 94
    .line 95
    invoke-virtual {v2, v4}, Ll/jl80$a;->Q(I)Ll/jl80$a;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    new-instance v4, Ll/h4e0;

    .line 100
    .line 101
    invoke-direct {v4, v0, p1}, Ll/h4e0;-><init>(ZLl/abe0;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2, p2, v4}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget p2, Ll/dbc0;->H7:I

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1, v3}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1, v3}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ll/jl80$a;->O()Ll/jl80;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Ll/jl80;->L()Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    check-cast p2, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipCreditScoreIntroView;

    .line 131
    .line 132
    const-string v0, "\u63a2\u63a2\u5206\u7efc\u5408\u8bc4\u4f30\u8be5\u7528\u6237\u5728\u63a2\u63a2\u7684\u6587\u660e\u884c\u4e3a\uff0c\u6ee1\u5206100\uff0c\u6bcf\u65e5\u66f4\u65b0"

    .line 133
    .line 134
    invoke-virtual {p2, p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipCreditScoreIntroView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Ll/jl80;->show()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
