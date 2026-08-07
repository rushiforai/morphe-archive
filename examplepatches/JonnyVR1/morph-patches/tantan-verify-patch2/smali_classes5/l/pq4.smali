.class public Ll/pq4;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "e_verification_center_policy_popup_disagree"

    .line 2
    .line 3
    const-string v1, "p_verification_center_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "verification_center"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, p1, v0, p2}, Ll/hxf;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "e_verification_center_policy_popup_agree"

    .line 11
    .line 12
    const-string p1, "p_verification_center_policy_popup"

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic e()V
    .locals 2

    .line 1
    const-string v0, "e_verification_center_policy_popup_disagree"

    .line 2
    .line 3
    const-string v1, "p_verification_center_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    const-string p0, "dialog"

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p1, p0, v0, p2}, Ll/hxf;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)V

    .line 10
    .line 11
    .line 12
    const-string p0, "e_verification_center_policy_popup_agree"

    .line 13
    .line 14
    const-string p1, "p_verification_center_policy_popup"

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic h(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {p0, v0, v1}, Ll/pq4;->j(Lcom/p1/mobile/android/app/Act;ZLjava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;ZLjava/lang/Runnable;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    const-string v1, "\u6211\u540c\u610f\u817e\u8baf\u3001\u963f\u91cc\u3001\u706b\u5c71\u91c7\u96c6\u6211\u7684\u9762\u90e8\u4fe1\u606f\u5e76\u4e0e\u5934\u50cf\u5bf9\u6bd4\uff0c\u8be6\u89c1"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/pq4$a;

    .line 14
    .line 15
    invoke-direct {v1, p0, p2, p1}, Ll/pq4$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Z)V

    .line 16
    .line 17
    .line 18
    const/16 v2, 0x1c

    .line 19
    .line 20
    const/16 v3, 0x26

    .line 21
    .line 22
    const/16 v4, 0x21

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 28
    .line 29
    const-string v5, "#FE7E1D"

    .line 30
    .line 31
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-direct {v1, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 39
    .line 40
    .line 41
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "p_verification_center_policy_popup"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/jl80$a;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    const-string v3, "\u6e29\u99a8\u63d0\u793a"

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v2}, Ll/jl80$a;->v0(Landroid/text/method/MovementMethod;)Ll/jl80$a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v2, Ll/kq4;

    .line 77
    .line 78
    invoke-direct {v2, p2, p0, p1}, Ll/kq4;-><init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;Z)V

    .line 79
    .line 80
    .line 81
    const-string p0, "\u540c\u610f\u5e76\u7ee7\u7eed"

    .line 82
    .line 83
    invoke-virtual {v0, p0, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p1, Ll/lq4;

    .line 88
    .line 89
    invoke-direct {p1}, Ll/lq4;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string p2, "\u4e0d\u540c\u610f"

    .line 93
    .line 94
    invoke-virtual {p0, p2, p1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/4 p1, 0x0

    .line 99
    invoke-virtual {p0, p1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const/4 p1, 0x1

    .line 104
    invoke-virtual {p0, p1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance p1, Ll/mq4;

    .line 109
    .line 110
    invoke-direct {p1, v1}, Ll/mq4;-><init>(Ll/l4g0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    new-instance p1, Ll/nq4;

    .line 118
    .line 119
    invoke-direct {p1, v1}, Ll/nq4;-><init>(Ll/l4g0;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/pq4;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/pq4;->m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 6
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    const-string v1, "\u6211\u540c\u610f\u817e\u8baf\u3001\u963f\u91cc\u3001\u706b\u5c71\u91c7\u96c6\u6211\u7684\u9762\u90e8\u4fe1\u606f\u5e76\u4e0e\u5934\u50cf\u5bf9\u6bd4\uff0c\u8be6\u89c1"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "\u300a\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u534f\u8bae\u300b"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/pq4$b;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1, p2}, Ll/pq4$b;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/16 v2, 0x1c

    .line 19
    .line 20
    const/16 v3, 0x26

    .line 21
    .line 22
    const/16 v4, 0x21

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 28
    .line 29
    const-string v5, "#FE7E1D"

    .line 30
    .line 31
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-direct {v1, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 39
    .line 40
    .line 41
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "p_verification_center_policy_popup"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/jl80$a;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    const-string v3, "\u6e29\u99a8\u63d0\u793a"

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v2}, Ll/jl80$a;->v0(Landroid/text/method/MovementMethod;)Ll/jl80$a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v2, Ll/gq4;

    .line 77
    .line 78
    invoke-direct {v2, p0, p1, p2}, Ll/gq4;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const-string p0, "\u540c\u610f\u5e76\u7ee7\u7eed"

    .line 82
    .line 83
    invoke-virtual {v0, p0, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p1, Ll/hq4;

    .line 88
    .line 89
    invoke-direct {p1, p3}, Ll/hq4;-><init>(Ll/x20;)V

    .line 90
    .line 91
    .line 92
    const-string p2, "\u4e0d\u540c\u610f"

    .line 93
    .line 94
    invoke-virtual {p0, p2, p1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/4 p1, 0x0

    .line 99
    invoke-virtual {p0, p1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const/4 p1, 0x1

    .line 104
    invoke-virtual {p0, p1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance p1, Ll/iq4;

    .line 109
    .line 110
    invoke-direct {p1, v1}, Ll/iq4;-><init>(Ll/l4g0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    new-instance p1, Ll/jq4;

    .line 118
    .line 119
    invoke-direct {p1, v1}, Ll/jq4;-><init>(Ll/l4g0;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->q4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object v2, v1

    .line 24
    :cond_1
    :goto_0
    const-string v0, "verified"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const-string v4, "pending"

    .line 31
    .line 32
    if-eqz v3, :cond_5

    .line 33
    .line 34
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_4

    .line 39
    .line 40
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const/4 v0, 0x1

    .line 48
    const-string v3, "verification_center"

    .line 49
    .line 50
    invoke-static {p0, v0, v3}, Ll/x5l0;->m(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    invoke-static {p0, v1, v2}, Ll/zki0;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    return-void

    .line 60
    :cond_4
    :goto_1
    invoke-static {p0, v1, v2}, Ll/zki0;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_5
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    const-string v0, "invalid"

    .line 71
    .line 72
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_6
    const/4 v0, 0x0

    .line 80
    invoke-static {p0, v0}, Ll/zki0;->F(Landroid/content/Context;Z)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_7
    :goto_2
    invoke-static {p0, v1, v2}, Ll/zki0;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;)V
    .locals 2
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->q4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    const-string v1, "verified"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_avatar_verification_succeed_verification_center:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, p0, v1}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const-string v1, "rejected"

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-static {p0}, Ll/pq4;->p(Lcom/p1/mobile/android/app/Act;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    const-string v1, "pending"

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_avatar_verification_review_verification_center:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, p0, v1}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-static {p0}, Ll/pq4;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static p(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "verification_center"

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Ll/x5l0;->m(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_avatarVerification_fail_popup_verificationCenter:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, p0, v1}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static q(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "verification_center"

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Ll/x5l0;->m(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Ll/pq4;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
