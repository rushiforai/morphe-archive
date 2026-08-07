.class public final Ll/qtk;
.super Ll/g6e;
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

.field public static final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static i:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 1
    const-string v23, "22:00"

    .line 2
    .line 3
    const-string v24, "23:00"

    .line 4
    .line 5
    const-string v1, "00:00"

    .line 6
    .line 7
    const-string v2, "01:00"

    .line 8
    .line 9
    const-string v3, "02:00"

    .line 10
    .line 11
    const-string v4, "03:00"

    .line 12
    .line 13
    const-string v5, "04:00"

    .line 14
    .line 15
    const-string v6, "05:00"

    .line 16
    .line 17
    const-string v7, "06:00"

    .line 18
    .line 19
    const-string v8, "07:00"

    .line 20
    .line 21
    const-string v9, "08:00"

    .line 22
    .line 23
    const-string v10, "09:00"

    .line 24
    .line 25
    const-string v11, "10:00"

    .line 26
    .line 27
    const-string v12, "11:00"

    .line 28
    .line 29
    const-string v13, "12:00"

    .line 30
    .line 31
    const-string v14, "13:00"

    .line 32
    .line 33
    const-string v15, "14:00"

    .line 34
    .line 35
    const-string v16, "15:00"

    .line 36
    .line 37
    const-string v17, "16:00"

    .line 38
    .line 39
    const-string v18, "17:00"

    .line 40
    .line 41
    const-string v19, "18:00"

    .line 42
    .line 43
    const-string v20, "19:00"

    .line 44
    .line 45
    const-string v21, "20:00"

    .line 46
    .line 47
    const-string v22, "21:00"

    .line 48
    .line 49
    filled-new-array/range {v1 .. v24}, [Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sput-object v0, Ll/qtk;->g:Ljava/util/List;

    .line 58
    .line 59
    const-string v23, "23:00"

    .line 60
    .line 61
    const-string v24, "24:00"

    .line 62
    .line 63
    const-string v1, "01:00"

    .line 64
    .line 65
    const-string v2, "02:00"

    .line 66
    .line 67
    const-string v3, "03:00"

    .line 68
    .line 69
    const-string v4, "04:00"

    .line 70
    .line 71
    const-string v5, "05:00"

    .line 72
    .line 73
    const-string v6, "06:00"

    .line 74
    .line 75
    const-string v7, "07:00"

    .line 76
    .line 77
    const-string v8, "08:00"

    .line 78
    .line 79
    const-string v9, "09:00"

    .line 80
    .line 81
    const-string v10, "10:00"

    .line 82
    .line 83
    const-string v11, "11:00"

    .line 84
    .line 85
    const-string v12, "12:00"

    .line 86
    .line 87
    const-string v13, "13:00"

    .line 88
    .line 89
    const-string v14, "14:00"

    .line 90
    .line 91
    const-string v15, "15:00"

    .line 92
    .line 93
    const-string v16, "16:00"

    .line 94
    .line 95
    const-string v17, "17:00"

    .line 96
    .line 97
    const-string v18, "18:00"

    .line 98
    .line 99
    const-string v19, "19:00"

    .line 100
    .line 101
    const-string v20, "20:00"

    .line 102
    .line 103
    const-string v21, "21:00"

    .line 104
    .line 105
    const-string v22, "22:00"

    .line 106
    .line 107
    filled-new-array/range {v1 .. v24}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Ll/qtk;->h:Ljava/util/List;

    .line 116
    .line 117
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g6e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Ll/pej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A0(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->k:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/data/MobileRespInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic B0(Lv/VText;Ll/jl80$a;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 4

    .line 1
    iget p2, p2, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    add-int/2addr p2, v0

    .line 6
    if-gt p2, v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const-wide v2, 0x4056400000000000L    # 89.0

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    mul-double/2addr v0, v2

    .line 18
    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    .line 19
    .line 20
    add-double/2addr v0, v2

    .line 21
    double-to-int p2, v0

    .line 22
    :cond_0
    const/16 v0, 0x63

    .line 23
    .line 24
    if-lt p2, v0, :cond_1

    .line 25
    .line 26
    const-string v0, "99+"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, ""

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p2}, Ll/c17;->q0(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p2, "\u4f60\u79bb\u5f00\u540e\uff0c\u4ecd\u6709 %s \u4e2a\u4eba\u559c\u6b22\u7740\u4f60"

    .line 58
    .line 59
    invoke-static {p2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const/4 p2, 0x1

    .line 71
    const-string v0, "reBackAppGuideDialog"

    .line 72
    .line 73
    invoke-virtual {p0, p2, v0}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic C(Lv/VText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Long;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x3c

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p2, v0, v2

    .line 11
    .line 12
    if-lez p2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ot:I

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "%d%s"

    .line 33
    .line 34
    invoke-static {p2, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic C0()V
    .locals 2

    .line 1
    const-string v0, "e_user_profile_share_agreement_popup_confirm"

    .line 2
    .line 3
    const-string v1, "p_user_profile_share_agreement_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic D()V
    .locals 2

    .line 1
    const-string v0, "e_reback_popup_confirm"

    .line 2
    .line 3
    const-string v1, "p_reback_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic D0(Ll/kcg0;Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/kcg0;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static E0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Z)V
    .locals 6

    .line 1
    new-instance v0, Ll/htk;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v5, p3

    .line 7
    move v4, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/htk;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLl/x20;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/th0$a;

    .line 12
    .line 13
    invoke-direct {p0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Oi:I

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 p2, 0x0

    .line 27
    invoke-virtual {p1, p2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, p2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Qi:I

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Ll/itk;

    .line 48
    .line 49
    invoke-direct {p2, v0}, Ll/itk;-><init>(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic F(Lv/VText;Lv/VButton;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    sget p0, Ll/qa00;->q:I

    .line 6
    .line 7
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static F0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->c8()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/core/R$string;->el:I

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-static {p0, v2, v0, v1, p1}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return v2

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/ui/DialogAct;->Q0(Landroid/content/Context;ILjava/io/Serializable;Z)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static G0(Ljava/lang/String;Z)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    if-nez p1, :cond_1

    .line 11
    .line 12
    const-string p1, "^[0-9]*$"

    .line 13
    .line 14
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/16 v0, 0xb

    .line 32
    .line 33
    if-eq p1, v0, :cond_2

    .line 34
    .line 35
    return v2

    .line 36
    :cond_2
    const-string p1, "^1[0-9]{10}$"

    .line 37
    .line 38
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->accessCode:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 12
    .line 13
    invoke-interface {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->oneClickBindPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static H0(Ll/jl80;)V
    .locals 3
    .param p0    # Ll/jl80;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "input_method"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void

    .line 68
    :catch_0
    move-exception p0

    .line 69
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic I(ZLjava/lang/Runnable;[Ll/jl80;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/fph0;->n()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Ll/fph0;->r()V

    .line 8
    .line 9
    .line 10
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    aget-object p0, p2, p0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static I0()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "good"

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 29
    .line 30
    const-string v1, "hidden"

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const-string v0, "fake"

    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_1
    const-string v0, "other"

    .line 46
    .line 47
    return-object v0
.end method

.method public static synthetic J(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/Integer;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p2, v0}, Ll/dkb;->va(I)V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Al:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {p0, p2, p1, v0, v1}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static J0(Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ShareItemBean;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ShareItemBean;",
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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Tp()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_8

    .line 19
    .line 20
    const-string v2, "\u559c\u6b22"

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-static {v2, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_8

    .line 29
    .line 30
    :cond_0
    const-string v1, "\u5173\u6ce8"

    .line 31
    .line 32
    invoke-static {v1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v3, -0x1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    sget v1, Ll/dbc0;->r6:I

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    invoke-static {v2, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-static {}, Ll/gra;->z()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    sget v1, Ll/dbc0;->y6:I

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    sget v1, Ll/dbc0;->x6:I

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    const-string v1, "\u53d6\u6d88\u5173\u6ce8"

    .line 61
    .line 62
    invoke-static {v1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_5

    .line 67
    .line 68
    const-string v1, "\u53d6\u6d88\u559c\u6b22"

    .line 69
    .line 70
    invoke-static {v1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    move v1, v3

    .line 78
    goto :goto_1

    .line 79
    :cond_5
    :goto_0
    invoke-static {}, Ll/gra;->z()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_6

    .line 84
    .line 85
    sget v1, Ll/dbc0;->C6:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_6
    sget v1, Ll/dbc0;->B6:I

    .line 89
    .line 90
    :goto_1
    if-eq v1, v3, :cond_7

    .line 91
    .line 92
    new-instance v2, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 93
    .line 94
    invoke-direct {v2, p5, v1, p0}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_7
    const/4 v2, 0x0

    .line 99
    :goto_2
    if-eqz v2, :cond_8

    .line 100
    .line 101
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p5

    .line 108
    if-eqz p5, :cond_a

    .line 109
    .line 110
    new-instance p5, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 111
    .line 112
    invoke-static {}, Ll/gra;->z()Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_9

    .line 117
    .line 118
    sget v1, Ll/dbc0;->w6:I

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_9
    sget v1, Ll/dbc0;->v6:I

    .line 122
    .line 123
    :goto_3
    const-string v2, "\u4e0d\u611f\u5174\u8da3"

    .line 124
    .line 125
    invoke-direct {p5, v2, v1, p1}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 126
    .line 127
    .line 128
    invoke-interface {v0, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    :cond_a
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_c

    .line 136
    .line 137
    const-string p1, "share_right"

    .line 138
    .line 139
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_c

    .line 144
    .line 145
    new-instance p1, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 146
    .line 147
    invoke-static {}, Ll/gra;->z()Z

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    if-eqz p2, :cond_b

    .line 152
    .line 153
    sget p2, Ll/dbc0;->E6:I

    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_b
    sget p2, Ll/dbc0;->D6:I

    .line 157
    .line 158
    :goto_4
    const-string p4, "\u533f\u540d\u4e3e\u62a5"

    .line 159
    .line 160
    invoke-direct {p1, p4, p2, p0}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 161
    .line 162
    .line 163
    const/4 p0, 0x0

    .line 164
    invoke-interface {v0, p0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    goto :goto_6

    .line 168
    :cond_c
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-eqz p0, :cond_e

    .line 173
    .line 174
    new-instance p0, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 175
    .line 176
    invoke-static {}, Ll/gra;->z()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_d

    .line 181
    .line 182
    sget p1, Ll/dbc0;->E6:I

    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_d
    sget p1, Ll/dbc0;->D6:I

    .line 186
    .line 187
    :goto_5
    const-string p4, "\u4e3e\u62a5"

    .line 188
    .line 189
    invoke-direct {p0, p4, p1, p2}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 190
    .line 191
    .line 192
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    :cond_e
    :goto_6
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-eqz p0, :cond_11

    .line 200
    .line 201
    new-instance p0, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 202
    .line 203
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-nez p1, :cond_f

    .line 208
    .line 209
    goto :goto_7

    .line 210
    :cond_f
    const-string p6, ""

    .line 211
    .line 212
    :goto_7
    invoke-static {}, Ll/gra;->z()Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-eqz p1, :cond_10

    .line 217
    .line 218
    sget p1, Ll/dbc0;->q6:I

    .line 219
    .line 220
    goto :goto_8

    .line 221
    :cond_10
    sget p1, Ll/dbc0;->p6:I

    .line 222
    .line 223
    :goto_8
    invoke-direct {p0, p6, p1, p3}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 224
    .line 225
    .line 226
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    :cond_11
    invoke-static {p7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    if-nez p0, :cond_12

    .line 234
    .line 235
    invoke-interface {v0, p7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 236
    .line 237
    .line 238
    :cond_12
    new-instance p0, Ll/nsk;

    .line 239
    .line 240
    invoke-direct {p0}, Ll/nsk;-><init>()V

    .line 241
    .line 242
    .line 243
    invoke-static {v0, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    check-cast p0, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 248
    .line 249
    new-instance p1, Ll/osk;

    .line 250
    .line 251
    invoke-direct {p1}, Ll/osk;-><init>()V

    .line 252
    .line 253
    .line 254
    invoke-static {v0, p1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result p2

    .line 262
    if-eqz p2, :cond_13

    .line 263
    .line 264
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    add-int/lit8 p1, p1, 0x1

    .line 268
    .line 269
    invoke-interface {v0, p1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    :cond_13
    return-object v0
.end method

.method public static synthetic K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 8
    .line 9
    new-instance p3, Ll/mtk;

    .line 10
    .line 11
    invoke-direct {p3, p1, p2}, Ll/mtk;-><init>(Lcom/p1/mobile/putong/data/User;Z)V

    .line 12
    .line 13
    .line 14
    const-wide/16 p1, 0x12c

    .line 15
    .line 16
    invoke-static {p0, p3, p1, p2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static K0(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)Ljava/util/List;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/data/Link;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ShareItemBean;",
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
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_8

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, -0x1

    .line 31
    sparse-switch v2, :sswitch_data_0

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :sswitch_0
    const-string v2, "wx"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    const/4 v4, 0x3

    .line 45
    goto :goto_1

    .line 46
    :sswitch_1
    const-string v2, "qz"

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    const/4 v4, 0x2

    .line 56
    goto :goto_1

    .line 57
    :sswitch_2
    const-string v2, "qq"

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    const/4 v4, 0x1

    .line 67
    goto :goto_1

    .line 68
    :sswitch_3
    const-string v2, "mo"

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    move v4, v3

    .line 78
    :goto_1
    packed-switch v4, :pswitch_data_0

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :pswitch_0
    new-instance v1, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 83
    .line 84
    invoke-static {}, Ll/gra;->z()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_4

    .line 89
    .line 90
    sget v2, Ll/dbc0;->A6:I

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    sget v2, Ll/dbc0;->o6:I

    .line 94
    .line 95
    :goto_2
    new-instance v4, Ll/ptk;

    .line 96
    .line 97
    move-object v5, p0

    .line 98
    move-object v6, p2

    .line 99
    move-object/from16 v7, p3

    .line 100
    .line 101
    move-object/from16 v8, p4

    .line 102
    .line 103
    move-object/from16 v9, p5

    .line 104
    .line 105
    move-object/from16 v10, p6

    .line 106
    .line 107
    move-object/from16 v11, p7

    .line 108
    .line 109
    invoke-direct/range {v4 .. v11}, Ll/ptk;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 110
    .line 111
    .line 112
    const-string v5, "\u5fae\u4fe1"

    .line 113
    .line 114
    invoke-direct {v1, v5, v2, v4}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {v0, v3, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :pswitch_1
    new-instance v1, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 122
    .line 123
    invoke-static {}, Ll/gra;->z()Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_5

    .line 128
    .line 129
    sget v2, Ll/dbc0;->m6:I

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_5
    sget v2, Ll/dbc0;->l6:I

    .line 133
    .line 134
    :goto_3
    new-instance v5, Ll/vqk;

    .line 135
    .line 136
    move-object v6, p0

    .line 137
    move-object v7, p2

    .line 138
    move-object/from16 v8, p3

    .line 139
    .line 140
    move-object/from16 v9, p4

    .line 141
    .line 142
    move-object/from16 v10, p5

    .line 143
    .line 144
    move-object/from16 v11, p6

    .line 145
    .line 146
    move-object/from16 v12, p7

    .line 147
    .line 148
    invoke-direct/range {v5 .. v12}, Ll/vqk;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 149
    .line 150
    .line 151
    const-string v3, "QQ\u7a7a\u95f4"

    .line 152
    .line 153
    invoke-direct {v1, v3, v2, v5}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 154
    .line 155
    .line 156
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :pswitch_2
    new-instance v1, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 162
    .line 163
    invoke-static {}, Ll/gra;->z()Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_6

    .line 168
    .line 169
    sget v2, Ll/dbc0;->k6:I

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_6
    sget v2, Ll/dbc0;->j6:I

    .line 173
    .line 174
    :goto_4
    new-instance v5, Ll/uqk;

    .line 175
    .line 176
    move-object v6, p0

    .line 177
    move-object v7, p2

    .line 178
    move-object/from16 v8, p3

    .line 179
    .line 180
    move-object/from16 v9, p4

    .line 181
    .line 182
    move-object/from16 v10, p5

    .line 183
    .line 184
    move-object/from16 v11, p6

    .line 185
    .line 186
    move-object/from16 v12, p7

    .line 187
    .line 188
    invoke-direct/range {v5 .. v12}, Ll/uqk;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 189
    .line 190
    .line 191
    const-string v3, "QQ"

    .line 192
    .line 193
    invoke-direct {v1, v3, v2, v5}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 194
    .line 195
    .line 196
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :pswitch_3
    new-instance v1, Lcom/p1/mobile/putong/core/data/ShareItemBean;

    .line 202
    .line 203
    invoke-static {}, Ll/gra;->z()Z

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    if-eqz v2, :cond_7

    .line 208
    .line 209
    sget v2, Ll/dbc0;->u6:I

    .line 210
    .line 211
    goto :goto_5

    .line 212
    :cond_7
    sget v2, Ll/dbc0;->s6:I

    .line 213
    .line 214
    :goto_5
    new-instance v5, Ll/tqk;

    .line 215
    .line 216
    move-object v6, p0

    .line 217
    move-object v7, p2

    .line 218
    move-object/from16 v8, p3

    .line 219
    .line 220
    move-object/from16 v9, p4

    .line 221
    .line 222
    move-object/from16 v10, p5

    .line 223
    .line 224
    move-object/from16 v11, p6

    .line 225
    .line 226
    move-object/from16 v12, p7

    .line 227
    .line 228
    invoke-direct/range {v5 .. v12}, Ll/tqk;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 229
    .line 230
    .line 231
    const-string v3, "\u670b\u53cb\u5708"

    .line 232
    .line 233
    invoke-direct {v1, v3, v2, v5}, Lcom/p1/mobile/putong/core/data/ShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 234
    .line 235
    .line 236
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :cond_8
    return-object v0

    .line 242
    nop

    .line 243
    :sswitch_data_0
    .sparse-switch
        0xda2 -> :sswitch_3
        0xe20 -> :sswitch_2
        0xe29 -> :sswitch_1
        0xee1 -> :sswitch_0
    .end sparse-switch

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/data/UserStatus;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "RISK_TAG_MANDATORY_PICTURE_VERIFICATION"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    const-string v0, "profile"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/yb5;->I(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/drk;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/drk;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/ork;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/ork;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ll/zrk;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Ll/zrk;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/android/app/Act;Lv/VText;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, Ll/rsk;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/rsk;-><init>(Lv/VText;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p2, p0, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Aq(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static M0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/gra;->v2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u89e6\u53d1\u51b7\u542f\u52a8\u5f39\u7a97\u53d6\u6d88\u5b9e\u9a8c-\u56de\u6d41\u7528\u6237-\u4f18\u5148\u63a8\u8350\u5f39\u7a97"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/hlh0;->c()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Ll/kec0;->Lb:I

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v1, Ll/adc0;->mb:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lv/VImage;

    .line 42
    .line 43
    sget v2, Ll/adc0;->lb:I

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lv/VText;

    .line 50
    .line 51
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c7()Lrx/c;

    .line 56
    .line 57
    .line 58
    const-class v3, Lcom/p1/mobile/android/app/Dialog;

    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const-string v4, "p_reback_popup"

    .line 65
    .line 66
    invoke-static {v4, v3}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 73
    .line 74
    invoke-virtual {v4}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    sget v4, Ll/dbc0;->ep:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    sget v4, Ll/dbc0;->cp:I

    .line 88
    .line 89
    :goto_0
    invoke-virtual {v1, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const/4 v1, 0x1

    .line 101
    invoke-virtual {v0, v1}, Ll/jl80$a;->T(Z)Ll/jl80$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const/4 v1, 0x0

    .line 106
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const-string v1, "10\u500d"

    .line 111
    .line 112
    filled-new-array {v1}, [Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const-string v4, "#fe7e1d"

    .line 121
    .line 122
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 127
    .line 128
    const-string v6, "\u6b22\u8fce\u56de\u6765\uff0c\u6211\u4eec\u5c06\u5bf9\u4f60\u8fdb\u884c\u4f18\u5148\u63a8\u8350\uff0c\u4f60\u5c06\u4f1a\u6bd4\u73b0\u5728\u591a10\u500d\u7684\u4eba\u770b\u5230\u3002\u522b\u8ba9\u559c\u6b22\u4f60\u7684\u4eba\u7b49\u592a\u4e45\u54e6\uff01"

    .line 129
    .line 130
    invoke-static {v6, v1, v4, v5}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/tsk;

    .line 139
    .line 140
    invoke-direct {v1}, Ll/tsk;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v4, "\u53bb\u5212\u5361"

    .line 144
    .line 145
    invoke-virtual {v0, v4, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/usk;

    .line 150
    .line 151
    invoke-direct {v1}, Ll/usk;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v4, "\u653e\u5f03"

    .line 155
    .line 156
    invoke-virtual {v0, v4, v1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    new-instance v1, Ll/wsk;

    .line 161
    .line 162
    invoke-direct {v1, v3, p1}, Ll/wsk;-><init>(Ll/l4g0;Ljava/lang/Runnable;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    new-instance v0, Ll/xsk;

    .line 170
    .line 171
    invoke-direct {v0, v3}, Ll/xsk;-><init>(Ll/l4g0;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, v0}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 179
    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->T6()Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    new-instance v0, Ll/ysk;

    .line 195
    .line 196
    invoke-direct {v0, v2, p1}, Ll/ysk;-><init>(Lv/VText;Ll/jl80$a;)V

    .line 197
    .line 198
    .line 199
    new-instance p1, Ll/zsk;

    .line 200
    .line 201
    invoke-direct {p1}, Ll/zsk;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public static synthetic N(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/Link;",
            "Lcom/p1/mobile/putong/ui/share/ShareHelper$c;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->t0(Ll/z20;)Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 7
    .line 8
    .line 9
    move-result-object p6

    .line 10
    invoke-virtual {p6, p7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->u0(Ll/a30;)Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 15
    .line 16
    move-object v1, p0

    .line 17
    move-object v2, p2

    .line 18
    move-object v4, p3

    .line 19
    move-object v5, p4

    .line 20
    move-object v6, p5

    .line 21
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->A0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic O(ZLcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/fph0;->i(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    instance-of p0, p4, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    move-object p0, p4

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 15
    .line 16
    const p1, 0x9c4b

    .line 17
    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0, p4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->handleAccountErrors(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static O0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Z)V
    .locals 6
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    invoke-static/range {v0 .. v5}, Ll/qtk;->P0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;ZZLl/x20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V
    .locals 8

    .line 1
    new-instance v2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 2
    .line 3
    sget-object v0, Ll/vvp0;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "wechat-session"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v3, "com.tencent.mm"

    .line 12
    .line 13
    filled-new-array {v3}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v4, "\u5fae\u4fe1"

    .line 18
    .line 19
    invoke-direct {v2, v4, v0, v1, v3}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    move-object v0, p0

    .line 23
    move-object v1, p1

    .line 24
    move-object v3, p2

    .line 25
    move-object v4, p3

    .line 26
    move-object v5, p4

    .line 27
    move-object v6, p5

    .line 28
    move-object v7, p6

    .line 29
    invoke-static/range {v0 .. v7}, Ll/qtk;->N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static P0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;ZZLl/x20;)V
    .locals 24
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ll/x20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v3, p0

    .line 2
    .line 3
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/kec0;->kd:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/adc0;->a9:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    move-object v2, v1

    .line 21
    check-cast v2, Landroid/widget/TextView;

    .line 22
    .line 23
    sget v1, Ll/adc0;->hf:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    move-object v4, v1

    .line 30
    check-cast v4, Landroid/widget/LinearLayout;

    .line 31
    .line 32
    sget v1, Ll/adc0;->bd:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v14

    .line 38
    sget v1, Ll/adc0;->U0:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    move-object v11, v1

    .line 45
    check-cast v11, Lv/VText;

    .line 46
    .line 47
    sget v1, Ll/adc0;->Ze:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lv/VEditText;

    .line 54
    .line 55
    sget v5, Ll/adc0;->G1:I

    .line 56
    .line 57
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    move-object v10, v5

    .line 62
    check-cast v10, Lv/VEditText;

    .line 63
    .line 64
    sget v5, Ll/adc0;->O4:I

    .line 65
    .line 66
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    move-object v15, v5

    .line 71
    check-cast v15, Lv/VText;

    .line 72
    .line 73
    sget v5, Ll/adc0;->F3:I

    .line 74
    .line 75
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    move-object v12, v5

    .line 80
    check-cast v12, Lv/VText;

    .line 81
    .line 82
    sget v5, Ll/adc0;->Pb:I

    .line 83
    .line 84
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Landroid/widget/LinearLayout;

    .line 89
    .line 90
    sget v6, Ll/adc0;->Qb:I

    .line 91
    .line 92
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    check-cast v6, Landroid/widget/TextView;

    .line 97
    .line 98
    sget v7, Ll/adc0;->g1:I

    .line 99
    .line 100
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    check-cast v7, Lv/VCheckBox;

    .line 105
    .line 106
    sget v8, Ll/adc0;->Aa:I

    .line 107
    .line 108
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    move-object v13, v8

    .line 113
    check-cast v13, Lv/VButton;

    .line 114
    .line 115
    sget v8, Ll/adc0;->Ba:I

    .line 116
    .line 117
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    check-cast v8, Lv/VButton;

    .line 122
    .line 123
    sget v9, Ll/adc0;->O8:I

    .line 124
    .line 125
    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    check-cast v9, Lv/VText;

    .line 130
    .line 131
    move-object/from16 p3, v14

    .line 132
    .line 133
    const/4 v14, 0x1

    .line 134
    move-object/from16 v16, v2

    .line 135
    .line 136
    new-array v2, v14, [Z

    .line 137
    .line 138
    const/4 v14, 0x0

    .line 139
    aput-boolean v14, v2, v14

    .line 140
    .line 141
    const-string v14, "\u767b\u51fa\u5f53\u524d\u5e10\u53f7"

    .line 142
    .line 143
    move-object/from16 v18, v2

    .line 144
    .line 145
    if-nez p4, :cond_0

    .line 146
    .line 147
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Hs:I

    .line 148
    .line 149
    invoke-virtual {v3, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    :goto_0
    move-object/from16 v19, v4

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_0
    move-object v2, v14

    .line 157
    goto :goto_0

    .line 158
    :goto_1
    sget v4, Lcom/p1/mobile/putong/core/R$string;->B3:I

    .line 159
    .line 160
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v13, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    sget v4, Lcom/p1/mobile/putong/core/R$string;->wt:I

    .line 168
    .line 169
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    .line 178
    .line 179
    new-instance v4, Ll/wqk;

    .line 180
    .line 181
    invoke-direct {v4, v3, v1}, Ll/wqk;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V

    .line 182
    .line 183
    .line 184
    move-object/from16 v20, v2

    .line 185
    .line 186
    new-instance v2, Ll/jl80$a;

    .line 187
    .line 188
    invoke-direct {v2, v3}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    const/4 v2, 0x1

    .line 196
    invoke-virtual {v0, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const/4 v2, 0x0

    .line 201
    invoke-virtual {v0, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    new-instance v2, Ll/erk;

    .line 206
    .line 207
    move-object/from16 v21, v5

    .line 208
    .line 209
    move-object/from16 v5, p2

    .line 210
    .line 211
    invoke-direct {v2, v5, v3, v4}, Ll/erk;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    new-instance v2, Ll/frk;

    .line 219
    .line 220
    invoke-direct {v2, v1, v3, v4}, Ll/frk;-><init>(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v2}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    move-object v2, v6

    .line 232
    move-object v6, v0

    .line 233
    new-instance v0, Ll/grk;

    .line 234
    .line 235
    move-object/from16 v4, v19

    .line 236
    .line 237
    move-object/from16 v19, v9

    .line 238
    .line 239
    move-object v9, v4

    .line 240
    move-object v4, v3

    .line 241
    move-object/from16 v23, v7

    .line 242
    .line 243
    move-object/from16 v22, v15

    .line 244
    .line 245
    move-object/from16 v3, v18

    .line 246
    .line 247
    move-object/from16 v15, v20

    .line 248
    .line 249
    move-object/from16 v5, v21

    .line 250
    .line 251
    move-object/from16 v7, p5

    .line 252
    .line 253
    move-object/from16 v18, v2

    .line 254
    .line 255
    move-object/from16 v2, v16

    .line 256
    .line 257
    move-object/from16 v16, v8

    .line 258
    .line 259
    move-object v8, v1

    .line 260
    move/from16 v1, p4

    .line 261
    .line 262
    invoke-direct/range {v0 .. v13}, Ll/grk;-><init>(ZLandroid/widget/TextView;[ZLcom/p1/mobile/android/app/Act;Landroid/widget/LinearLayout;Ll/jl80;Ll/x20;Lv/VEditText;Landroid/widget/LinearLayout;Lv/VEditText;Lv/VText;Lv/VText;Lv/VButton;)V

    .line 263
    .line 264
    .line 265
    move-object v7, v4

    .line 266
    move-object v4, v9

    .line 267
    move-object v9, v3

    .line 268
    move-object v3, v0

    .line 269
    move-object v0, v6

    .line 270
    move v6, v1

    .line 271
    move-object v1, v5

    .line 272
    invoke-virtual {v13, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v3

    .line 279
    if-eqz v3, :cond_1

    .line 280
    .line 281
    const/4 v3, 0x0

    .line 282
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 283
    .line 284
    .line 285
    :cond_1
    new-instance v3, Ll/hrk;

    .line 286
    .line 287
    invoke-direct {v3, v15, v7, v0, v6}, Ll/hrk;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/jl80;Z)V

    .line 288
    .line 289
    .line 290
    move-object/from16 v5, v19

    .line 291
    .line 292
    invoke-virtual {v5, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    .line 294
    .line 295
    move-object v3, v0

    .line 296
    new-instance v0, Ll/irk;

    .line 297
    .line 298
    move-object/from16 v5, p3

    .line 299
    .line 300
    move-object v14, v3

    .line 301
    move-object/from16 v3, v16

    .line 302
    .line 303
    invoke-direct/range {v0 .. v6}, Ll/irk;-><init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lv/VButton;Landroid/widget/LinearLayout;Landroid/view/View;Z)V

    .line 304
    .line 305
    .line 306
    move-object v15, v2

    .line 307
    move-object v2, v0

    .line 308
    move-object v0, v3

    .line 309
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    .line 311
    .line 312
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d()Ll/pf60;

    .line 313
    .line 314
    .line 315
    move-result-object v2

    .line 316
    new-instance v3, Ll/jrk;

    .line 317
    .line 318
    invoke-direct {v3, v7, v2}, Ll/jrk;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pf60;)V

    .line 319
    .line 320
    .line 321
    move-object/from16 v6, v18

    .line 322
    .line 323
    invoke-virtual {v6, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 324
    .line 325
    .line 326
    new-instance v3, Ll/krk;

    .line 327
    .line 328
    invoke-direct {v3, v7, v11}, Ll/krk;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v11, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 332
    .line 333
    .line 334
    move-object/from16 v16, v0

    .line 335
    .line 336
    new-instance v0, Ll/lrk;

    .line 337
    .line 338
    move-object/from16 p2, v10

    .line 339
    .line 340
    move-object v10, v4

    .line 341
    move-object/from16 v4, p2

    .line 342
    .line 343
    move-object/from16 p2, v14

    .line 344
    .line 345
    move-object/from16 v3, v22

    .line 346
    .line 347
    move-object v14, v2

    .line 348
    move-object v2, v11

    .line 349
    move-object v11, v5

    .line 350
    move-object v5, v7

    .line 351
    move-object v7, v12

    .line 352
    move-object v12, v1

    .line 353
    move-object v1, v8

    .line 354
    move-object v8, v13

    .line 355
    move-object v13, v6

    .line 356
    move/from16 v6, p4

    .line 357
    .line 358
    invoke-direct/range {v0 .. v8}, Ll/lrk;-><init>(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;ZLv/VText;Lv/VButton;)V

    .line 359
    .line 360
    .line 361
    move-object v6, v5

    .line 362
    move-object v5, v3

    .line 363
    move-object v3, v6

    .line 364
    move-object v6, v4

    .line 365
    move-object v4, v7

    .line 366
    invoke-virtual {v5, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 367
    .line 368
    .line 369
    new-instance v0, Ljava/lang/StringBuilder;

    .line 370
    .line 371
    const-string v7, "+"

    .line 372
    .line 373
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    sget-object v7, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 377
    .line 378
    move-object/from16 p3, v4

    .line 379
    .line 380
    const/4 v4, 0x0

    .line 381
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object v7

    .line 385
    check-cast v7, Ll/nsb;

    .line 386
    .line 387
    iget v4, v7, Ll/nsb;->b:I

    .line 388
    .line 389
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v3}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 404
    .line 405
    .line 406
    move-result v0

    .line 407
    if-nez v0, :cond_3

    .line 408
    .line 409
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-lez v0, :cond_2

    .line 418
    .line 419
    const/4 v0, 0x1

    .line 420
    goto :goto_2

    .line 421
    :cond_2
    const/4 v0, 0x0

    .line 422
    :goto_2
    invoke-static {v5, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 423
    .line 424
    .line 425
    goto :goto_3

    .line 426
    :cond_3
    const/4 v2, 0x0

    .line 427
    invoke-virtual {v5, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v5, v2}, Landroid/view/View;->setClickable(Z)V

    .line 431
    .line 432
    .line 433
    sget v0, Lcom/p1/mobile/putong/core/R$string;->hp:I

    .line 434
    .line 435
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(I)V

    .line 436
    .line 437
    .line 438
    invoke-virtual {v3}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    const/16 v2, 0x3c

    .line 443
    .line 444
    invoke-static {v0, v2}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    new-instance v2, Ll/mrk;

    .line 453
    .line 454
    invoke-direct {v2, v5, v3}, Ll/mrk;-><init>(Lv/VText;Lcom/p1/mobile/android/app/Act;)V

    .line 455
    .line 456
    .line 457
    new-instance v4, Ll/xqk;

    .line 458
    .line 459
    invoke-direct {v4}, Ll/xqk;-><init>()V

    .line 460
    .line 461
    .line 462
    new-instance v7, Ll/yqk;

    .line 463
    .line 464
    invoke-direct {v7, v5, v1}, Ll/yqk;-><init>(Lv/VText;Lv/VEditText;)V

    .line 465
    .line 466
    .line 467
    invoke-static {v2, v4, v7}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 468
    .line 469
    .line 470
    move-result-object v2

    .line 471
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 472
    .line 473
    .line 474
    :goto_3
    invoke-virtual {v1}, Lv/VEditText;->h()Lrx/c;

    .line 475
    .line 476
    .line 477
    move-result-object v7

    .line 478
    new-instance v0, Ll/zqk;

    .line 479
    .line 480
    move-object/from16 v4, p3

    .line 481
    .line 482
    move-object v2, v5

    .line 483
    move-object v5, v8

    .line 484
    invoke-direct/range {v0 .. v5}, Ll/zqk;-><init>(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VText;Lv/VButton;)V

    .line 485
    .line 486
    .line 487
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    invoke-virtual {v7, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v6}, Lv/VEditText;->h()Lrx/c;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    new-instance v2, Ll/ark;

    .line 499
    .line 500
    invoke-direct {v2, v4, v8}, Ll/ark;-><init>(Lv/VText;Lv/VButton;)V

    .line 501
    .line 502
    .line 503
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 508
    .line 509
    .line 510
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 511
    .line 512
    .line 513
    move-result v0

    .line 514
    if-nez v0, :cond_4

    .line 515
    .line 516
    const/4 v2, 0x1

    .line 517
    invoke-static {v12, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 518
    .line 519
    .line 520
    const-string v0, "agreement_entrance"

    .line 521
    .line 522
    const-string v2, "bind_popup"

    .line 523
    .line 524
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 525
    .line 526
    .line 527
    move-result-object v0

    .line 528
    filled-new-array {v0}, [Ll/pf60;

    .line 529
    .line 530
    .line 531
    move-result-object v0

    .line 532
    const-string v2, "e_sign_in_agreement"

    .line 533
    .line 534
    const-string v4, ""

    .line 535
    .line 536
    invoke-static {v2, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 537
    .line 538
    .line 539
    new-instance v0, Ll/brk;

    .line 540
    .line 541
    move-object/from16 v7, v23

    .line 542
    .line 543
    invoke-direct {v0, v9, v7}, Ll/brk;-><init>([ZLv/VCheckBox;)V

    .line 544
    .line 545
    .line 546
    invoke-static {v7, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 547
    .line 548
    .line 549
    new-instance v0, Ll/crk;

    .line 550
    .line 551
    invoke-direct {v0, v13, v9, v7}, Ll/crk;-><init>(Landroid/widget/TextView;[ZLv/VCheckBox;)V

    .line 552
    .line 553
    .line 554
    invoke-static {v13, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 555
    .line 556
    .line 557
    sget v0, Lcom/p1/mobile/putong/core/R$string;->A3:I

    .line 558
    .line 559
    new-instance v2, Ljava/lang/StringBuilder;

    .line 560
    .line 561
    const-string v4, "\u300a"

    .line 562
    .line 563
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    iget-object v5, v14, Ll/pf60;->a:Ljava/lang/Object;

    .line 567
    .line 568
    check-cast v5, Ljava/lang/String;

    .line 569
    .line 570
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    const-string v5, "\u300b"

    .line 574
    .line 575
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object v2

    .line 582
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 583
    .line 584
    .line 585
    move-result-object v2

    .line 586
    invoke-virtual {v3, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    iget-object v2, v14, Ll/pf60;->a:Ljava/lang/Object;

    .line 591
    .line 592
    check-cast v2, Ljava/lang/String;

    .line 593
    .line 594
    iget-object v6, v14, Ll/pf60;->b:Ljava/lang/Object;

    .line 595
    .line 596
    check-cast v6, Ljava/lang/String;

    .line 597
    .line 598
    filled-new-array {v2, v6}, [Ljava/lang/String;

    .line 599
    .line 600
    .line 601
    move-result-object v2

    .line 602
    invoke-static {v3, v0, v2}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 607
    .line 608
    .line 609
    sget v0, Lcom/p1/mobile/putong/core/R$string;->A3:I

    .line 610
    .line 611
    new-instance v2, Ljava/lang/StringBuilder;

    .line 612
    .line 613
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 614
    .line 615
    .line 616
    iget-object v4, v14, Ll/pf60;->a:Ljava/lang/Object;

    .line 617
    .line 618
    check-cast v4, Ljava/lang/String;

    .line 619
    .line 620
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 624
    .line 625
    .line 626
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v2

    .line 630
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 631
    .line 632
    .line 633
    move-result-object v2

    .line 634
    invoke-virtual {v3, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 635
    .line 636
    .line 637
    move-result-object v0

    .line 638
    iget-object v2, v14, Ll/pf60;->a:Ljava/lang/Object;

    .line 639
    .line 640
    check-cast v2, Ljava/lang/String;

    .line 641
    .line 642
    iget-object v4, v14, Ll/pf60;->b:Ljava/lang/Object;

    .line 643
    .line 644
    check-cast v4, Ljava/lang/String;

    .line 645
    .line 646
    filled-new-array {v2, v4}, [Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object v2

    .line 650
    invoke-static {v3, v0, v2}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 651
    .line 652
    .line 653
    move-result-object v0

    .line 654
    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 655
    .line 656
    .line 657
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 658
    .line 659
    .line 660
    move-result-object v0

    .line 661
    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 662
    .line 663
    .line 664
    move-object/from16 v0, p1

    .line 665
    .line 666
    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 667
    .line 668
    .line 669
    goto :goto_4

    .line 670
    :cond_4
    move-object/from16 v0, p1

    .line 671
    .line 672
    const/4 v2, 0x0

    .line 673
    invoke-static {v12, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 674
    .line 675
    .line 676
    sget v2, Ll/qa00;->m:I

    .line 677
    .line 678
    invoke-static {v11, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 679
    .line 680
    .line 681
    :goto_4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 682
    .line 683
    .line 684
    move-result v2

    .line 685
    const/16 v17, 0x1

    .line 686
    .line 687
    xor-int/lit8 v2, v2, 0x1

    .line 688
    .line 689
    invoke-static {v15, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 690
    .line 691
    .line 692
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 693
    .line 694
    .line 695
    move-result v2

    .line 696
    invoke-static {v10, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 697
    .line 698
    .line 699
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 700
    .line 701
    .line 702
    move-result v2

    .line 703
    xor-int/lit8 v2, v2, 0x1

    .line 704
    .line 705
    move-object/from16 v8, v16

    .line 706
    .line 707
    invoke-static {v8, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 708
    .line 709
    .line 710
    invoke-static {}, Ll/d09;->d()Z

    .line 711
    .line 712
    .line 713
    move-result v2

    .line 714
    if-eqz v2, :cond_5

    .line 715
    .line 716
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 717
    .line 718
    .line 719
    move-result v2

    .line 720
    if-eqz v2, :cond_5

    .line 721
    .line 722
    if-nez p4, :cond_5

    .line 723
    .line 724
    invoke-static {}, Ll/upp0;->e()Ll/upp0;

    .line 725
    .line 726
    .line 727
    move-result-object v2

    .line 728
    invoke-virtual {v2, v3}, Ll/upp0;->f(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 729
    .line 730
    .line 731
    move-result-object v2

    .line 732
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 733
    .line 734
    .line 735
    move-result v3

    .line 736
    if-nez v3, :cond_6

    .line 737
    .line 738
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 739
    .line 740
    .line 741
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 742
    .line 743
    .line 744
    move-result v2

    .line 745
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 746
    .line 747
    .line 748
    goto :goto_5

    .line 749
    :cond_5
    if-nez p4, :cond_6

    .line 750
    .line 751
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 752
    .line 753
    .line 754
    move-result v2

    .line 755
    if-eqz v2, :cond_6

    .line 756
    .line 757
    invoke-static {}, Ll/upp0;->e()Ll/upp0;

    .line 758
    .line 759
    .line 760
    move-result-object v2

    .line 761
    invoke-virtual {v2, v3}, Ll/upp0;->f(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 762
    .line 763
    .line 764
    move-result-object v2

    .line 765
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 766
    .line 767
    .line 768
    move-result v3

    .line 769
    if-nez v3, :cond_6

    .line 770
    .line 771
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 772
    .line 773
    .line 774
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 775
    .line 776
    .line 777
    move-result-object v2

    .line 778
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 779
    .line 780
    .line 781
    move-result v2

    .line 782
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 783
    .line 784
    .line 785
    :cond_6
    :goto_5
    if-eqz p4, :cond_7

    .line 786
    .line 787
    const-string v2, "signout"

    .line 788
    .line 789
    goto :goto_6

    .line 790
    :cond_7
    const-string v2, "on"

    .line 791
    .line 792
    :goto_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 793
    .line 794
    .line 795
    move-result v0

    .line 796
    if-nez v0, :cond_8

    .line 797
    .line 798
    const-string v0, "one_click"

    .line 799
    .line 800
    goto :goto_7

    .line 801
    :cond_8
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 802
    .line 803
    .line 804
    move-result-object v0

    .line 805
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 806
    .line 807
    .line 808
    move-result-object v0

    .line 809
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 810
    .line 811
    .line 812
    move-result v0

    .line 813
    if-eqz v0, :cond_9

    .line 814
    .line 815
    const-string v0, "no_number"

    .line 816
    .line 817
    goto :goto_7

    .line 818
    :cond_9
    const-string v0, "secret_number"

    .line 819
    .line 820
    :goto_7
    invoke-static {v2, v0}, Ll/fph0;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    .line 822
    .line 823
    invoke-virtual/range {p2 .. p2}, Ll/jl80;->show()V

    .line 824
    .line 825
    .line 826
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V
    .locals 8

    .line 1
    new-instance v2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 2
    .line 3
    sget-object v0, Ll/kvp0;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "wechat-moments"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v3, "com.tencent.mm"

    .line 12
    .line 13
    filled-new-array {v3}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v4, "\u670b\u53cb\u5708"

    .line 18
    .line 19
    invoke-direct {v2, v4, v0, v1, v3}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    move-object v0, p0

    .line 23
    move-object v1, p1

    .line 24
    move-object v3, p2

    .line 25
    move-object v4, p3

    .line 26
    move-object v5, p4

    .line 27
    move-object v6, p5

    .line 28
    move-object v7, p6

    .line 29
    invoke-static/range {v0 .. v7}, Ll/qtk;->N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static Q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 5

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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/core/R$string;->S:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Lcom/p1/mobile/putong/core/R$string;->R:I

    .line 22
    .line 23
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Dialog$e;->Q()Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    sget v4, Ll/kec0;->td:I

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget v4, Lcom/p1/mobile/putong/core/R$string;->rh:I

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    filled-new-array {v1}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget v4, Ll/c9c0;->O1:I

    .line 64
    .line 65
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    const/4 v4, 0x3

    .line 70
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-static {v2, v1, p0, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v3, p0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget v1, Lcom/p1/mobile/putong/core/R$string;->qh:I

    .line 83
    .line 84
    new-instance v2, Ll/lsk;

    .line 85
    .line 86
    invoke-direct {v2}, Ll/lsk;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget v1, Lcom/p1/mobile/putong/core/R$string;->jm:I

    .line 94
    .line 95
    new-instance v2, Ll/msk;

    .line 96
    .line 97
    invoke-direct {v2, p2}, Ll/msk;-><init>(Ll/x20;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const/4 p2, 0x0

    .line 105
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    sget v1, Ll/adc0;->h8:I

    .line 118
    .line 119
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Lv/VDraweeView;

    .line 124
    .line 125
    sget v2, Ll/adc0;->i9:I

    .line 126
    .line 127
    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    check-cast p2, Lv/VDraweeView;

    .line 132
    .line 133
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 134
    .line 135
    invoke-virtual {v2, v1, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 139
    .line 140
    invoke-virtual {v0, p2, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Ll/fph0;->E()V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public static synthetic R(Lv/VText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Long;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x3c

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p2, v0, v2

    .line 11
    .line 12
    if-lez p2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ot:I

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "%d%s"

    .line 33
    .line 34
    invoke-static {p2, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static R0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;)Ll/pej0;
    .locals 17

    .line 1
    const/4 v15, 0x0

    .line 2
    move-object/from16 v1, p0

    .line 3
    .line 4
    move-object/from16 v2, p1

    .line 5
    .line 6
    move-object/from16 v3, p2

    .line 7
    .line 8
    move-object/from16 v4, p3

    .line 9
    .line 10
    move-object/from16 v5, p4

    .line 11
    .line 12
    move-object/from16 v6, p5

    .line 13
    .line 14
    move-object/from16 v7, p6

    .line 15
    .line 16
    move-object/from16 v8, p7

    .line 17
    .line 18
    move-object/from16 v9, p8

    .line 19
    .line 20
    move-object/from16 v10, p9

    .line 21
    .line 22
    move-object/from16 v11, p10

    .line 23
    .line 24
    move-object/from16 v12, p11

    .line 25
    .line 26
    move-object/from16 v13, p12

    .line 27
    .line 28
    move-object/from16 v14, p13

    .line 29
    .line 30
    move-object/from16 v16, p14

    .line 31
    .line 32
    invoke-static/range {v1 .. v16}, Ll/qtk;->a1(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ll/pej0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    return-object v0
.end method

.method public static synthetic S(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static S0(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_cheat_prevention__verify_required_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, p0, v0}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/uk50;->h()Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/trk;

    .line 43
    .line 44
    invoke-direct {v1, p1}, Ll/trk;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    new-instance v1, Ll/urk;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/urk;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    new-instance v1, Ll/vrk;

    .line 81
    .line 82
    invoke-direct {v1}, Ll/vrk;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance v1, Ll/wrk;

    .line 90
    .line 91
    invoke-direct {v1, p1}, Ll/wrk;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_0

    .line 107
    .line 108
    new-instance v1, Ll/xrk;

    .line 109
    .line 110
    invoke-direct {v1, v0, p0}, Ll/xrk;-><init>(Ll/kcg0;Ll/kcg0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b0(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Ll/hxf;->n()V

    .line 117
    .line 118
    .line 119
    :cond_0
    return-void
.end method

.method public static synthetic T(Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fph0;->F()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static T0(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->ke:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/sqk;

    .line 42
    .line 43
    invoke-direct {v2, v1}, Ll/sqk;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p0, v2}, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->i(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic U(Ll/z20;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ll/pej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getCurrentItemPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getCurrentItemPosition()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p3}, Ll/pej0;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static U0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 13

    .line 1
    const/4 v11, 0x0

    .line 2
    const/4 v12, 0x0

    .line 3
    const-string v0, ""

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    const-string v4, ""

    .line 8
    .line 9
    const-string v5, ""

    .line 10
    .line 11
    const/4 v8, 0x0

    .line 12
    const/4 v9, 0x0

    .line 13
    const/4 v10, 0x0

    .line 14
    move-object v1, p0

    .line 15
    move-object v3, p1

    .line 16
    move-object v6, p2

    .line 17
    move-object/from16 v7, p3

    .line 18
    .line 19
    invoke-static/range {v0 .. v12}, Ll/qtk;->Y0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic V(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    const-string v5, ""

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    invoke-static/range {v0 .. v5}, Ll/qtk;->W0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic W(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static W0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 5

    .line 1
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    sget v0, Ll/kec0;->Ee:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p5, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    check-cast p5, Lcom/p1/mobile/putong/core/ui/popup/ProfileFakeView;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    new-array v3, v0, [Ll/jl80;

    .line 24
    .line 25
    invoke-interface {p5, p1, p2}, Ll/r3m;->a(ZLcom/p1/mobile/putong/data/Media;)V

    .line 26
    .line 27
    .line 28
    new-instance p2, Ll/jl80$a;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, v0}, Ll/jl80$a;->e0(Z)Ll/jl80$a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-interface {p5}, Ll/r3m;->getRenderView()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {p2, v4}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    xor-int/lit8 v4, p1, 0x1

    .line 46
    .line 47
    invoke-virtual {p2, v4}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p2, v0}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2, p3}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p3, v1}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2}, Ll/jl80$a;->O()Ll/jl80;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    aput-object p2, v3, v2

    .line 67
    .line 68
    new-instance p3, Ll/gtk;

    .line 69
    .line 70
    invoke-direct {p3, p1, p4, v3}, Ll/gtk;-><init>(ZLjava/lang/Runnable;[Ll/jl80;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, p3}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    if-nez p1, :cond_0

    .line 77
    .line 78
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 81
    .line 82
    invoke-virtual {p2}, Ll/dkb;->k8()Z

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    if-eqz p2, :cond_0

    .line 87
    .line 88
    invoke-interface {p5}, Ll/r3m;->getTitleView()Landroid/widget/TextView;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    sget p3, Lcom/p1/mobile/putong/core/R$string;->O:I

    .line 93
    .line 94
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    if-eqz p1, :cond_1

    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/fake/b;->q()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-virtual {p0, p2, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    new-instance p2, Ll/ntk;

    .line 120
    .line 121
    invoke-direct {p2, v3}, Ll/ntk;-><init>([Ll/jl80;)V

    .line 122
    .line 123
    .line 124
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    :cond_1
    const-class p0, Lcom/p1/mobile/android/app/Dialog;

    .line 133
    .line 134
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string p2, "p_fake_twoguide"

    .line 139
    .line 140
    invoke-static {p2, p0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    aget-object p2, v3, v2

    .line 145
    .line 146
    new-instance p3, Ll/otk;

    .line 147
    .line 148
    invoke-direct {p3, v1, p1, v2, p0}, Ll/otk;-><init>(Ll/kcg0;ZZLl/l4g0;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p2, p3}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 152
    .line 153
    .line 154
    aget-object p0, v3, v2

    .line 155
    .line 156
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 157
    .line 158
    .line 159
    if-eqz p1, :cond_2

    .line 160
    .line 161
    sget-object p0, Ll/qtk;->i:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {p0}, Ll/fph0;->p(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    const-string p0, ""

    .line 167
    .line 168
    sput-object p0, Ll/qtk;->i:Ljava/lang/String;

    .line 169
    .line 170
    return-void

    .line 171
    :cond_2
    invoke-static {}, Ll/fph0;->s()V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public static synthetic X(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->k:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static X0(Lcom/p1/mobile/android/app/Act;IILl/z20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "II",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 8
    .line 9
    .line 10
    sget p0, Ll/kec0;->ib:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 13
    .line 14
    .line 15
    sget p0, Ll/adc0;->r4:I

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lv/VIcon;

    .line 22
    .line 23
    sget v1, Ll/adc0;->s4:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroid/widget/TextView;

    .line 30
    .line 31
    sget v2, Ll/adc0;->eb:I

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 38
    .line 39
    sget v3, Ll/adc0;->fb:I

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 46
    .line 47
    if-ltz p1, :cond_1

    .line 48
    .line 49
    const/16 v4, 0x18

    .line 50
    .line 51
    if-ge p1, v4, :cond_1

    .line 52
    .line 53
    sget-object v5, Ll/qtk;->g:Ljava/util/List;

    .line 54
    .line 55
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 59
    .line 60
    .line 61
    if-lez p2, :cond_1

    .line 62
    .line 63
    if-gt p2, v4, :cond_1

    .line 64
    .line 65
    sget-object p1, Ll/qtk;->h:Ljava/util/List;

    .line 66
    .line 67
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 p2, p2, -0x1

    .line 71
    .line 72
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 73
    .line 74
    .line 75
    new-instance p1, Ll/atk;

    .line 76
    .line 77
    invoke-direct {p1, v0}, Ll/atk;-><init>(Ll/pej0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    new-instance p0, Ll/btk;

    .line 84
    .line 85
    invoke-direct {p0, p3, v2, v3, v0}, Ll/btk;-><init>(Ll/z20;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ll/pej0;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const p1, 0x3e99999a    # 0.3f

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1}, Landroid/view/Window;->setDimAmount(F)V

    .line 99
    .line 100
    .line 101
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_0

    .line 106
    .line 107
    const p1, 0x1020002

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    sget p2, Ll/adc0;->q2:I

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Landroid/widget/FrameLayout;

    .line 121
    .line 122
    sget p2, Ll/dbc0;->Up:I

    .line 123
    .line 124
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 125
    .line 126
    .line 127
    :cond_0
    new-instance p1, Ll/ctk;

    .line 128
    .line 129
    invoke-direct {p1, p0}, Ll/ctk;-><init>(Landroid/view/Window;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 136
    .line 137
    .line 138
    :cond_1
    return-void
.end method

.method public static synthetic Y()V
    .locals 0

    .line 1
    invoke-static {}, Ll/fph0;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Y0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 14

    const/4 v13, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    .line 1
    invoke-static/range {v0 .. v13}, Ll/qtk;->Z0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static Z0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 17

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    .line 1
    invoke-static/range {v1 .. v16}, Ll/qtk;->a1(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ll/pej0;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic a0(Ll/uxj0;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static a1(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ll/pej0;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ShareItemBean;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ll/pej0;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 1
    const-class v2, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "p_share_pop"

    invoke-static {v3, v2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    move-result-object v2

    .line 3
    const-string v4, "from_discover_dating"

    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "from_album"

    .line 4
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "from_like"

    .line 5
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "from_nearby_falls_feed"

    .line 6
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "from_nearby_focus"

    .line 7
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "from_activity_tab_one"

    .line 8
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "from_activity_tab_two"

    .line 9
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "from_discover_discussion"

    .line 10
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 11
    :cond_0
    const-string v4, "moment_detail"

    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 12
    :cond_2
    :goto_0
    const-string v4, "moment_feed"

    .line 13
    :goto_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    const-string v6, ""

    if-eqz v5, :cond_4

    .line 14
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v4, v6

    goto :goto_2

    :cond_3
    move-object/from16 v4, p3

    .line 15
    :cond_4
    :goto_2
    const-string v5, "moment_id"

    move-object/from16 v7, p0

    .line 16
    invoke-static {v5, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v5

    const-string v7, "share_pop_from_which"

    .line 17
    invoke-static {v7, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v4

    .line 18
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5

    const-string v7, "discover_discussion"

    move-object/from16 v12, p3

    .line 20
    invoke-static {v12, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_6

    move-object v6, v1

    goto :goto_3

    :cond_5
    move-object/from16 v12, p3

    .line 21
    :cond_6
    :goto_3
    const-string v7, "moment_share_from_which"

    invoke-static {v7, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v6

    filled-new-array {v5, v4, v6}, [Ll/pf60;

    move-result-object v4

    .line 22
    invoke-virtual {v2, v4}, Ll/l4g0;->p([Ll/pf60;)V

    .line 23
    invoke-static {v2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 24
    new-instance v4, Ll/pej0;

    invoke-direct {v4, v0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x1

    .line 25
    invoke-virtual {v4, v5}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 26
    sget v6, Ll/kec0;->Vb:I

    invoke-virtual {v4, v6}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 27
    new-instance v6, Ll/qtk$a;

    move-object/from16 v7, p12

    invoke-direct {v6, v2, v7}, Ll/qtk$a;-><init>(Ll/l4g0;Ll/x20;)V

    invoke-virtual {v4, v6}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 28
    new-instance v2, Ll/qtk$b;

    invoke-direct {v2}, Ll/qtk$b;-><init>()V

    invoke-virtual {v4, v2}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 29
    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    .line 30
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    const v6, 0x1020002

    .line 31
    invoke-virtual {v2, v6}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 32
    sget v7, Ll/adc0;->q2:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout;

    .line 33
    sget v7, Ll/dbc0;->Up:I

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundResource(I)V

    .line 34
    :cond_7
    new-instance v6, Ll/nrk;

    invoke-direct {v6, v2}, Ll/nrk;-><init>(Landroid/view/Window;)V

    invoke-static {v6}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 35
    sget v2, Ll/adc0;->D7:I

    invoke-virtual {v4, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lv/VLinear;

    .line 36
    sget v6, Ll/adc0;->E7:I

    invoke-virtual {v4, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VImage;

    .line 37
    sget v7, Ll/adc0;->B7:I

    invoke-virtual {v4, v7}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lv/VLinear;

    .line 38
    sget v8, Ll/adc0;->C7:I

    invoke-virtual {v4, v8}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lv/VImage;

    .line 39
    sget v9, Ll/adc0;->A7:I

    invoke-virtual {v4, v9}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lv/VImage;

    .line 40
    invoke-static {}, Ll/gra;->z()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 41
    sget v10, Ll/dbc0;->z6:I

    invoke-virtual {v6, v10}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    sget v6, Ll/dbc0;->t6:I

    invoke-virtual {v8, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 43
    sget v6, Ll/dbc0;->n6:I

    invoke-virtual {v9, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 44
    :cond_8
    sget v6, Ll/adc0;->je:I

    invoke-virtual {v4, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 45
    invoke-static/range {p15 .. p15}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v8

    const/4 v9, 0x0

    if-eqz v8, :cond_9

    .line 46
    invoke-static/range {p15 .. p15}, Ll/wj90;->d(Lcom/p1/mobile/putong/data/User;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 47
    const-string v8, "\u66f4\u591a\u64cd\u4f5c"

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    invoke-static {v2, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    invoke-static {v7, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    :cond_9
    sget v6, Ll/adc0;->z7:I

    invoke-virtual {v4, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lv/VLinear;

    .line 51
    const-string v8, "p_moment_preview"

    invoke-static {v8, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-static/range {p13 .. p13}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 52
    const-string v1, "e_save_picture"

    invoke-static {v1, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    :cond_a
    sget v1, Ll/adc0;->Kb:I

    invoke-virtual {v4, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lv/VRecyclerView;

    .line 55
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v3, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 56
    invoke-virtual {v3, v9}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 57
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 58
    new-instance v3, Ll/k0f0;

    invoke-direct {v3, v0}, Ll/k0f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v15, p14

    .line 59
    invoke-static/range {v8 .. v15}, Ll/qtk;->J0(Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 60
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v8

    xor-int/2addr v5, v8

    invoke-static {v1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 62
    invoke-virtual {v3, v0}, Ll/k0f0;->C(Ljava/util/List;)V

    .line 63
    new-instance v1, Ll/qtk$c;

    invoke-direct {v1, v0, v4}, Ll/qtk$c;-><init>(Ljava/util/List;Ll/pej0;)V

    invoke-virtual {v3, v1}, Ll/k0f0;->D(Ll/k0f0$b;)V

    .line 64
    sget v0, Ll/adc0;->Ae:I

    invoke-virtual {v4, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VText;

    .line 65
    new-instance v1, Ll/prk;

    move-object/from16 v3, p6

    invoke-direct {v1, v3, v4}, Ll/prk;-><init>(Ll/x20;Ll/pej0;)V

    invoke-static {v2, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    new-instance v1, Ll/qrk;

    move-object/from16 v2, p7

    invoke-direct {v1, v2, v4}, Ll/qrk;-><init>(Ll/x20;Ll/pej0;)V

    invoke-static {v7, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    new-instance v1, Ll/rrk;

    move-object/from16 v2, p13

    invoke-direct {v1, v2, v4}, Ll/rrk;-><init>(Ll/x20;Ll/pej0;)V

    invoke-static {v6, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    new-instance v1, Ll/srk;

    invoke-direct {v1, v4}, Ll/srk;-><init>(Ll/pej0;)V

    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    return-object v4
.end method

.method public static synthetic b0(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;ZLv/VText;Lv/VButton;Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v3, 0x56

    .line 10
    .line 11
    const/4 v6, 0x0

    .line 12
    if-ne v1, v3, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v1, v6

    .line 17
    :goto_0
    invoke-static {v0, v1}, Ll/qtk;->G0(Ljava/lang/String;Z)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string v0, "\u8bf7\u8f93\u5165\u6b63\u786e\u624b\u673a\u53f7"

    .line 24
    .line 25
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "bind_mobile"

    .line 41
    .line 42
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 47
    .line 48
    const/4 v1, 0x6

    .line 49
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 50
    .line 51
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 56
    .line 57
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p2, v6}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 67
    .line 68
    .line 69
    const-string v1, "..."

    .line 70
    .line 71
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->send(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    new-instance v0, Ll/psk;

    .line 83
    .line 84
    move-object v4, p0

    .line 85
    move-object v2, p2

    .line 86
    move-object v1, p3

    .line 87
    move-object v3, p4

    .line 88
    move v5, p5

    .line 89
    invoke-direct/range {v0 .. v5}, Ll/psk;-><init>(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;Z)V

    .line 90
    .line 91
    .line 92
    new-instance v1, Ll/qsk;

    .line 93
    .line 94
    invoke-direct {v1, p2, p0, p6, p7}, Ll/qsk;-><init>(Lv/VText;Lv/VEditText;Lv/VText;Lv/VButton;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v0, v1, v6}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v7, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static b1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ll/z20;Ll/a30;)Ll/pej0;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Link;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ">;)",
            "Ll/pej0;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->S(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    move-object v0, p0

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move-object v5, p5

    .line 10
    move-object v6, p7

    .line 11
    move-object/from16 v7, p8

    .line 12
    .line 13
    invoke-static/range {v0 .. v7}, Ll/qtk;->K0(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1, p2}, Ll/qtk;->c1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/List;)Ll/pej0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic c0(Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_share_pop_cancel"

    .line 2
    .line 3
    const-string v0, "p_share_pop"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static c1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/List;)Ll/pej0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ShareItemBean;",
            ">;)",
            "Ll/pej0;"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_share_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, ""

    .line 21
    .line 22
    :goto_0
    const-string v1, "share_pop_from_which"

    .line 23
    .line 24
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Ll/pej0;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 45
    .line 46
    .line 47
    sget v1, Ll/kec0;->Yb:I

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/qtk$d;

    .line 53
    .line 54
    invoke-direct {v1, v0}, Ll/qtk$d;-><init>(Ll/l4g0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/qtk$e;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/qtk$e;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    const v1, 0x1020002

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget v2, Ll/adc0;->q2:I

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Landroid/widget/FrameLayout;

    .line 92
    .line 93
    sget v2, Ll/dbc0;->Up:I

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 96
    .line 97
    .line 98
    :cond_1
    new-instance v1, Ll/ksk;

    .line 99
    .line 100
    invoke-direct {v1, v0}, Ll/ksk;-><init>(Landroid/view/Window;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 104
    .line 105
    .line 106
    sget v0, Ll/adc0;->Lb:I

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Lv/VRecyclerView;

    .line 113
    .line 114
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 117
    .line 118
    .line 119
    const/4 v2, 0x0

    .line 120
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 124
    .line 125
    .line 126
    new-instance v1, Ll/k0f0;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/k0f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, p2}, Ll/k0f0;->C(Ljava/util/List;)V

    .line 135
    .line 136
    .line 137
    new-instance p0, Ll/qtk$f;

    .line 138
    .line 139
    invoke-direct {p0, p2, p1}, Ll/qtk$f;-><init>(Ljava/util/List;Ll/pej0;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, p0}, Ll/k0f0;->D(Ll/k0f0$b;)V

    .line 143
    .line 144
    .line 145
    sget p0, Ll/adc0;->Ae:I

    .line 146
    .line 147
    invoke-virtual {p1, p0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    check-cast p0, Lv/VText;

    .line 152
    .line 153
    new-instance p2, Ll/vsk;

    .line 154
    .line 155
    invoke-direct {p2, p1}, Ll/vsk;-><init>(Ll/pej0;)V

    .line 156
    .line 157
    .line 158
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 162
    .line 163
    .line 164
    return-object p1
.end method

.method public static synthetic d0(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VText;Lv/VButton;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 p5, 0x0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-static {p1, p5}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget v0, Lcom/p1/mobile/putong/core/R$string;->bp:I

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    invoke-static {p1, p0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    invoke-static {p3, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    sget p0, Ll/qa00;->q:I

    .line 48
    .line 49
    invoke-static {p4, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static d1(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_profile_share_agreement_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/jl80$a;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    sget p0, Ll/dbc0;->Vp:I

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "\u5206\u4eab\u65b0\u529f\u80fd"

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v1, "\u8fdb\u5165ta\u4eba\u4e3b\u9875\u53ef\u5c06ta\u7684\u540d\u7247\u5206\u4eab\u7ed9\u60a8\u7684\u670b\u53cb\uff0c\u4f7f\u7528\u622a\u56fe\u6709\u66f4\u591a\u60ca\u559c\uff01\u82e5\u60a8\u9700\u8981\u5173\u95ed\u8be5\u529f\u80fd\u5219\u53ef\u524d\u5f80\u8bbe\u7f6e-\u9690\u79c1\u548c\u901a\u77e5\u8fdb\u884c\u5173\u95ed"

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v1, Ll/yrk;

    .line 45
    .line 46
    invoke-direct {v1}, Ll/yrk;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v2, "\u6211\u77e5\u9053\u4e86"

    .line 50
    .line 51
    invoke-virtual {p0, v2, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    invoke-interface {p1}, Ll/x20;->call()V

    .line 66
    .line 67
    .line 68
    :cond_0
    new-instance p1, Ll/ask;

    .line 69
    .line 70
    invoke-direct {p1, v0}, Ll/ask;-><init>(Ll/l4g0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic e0(Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "e_share_pop_wechat"

    .line 8
    .line 9
    const-string v0, "p_share_pop"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic f0(ZLandroid/widget/TextView;[ZLcom/p1/mobile/android/app/Act;Landroid/widget/LinearLayout;Ll/jl80;Ll/x20;Lv/VEditText;Landroid/widget/LinearLayout;Lv/VEditText;Lv/VText;Lv/VText;Lv/VButton;Landroid/view/View;)V
    .locals 8

    if-eqz p0, :cond_0

    .line 1
    const-string v0, "signout"

    goto :goto_0

    :cond_0
    const-string v0, "on"

    :goto_0
    invoke-static {v0}, Ll/fph0;->c(Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 3
    aget-boolean p2, p2, v1

    if-nez p2, :cond_1

    .line 4
    sget p0, Ll/x7c0;->j:I

    invoke-static {p3, p0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p0

    .line 5
    invoke-virtual {p4, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    return-void

    .line 6
    :cond_1
    sget p2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    invoke-virtual {p3, p2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    move-result-object p2

    const/16 p4, 0x1388

    .line 8
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    move-result-object p2

    new-instance p4, Ll/dsk;

    invoke-direct {p4, p0, p3}, Ll/dsk;-><init>(ZLcom/p1/mobile/android/app/Act;)V

    .line 9
    invoke-virtual {p2, p4}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    move-result-object p2

    new-instance p4, Ll/esk;

    invoke-direct {p4}, Ll/esk;-><init>()V

    .line 10
    invoke-virtual {p2, p4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object p2

    new-instance p4, Ll/fsk;

    invoke-direct {p4}, Ll/fsk;-><init>()V

    .line 11
    invoke-virtual {p2, p4}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    move-result-object p2

    .line 12
    invoke-virtual {p3, p2, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    move-result-object p2

    new-instance v0, Ll/gsk;

    move v4, p0

    move-object v1, p3

    move-object v2, p5

    move-object v3, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Ll/gsk;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/x20;ZLv/VEditText;)V

    new-instance p4, Ll/hsk;

    move-object/from16 p5, p8

    invoke-direct {p4, p0, p3, p1, p5}, Ll/hsk;-><init>(ZLcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V

    .line 13
    invoke-static {v0, p4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object p0

    .line 14
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void

    .line 15
    :cond_2
    invoke-virtual {p7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 16
    sget p0, Lcom/p1/mobile/putong/core/R$string;->gp:I

    invoke-static {p0}, Ll/o1j0;->w(I)V

    return-void

    .line 17
    :cond_3
    invoke-virtual/range {p9 .. p9}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 18
    sget p0, Lcom/p1/mobile/putong/core/R$string;->o4:I

    invoke-static {p0}, Ll/o1j0;->w(I)V

    return-void

    .line 19
    :cond_4
    sget p1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    invoke-virtual {p3, p1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 20
    new-instance p1, Lcom/p1/mobile/putong/data/VerifyData;

    invoke-direct {p1}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 21
    invoke-static/range {p9 .. p9}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    move-result p2

    iput p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 22
    const-string p2, "bind_mobile"

    invoke-static {p2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    move-result-object p4

    iput-object p4, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    const/4 p4, 0x6

    .line 23
    iput p4, p1, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 24
    invoke-static/range {p10 .. p10}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    move-result p4

    iput p4, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 25
    invoke-static {p7}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object p4

    iput-object p4, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 26
    invoke-static {p2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    move-result-object p2

    iput-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 27
    invoke-static/range {p10 .. p10}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    move-result p2

    iput p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 28
    invoke-static {p7}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p2

    .line 30
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->verify(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    move-result-object p1

    new-instance v2, Ll/isk;

    move v6, p0

    move-object v3, p3

    move-object v4, p5

    move-object v5, p6

    move-object v7, p7

    invoke-direct/range {v2 .. v7}, Ll/isk;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/x20;ZLv/VEditText;)V

    new-instance p2, Ll/jsk;

    move-object/from16 p4, p11

    move-object/from16 p5, p12

    invoke-direct {p2, p0, p3, p4, p5}, Ll/jsk;-><init>(ZLcom/p1/mobile/android/app/Act;Lv/VText;Lv/VButton;)V

    .line 31
    invoke-static {v2, p2, v1}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLl/x20;)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/Report;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 15
    .line 16
    sget v1, Lcom/p1/mobile/putong/core/R$string;->pm:I

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->chatMessages:Ljava/util/List;

    .line 33
    .line 34
    new-instance p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v1, "blocked"

    .line 40
    .line 41
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v1, v0}, Ll/dkb;->ha(Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 60
    .line 61
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->qe(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/jtk;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/jtk;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v0, Ll/ktk;

    .line 77
    .line 78
    invoke-direct {v0, p0, p2, p3}, Ll/ktk;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 79
    .line 80
    .line 81
    new-instance p2, Ll/ltk;

    .line 82
    .line 83
    invoke-direct {p2, p0}, Ll/ltk;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_0

    .line 98
    .line 99
    invoke-interface {p4}, Ll/x20;->call()V

    .line 100
    .line 101
    .line 102
    :cond_0
    return-void
.end method

.method public static synthetic h(Lv/VText;Lv/VEditText;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 3
    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->bp:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic h0(Ll/l4g0;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "reBackAppGuideDialog"

    .line 7
    .line 8
    invoke-virtual {p2, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic i(Lv/VText;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Lv/VText;Lv/VEditText;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 3
    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->bp:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic j(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;ZLl/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 9
    .line 10
    .line 11
    sget p0, Lcom/p1/mobile/putong/core/R$string;->hp:I

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/16 p5, 0x3c

    .line 21
    .line 22
    invoke-static {p0, p5}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p5, Ll/dtk;

    .line 31
    .line 32
    invoke-direct {p5, p1, p2}, Ll/dtk;-><init>(Lv/VText;Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    new-instance p2, Ll/etk;

    .line 36
    .line 37
    invoke-direct {p2}, Ll/etk;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/ftk;

    .line 41
    .line 42
    invoke-direct {v0, p1, p3}, Ll/ftk;-><init>(Lv/VText;Lv/VEditText;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p5, p2, v0}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    if-eqz p4, :cond_0

    .line 53
    .line 54
    const-string p0, "signout"

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const-string p0, "on"

    .line 58
    .line 59
    :goto_0
    invoke-static {p0}, Ll/fph0;->h(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 1

    .line 1
    const-string v0, "pending"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "verified"

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Q()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public static synthetic k(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ll/fph0;->f()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic l0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->k:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n0(Ll/kcg0;ZZLl/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-static {p3}, Ll/w1e;->e(Ll/l4g0;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/fph0;->o()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-static {}, Ll/fph0;->q()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic o(Ljava/util/List;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ljava/util/ArrayList;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    invoke-virtual {v2, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-object v2, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/android/app/Act;Ll/pf60;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p2, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V
    .locals 8

    .line 1
    new-instance v2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 2
    .line 3
    sget-object v0, Ll/gvb0;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "qq-space"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v3, "com.tencent.mobileqq"

    .line 12
    .line 13
    const-string v4, "com.tencent.mobileqqi"

    .line 14
    .line 15
    const-string v5, "com.tencent.tim"

    .line 16
    .line 17
    filled-new-array {v5, v3, v4}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "QQ\u7a7a\u95f4"

    .line 22
    .line 23
    invoke-direct {v2, v4, v0, v1, v3}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v0, p0

    .line 27
    move-object v1, p1

    .line 28
    move-object v3, p2

    .line 29
    move-object v4, p3

    .line 30
    move-object v5, p4

    .line 31
    move-object v6, p5

    .line 32
    move-object v7, p6

    .line 33
    invoke-static/range {v0 .. v7}, Ll/qtk;->N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic q(Landroid/widget/TextView;[ZLv/VCheckBox;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p3, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const-string p0, "agreement_entrance"

    .line 15
    .line 16
    const-string p3, "bind_popup"

    .line 17
    .line 18
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p3, "e_sign_in_agreement"

    .line 27
    .line 28
    const-string v0, ""

    .line 29
    .line 30
    invoke-static {p3, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    aget-boolean p3, p1, p0

    .line 35
    .line 36
    xor-int/lit8 p3, p3, 0x1

    .line 37
    .line 38
    aput-boolean p3, p1, p0

    .line 39
    .line 40
    invoke-virtual {p2, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/x20;ZLv/VEditText;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p5, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p5

    .line 23
    invoke-static {p5}, Ll/l51;->K(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget p5, Lcom/p1/mobile/putong/core/R$string;->xt:I

    .line 27
    .line 28
    invoke-virtual {p0, p5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/qtk;->H0(Ll/jl80;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 39
    .line 40
    .line 41
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    invoke-interface {p2}, Ll/x20;->call()V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p3, p0}, Ll/fph0;->j(ZLjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic r(Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/z0w;->u()V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-static {}, Ll/fph0;->k()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic r0(Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_share_pop_cancel"

    .line 2
    .line 3
    const-string v0, "p_share_pop"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic s([Ll/jl80;Ll/uxj0;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object v0, p0, p1

    .line 3
    .line 4
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    aget-object p0, p0, p1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ssk;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ssk;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 25
    .line 26
    const-string v1, "hidden"

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/lang/Integer;

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/dkb;->I7()Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_0

    .line 59
    .line 60
    const/4 p1, 0x1

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 p1, 0x0

    .line 63
    :goto_0
    if-eqz v0, :cond_1

    .line 64
    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Q()V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/data/ShareItemBean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ShareItemBean;->getTag()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "foot_print"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic t0(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/fph0;->i(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    sget p0, Lcom/p1/mobile/putong/core/R$string;->z3:I

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic u(ZLcom/p1/mobile/android/app/Act;Lv/VText;Lv/VButton;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/fph0;->i(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    instance-of p0, p4, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    move-object p0, p4

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 15
    .line 16
    const p1, 0x9c40

    .line 17
    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    invoke-static {p4}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {p0}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    invoke-static {p4}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const/4 p1, 0x1

    .line 36
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    sget p0, Ll/qa00;->j:I

    .line 43
    .line 44
    invoke-static {p3, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-static {p4}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V
    .locals 8

    .line 1
    new-instance v2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 2
    .line 3
    sget-object v0, Ll/hvb0;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "qq_friend"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v3, "com.tencent.mobileqq"

    .line 12
    .line 13
    const-string v4, "com.tencent.mobileqqi"

    .line 14
    .line 15
    const-string v5, "com.tencent.tim"

    .line 16
    .line 17
    filled-new-array {v5, v3, v4}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "QQ\u597d\u53cb"

    .line 22
    .line 23
    invoke-direct {v2, v4, v0, v1, v3}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    move-object v0, p0

    .line 27
    move-object v1, p1

    .line 28
    move-object v3, p2

    .line 29
    move-object v4, p3

    .line 30
    move-object v5, p4

    .line 31
    move-object v6, p5

    .line 32
    move-object v7, p6

    .line 33
    invoke-static/range {v0 .. v7}, Ll/qtk;->N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Link;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;Ll/a30;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic v([ZLv/VCheckBox;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "agreement_entrance"

    .line 2
    .line 3
    const-string v0, "bind_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_sign_in_agreement"

    .line 14
    .line 15
    const-string v1, ""

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    aget-boolean v0, p0, p2

    .line 22
    .line 23
    xor-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    aput-boolean v0, p0, p2

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic v0(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-wide/16 v0, 0xc8

    .line 16
    .line 17
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic w(Lv/VText;Lv/VEditText;Lv/VText;Lv/VButton;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/core/R$string;->bp:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :goto_0
    instance-of p0, p4, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    move-object p0, p4

    .line 40
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 41
    .line 42
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 43
    .line 44
    const p1, 0x9c40

    .line 45
    .line 46
    .line 47
    if-ne p0, p1, :cond_1

    .line 48
    .line 49
    invoke-static {p4}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {p0}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    invoke-static {p4}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    sget p0, Ll/qa00;->j:I

    .line 70
    .line 71
    invoke-static {p3, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    invoke-static {p4}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static synthetic w0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/jl80;ZLandroid/view/View;)V
    .locals 2

    .line 1
    const-string p4, "\u767b\u51fa\u5f53\u524d\u5e10\u53f7"

    .line 2
    .line 3
    invoke-virtual {p4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/vq8;->c()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p4

    .line 32
    if-eqz p4, :cond_0

    .line 33
    .line 34
    sget-object p4, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 35
    .line 36
    iget-object p4, p4, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getAuthData()Ll/gxd0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/p1/mobile/putong/data/AuthData;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p4, v0, v1, p0}, Ll/yyd0;->p(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    const/4 p0, 0x1

    .line 64
    const/4 p4, 0x0

    .line 65
    invoke-static {p0, p4}, Ll/uqb0;->Z0(ZZ)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance p4, Ll/bsk;

    .line 78
    .line 79
    invoke-direct {p4}, Ll/bsk;-><init>()V

    .line 80
    .line 81
    .line 82
    new-instance v0, Ll/csk;

    .line 83
    .line 84
    invoke-direct {v0, p1}, Ll/csk;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p4, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    :cond_1
    invoke-static {p2}, Ll/qtk;->H0(Ll/jl80;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 98
    .line 99
    .line 100
    if-nez p3, :cond_2

    .line 101
    .line 102
    invoke-static {}, Ll/fph0;->e()V

    .line 103
    .line 104
    .line 105
    :cond_2
    return-void
.end method

.method public static synthetic x(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lv/VButton;Landroid/widget/LinearLayout;Landroid/view/View;ZLandroid/view/View;)V
    .locals 0

    .line 1
    const/4 p6, 0x0

    .line 2
    invoke-static {p0, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    sget p0, Ll/qa00;->m:I

    .line 16
    .line 17
    invoke-static {p4, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 18
    .line 19
    .line 20
    const-string p0, "on"

    .line 21
    .line 22
    const-string p1, "signout"

    .line 23
    .line 24
    if-eqz p5, :cond_0

    .line 25
    .line 26
    move-object p2, p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object p2, p0

    .line 29
    :goto_0
    invoke-static {p2}, Ll/fph0;->d(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    if-eqz p5, :cond_1

    .line 33
    .line 34
    move-object p0, p1

    .line 35
    :cond_1
    const-string p1, "no_number"

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/fph0;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/core/data/ShareItemBean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ShareItemBean;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u53d6\u6d88\u559c\u6b22"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic y()V
    .locals 2

    .line 1
    const-string v0, "e_reback_popup_cancel"

    .line 2
    .line 3
    const-string v1, "p_reback_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/x20;ZLv/VEditText;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p5, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    sget p5, Lcom/p1/mobile/putong/core/R$string;->xt:I

    .line 20
    .line 21
    invoke-virtual {p0, p5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 29
    .line 30
    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-interface {p2}, Ll/x20;->call()V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p3, p0}, Ll/fph0;->j(ZLjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic z(Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "e_share_pop_wechat_moment"

    .line 8
    .line 9
    const-string v0, "p_share_pop"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic z0(Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_save_picture"

    .line 2
    .line 3
    const-string v0, "p_share_pop"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
