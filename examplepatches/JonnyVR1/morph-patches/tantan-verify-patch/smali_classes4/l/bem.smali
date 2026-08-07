.class public Ll/bem;
.super Ll/oof;
.source "SourceFile"


# instance fields
.field public h:Landroid/view/View;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

.field public o:Landroid/widget/TextView;

.field public p:Lcom/p1/mobile/android/app/Act;

.field public q:Ljava/lang/String;

.field public r:Ll/l4g0;

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/oof;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/bem;->L(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic A(Ll/bem;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bem;->S(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic C(Ll/bem;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bem;->R(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic D(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E(Ll/bem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bem;->T(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic F(Ll/bem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bem;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/bem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bem;->P(Landroid/view/View;)V

    return-void
.end method

.method private K()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_add_ideal_type"

    .line 2
    .line 3
    return-object p0
.end method

.method private L(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iput-object v0, p0, Ll/bem;->p:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Ll/bem;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/bem;->r:Ll/l4g0;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, Ll/bem;->K()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-class v0, Ll/bem;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/bem;->r:Ll/l4g0;

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method private M()V
    .locals 3

    .line 1
    const-string v0, "swipe"

    .line 2
    .line 3
    iget-object v1, p0, Ll/bem;->q:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bem;->l:Landroid/widget/TextView;

    .line 12
    .line 13
    const-string v1, "\u4f60\u60f3\u8ba4\u8bc6\u4ec0\u4e48\u6837\u7684\u4eba\uff1f"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bem;->m:Landroid/widget/TextView;

    .line 19
    .line 20
    const-string v1, "\u9009\u62e9\u4f60\u7684\u7406\u60f3\u578b\uff0c\u6211\u4eec\u4f1a\u4f18\u5148\u63a8\u8350\u4f60\u611f\u5174\u8da3\u7684\u4eba"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    iget-object v1, p0, Ll/bem;->k:Lv/VDraweeView;

    .line 28
    .line 29
    const-string v2, "https://auto.tancdn.com/v1/raw/d4b19bd3-58e8-48b9-b81a-b037d4b863f914.webp"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    const-string v0, "conversation"

    .line 36
    .line 37
    iget-object v1, p0, Ll/bem;->q:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Ll/bem;->l:Landroid/widget/TextView;

    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    const-string v1, "\u4ed6"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const-string v1, "\u5979"

    .line 65
    .line 66
    :goto_0
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v2, "%s\u4eec\u90fd\u4e0d\u662f\u4f60\u60f3\u804a\u5929\u7684\u7c7b\u578b\uff1f"

    .line 71
    .line 72
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/bem;->m:Landroid/widget/TextView;

    .line 80
    .line 81
    const-string v1, "\u9009\u62e9\u4f60\u7684\u7406\u60f3\u578b\uff0c\u4e3a\u4f60\u63a8\u8350\u66f4\u591a\u9002\u5408\u804a\u5929\u7684\u5bf9\u8c61"

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 87
    .line 88
    iget-object v1, p0, Ll/bem;->k:Lv/VDraweeView;

    .line 89
    .line 90
    const-string v2, "https://auto.tancdn.com/v1/raw/92b47530-df26-49e8-95bc-0357344850d314.webp"

    .line 91
    .line 92
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_1
    const-string v0, "e_save_ideal_type"

    .line 96
    .line 97
    invoke-direct {p0}, Ll/bem;->K()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/bem;->o:Landroid/widget/TextView;

    .line 105
    .line 106
    new-instance v1, Ll/vdm;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/vdm;-><init>(Ll/bem;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/bem;->j:Landroid/widget/ImageView;

    .line 115
    .line 116
    new-instance v1, Ll/wdm;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/wdm;-><init>(Ll/bem;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/bem;->h:Landroid/view/View;

    .line 125
    .line 126
    new-instance v1, Ll/xdm;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/xdm;-><init>(Ll/bem;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/bem;->i:Landroid/widget/LinearLayout;

    .line 135
    .line 136
    new-instance v0, Ll/ydm;

    .line 137
    .line 138
    invoke-direct {v0}, Ll/ydm;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bem;->s:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/bem;->o:Landroid/widget/TextView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/bem;->o:Landroid/widget/TextView;

    .line 16
    .line 17
    const-string v0, "\u6b63\u5728\u4fdd\u5b58"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/bem;->s:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/bem;->V(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    const-string p1, "e_save_ideal_type"

    .line 28
    .line 29
    invoke-direct {p0}, Ll/bem;->K()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic R(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bem;->r:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic y(Ll/bem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bem;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/bem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bem;->O(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cem;->b(Ll/bem;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final I()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/bem;->s:Ljava/util/List;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    iget-object v1, p0, Ll/bem;->n:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v0, v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Ll/bem;->n:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Ll/bem;->s:Ljava/util/List;

    .line 30
    .line 31
    iget-object v2, p0, Ll/bem;->n:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/data/IdealTag;

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, p0, Ll/bem;->o:Landroid/widget/TextView;

    .line 50
    .line 51
    iget-object v1, p0, Ll/bem;->s:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    xor-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/bem;->o:Landroid/widget/TextView;

    .line 63
    .line 64
    iget-object v1, p0, Ll/bem;->s:Ljava/util/List;

    .line 65
    .line 66
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    const-string p0, "\u4fdd\u5b58"

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    iget-object p0, p0, Ll/bem;->s:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string v1, "\u4fdd\u5b58 (%d)"

    .line 90
    .line 91
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    :goto_1
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public J(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceAsColor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
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
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/data/IdealTag;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    new-instance v2, Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    sget v3, Ll/dbc0;->K8:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    sget v4, Ll/c9c0;->V0:I

    .line 48
    .line 49
    invoke-static {v3, v4}, Ll/j26;->d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 54
    .line 55
    .line 56
    sget v3, Ll/qa00;->m:I

    .line 57
    .line 58
    sget v4, Ll/qa00;->j:I

    .line 59
    .line 60
    invoke-virtual {v2, v3, v4, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 61
    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/data/IdealTag;->name:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    const/high16 v3, 0x41600000    # 14.0f

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 71
    .line 72
    .line 73
    const/high16 v3, 0x41a00000    # 20.0f

    .line 74
    .line 75
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-static {v2, v3}, Ll/msi0;->m(Landroid/widget/TextView;I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const/4 v3, 0x1

    .line 90
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 91
    .line 92
    .line 93
    new-instance v1, Ll/tdm;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/tdm;-><init>(Ll/bem;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_1
    return-object v0
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bem;->o:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "\u6b63\u5728\u4fdd\u5b58"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    xor-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/bem;->I()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic S(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const-string p1, "\u5df2\u4fdd\u5b58"

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o8()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic T(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bem;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public U(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/bem;->q:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "swipe"

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "add_ideal_timing"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Ll/bem;->r:Ll/l4g0;

    .line 14
    .line 15
    const-string v0, "continue_dislike"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p2, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v0, "conversation"

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    iget-object p2, p0, Ll/bem;->r:Ll/l4g0;

    .line 38
    .line 39
    const-string v0, "no_match_to_chat"

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {v0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p2, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    iget-object p2, p0, Ll/bem;->n:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-lez p2, :cond_2

    .line 59
    .line 60
    iget-object p2, p0, Ll/bem;->n:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 63
    .line 64
    .line 65
    :cond_2
    iget-object p2, p0, Ll/bem;->n:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/bem;->J(Ljava/util/List;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final V(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bem;->p:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ll/dkb;->ta(Ljava/util/List;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/zdm;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/zdm;-><init>(Ll/bem;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/aem;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/aem;-><init>(Ll/bem;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/oof;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bem;->r:Ll/l4g0;

    .line 5
    .line 6
    const-string v1, "swipe"

    .line 7
    .line 8
    iget-object v2, p0, Ll/bem;->q:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const-string v1, "continue_dislike"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v1, "no_match_to_chat"

    .line 20
    .line 21
    :goto_0
    const-string v2, "add_ideal_timing"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "is_first_add_ideal"

    .line 28
    .line 29
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/bem;->r:Ll/l4g0;

    .line 43
    .line 44
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/udm;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/udm;-><init>(Ll/bem;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Ll/bem;->M()V

    .line 56
    .line 57
    .line 58
    return-void
.end method
