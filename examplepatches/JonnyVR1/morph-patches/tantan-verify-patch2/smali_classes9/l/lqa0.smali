.class public Ll/lqa0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/nqa0;",
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

.field public b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/lqa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lqa0;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method private j0()I
    .locals 3

    .line 1
    iget-object p0, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v0
.end method

.method private k0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "loop_create_tag_info"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 42
    .line 43
    iput-object v0, p0, Ll/lqa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 46
    .line 47
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->p(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 64
    .line 65
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast v1, Ll/nqa0;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ll/nqa0;->i(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast v0, Ll/nqa0;

    .line 77
    .line 78
    iget-object p0, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Ll/nqa0;->f(Ljava/util/ArrayList;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private synthetic l0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lqa0;->k0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/nqa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lqa0;->f0(Ll/nqa0;)V

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
    new-instance v0, Ll/kqa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/kqa0;-><init>(Ll/lqa0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0(Ll/nqa0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lqa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/lqa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PERSONALITY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    const-string v1, "e_personality_selection_save"

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string v1, "e_interests_selection_save"

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    new-instance v0, Landroid/content/Intent;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/lqa0;->i0()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, -0x1

    .line 45
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 46
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
.end method

.method public final h0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/data/Tag;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget-object p0, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_3

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    new-instance v1, Lcom/p1/mobile/putong/data/Tag;

    .line 83
    .line 84
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Tag;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_4
    :goto_2
    return-void
.end method

.method public i0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/lqa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->tagKey:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/lqa0;->h0(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public m0(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, -0x1

    .line 8
    if-ne p2, p1, :cond_0

    .line 9
    .line 10
    const-string p1, "loop_result_key"

    .line 11
    .line 12
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 23
    .line 24
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->g()Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 p3, 0x1

    .line 32
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {p1, p3, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p1, Ll/nqa0;

    .line 43
    .line 44
    iget-object p0, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ll/nqa0;->f(Ljava/util/ArrayList;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public n0(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/lqa0;->j0()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/16 v2, 0xa

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    if-lt v0, v2, :cond_0

    .line 22
    .line 23
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->B2:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Ll/lqa0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->c2(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;Landroid/content/Context;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v0, Ll/nqa0;

    .line 42
    .line 43
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, p1, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    if-le v0, v2, :cond_2

    .line 61
    .line 62
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->B2:I

    .line 63
    .line 64
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    xor-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 75
    .line 76
    .line 77
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast p1, Ll/nqa0;

    .line 80
    .line 81
    iget-object p0, p0, Ll/lqa0;->a:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ll/nqa0;->f(Ljava/util/ArrayList;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
