.class public abstract Ll/an2;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/bwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ll/ar2<",
        "TV;>;",
        "Ll/bwl;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Lcom/p1/mobile/putong/core/data/LikeUser;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/an2;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/an2;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/an2;->H0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic f0(Ll/an2;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/an2;->G0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    const/4 p1, 0x4

    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic h0(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Ll/an2;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/an2;->D0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Z

    move-result p0

    return p0
.end method

.method public static synthetic j0(Ll/an2;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/an2;->W0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Ll/an2;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/an2;->F0(ILandroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public A0(ILandroid/content/Intent;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/an2;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_6

    .line 6
    .line 7
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v9

    .line 17
    if-eqz v9, :cond_7

    .line 18
    .line 19
    iget-object v1, v9, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    goto/16 :goto_6

    .line 28
    .line 29
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    const/4 v3, 0x0

    .line 37
    if-eq p1, v1, :cond_3

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-ne p1, v1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move v4, v3

    .line 49
    goto :goto_1

    .line 50
    :cond_3
    :goto_0
    move v4, v2

    .line 51
    :goto_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-ne p1, v1, :cond_4

    .line 58
    .line 59
    move v5, v2

    .line 60
    goto :goto_2

    .line 61
    :cond_4
    move v5, v3

    .line 62
    :goto_2
    iget-object p1, v9, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p2, :cond_5

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->bo()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->ch()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-nez v2, :cond_5

    .line 111
    .line 112
    move-object v7, v1

    .line 113
    :goto_3
    move v6, v3

    .line 114
    goto :goto_4

    .line 115
    :cond_5
    move-object v7, p1

    .line 116
    goto :goto_3

    .line 117
    :goto_4
    const/4 p1, 0x0

    .line 118
    if-eqz v5, :cond_6

    .line 119
    .line 120
    invoke-virtual {p0, p2, v0}, Ll/an2;->x0(Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    move-object v8, p2

    .line 125
    goto :goto_5

    .line 126
    :cond_6
    move-object v8, p1

    .line 127
    :goto_5
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {p0}, Ll/an2;->q0()Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    iget-object v10, p0, Ll/an2;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/an2;->t0()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v11

    .line 145
    new-instance v12, Ll/om2;

    .line 146
    .line 147
    invoke-direct {v12, p0}, Ll/om2;-><init>(Ll/an2;)V

    .line 148
    .line 149
    .line 150
    invoke-interface/range {v2 .. v12}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Qd(Lcom/p1/mobile/android/app/Act;ZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ljava/lang/String;Ll/y20;)Z

    .line 151
    .line 152
    .line 153
    iput-object p1, p0, Ll/an2;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 154
    .line 155
    :cond_7
    :goto_6
    return-void
.end method

.method public C0(I)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ck()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-ne p1, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final D0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq p0, p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public E0(I)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eq p1, p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eq p1, p0, :cond_1

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-ne p1, p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public final synthetic F0(ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/an2;->A0(ILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/an2;->Q0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/joa;->f4()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/an2;->q0()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p0}, Ll/an2;->s0()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-interface {p1, p2, p0, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iput-object p1, p0, Ll/an2;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Ll/an2;->S0(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic G0(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p0, Ll/an2;->a:Z

    .line 10
    .line 11
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/an2;->L0(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/an2;->J0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/an2;->N0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public I0(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/an2;->C0(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, Ll/an2;->z0(ILandroid/content/Intent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/16 v0, 0x312

    .line 13
    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p2, p3}, Ll/an2;->y0(ILandroid/content/Intent;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public abstract J0()V
.end method

.method public K(Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/an2;->O0(Lcom/p1/mobile/putong/core/data/LikeUser;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/r79;->A(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/an2;->r0()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-gtz p1, :cond_0

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Ll/an2;->P0(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public abstract L0(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation
.end method

.method public N(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/data/User;)V
    .locals 12

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/an2;->R0(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0}, Ll/an2;->q0()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/an2;->t0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v10

    .line 42
    new-instance v11, Ll/om2;

    .line 43
    .line 44
    invoke-direct {v11, p0}, Ll/om2;-><init>(Ll/an2;)V

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    const/4 v4, 0x1

    .line 49
    const/4 v5, 0x0

    .line 50
    const/4 v7, 0x0

    .line 51
    move-object v9, p1

    .line 52
    move-object v8, p2

    .line 53
    invoke-interface/range {v1 .. v11}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Qd(Lcom/p1/mobile/android/app/Act;ZZILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/LikeUser;Ljava/lang/String;Ll/y20;)Z

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public N0()V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/r79;->j()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/r79;->k()V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    const/16 v1, 0x14

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Ll/r79;->x(II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public abstract O0(Lcom/p1/mobile/putong/core/data/LikeUser;)Z
.end method

.method public abstract P0(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Q0()V
.end method

.method public abstract R0(Ljava/lang/String;)V
.end method

.method public S0(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/an2;->q0()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v1, Ll/qm2;

    .line 16
    .line 17
    invoke-direct {v1, p2}, Ll/qm2;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s7(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public U0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/r79;->l()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/sm2;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/sm2;-><init>(Ll/an2;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/tm2;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/tm2;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public V0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->On()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/um2;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/um2;-><init>(Ll/an2;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/vm2;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/vm2;-><init>(Ll/an2;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/wm2;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/wm2;-><init>(Ll/an2;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/xm2;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/xm2;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final W0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->fromSign:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/joa;->y3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/pm2;

    .line 32
    .line 33
    invoke-direct {v0, p1}, Ll/pm2;-><init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public b()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/an2;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/an2;->r0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    add-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/r79;->k()V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 22
    .line 23
    const/16 v1, 0x14

    .line 24
    .line 25
    invoke-virtual {v0, p0, v1}, Ll/r79;->x(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/an2;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public o(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->a1:Ll/r79;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/r79;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final p0(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ym2;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ym2;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/zm2;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ll/zm2;-><init>(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public abstract q0()Lcom/p1/mobile/android/app/Act;
.end method

.method public abstract r0()I
.end method

.method public abstract s0()Ljava/lang/String;
.end method

.method public abstract t0()Ljava/lang/String;
.end method

.method public u0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/an2;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, v0}, Ll/an2;->K(Lcom/p1/mobile/putong/core/data/LikeUser;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/an2;->b:Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 11
    .line 12
    return-void
.end method

.method public x0(Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->gl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L8()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_1

    .line 50
    .line 51
    return-object p1

    .line 52
    :cond_1
    return-object p0
.end method

.method public y0(ILandroid/content/Intent;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/an2;->q0()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Jb(Lcom/p1/mobile/android/app/Act;ILandroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public z0(ILandroid/content/Intent;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    new-instance p1, Ll/nm2;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/nm2;-><init>(Ll/an2;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/an2;->p0(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Ll/an2;->E0(I)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    new-instance v0, Ll/rm2;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1, p2}, Ll/rm2;-><init>(Ll/an2;ILandroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/an2;->p0(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return p0
.end method
