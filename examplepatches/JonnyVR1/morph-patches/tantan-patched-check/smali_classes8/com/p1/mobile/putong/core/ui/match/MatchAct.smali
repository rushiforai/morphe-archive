.class public Lcom/p1/mobile/putong/core/ui/match/MatchAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/d0r;
.implements Ll/crl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/match/MatchAct$a;,
        Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;
    }
.end annotation


# instance fields
.field public c:Ll/k8x;

.field public d:Ll/qyl;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Z

.field public h:I

.field public i:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->f:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->i:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_enter_time:I

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object p1, p1, Ll/dkb;->e3:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->toJson()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :catch_0
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_time:I

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object p1, p1, Ll/dkb;->e3:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->toJson()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_head_time:I

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object p1, p1, Ll/dkb;->e3:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->toJson()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->n2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_exit_time:I

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object p1, p1, Ll/dkb;->e3:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->toJson()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->m2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->o2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->l2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    return-void
.end method

.method public static g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "user_list"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "match_type"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "extra_list"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "from"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public debugItems()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
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
    invoke-static {}, Ll/dj30;->l()Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v3, "\u7537\u6027 \u8fdb\u5165\u52a8\u753b\u65f6\u95f4 "

    .line 13
    .line 14
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget v3, v1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_enter_time:I

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v3, Ll/m6x;

    .line 27
    .line 28
    invoke-direct {v3, p0, v1}, Ll/m6x;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v3, "\u7537\u6027 \u952e\u76d8\u5f39\u8d77\u52a8\u753b\u65f6\u95f4 "

    .line 41
    .line 42
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget v3, v1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_time:I

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    new-instance v3, Ll/n6x;

    .line 55
    .line 56
    invoke-direct {v3, p0, v1}, Ll/n6x;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v3, "\u7537\u6027 \u5934\u50cf\u6536\u8d77\u52a8\u753b\u65f6\u95f4 "

    .line 69
    .line 70
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget v3, v1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_head_time:I

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    new-instance v3, Ll/o6x;

    .line 83
    .line 84
    invoke-direct {v3, p0, v1}, Ll/o6x;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    new-instance v2, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v3, "\u7537\u6027 \u9000\u51fa\u52a8\u753b\u65f6\u95f4 "

    .line 97
    .line 98
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget v3, v1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_exit_time:I

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    new-instance v3, Ll/p6x;

    .line 111
    .line 112
    invoke-direct {v3, p0, v1}, Ll/p6x;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    return-object v0
.end method

