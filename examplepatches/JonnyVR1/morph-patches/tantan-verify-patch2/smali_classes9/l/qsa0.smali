.class public Ll/qsa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qsa0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/nsa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public final g:Landroid/content/Context;

.field public final h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

.field public i:Ll/nsa0;

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/qsa0;->j:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/qsa0;->g:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/qsa0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/qsa0;->q(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static bridge synthetic c(Ll/qsa0;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    return-void
.end method

.method public static bridge synthetic d(Ll/qsa0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qsa0;->a:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic e(Ll/qsa0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qsa0;->c:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic f(Ll/qsa0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic i(Ll/qsa0;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    return-void
.end method

.method public static bridge synthetic j(Ll/qsa0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qsa0;->b:Landroid/widget/TextView;

    return-void
.end method

.method private synthetic q(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    instance-of p1, p2, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p2, Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/qsa0;->s(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/qsa0;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/qsa0;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Ll/qsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 20
    .line 21
    new-instance v0, Ll/osa0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/osa0;-><init>(Ll/qsa0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/qsa0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 30
    .line 31
    iget-object v0, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/qsa0;->p()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p0, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsa0;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/nsa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qsa0;->l(Ll/nsa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qsa0;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qsa0$a;->a(Ll/qsa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/nsa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qsa0;->i:Ll/nsa0;

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/qsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    const-string v2, "cm"

    .line 23
    .line 24
    const-string v3, ""

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 38
    .line 39
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget-object p0, p0, Ll/qsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->W(Lcom/p1/mobile/putong/data/User;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public n()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsa0;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public final s(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qsa0;->g:Landroid/content/Context;

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->setVisible(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public u(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->a0(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Zg()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/qsa0;->p()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 30
    .line 31
    iget-object v2, p0, Ll/qsa0;->c:Lv/VFrame;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/xra;->f()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-object v2, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    new-instance v2, Ll/psa0;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/psa0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v2}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object v2, p0, Ll/qsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    const/16 v2, 0x14

    .line 71
    .line 72
    iput v2, p0, Ll/qsa0;->j:I

    .line 73
    .line 74
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    const/4 v4, 0x0

    .line 79
    if-nez v2, :cond_2

    .line 80
    .line 81
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-nez v2, :cond_2

    .line 92
    .line 93
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Ljava/lang/String;

    .line 98
    .line 99
    const-string v5, "\\d+"

    .line 100
    .line 101
    invoke-virtual {v2, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_1

    .line 106
    .line 107
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    add-int/lit16 v1, v1, -0x8c

    .line 122
    .line 123
    iput v1, p0, Ll/qsa0;->j:I

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_1
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    check-cast v1, Ljava/lang/CharSequence;

    .line 131
    .line 132
    iget-object v2, p0, Ll/qsa0;->g:Landroid/content/Context;

    .line 133
    .line 134
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 135
    .line 136
    invoke-virtual {v2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_2

    .line 145
    .line 146
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    sub-int/2addr v1, v3

    .line 151
    iput v1, p0, Ll/qsa0;->j:I

    .line 152
    .line 153
    :cond_2
    :goto_0
    iget v1, p0, Ll/qsa0;->j:I

    .line 154
    .line 155
    if-ltz v1, :cond_3

    .line 156
    .line 157
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-lt v1, v0, :cond_4

    .line 162
    .line 163
    :cond_3
    iput v4, p0, Ll/qsa0;->j:I

    .line 164
    .line 165
    :cond_4
    iget-object v0, p0, Ll/qsa0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 166
    .line 167
    iget v1, p0, Ll/qsa0;->j:I

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 170
    .line 171
    .line 172
    iget v0, p0, Ll/qsa0;->j:I

    .line 173
    .line 174
    invoke-virtual {p0, p1, v0}, Ll/qsa0;->w(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;I)V

    .line 175
    .line 176
    .line 177
    invoke-static {}, Ll/xra;->f()Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-eqz p1, :cond_5

    .line 182
    .line 183
    iget-object p1, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 184
    .line 185
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_5

    .line 190
    .line 191
    iget-object p1, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 192
    .line 193
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 194
    .line 195
    invoke-static {p1}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iget-object v0, p0, Ll/qsa0;->a:Landroid/widget/TextView;

    .line 200
    .line 201
    invoke-static {v0, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 202
    .line 203
    .line 204
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_5

    .line 209
    .line 210
    iget-object v0, p0, Ll/qsa0;->b:Landroid/widget/TextView;

    .line 211
    .line 212
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ll/qsa0;->b:Landroid/widget/TextView;

    .line 216
    .line 217
    const/high16 v1, 0x41400000    # 12.0f

    .line 218
    .line 219
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Ll/qsa0;->c:Lv/VFrame;

    .line 227
    .line 228
    const/high16 v1, 0x41d80000    # 27.0f

    .line 229
    .line 230
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Ll/qsa0;->b:Landroid/widget/TextView;

    .line 238
    .line 239
    const/high16 v1, 0x41700000    # 15.0f

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/qsa0;->b:Landroid/widget/TextView;

    .line 245
    .line 246
    const-string v1, "#a9a9a9"

    .line 247
    .line 248
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Ll/qsa0;->b:Landroid/widget/TextView;

    .line 256
    .line 257
    const-string v1, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 258
    .line 259
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .line 269
    .line 270
    :cond_5
    iget-object p0, p0, Ll/qsa0;->h:Lcom/p1/mobile/putong/core/ui/profile/loop/height/ProfileLoopSelectHeightFrag;

    .line 271
    .line 272
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->f5()V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;I)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Zg()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x1

    .line 16
    sub-int/2addr p1, v0

    .line 17
    if-eq p2, p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object p0, p0, Ll/qsa0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->setVisible(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
