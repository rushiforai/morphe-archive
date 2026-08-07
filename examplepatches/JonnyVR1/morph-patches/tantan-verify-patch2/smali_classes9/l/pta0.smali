.class public Ll/pta0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pta0$c;,
        Ll/pta0$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/nta0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VList;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Ll/nta0;

.field public i:Ll/pta0$c;

.field public j:Landroid/content/Context;

.field public k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pta0;->j:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/pta0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pta0;->l(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/pta0;)Ll/nta0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pta0;->h:Ll/nta0;

    return-object p0
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pta0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->F:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "from_card_guide_improve_profile"

    .line 13
    .line 14
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/pta0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/pta0;->f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->f:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->setNextButton(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/pta0;->f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/pta0$c;

    .line 53
    .line 54
    iget-object v1, p0, Ll/pta0;->h:Ll/nta0;

    .line 55
    .line 56
    invoke-direct {v0, p0, v1}, Ll/pta0$c;-><init>(Ll/pta0;Ll/nta0;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Ll/pta0;->i:Ll/pta0$c;

    .line 60
    .line 61
    iget-object v1, p0, Ll/pta0;->c:Lv/VList;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/pta0;->c:Lv/VList;

    .line 67
    .line 68
    new-instance v1, Ll/pta0$a;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/pta0$a;-><init>(Ll/pta0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/pta0;->g:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    new-instance v1, Ll/pta0$b;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/pta0$b;-><init>(Ll/pta0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 87
    .line 88
    invoke-static {}, Ll/xra;->g()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pta0;->j:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qta0;->b(Ll/pta0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/nta0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pta0;->h:Ll/nta0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

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

.method public f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pta0;->j:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pta0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/nta0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pta0;->d(Ll/nta0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pta0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/pta0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pta0;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->setUser(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 7
    .line 8
    iget-object v0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->u0(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pta0;->u()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic l(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->i0(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/pta0;->h:Ll/nta0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/nta0;->A0()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/ota0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/ota0;-><init>(Ll/pta0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->s0(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Ll/pta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->a0(Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public n(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pta0;->i:Ll/pta0$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pta0$c;->b(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOMETOWN:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/xra;->g()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/xra;->f()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v2, "#a9a9a9"

    .line 27
    .line 28
    const/high16 v3, 0x41700000    # 15.0f

    .line 29
    .line 30
    const/high16 v4, 0x41400000    # 12.0f

    .line 31
    .line 32
    const/4 v5, 0x1

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-static {p1}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v6, p0, Ll/pta0;->a:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-static {v6, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-nez v6, :cond_1

    .line 57
    .line 58
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    invoke-static {v6, v7}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    iget-object v6, p0, Ll/pta0;->c:Lv/VList;

    .line 73
    .line 74
    const/high16 v7, 0x41a00000    # 20.0f

    .line 75
    .line 76
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    invoke-static {v6, v7}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 86
    .line 87
    .line 88
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 98
    .line 99
    const-string v7, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 100
    .line 101
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUALIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 113
    .line 114
    iget-object v6, p0, Ll/pta0;->a:Landroid/widget/TextView;

    .line 115
    .line 116
    if-ne p1, v0, :cond_2

    .line 117
    .line 118
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->o1:I

    .line 119
    .line 120
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(I)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    :goto_0
    iget-object v0, p0, Ll/pta0;->h:Ll/nta0;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/nta0;->A0()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    iget-object v0, p0, Ll/pta0;->c:Lv/VList;

    .line 138
    .line 139
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 140
    .line 141
    .line 142
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 143
    .line 144
    if-eq p1, v0, :cond_4

    .line 145
    .line 146
    sget-object v6, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 147
    .line 148
    if-eq p1, v6, :cond_4

    .line 149
    .line 150
    sget-object v6, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_VOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 151
    .line 152
    if-ne p1, v6, :cond_5

    .line 153
    .line 154
    :cond_4
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 155
    .line 156
    invoke-static {v6, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    :cond_5
    iget-object v6, p0, Ll/pta0;->h:Ll/nta0;

    .line 160
    .line 161
    invoke-virtual {v6}, Ll/nta0;->A0()Z

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    if-eqz v6, :cond_9

    .line 166
    .line 167
    iget-object v6, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 168
    .line 169
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->V4()Z

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    if-eqz v6, :cond_9

    .line 174
    .line 175
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 176
    .line 177
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    invoke-virtual {v6}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 189
    .line 190
    .line 191
    move-result v6

    .line 192
    const-string v7, "\u4ed6"

    .line 193
    .line 194
    if-eqz v6, :cond_6

    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 198
    .line 199
    .line 200
    move-result-object v6

    .line 201
    invoke-virtual {v6}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->N8()Z

    .line 206
    .line 207
    .line 208
    move-result v6

    .line 209
    const-string v8, "\u5979"

    .line 210
    .line 211
    if-eqz v6, :cond_8

    .line 212
    .line 213
    :cond_7
    move-object v7, v8

    .line 214
    goto :goto_1

    .line 215
    :cond_8
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 216
    .line 217
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 218
    .line 219
    invoke-virtual {v6}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 224
    .line 225
    .line 226
    move-result v6

    .line 227
    if-eqz v6, :cond_7

    .line 228
    .line 229
    :goto_1
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 230
    .line 231
    new-instance v8, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    const-string v9, "\u4f60\u6709\u5ba0\u7269\u5417\uff1f\u4e0a\u4f20\u66f4\u591a\u5ba0\u7269\u7167\u7247\uff0c\u840c\u5316"

    .line 234
    .line 235
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v7, "\u4eec"

    .line 242
    .line 243
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v7

    .line 250
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    .line 252
    .line 253
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 254
    .line 255
    const/high16 v7, 0x41200000    # 10.0f

    .line 256
    .line 257
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 258
    .line 259
    .line 260
    move-result v7

    .line 261
    invoke-static {v6, v7}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 262
    .line 263
    .line 264
    iget-object v6, p0, Ll/pta0;->c:Lv/VList;

    .line 265
    .line 266
    const/high16 v7, 0x40c00000    # 6.0f

    .line 267
    .line 268
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 269
    .line 270
    .line 271
    move-result v7

    .line 272
    invoke-static {v6, v7}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 273
    .line 274
    .line 275
    :cond_9
    iget-object v6, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 276
    .line 277
    iget-object v6, v6, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->F:Ljava/lang/String;

    .line 278
    .line 279
    const-string v7, "from_card_guide_improve_profile"

    .line 280
    .line 281
    invoke-static {v7, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 282
    .line 283
    .line 284
    move-result v6

    .line 285
    if-eqz v6, :cond_d

    .line 286
    .line 287
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 288
    .line 289
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 290
    .line 291
    .line 292
    iget-object v6, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 293
    .line 294
    iget-object v6, v6, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->G:Ljava/lang/String;

    .line 295
    .line 296
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 297
    .line 298
    .line 299
    move-result v7

    .line 300
    const-string v8, "\u6839\u636e\u4f60\u7684\u9009\u62e9\uff0c\u81ea\u52a8\u751f\u6210\u7559\u8a00\u53d1\u9001"

    .line 301
    .line 302
    if-nez v7, :cond_b

    .line 303
    .line 304
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 305
    .line 306
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 307
    .line 308
    invoke-virtual {v7, v6}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 309
    .line 310
    .line 311
    move-result-object v6

    .line 312
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v7

    .line 316
    iget-object v9, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 317
    .line 318
    if-eqz v7, :cond_a

    .line 319
    .line 320
    new-instance v7, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    const-string v8, "\u6839\u636e\u4f60\u7684\u9009\u62e9\uff0c\u81ea\u52a8\u751f\u6210\u7559\u8a00\u53d1\u9001\u7ed9"

    .line 323
    .line 324
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v6

    .line 331
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v6

    .line 338
    invoke-virtual {v9, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 339
    .line 340
    .line 341
    goto :goto_2

    .line 342
    :cond_a
    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 343
    .line 344
    .line 345
    goto :goto_2

    .line 346
    :cond_b
    iget-object v6, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 347
    .line 348
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    .line 350
    .line 351
    :goto_2
    if-ne p1, v0, :cond_c

    .line 352
    .line 353
    iget-object p1, p0, Ll/pta0;->a:Landroid/widget/TextView;

    .line 354
    .line 355
    const-string v0, "\u5728\u73a9\u7684\u6e38\u620f\uff08\u591a\u9009\uff09"

    .line 356
    .line 357
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 358
    .line 359
    .line 360
    :cond_c
    iget-object p1, p0, Ll/pta0;->a:Landroid/widget/TextView;

    .line 361
    .line 362
    const/4 v0, 0x4

    .line 363
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 364
    .line 365
    .line 366
    iget-object p1, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 367
    .line 368
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 373
    .line 374
    .line 375
    iget-object p1, p0, Ll/pta0;->c:Lv/VList;

    .line 376
    .line 377
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 378
    .line 379
    .line 380
    iget-object p1, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 381
    .line 382
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 383
    .line 384
    .line 385
    iget-object p1, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 386
    .line 387
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 388
    .line 389
    .line 390
    move-result v0

    .line 391
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 392
    .line 393
    .line 394
    iget-object p0, p0, Ll/pta0;->b:Landroid/widget/TextView;

    .line 395
    .line 396
    invoke-static {p0, v5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 397
    .line 398
    .line 399
    :cond_d
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pta0;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->v0(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pta0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