.method public enterAnimation()Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qyl;->enterAnimation()Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qyl;->exitAnimation()Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/qyl;->h(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "user_list"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->f:Ljava/lang/String;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initAnimationState()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qyl;->initAnimationState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public initDataOnCreate()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->i2()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "match_type"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/16 v1, 0x2e

    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Ll/a550;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/a550;-><init>(Ll/ner;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 28
    .line 29
    new-instance v1, Ll/d550;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/d550;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 35
    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_0
    invoke-static {}, Ll/z7x;->b()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/16 v3, 0x500

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/v8x;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/v8x;-><init>(Ll/ner;)V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 63
    .line 64
    new-instance v1, Ll/g9x;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/g9x;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 70
    .line 71
    goto/16 :goto_2

    .line 72
    .line 73
    :cond_1
    invoke-static {}, Ll/gra;->g2()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_2

    .line 78
    .line 79
    invoke-static {}, Ll/gra;->i2()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_3

    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 88
    .line 89
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 94
    .line 95
    const-string v4, "male"

    .line 96
    .line 97
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->f:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/a;->p(Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_3

    .line 110
    .line 111
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->T1:Ll/hva;

    .line 114
    .line 115
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->f:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v4}, Ll/hva;->B3(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_3

    .line 122
    .line 123
    new-instance v1, Ll/v9x;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/v9x;-><init>(Ll/ner;)V

    .line 126
    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 129
    .line 130
    new-instance v1, Ll/jax;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/jax;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V

    .line 133
    .line 134
    .line 135
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 136
    .line 137
    goto/16 :goto_2

    .line 138
    .line 139
    :cond_3
    invoke-static {}, Ll/spl0;->S()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    const/4 v4, 0x1

    .line 144
    if-eqz v1, :cond_5

    .line 145
    .line 146
    const/16 v1, 0x2a

    .line 147
    .line 148
    if-eq v0, v1, :cond_4

    .line 149
    .line 150
    const/16 v1, 0x2b

    .line 151
    .line 152
    if-eq v0, v1, :cond_4

    .line 153
    .line 154
    const/16 v1, 0x2d

    .line 155
    .line 156
    if-ne v0, v1, :cond_5

    .line 157
    .line 158
    :cond_4
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 159
    .line 160
    new-instance v1, Ll/ydx;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Ll/ydx;-><init>(Ll/ner;)V

    .line 163
    .line 164
    .line 165
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 166
    .line 167
    new-instance v1, Ll/rex;

    .line 168
    .line 169
    invoke-direct {v1, p0}, Ll/rex;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V

    .line 170
    .line 171
    .line 172
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 173
    .line 174
    goto/16 :goto_2

    .line 175
    .line 176
    :cond_5
    invoke-static {}, Ll/gra;->n3()Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    const/16 v5, 0x400

    .line 181
    .line 182
    const/high16 v6, -0x80000000

    .line 183
    .line 184
    const/high16 v7, 0x4000000

    .line 185
    .line 186
    if-eqz v1, :cond_6

    .line 187
    .line 188
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->k2(I)Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_6

    .line 193
    .line 194
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 195
    .line 196
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v1, v7}, Landroid/view/Window;->clearFlags(I)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {v1, v6}, Landroid/view/Window;->addFlags(I)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v1, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 218
    .line 219
    .line 220
    new-instance v1, Ll/rgx;

    .line 221
    .line 222
    invoke-direct {v1, p0}, Ll/rgx;-><init>(Ll/ner;)V

    .line 223
    .line 224
    .line 225
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 226
    .line 227
    new-instance v1, Ll/ugx;

    .line 228
    .line 229
    invoke-direct {v1, p0}, Ll/ugx;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V

    .line 230
    .line 231
    .line 232
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    const/16 v8, 0x33

    .line 240
    .line 241
    const/16 v9, 0x32

    .line 242
    .line 243
    if-nez v1, :cond_9

    .line 244
    .line 245
    if-eq v0, v9, :cond_8

    .line 246
    .line 247
    if-ne v0, v8, :cond_7

    .line 248
    .line 249
    goto :goto_0

    .line 250
    :cond_7
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-virtual {v1, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 259
    .line 260
    .line 261
    goto :goto_1

    .line 262
    :cond_8
    :goto_0
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 263
    .line 264
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-virtual {v1, v7}, Landroid/view/Window;->clearFlags(I)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    invoke-virtual {v1, v6}, Landroid/view/Window;->addFlags(I)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    invoke-virtual {v1, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 286
    .line 287
    .line 288
    :goto_1
    new-instance v1, Ll/xbx;

    .line 289
    .line 290
    invoke-direct {v1, p0}, Ll/xbx;-><init>(Ll/ner;)V

    .line 291
    .line 292
    .line 293
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 294
    .line 295
    new-instance v1, Ll/xcx;

    .line 296
    .line 297
    invoke-direct {v1, p0}, Ll/xcx;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V

    .line 298
    .line 299
    .line 300
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 301
    .line 302
    goto :goto_2

    .line 303
    :cond_9
    if-eq v0, v9, :cond_a

    .line 304
    .line 305
    if-ne v0, v8, :cond_b

    .line 306
    .line 307
    :cond_a
    iput-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 308
    .line 309
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    invoke-virtual {v1, v7}, Landroid/view/Window;->clearFlags(I)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 317
    .line 318
    .line 319
    move-result-object v1

    .line 320
    invoke-virtual {v1, v6}, Landroid/view/Window;->addFlags(I)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-virtual {v1, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 331
    .line 332
    .line 333
    :cond_b
    new-instance v1, Ll/h7x;

    .line 334
    .line 335
    invoke-direct {v1, p0}, Ll/h7x;-><init>(Ll/ner;)V

    .line 336
    .line 337
    .line 338
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 339
    .line 340
    new-instance v1, Ll/y7x;

    .line 341
    .line 342
    invoke-direct {v1, p0}, Ll/y7x;-><init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V

    .line 343
    .line 344
    .line 345
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 346
    .line 347
    :goto_2
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    const-string v2, "from"

    .line 352
    .line 353
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 358
    .line 359
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    const-string v2, "extra_list"

    .line 364
    .line 365
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    const-string v3, "user_list"

    .line 374
    .line 375
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 380
    .line 381
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->f:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v3, v4, v0, v2, v1}, Ll/k8x;->q0(Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 384
    .line 385
    .line 386
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 387
    .line 388
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 389
    .line 390
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 391
    .line 392
    invoke-virtual {v0, v1, v2}, Ll/k8x;->t0(Ll/l4g0;Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 396
    .line 397
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->d:Ll/qyl;

    .line 398
    .line 399
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 400
    .line 401
    .line 402
    return-void
.end method

.method public initSubscription()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->c:Ll/k8x;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "match_type"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 21
    .line 22
    const/16 v1, 0x30

    .line 23
    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    const/16 v1, 0x31

    .line 27
    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    const/16 v1, 0x2f

    .line 31
    .line 32
    if-ne v0, v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void

    .line 36
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 37
    .line 38
    const-string v1, "p_intl_premium_match"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 44
    .line 45
    invoke-static {}, Ll/joa;->f4()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    xor-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "if_premuim"

    .line 56
    .line 57
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    filled-new-array {v0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public k2(I)Z
    .locals 0

    .line 1
    const/16 p0, 0x28

    if-eq p1, p0, :cond_1

    const/16 p0, 0x29

    if-eq p1, p0, :cond_1

    const/16 p0, 0x2a

    if-eq p1, p0, :cond_1

    const/16 p0, 0x2b

    if-eq p1, p0, :cond_1

    const/16 p0, 0x2d

    if-eq p1, p0, :cond_1

    const/16 p0, 0x2e

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic l2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "\u65f6\u95f4 = "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_enter_time:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/t6x;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/t6x;-><init>(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic m2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "\u65f6\u95f4 = "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_time:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/s6x;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/s6x;-><init>(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic n2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "\u65f6\u95f4 = "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_keyboard_show_head_time:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/q6x;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/q6x;-><init>(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public needBindBillingService()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "match_type"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 13
    .line 14
    const/16 v1, 0x30

    .line 15
    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    const/16 v1, 0x31

    .line 19
    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x32

    .line 23
    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    const/16 v1, 0x33

    .line 27
    .line 28
    if-ne v0, v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->needBindBillingService()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public final synthetic o2(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "\u65f6\u95f4 = "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;->male_exit_time:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/r6x;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/r6x;-><init>(Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public overridePendingTransition(II)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->i:Z

    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "match_type"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->f:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->f:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->p(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const-string p0, "p_limited_time_match"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 34
    .line 35
    const/16 v0, 0x30

    .line 36
    .line 37
    if-eq p0, v0, :cond_3

    .line 38
    .line 39
    const/16 v0, 0x31

    .line 40
    .line 41
    if-eq p0, v0, :cond_3

    .line 42
    .line 43
    const/16 v0, 0x2f

    .line 44
    .line 45
    if-ne p0, v0, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/16 v0, 0x32

    .line 49
    .line 50
    if-ne p0, v0, :cond_2

    .line 51
    .line 52
    const-string p0, "p_intl_instantmatch_no_ultra_view"

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    const-string p0, "p_successful_match_view"

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_3
    :goto_0
    const-string p0, "p_intl_premium_match"

    .line 59
    .line 60
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "match_type"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 16
    .line 17
    const/16 v0, 0x2e

    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/high16 v0, -0x80000000

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/high16 v0, 0x4000000

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 47
    .line 48
    .line 49
    const/16 p1, 0x400

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {}, Ll/bnl0;->F0()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-virtual {p0, v1, p1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public setTransparentStatusBar()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h:I

    .line 9
    .line 10
    const/16 v1, 0x2e

    .line 11
    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/16 v1, 0x33

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 v0, 0x400

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v0, 0x500

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public shouldSwitchToGradientColoredStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g:Z

    .line 2
    .line 3
    return p0
.end method
