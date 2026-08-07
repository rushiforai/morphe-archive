.class public Ll/ufw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ufw$d;,
        Ll/ufw$c;,
        Ll/ufw$b;,
        Ll/ufw$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tfw;",
        ">;"
    }
.end annotation


# static fields
.field public static final l:[Ljava/lang/String;


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/viewpager2/widget/ViewPager2;

.field public c:Lv/VText;

.field public d:Lv/VProgressBar;

.field public final e:Lcom/p1/mobile/android/app/Act;

.field public f:Ll/tfw;

.field public g:Ll/ufw$d;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/lang/String;

.field public j:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

.field public k:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "\u4f60\u5728\u610f\u7684\u7279\u8d28\uff08\u591a\u9009\uff09"

    .line 2
    .line 3
    const-string v1, "\u5174\u8da3\u7231\u597d\uff08\u591a\u9009\uff09"

    .line 4
    .line 5
    const-string v2, "\u5bf9\u65b9\u72b6\u6001\uff08\u591a\u9009\uff09"

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/ufw;->l:[Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ufw;->e:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/ufw;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ufw;->e:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/ufw;)Ll/tfw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ufw;->f:Ll/tfw;

    return-object p0
.end method

.method public static e()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, v0}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const/16 v2, 0x14

    .line 74
    .line 75
    if-le v1, v2, :cond_1

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    :cond_1
    return-object v0

    .line 83
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    return-object v0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ufw;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vfw;->b(Ll/ufw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/tfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ufw;->f:Ll/tfw;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/ufw;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ufw;->e:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string v1, "targetPage"

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Ll/ufw;->i:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "data_key"

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 40
    .line 41
    iput-object p1, p0, Ll/ufw;->k:Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Ll/ufw;->e:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FateRadarSearchConditions;->customItems:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 52
    .line 53
    iput-object p1, p0, Ll/ufw;->j:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 54
    .line 55
    invoke-static {}, Ll/ufw;->e()Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Ll/ufw;->h:Ljava/util/List;

    .line 60
    .line 61
    new-instance v1, Ll/ufw$d;

    .line 62
    .line 63
    iget-object v2, p0, Ll/ufw;->i:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p0, Ll/ufw;->j:Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;

    .line 66
    .line 67
    invoke-direct {v1, v2, v3, p1}, Ll/ufw$d;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FilterConditionsCustomItems;Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Ll/ufw;->g:Ll/ufw$d;

    .line 71
    .line 72
    iget-object p1, p0, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 73
    .line 74
    invoke-virtual {p1, v1}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/ufw;->i:Ljava/lang/String;

    .line 78
    .line 79
    const-string v1, "select_status"

    .line 80
    .line 81
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    const-string v1, "\u4e0b\u4e00\u6b65"

    .line 86
    .line 87
    if-eqz p1, :cond_2

    .line 88
    .line 89
    iget-object p1, p0, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 90
    .line 91
    invoke-virtual {p1, v0, v0}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/ufw;->c:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    iget-object p1, p0, Ll/ufw;->i:Ljava/lang/String;

    .line 101
    .line 102
    const-string v2, "select_feature"

    .line 103
    .line 104
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    const-string v2, "\u5b8c\u6210"

    .line 109
    .line 110
    if-eqz p1, :cond_4

    .line 111
    .line 112
    iget-object p1, p0, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 113
    .line 114
    const/4 v3, 0x1

    .line 115
    invoke-virtual {p1, v3, v0}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Ll/ufw;->h:Ljava/util/List;

    .line 119
    .line 120
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    iget-object v0, p0, Ll/ufw;->c:Lv/VText;

    .line 125
    .line 126
    if-lez p1, :cond_3

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_3
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_4
    iget-object p1, p0, Ll/ufw;->i:Ljava/lang/String;

    .line 137
    .line 138
    const-string v1, "select_selectedInterest"

    .line 139
    .line 140
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_5

    .line 145
    .line 146
    iget-object p1, p0, Ll/ufw;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 147
    .line 148
    const/4 v1, 0x2

    .line 149
    invoke-virtual {p1, v1, v0}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/ufw;->c:Lv/VText;

    .line 153
    .line 154
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    :cond_5
    :goto_0
    iget-object p1, p0, Ll/ufw;->c:Lv/VText;

    .line 158
    .line 159
    new-instance v0, Ll/ufw$a;

    .line 160
    .line 161
    invoke-direct {v0, p0}, Ll/ufw$a;-><init>(Ll/ufw;)V

    .line 162
    .line 163
    .line 164
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tfw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ufw;->d(Ll/tfw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ufw;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
