.class public Ll/bc20;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public a:Ll/x20;

.field public b:Z


# direct methods
.method public constructor <init>(Ll/x20;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/bc20;->b:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/bc20;->a:Ll/x20;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic k(Ll/bc20;Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bc20;->q(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic l(Ll/bc20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/bc20;->r(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ll/bc20;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bc20;->p(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method private synthetic r(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/lbl0;->c(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->r:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u5()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/xb20;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/xb20;-><init>(Ll/bc20;Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ll/yb20;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1}, Ll/yb20;-><init>(Ll/bc20;Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "NameVerifyChecker"

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_6

    .line 7
    .line 8
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;->idCard:Lcom/p1/mobile/putong/live/base/data/BLiveIdCardVerificationInfo;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    const-string v3, "verified"

    .line 18
    .line 19
    const-string v4, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 20
    .line 21
    const-string v5, "pending"

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    invoke-static {v6, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    if-eqz v6, :cond_1

    .line 32
    .line 33
    iget-boolean p0, p0, Ll/bc20;->b:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-static {v4}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 45
    .line 46
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    move v0, v2

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v0, v1

    .line 55
    :goto_0
    if-nez v0, :cond_5

    .line 56
    .line 57
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;->identity:Lcom/p1/mobile/putong/live/base/data/BLiveIdentity;

    .line 64
    .line 65
    if-eqz p2, :cond_5

    .line 66
    .line 67
    iget-object v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveIdentity;->status:Lcom/p1/mobile/putong/live/base/data/BLiveVerificationStatus;

    .line 68
    .line 69
    invoke-static {v6, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-eqz v5, :cond_4

    .line 74
    .line 75
    iget-boolean p0, p0, Ll/bc20;->b:Z

    .line 76
    .line 77
    if-eqz p0, :cond_3

    .line 78
    .line 79
    invoke-static {v4}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveIdentity;->status:Lcom/p1/mobile/putong/live/base/data/BLiveVerificationStatus;

    .line 87
    .line 88
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-eqz p2, :cond_5

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_5
    move v2, v0

    .line 96
    goto :goto_1

    .line 97
    :cond_6
    move v2, v1

    .line 98
    :goto_1
    if-eqz v2, :cond_7

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_7
    iget-object p2, p0, Ll/bc20;->a:Ll/x20;

    .line 105
    .line 106
    if-eqz p2, :cond_8

    .line 107
    .line 108
    new-instance p2, Ll/th0$a;

    .line 109
    .line 110
    invoke-direct {p2, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 111
    .line 112
    .line 113
    const-string v0, "\u9996\u6b21\u4f7f\u7528\u89c6\u9891\u95ea\u804a\u8bf7\u5148\u5b8c\u6210\u5b9e\u540d\u8ba4\u8bc1"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    const-string v0, "\u5b9e\u540d\u8ba4\u8bc1"

    .line 120
    .line 121
    invoke-virtual {p2, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    const-string v0, "\u53d6\u6d88"

    .line 126
    .line 127
    invoke-virtual {p2, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    const-string v0, "\u53bb\u8ba4\u8bc1"

    .line 132
    .line 133
    invoke-virtual {p2, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {p2, v1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    new-instance v0, Ll/zb20;

    .line 142
    .line 143
    invoke-direct {v0, p1}, Ll/zb20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p2, v0}, Ll/th0$a;->l(Landroid/content/DialogInterface$OnCancelListener;)Ll/th0$a;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    new-instance v0, Ll/ac20;

    .line 151
    .line 152
    invoke-direct {v0, p0, p1}, Ll/ac20;-><init>(Ll/bc20;Lcom/p1/mobile/android/app/Act;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p2, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 164
    .line 165
    .line 166
    :cond_8
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bc20;->a:Ll/x20;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/x20;->call()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bc20;->o(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
