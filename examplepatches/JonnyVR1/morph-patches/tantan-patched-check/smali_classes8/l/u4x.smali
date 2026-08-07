.class public Ll/u4x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/myl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;",
        ">;",
        "Ll/myl;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VImage;

.field public c:Lv/VButton;

.field public d:Lcom/google/android/material/tabs/TabLayout;

.field public e:Landroidx/viewpager2/widget/ViewPager2;

.field public f:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;

.field public g:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/google/android/material/tabs/TabLayoutMediator;

.field public j:Z

.field public k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

.field public l:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;

.field public final o:Landroidx/viewpager2/widget/ViewPager2$i;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MarryEditProfileFrag"

    .line 5
    .line 6
    iput-object v0, p0, Ll/u4x;->m:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "MarryPreviewProfileFrag"

    .line 9
    .line 10
    iput-object v0, p0, Ll/u4x;->n:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Ll/u4x$a;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/u4x$a;-><init>(Ll/u4x;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/u4x;->o:Landroidx/viewpager2/widget/ViewPager2$i;

    .line 18
    .line 19
    iput-object p1, p0, Ll/u4x;->f:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/u4x;[Ljava/lang/String;Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/u4x;->n([Ljava/lang/String;Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    return-void
.end method

.method public static synthetic b(Ll/u4x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u4x;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/u4x;[Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u4x;->s([Ll/th0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/u4x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u4x;->q(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/u4x;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u4x;->h:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/u4x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u4x;->w()V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u4x;->f:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public I0(Lcom/p1/mobile/putong/data/User;Z)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u4x;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;

    .line 18
    .line 19
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->I0(Lcom/p1/mobile/putong/data/User;Z)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-super {p0, p1, p2}, Ll/myl;->I0(Lcom/p1/mobile/putong/data/User;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u4x;->f:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/u4x;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u4x;->i:Lcom/google/android/material/tabs/TabLayoutMediator;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayoutMediator;->detach()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/u4x;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 7
    .line 8
    iget-object p0, p0, Ll/u4x;->o:Landroidx/viewpager2/widget/ViewPager2$i;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroidx/viewpager2/widget/ViewPager2;->n(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u4x;->k(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u4x;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/v4x;->b(Ll/u4x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u4x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 2
    .line 3
    return-void
.end method

.method public l()Lcom/p1/mobile/android/app/Frag;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u4x;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u4x;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/app/Frag;

    .line 14
    .line 15
    return-object p0
.end method

.method public m(Landroid/os/Bundle;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceType"
        }
    .end annotation

    .line 1
    const-string v0, "\u7f16\u8f91"

    .line 2
    .line 3
    const-string v1, "\u9884\u89c8"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    move-object v3, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v3, "MarryEditProfileFrag"

    .line 23
    .line 24
    invoke-virtual {v1, p1, v3}, Landroidx/fragment/app/FragmentManager;->p0(Landroid/os/Bundle;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    :goto_0
    if-nez p1, :cond_1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const-string v2, "MarryPreviewProfileFrag"

    .line 32
    .line 33
    invoke-virtual {v1, p1, v2}, Landroidx/fragment/app/FragmentManager;->p0(Landroid/os/Bundle;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    :goto_1
    instance-of p1, v3, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    check-cast v3, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 42
    .line 43
    iput-object v3, p0, Ll/u4x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 47
    .line 48
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Ll/u4x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 52
    .line 53
    :goto_2
    iget-object p1, p0, Ll/u4x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 54
    .line 55
    iget-object v3, p0, Ll/u4x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 56
    .line 57
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;->P4(Ll/nyl;)V

    .line 58
    .line 59
    .line 60
    instance-of p1, v2, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    check-cast v2, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 65
    .line 66
    iput-object v2, p0, Ll/u4x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_3
    new-instance p1, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 70
    .line 71
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ll/u4x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 75
    .line 76
    :goto_3
    new-instance p1, Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Ll/u4x;->h:Ljava/util/ArrayList;

    .line 82
    .line 83
    iget-object v2, p0, Ll/u4x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 84
    .line 85
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/u4x;->h:Ljava/util/ArrayList;

    .line 89
    .line 90
    iget-object v2, p0, Ll/u4x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 91
    .line 92
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/u4x;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 96
    .line 97
    new-instance v2, Ll/u4x$b;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v3}, Landroidx/activity/ComponentActivity;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-direct {v2, p0, v1, v3, v0}, Ll/u4x$b;-><init>(Ll/u4x;Landroidx/fragment/app/FragmentManager;Landroidx/lifecycle/Lifecycle;[Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v2}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Ll/u4x;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 114
    .line 115
    iget-object v1, p0, Ll/u4x;->o:Landroidx/viewpager2/widget/ViewPager2$i;

    .line 116
    .line 117
    invoke-virtual {p1, v1}, Landroidx/viewpager2/widget/ViewPager2;->g(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 118
    .line 119
    .line 120
    new-instance p1, Lcom/google/android/material/tabs/TabLayoutMediator;

    .line 121
    .line 122
    iget-object v1, p0, Ll/u4x;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 123
    .line 124
    iget-object v2, p0, Ll/u4x;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 125
    .line 126
    new-instance v3, Ll/q4x;

    .line 127
    .line 128
    invoke-direct {v3, p0, v0}, Ll/q4x;-><init>(Ll/u4x;[Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-direct {p1, v1, v2, v3}, Lcom/google/android/material/tabs/TabLayoutMediator;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroidx/viewpager2/widget/ViewPager2;Lcom/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy;)V

    .line 132
    .line 133
    .line 134
    iput-object p1, p0, Ll/u4x;->i:Lcom/google/android/material/tabs/TabLayoutMediator;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayoutMediator;->attach()V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Ll/u4x;->c:Lv/VButton;

    .line 140
    .line 141
    new-instance v0, Ll/r4x;

    .line 142
    .line 143
    invoke-direct {v0, p0}, Ll/r4x;-><init>(Ll/u4x;)V

    .line 144
    .line 145
    .line 146
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ll/u4x;->b:Lv/VImage;

    .line 150
    .line 151
    new-instance v0, Ll/s4x;

    .line 152
    .line 153
    invoke-direct {v0, p0}, Ll/s4x;-><init>(Ll/u4x;)V

    .line 154
    .line 155
    .line 156
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Ll/u4x;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 160
    .line 161
    iget-object v0, p0, Ll/u4x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 162
    .line 163
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->o0()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V

    .line 168
    .line 169
    .line 170
    iget-object p0, p0, Ll/u4x;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 171
    .line 172
    const/4 p1, 0x0

    .line 173
    invoke-virtual {p0, p1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public final synthetic n([Ljava/lang/String;Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 1

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    aget-object p0, p1, p3

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    invoke-static {p0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {v0, p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 22
    .line 23
    .line 24
    const/high16 p0, 0x41700000    # 15.0f

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x11

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u4x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->k0(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r0(Z)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u4x;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->r0(Z)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    invoke-super {p0, p1}, Ll/myl;->r0(Z)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final synthetic s([Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-object p1, p1, p2

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/th0;->c()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public u(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/u4x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Ll/u4x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const-string v1, "MarryPreviewProfileFrag"

    .line 26
    .line 27
    iget-object v2, p0, Ll/u4x;->l:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 28
    .line 29
    invoke-virtual {v0, p1, v1, v2}, Landroidx/fragment/app/FragmentManager;->d1(Landroid/os/Bundle;Ljava/lang/String;Landroidx/fragment/app/Fragment;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Ll/u4x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Ll/u4x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    const-string v1, "MarryEditProfileFrag"

    .line 49
    .line 50
    iget-object p0, p0, Ll/u4x;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;

    .line 51
    .line 52
    invoke-virtual {v0, p1, v1, p0}, Landroidx/fragment/app/FragmentManager;->d1(Landroid/os/Bundle;Ljava/lang/String;Landroidx/fragment/app/Fragment;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final v()Z
    .locals 6

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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->getUserInfoForMarryStatus()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const-string v0, "audit_ignore"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-string v0, "auditing_ignore"

    .line 29
    .line 30
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return v2

    .line 38
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 39
    new-array v1, v0, [Ll/th0;

    .line 40
    .line 41
    new-instance v3, Ll/th0$a;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-direct {v3, v4}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->N:I

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v3, v4}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {p0}, Ll/u4x;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->L:I

    .line 81
    .line 82
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v3, v4}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    new-instance v4, Ll/t4x;

    .line 91
    .line 92
    invoke-direct {v4, p0, v1}, Ll/t4x;-><init>(Ll/u4x;[Ll/th0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v4}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    aput-object p0, v1, v2

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 106
    .line 107
    .line 108
    return v0
.end method

.method public final w()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u4x;->v()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method
