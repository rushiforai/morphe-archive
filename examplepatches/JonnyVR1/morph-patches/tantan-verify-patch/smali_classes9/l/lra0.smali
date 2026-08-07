.class public Ll/lra0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/tra0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:I

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public final d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x64

    .line 5
    .line 6
    iput v0, p0, Ll/lra0;->a:I

    .line 7
    .line 8
    iput-object p1, p0, Ll/lra0;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e0(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/Question;)Lcom/p1/mobile/putong/core/data/Question;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Question;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/QuestionEditable;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic g0(Ll/lra0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lra0;->n0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h0(Ll/lra0;Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lra0;->m0(Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "ja"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuestionEditable;->languages:Ljava/util/List;

    .line 26
    .line 27
    const-string v0, "ja-JP"

    .line 28
    .line 29
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuestionEditable;->languages:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_1

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 p0, 0x0

    .line 51
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static synthetic k0(Ll/lra0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lra0;->o0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic o0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 4
    .line 5
    iget-object v0, p0, Ll/lra0;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->H:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

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
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/tra0;

    .line 22
    .line 23
    iget-object v1, p0, Ll/lra0;->b:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object p0, p0, Ll/lra0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 26
    .line 27
    invoke-virtual {v0, v1, p0, p1}, Ll/tra0;->q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/lra0;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 7
    .line 8
    iput-object v0, p0, Ll/lra0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/lra0;->b:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Ll/lra0;->b:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Ll/lra0;->b:Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    :cond_1
    iget-object v0, p0, Ll/lra0;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->H:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 85
    .line 86
    iget-object v0, v0, Ll/kua;->R:Ll/mof0;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/dra0;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/dra0;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/era0;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/era0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/fra0;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/fra0;-><init>(Ll/lra0;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/gra0;

    .line 124
    .line 125
    invoke-direct {v1}, Ll/gra0;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    new-instance v1, Ll/hra0;

    .line 133
    .line 134
    invoke-direct {v1}, Ll/hra0;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lrx/c;->toList()Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/ira0;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/ira0;-><init>(Ll/lra0;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_2
    new-instance v0, Ll/jra0;

    .line 163
    .line 164
    invoke-direct {v0, p0}, Ll/jra0;-><init>(Ll/lra0;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/lra0;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 8
    .line 9
    new-instance v0, Ll/kra0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/kra0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final synthetic n0(Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p1, Ll/tra0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/lra0;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object p0, p0, Ll/lra0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/data/Question;

    .line 30
    .line 31
    invoke-virtual {p1, v1, p0, v0}, Ll/tra0;->q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
