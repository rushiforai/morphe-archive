.class public Lcom/p1/mobile/putong/core/ui/vip/likers/c;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/dwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/nnr;",
        ">;",
        "Ll/dwl;"
    }
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:Lcom/p1/mobile/putong/data/Links;

.field public d:Lcom/p1/mobile/putong/data/User;

.field public e:Landroid/view/ViewGroup;

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

.field public i:I

.field public j:J

.field public k:Lcom/p1/mobile/android/app/Act;

.field public l:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

.field public final m:Ll/jxd0;

.field public final n:Ll/jxd0;

.field public o:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public p:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Ljava/lang/Runnable;

.field public final u:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->e:Landroid/view/ViewGroup;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->f:Z

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->i:I

    .line 15
    .line 16
    new-instance v1, Ll/jxd0;

    .line 17
    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "see_help_clicked_"

    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-direct {v1, v2, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->m:Ll/jxd0;

    .line 46
    .line 47
    new-instance v1, Ll/jxd0;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v4, "has_see_guide_anim_shown_"

    .line 52
    .line 53
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-direct {v1, v2, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 72
    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->n:Ll/jxd0;

    .line 75
    .line 76
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-static {v1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->o:Lrx/subjects/a;

    .line 83
    .line 84
    invoke-static {v1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->p:Lrx/subjects/a;

    .line 89
    .line 90
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->r:Z

    .line 91
    .line 92
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 93
    .line 94
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/likers/c$a;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->t:Ljava/lang/Runnable;

    .line 100
    .line 101
    new-instance v0, Ll/lmr;

    .line 102
    .line 103
    invoke-direct {v0, p0}, Ll/lmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->u:Ljava/lang/Runnable;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k:Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 115
    .line 116
    invoke-static {}, Ll/rs9;->h()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->r:Z

    .line 121
    .line 122
    if-eqz p1, :cond_0

    .line 123
    .line 124
    invoke-static {}, Ll/eqq0;->k()Ll/eqq0;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Ll/eqq0;->n()V

    .line 129
    .line 130
    .line 131
    :cond_0
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->f1(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V

    return-void
.end method

.method private B1()V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->m5()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/nnr;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ll/nnr;->W(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Q1()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 27
    .line 28
    const-string v3, ""

    .line 29
    .line 30
    const/16 v4, 0xa

    .line 31
    .line 32
    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/CoreLikers;->j7(IJLjava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c:Lcom/p1/mobile/putong/data/Links;

    .line 41
    .line 42
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    const-string v6, ""

    .line 46
    .line 47
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Z6(Lcom/p1/mobile/putong/data/Links;JILjava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->b:J

    .line 55
    .line 56
    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic D0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k1(Ll/vg60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E0(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->v1(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic G0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic H0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->i1(Ll/vg60;)V

    return-void
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->m1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->j1(Ll/vg60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic N0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
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
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->p1()V

    return-void
.end method

.method public static synthetic P0(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/eqq0;->k()Ll/eqq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/eqq0;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MemberZoneFilter;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic Q0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->t1()V

    return-void
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->o1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/vg60;Ljava/lang/Boolean;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d1(Ll/vg60;Ljava/lang/Boolean;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method private W0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->k5()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->O1()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->B1()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

    .line 4
    .line 5
    if-lez p0, :cond_0

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

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->r1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->h1()V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Settings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic h1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Q1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "seepageBottomReach"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->N1(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic i0(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/dkb;->va(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c1(Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->n1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->x1(Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->e1(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a1(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l1(Ll/vg60;)V

    return-void
.end method

.method private synthetic o1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->Y0:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->J1(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/nnr;

    .line 21
    .line 22
    sget v0, Ll/gbc0;->u0:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/nnr;->U(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Ll/nnr;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/nnr;->G()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p1, Ll/nnr;

    .line 37
    .line 38
    new-instance v0, Ll/rmr;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/rmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ll/nnr;->H(Ll/x20;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p1, Ll/nnr;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/nnr;->V()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p0, Ll/nnr;

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p0, p1, v0}, Ll/nnr;->a(ZZ)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->p0:Ll/jxd0;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_1

    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->p0:Ll/jxd0;

    .line 85
    .line 86
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method private synthetic p1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->t:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/nnr;

    .line 9
    .line 10
    iget-object v0, v0, Ll/nnr;->J:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->u:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/e7d0;->f()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/e7d0;->c()Ll/e7d0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "see"

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/e7d0;->g(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->u1(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->b1(Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/data/Counter;)Lcom/p1/mobile/putong/data/LikersLimit;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic s1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->p:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Bb(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g1(Ll/vg60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic t1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nnr;

    .line 4
    .line 5
    new-instance v1, Ll/smr;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/smr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/nnr;->c0(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s1()V

    return-void
.end method

.method public static synthetic x0(Ll/pf60;)Ljava/lang/Boolean;
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
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

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

.method public static synthetic y0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;Lcom/p1/mobile/putong/data/LikersLimit;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->q1(Lcom/p1/mobile/putong/data/LikersLimit;)V

    return-void
.end method


# virtual methods
.method public C1(Lcom/p1/mobile/putong/data/Links;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/eqq0;->k()Ll/eqq0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/eqq0;->i()Lcom/p1/mobile/putong/core/data/MemberZoneFilter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->o1:Ll/dt9;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    :goto_0
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 24
    .line 25
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/Converter;->dateToApiTimeString(J)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v0, p1, v2}, Ll/dt9;->j3(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 36
    .line 37
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    const-string v6, ""

    .line 41
    .line 42
    move-object v2, p1

    .line 43
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Z6(Lcom/p1/mobile/putong/data/Links;JILjava/lang/String;)Lrx/c;

    .line 44
    .line 45
    .line 46
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->b:J

    .line 51
    .line 52
    return-void
.end method

.method public D1(IILandroid/content/Intent;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ck()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eq p2, p1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eq p2, p1, :cond_0

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-ne p2, p1, :cond_4

    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Ll/mmr;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/mmr;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v0, Ll/nmr;

    .line 52
    .line 53
    invoke-direct {v0, p0, p2, p3}, Ll/nmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;ILandroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return v1

    .line 64
    :cond_1
    const/16 v0, 0x312

    .line 65
    .line 66
    if-ne p1, v0, :cond_2

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-interface {p1, p2, p3, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Yq(ILandroid/content/Intent;Lcom/p1/mobile/android/app/Act;)V

    .line 79
    .line 80
    .line 81
    return v1

    .line 82
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->bj()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-ne p1, v0, :cond_4

    .line 95
    .line 96
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eq p2, p1, :cond_3

    .line 103
    .line 104
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eq p2, p1, :cond_3

    .line 111
    .line 112
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-ne p2, p1, :cond_4

    .line 119
    .line 120
    :cond_3
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    new-instance v0, Ll/pmr;

    .line 125
    .line 126
    invoke-direct {v0}, Ll/pmr;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance v0, Ll/qmr;

    .line 134
    .line 135
    invoke-direct {v0, p0, p2, p3}, Ll/qmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;ILandroid/content/Intent;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    return v1

    .line 146
    :cond_4
    const/4 p0, 0x0

    .line 147
    return p0
.end method

.method public E(Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    iget-object v7, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v5, 0x0

    .line 16
    const/4 v6, 0x0

    .line 17
    move-object v1, p0

    .line 18
    move v2, p2

    .line 19
    move v4, p3

    .line 20
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->V0(ZZZZILjava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->An(Lcom/p1/mobile/putong/data/User;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public E1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nnr;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nnr;->z()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public F1(Landroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nnr;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/nnr;->A(Landroid/view/Menu;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/nnr;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->m:Ll/jxd0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1, v0}, Ll/nnr;->T(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->m:Ll/jxd0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->m:Ll/jxd0;

    .line 42
    .line 43
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    const/4 p0, 0x1

    .line 49
    return p0
.end method

.method public H1(Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    iget-object v6, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x1

    .line 17
    const/4 v5, 0x0

    .line 18
    move-object v0, p0

    .line 19
    move v1, p2

    .line 20
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->V0(ZZZZILjava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final I1(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->o1:Ll/dt9;

    .line 4
    .line 5
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a:J

    .line 6
    .line 7
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/Converter;->dateToApiTimeString(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1, p0}, Ll/dt9;->j3(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public J(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public final J1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "push_call2buysee"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "push_call2buysee_side_new"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "msg_call2buysee"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const-string p0, "msg_call2buysee_side_new"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public L(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

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
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const/4 v7, 0x0

    .line 12
    const-string v8, "QuickGreeting"

    .line 13
    .line 14
    const-string v4, "[\u6446\u624b]"

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    const/4 v6, 0x0

    .line 18
    move-object v3, p1

    .line 19
    invoke-interface/range {v1 .. v8}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->lm(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public L1()Z
    .locals 2

    .line 1
    const-string v0, "push_call2buysee_side_new"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "msg_call2buysee_side_new"

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public N1(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->j:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x12c

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v0, v1, p1}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->j:J

    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final O1()V
    .locals 3

    .line 1
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->m0:Ll/byd0;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->n0:Ll/byd0;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public P(I)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-gtz p1, :cond_0

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->Y0:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->X0:I

    .line 13
    .line 14
    const/16 v1, 0x63

    .line 15
    .line 16
    if-le p1, v1, :cond_1

    .line 17
    .line 18
    const-string p1, "99+"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final P1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/tmr;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/tmr;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/umr;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/umr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public Q1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->J1(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public U0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final V0(ZZZZILjava/lang/String;)Z
    .locals 10

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
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    move-object v8, v1

    .line 12
    check-cast v8, Ll/ewl;

    .line 13
    .line 14
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 15
    .line 16
    move-object v7, p0

    .line 17
    move v1, p1

    .line 18
    move v2, p2

    .line 19
    move v3, p3

    .line 20
    move v4, p4

    .line 21
    move v5, p5

    .line 22
    move-object/from16 v6, p6

    .line 23
    .line 24
    invoke-interface/range {v0 .. v9}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->fe(ZZZZILjava/lang/String;Ll/dwl;Ll/ewl;Ll/cwl;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    return v0
.end method

.method public X0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public final Y0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public Z()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "from"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "style"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->h:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "show_giving_boost"

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->q:Z

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->n:Ll/jxd0;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->p:Lrx/subjects/a;

    .line 68
    .line 69
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->W0()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public a0()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/slr;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/slr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/ulr;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ulr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->J1(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v2, Ll/emr;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/emr;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v2, Ll/fmr;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/fmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->V6()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v2, Ll/gmr;

    .line 78
    .line 79
    invoke-direct {v2}, Ll/gmr;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v2, Ll/hmr;

    .line 87
    .line 88
    invoke-direct {v2, p0}, Ll/hmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    new-instance v2, Ll/imr;

    .line 111
    .line 112
    invoke-direct {v2}, Ll/imr;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v2, Ll/jmr;

    .line 120
    .line 121
    invoke-direct {v2, p0}, Ll/jmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 132
    .line 133
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    new-instance v2, Ll/kmr;

    .line 144
    .line 145
    invoke-direct {v2}, Ll/kmr;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v2, Ll/cjr;

    .line 153
    .line 154
    invoke-direct {v2}, Ll/cjr;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v2}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    new-instance v2, Ll/dmr;

    .line 166
    .line 167
    invoke-direct {v2, p0}, Ll/dmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    const-wide/16 v2, 0x1

    .line 175
    .line 176
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 177
    .line 178
    invoke-virtual {v0, v2, v3, v4}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    new-instance v2, Ll/omr;

    .line 191
    .line 192
    invoke-direct {v2, p0}, Ll/omr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 193
    .line 194
    .line 195
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 200
    .line 201
    .line 202
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 203
    .line 204
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->N6()Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->o:Lrx/subjects/a;

    .line 211
    .line 212
    new-instance v3, Ll/vmr;

    .line 213
    .line 214
    invoke-direct {v3, p0}, Ll/vmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 215
    .line 216
    .line 217
    invoke-static {v0, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    new-instance v2, Ll/wmr;

    .line 226
    .line 227
    invoke-direct {v2}, Ll/wmr;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    new-instance v2, Ll/xmr;

    .line 235
    .line 236
    invoke-direct {v2, p0}, Ll/xmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 237
    .line 238
    .line 239
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 244
    .line 245
    .line 246
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->r:Z

    .line 247
    .line 248
    if-eqz v0, :cond_1

    .line 249
    .line 250
    invoke-static {}, Ll/eqq0;->k()Ll/eqq0;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v0}, Ll/eqq0;->h()Lrx/c;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    new-instance v2, Ll/ymr;

    .line 263
    .line 264
    invoke-direct {v2}, Ll/ymr;-><init>()V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0, v2}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    new-instance v2, Ll/zmr;

    .line 276
    .line 277
    invoke-direct {v2, p0}, Ll/zmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 278
    .line 279
    .line 280
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 285
    .line 286
    .line 287
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->o1:Ll/dt9;

    .line 290
    .line 291
    invoke-virtual {v0}, Ll/dt9;->i3()Lrx/c;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    new-instance v2, Ll/anr;

    .line 300
    .line 301
    invoke-direct {v2, p0}, Ll/anr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    new-instance v2, Ll/bnr;

    .line 309
    .line 310
    invoke-direct {v2, p0}, Ll/bnr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 311
    .line 312
    .line 313
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 318
    .line 319
    .line 320
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 321
    .line 322
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 323
    .line 324
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->N6()Lrx/c;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    new-instance v2, Ll/tlr;

    .line 333
    .line 334
    invoke-direct {v2, p0}, Ll/tlr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    new-instance v2, Ll/vlr;

    .line 342
    .line 343
    invoke-direct {v2, p0}, Ll/vlr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    new-instance v2, Ll/wlr;

    .line 351
    .line 352
    invoke-direct {v2, p0}, Ll/wlr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 353
    .line 354
    .line 355
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 356
    .line 357
    .line 358
    move-result-object v2

    .line 359
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 360
    .line 361
    .line 362
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 363
    .line 364
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 365
    .line 366
    invoke-virtual {v0}, Ll/dkb;->wa()Lrx/c;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    new-instance v2, Ll/xlr;

    .line 375
    .line 376
    invoke-direct {v2}, Ll/xlr;-><init>()V

    .line 377
    .line 378
    .line 379
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 384
    .line 385
    .line 386
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    new-instance v2, Ll/ylr;

    .line 391
    .line 392
    invoke-direct {v2}, Ll/ylr;-><init>()V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    new-instance v2, Ll/zlr;

    .line 400
    .line 401
    invoke-direct {v2, p0}, Ll/zlr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 402
    .line 403
    .line 404
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 405
    .line 406
    .line 407
    move-result-object v2

    .line 408
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 409
    .line 410
    .line 411
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->o:Lrx/subjects/a;

    .line 412
    .line 413
    new-instance v2, Ll/amr;

    .line 414
    .line 415
    invoke-direct {v2}, Ll/amr;-><init>()V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 419
    .line 420
    .line 421
    move-result-object v0

    .line 422
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    new-instance v1, Ll/bmr;

    .line 431
    .line 432
    invoke-direct {v1}, Ll/bmr;-><init>()V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    new-instance v1, Ll/cmr;

    .line 440
    .line 441
    invoke-direct {v1, p0}, Ll/cmr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V

    .line 442
    .line 443
    .line 444
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 449
    .line 450
    .line 451
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->P1()V

    .line 452
    .line 453
    .line 454
    return-void
.end method

.method public final synthetic a1(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->W0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b1(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->t:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->m5()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->J1(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const-string p1, "seepageDislike"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p1, "seepageLike"

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->N1(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic c1(Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c:Lcom/p1/mobile/putong/data/Links;

    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->f:Z

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->l5()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->B1()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic d1(Ll/vg60;Ljava/lang/Boolean;)Landroid/util/Pair;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->n:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->r:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/eqq0;->k()Ll/eqq0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/eqq0;->n()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic e1(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->n:Ll/jxd0;

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/nnr;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/nnr;->R()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->u:Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->u:Ljava/lang/Runnable;

    .line 33
    .line 34
    const-wide/16 v0, 0x2bc

    .line 35
    .line 36
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->k:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Bb(Lcom/p1/mobile/android/app/Act;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic f1(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/eqq0;->k()Ll/eqq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/eqq0;->p(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/eqq0;->k()Ll/eqq0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Ll/eqq0;->l(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->j5()V

    .line 28
    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 31
    .line 32
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->B1()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->I1(Lcom/p1/mobile/putong/core/data/MemberZoneFilter;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p0, Ll/nnr;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/nnr;->W(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic g1(Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->s:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic i1(Ll/vg60;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 12
    :goto_1
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/nnr;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/nnr;->S(Ll/vg60;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic j1(Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Q1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic k1(Ll/vg60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Y0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic l1(Ll/vg60;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 12
    :goto_1
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    goto :goto_2

    .line 18
    :cond_2
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    :goto_2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->i:I

    .line 23
    .line 24
    if-lez v0, :cond_3

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->f:Z

    .line 28
    .line 29
    :cond_3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/nnr;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/nnr;->S(Ll/vg60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic m1(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/nnr;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/nnr;->F()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->m:Ll/jxd0;

    .line 12
    .line 13
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic n1(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s8()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Ll/nnr;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/nnr;->a0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Ll/nnr;

    .line 25
    .line 26
    const/16 v0, 0xfa0

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/nnr;->Z(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Ll/nnr;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/nnr;->y()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic q1(Lcom/p1/mobile/putong/data/LikersLimit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->B1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r1(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    check-cast v0, Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :goto_0
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eq v0, v2, :cond_1

    .line 23
    .line 24
    const/16 v2, 0xa

    .line 25
    .line 26
    if-ge v0, v2, :cond_1

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->B1()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Ll/nnr;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/nnr;->E()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v2, Ljava/util/List;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->T(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, Ljava/util/Collection;

    .line 55
    .line 56
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast v2, Ll/nnr;

    .line 63
    .line 64
    invoke-virtual {v2, v1, v0}, Ll/nnr;->a(ZZ)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast v1, Ll/nnr;

    .line 70
    .line 71
    xor-int/lit8 v2, v0, 0x1

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ll/nnr;->b0(Z)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast v1, Ll/nnr;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Ll/nnr;->Y(Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p1, Ljava/lang/Integer;

    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->i:I

    .line 92
    .line 93
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 94
    .line 95
    check-cast v0, Ll/nnr;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->P(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0, p0}, Ll/nnr;->setTitle(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public s()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->e:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic u1(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 9

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->e:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_4

    .line 8
    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_4

    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->e:Landroid/view/ViewGroup;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p3, v0}, Landroid/view/View;->setClickable(Z)V

    .line 21
    .line 22
    .line 23
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 24
    .line 25
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    const/4 v1, 0x1

    .line 30
    if-eq p1, p3, :cond_1

    .line 31
    .line 32
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 33
    .line 34
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-ne p1, p3, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v3, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    move v3, v1

    .line 44
    :goto_1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 45
    .line 46
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    if-ne p1, p3, :cond_2

    .line 51
    .line 52
    move v4, v1

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    move v4, v0

    .line 55
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->d:Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    if-eqz p3, :cond_3

    .line 72
    .line 73
    const-string p1, "currentImageIndex"

    .line 74
    .line 75
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const-string p1, "currentImageUrl"

    .line 80
    .line 81
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    :cond_3
    move-object v8, p1

    .line 86
    move v7, v0

    .line 87
    const/4 v5, 0x1

    .line 88
    const/4 v6, 0x0

    .line 89
    move-object v2, p0

    .line 90
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->V0(ZZZZILjava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    :cond_4
    return-void
.end method

.method public final synthetic v1(ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V
    .locals 9

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nnr;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nnr;->C()Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_4

    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->e:Ll/sm70;

    .line 12
    .line 13
    invoke-virtual {p3}, Ll/sm70;->j0()Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->e:Ll/sm70;

    .line 18
    .line 19
    iget-object v0, v0, Ll/sm70;->c:Lcom/p1/mobile/putong/core/data/PicksUser;

    .line 20
    .line 21
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-eqz p3, :cond_4

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-eqz p3, :cond_4

    .line 32
    .line 33
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p3, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 44
    .line 45
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    const/4 v0, 0x1

    .line 50
    const/4 v1, 0x0

    .line 51
    if-eq p1, p3, :cond_1

    .line 52
    .line 53
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 54
    .line 55
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-ne p1, p3, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move v2, v1

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    :goto_0
    move v2, v0

    .line 65
    :goto_1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 66
    .line 67
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-ne p1, v3, :cond_2

    .line 72
    .line 73
    move v3, v0

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    move v3, v1

    .line 76
    :goto_2
    iget-object v0, v7, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    const/4 v5, 0x0

    .line 91
    if-eqz v4, :cond_3

    .line 92
    .line 93
    const-string v0, "currentImageIndex"

    .line 94
    .line 95
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    const-string v0, "currentImageUrl"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-ne p1, p3, :cond_3

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->pc()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    :cond_3
    move-object v6, v0

    .line 128
    move-object v8, v5

    .line 129
    move v5, v1

    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->e:Ll/sm70;

    .line 131
    .line 132
    const/4 v4, 0x1

    .line 133
    invoke-virtual/range {v1 .. v8}, Ll/sm70;->n0(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    :cond_4
    return-void
.end method

.method public final synthetic x1(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->V0:Ll/jxd0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->o:Lrx/subjects/a;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p0, Ll/nnr;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/nnr;->P()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public z1()Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->L1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;->newStyle1:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;->defaultStyle:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersItemView$LikersItemStyle;

    .line 11
    .line 12
    return-object p0
.end method
