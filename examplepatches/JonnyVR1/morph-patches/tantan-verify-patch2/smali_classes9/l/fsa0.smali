.class public Ll/fsa0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/gsa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

.field public d:Lcom/p1/mobile/putong/core/data/Question;

.field public e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/fsa0;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/fsa0;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Ll/fsa0;Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fsa0;->r0(Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/fsa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fsa0;->q0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h0(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;
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

.method public static synthetic i0(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public static synthetic j0(Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "ja"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuestionEditable;->languages:Ljava/util/List;

    .line 22
    .line 23
    const-string v0, "ja-JP"

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Question;->editable:Lcom/p1/mobile/putong/core/data/QuestionEditable;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuestionEditable;->languages:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public static synthetic l0(Ll/fsa0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fsa0;->s0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/data/Question;)Lcom/p1/mobile/putong/core/data/Question;
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

.method public static synthetic n0(Ljava/util/List;)Lrx/c;
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

.method private synthetic q0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gsa0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gsa0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gsa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fsa0;->o0(Ll/gsa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vra0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vra0;-><init>(Ll/fsa0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

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
    const-string v1, "loop_edit_user"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iput-object v0, p0, Ll/fsa0;->e:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Ll/fsa0;->e:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "loop_create_tag_info"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 71
    .line 72
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast v1, Ll/gsa0;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Ll/gsa0;->f(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, ""

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/fsa0;->p0()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0(Ll/gsa0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 4
    .line 5
    iget-object v0, v0, Ll/kua;->R:Ll/mof0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/wra0;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/wra0;-><init>()V

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
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/xra0;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/xra0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/yra0;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/yra0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/zra0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/zra0;-><init>(Ll/fsa0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/asa0;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/asa0;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/bsa0;

    .line 66
    .line 67
    invoke-direct {v1}, Ll/bsa0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lrx/c;->toList()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/csa0;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/csa0;-><init>(Ll/fsa0;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/core/data/Question;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fsa0;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/fsa0;->e:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 18
    .line 19
    new-instance v0, Ll/dsa0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/dsa0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_0

    .line 35
    .line 36
    move v1, v2

    .line 37
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 59
    .line 60
    new-instance v0, Ll/esa0;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/esa0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_2

    .line 76
    .line 77
    move v1, v2

    .line 78
    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public final synthetic s0(Ljava/util/List;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/fsa0;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/gsa0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/gsa0;->i()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/fsa0;->a:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/data/Question;

    .line 44
    .line 45
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 48
    .line 49
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/fsa0;->a:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast p1, Ll/gsa0;

    .line 65
    .line 66
    iget-object p0, p0, Ll/fsa0;->a:Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ll/gsa0;->e(Ljava/util/ArrayList;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public t0(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 4
    .line 5
    if-ne p1, v0, :cond_2

    .line 6
    .line 7
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    if-ne p2, p1, :cond_2

    .line 15
    .line 16
    iget-object p2, p0, Ll/fsa0;->d:Lcom/p1/mobile/putong/core/data/Question;

    .line 17
    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p2, "loop_result_key"

    .line 29
    .line 30
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-nez p3, :cond_2

    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    if-nez p3, :cond_2

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/data/Answer;->new_()Lcom/p1/mobile/putong/data/Answer;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    iget-object v0, p0, Ll/fsa0;->d:Lcom/p1/mobile/putong/core/data/Question;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v0, p3, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 59
    .line 60
    iput-object p2, p3, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 61
    .line 62
    new-instance p2, Landroid/content/Intent;

    .line 63
    .line 64
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/fsa0;->e:Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    iget-object v0, p0, Ll/fsa0;->e:Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    const-string p3, "loop_edit_user"

    .line 85
    .line 86
    iget-object v0, p0, Ll/fsa0;->e:Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-void
.end method

.method public u0(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fsa0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 8
    .line 9
    iput-object v0, p0, Ll/fsa0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 10
    .line 11
    iget-object v0, p0, Ll/fsa0;->b:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    .line 18
    .line 19
    iput-object p1, p0, Ll/fsa0;->d:Lcom/p1/mobile/putong/core/data/Question;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "loop_new_style"

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    new-instance p1, Landroid/content/Intent;

    .line 39
    .line 40
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v0, "loop_result_question"

    .line 44
    .line 45
    iget-object v1, p0, Ll/fsa0;->d:Lcom/p1/mobile/putong/core/data/Question;

    .line 46
    .line 47
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/4 v1, -0x1

    .line 55
    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 67
    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 69
    .line 70
    const/16 v1, 0x64

    .line 71
    .line 72
    const-string v2, ""

    .line 73
    .line 74
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->getCreateTagInfo(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/4 v1, 0x1

    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setEmptyInput(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v2, p0, Ll/fsa0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 84
    .line 85
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setSubTitle(Ljava/lang/String;Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Ll/fsa0;->d:Lcom/p1/mobile/putong/core/data/Question;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 95
    .line 96
    const-string v3, "tacitTest"

    .line 97
    .line 98
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_2

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setHarmonyTest(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 105
    .line 106
    .line 107
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 110
    .line 111
    iget-object v1, v1, Ll/kua;->S:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 112
    .line 113
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_1

    .line 118
    .line 119
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->answer:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-nez v2, :cond_1

    .line 126
    .line 127
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->answer:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setDefaultContent(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 130
    .line 131
    .line 132
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    const-string v2, "e_profile_test_question_click"

    .line 141
    .line 142
    invoke-static {v2, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->c2(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;Landroid/content/Context;)Landroid/content/Intent;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 158
    .line 159
    invoke-virtual {p0, v0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 160
    .line 161
    .line 162
    return-void
.end method
