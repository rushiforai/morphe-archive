.class public Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/oyl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView$a;
    }
.end annotation


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Landroidx/recyclerview/widget/RecyclerView;

.field public j:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView$a;

.field public k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 139
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 138
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object p3, Ll/rhc0;->t:[I

    .line 5
    .line 6
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    sget p3, Ll/rhc0;->u:I

    .line 11
    .line 12
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    sget v0, Ll/rhc0;->w:I

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget p2, Ll/sec0;->S:I

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    sget p1, Ll/gdc0;->Y:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lv/VText;

    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->d:Lv/VText;

    .line 44
    .line 45
    sget p1, Ll/gdc0;->C:I

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lv/VText;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->e:Lv/VText;

    .line 54
    .line 55
    sget p1, Ll/gdc0;->K:I

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lv/VImage;

    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->f:Lv/VImage;

    .line 64
    .line 65
    sget p1, Ll/gdc0;->n:I

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lv/VImage;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->g:Lv/VImage;

    .line 74
    .line 75
    sget p1, Ll/gdc0;->L:I

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lv/VImage;

    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->h:Lv/VImage;

    .line 84
    .line 85
    sget p1, Ll/gdc0;->D:I

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->d:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->e:Lv/VText;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView$a;

    .line 106
    .line 107
    const/4 p2, 0x0

    .line 108
    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView$a;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;Ll/x0x;)V

    .line 109
    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->j:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView$a;

    .line 112
    .line 113
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 114
    .line 115
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->d:Lv/VText;

    .line 119
    .line 120
    const/4 p2, 0x3

    .line 121
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    invoke-virtual {p1, p3, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->e:Lv/VText;

    .line 129
    .line 130
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method private setContentList(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->e:Lv/VText;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->h:Lv/VImage;

    .line 15
    .line 16
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->g:Lv/VImage;

    .line 20
    .line 21
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->f:Lv/VImage;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->h:Lv/VImage;

    .line 45
    .line 46
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->g:Lv/VImage;

    .line 50
    .line 51
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->f:Lv/VImage;

    .line 60
    .line 61
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->j:Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView$a;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView$a;->G(Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/oyl;->d(Lcom/p1/mobile/putong/data/User;)V

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
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 46
    .line 47
    :cond_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->setContentList(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public d0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->f:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public getClickView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemImagesView;->k:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/oyl;->setContent(Ljava/lang/String;)V

    return-void
.end method
