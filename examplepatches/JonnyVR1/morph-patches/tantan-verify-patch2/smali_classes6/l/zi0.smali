.class public Ll/zi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zi0$a;,
        Ll/zi0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/yi0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

.field public e:Lcom/p1/mobile/putong/app/PutongAct;

.field public f:Ll/yi0;

.field public g:Ll/zi0$a;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public i:[Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zi0;->h:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [Lv/VText;

    .line 13
    .line 14
    iput-object v0, p0, Ll/zi0;->i:[Lv/VText;

    .line 15
    .line 16
    iput-object p1, p0, Ll/zi0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic a(Ll/zi0;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zi0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/zi0;)Ll/zi0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zi0;->g:Ll/zi0$a;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/zi0;)Ll/yi0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zi0;->f:Ll/yi0;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/zi0;)[Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zi0;->i:[Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/zi0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zi0;->h:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zi0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/aj0;->b(Ll/zi0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/yi0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zi0;->f:Ll/yi0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zi0;->i(Ll/yi0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zi0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zi0;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u5708\u5b50"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/zi0;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    iget-object v1, p0, Ll/zi0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/zi0;->h:Ljava/util/List;

    .line 16
    .line 17
    const-string v1, "\u6211\u7684\u5708\u5b50"

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/zi0;->h:Ljava/util/List;

    .line 24
    .line 25
    const-string v1, "\u70ed\u95e8\u5708\u5b50"

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    invoke-interface {v0, v3, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/zi0$a;

    .line 32
    .line 33
    iget-object v1, p0, Ll/zi0;->e:Lcom/p1/mobile/putong/app/PutongAct;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-direct {v0, p0, v1}, Ll/zi0$a;-><init>(Ll/zi0;Landroidx/fragment/app/FragmentManager;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/zi0;->g:Ll/zi0$a;

    .line 43
    .line 44
    new-instance v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->M4(I)Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;->M4(I)Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Ll/zi0;->g:Ll/zi0$a;

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Ll/zi0$a;->k(Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/zi0;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 69
    .line 70
    iget-object v1, p0, Ll/zi0;->g:Ll/zi0$a;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/zi0;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 76
    .line 77
    iget-object v1, p0, Ll/zi0;->g:Ll/zi0$a;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/zi0;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 83
    .line 84
    iget-object v1, p0, Ll/zi0;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/zi0;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 90
    .line 91
    iget-object v1, p0, Ll/zi0;->f:Ll/yi0;

    .line 92
    .line 93
    iget-boolean v1, v1, Ll/yi0;->a:Z

    .line 94
    .line 95
    xor-int/2addr v1, v3

    .line 96
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object v0, p0, Ll/zi0;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-ge v2, v0, :cond_0

    .line 106
    .line 107
    iget-object v0, p0, Ll/zi0;->g:Ll/zi0$a;

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Ll/zi0$a;->j(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v1, p0, Ll/zi0;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/zi0;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v0, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 129
    .line 130
    const/high16 v1, 0x41300000    # 11.0f

    .line 131
    .line 132
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 137
    .line 138
    .line 139
    add-int/lit8 v2, v2, 0x1

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_0
    iget-object v0, p0, Ll/zi0;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 143
    .line 144
    new-instance v1, Ll/zi0$b;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/zi0$b;-><init>(Ll/zi0;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method
