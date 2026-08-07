.class public Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/oyl;


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Z

.field public i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 97
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 96
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->j:Z

    .line 6
    .line 7
    sget-object p3, Ll/rhc0;->v:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget p3, Ll/rhc0;->w:I

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    sget v0, Ll/rhc0;->x:I

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h:Z

    .line 27
    .line 28
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget p2, Ll/sec0;->T:I

    .line 36
    .line 37
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    sget p1, Ll/gdc0;->C:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lv/VText;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->d:Lv/VText;

    .line 49
    .line 50
    sget p1, Ll/gdc0;->K:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lv/VImage;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->e:Lv/VImage;

    .line 59
    .line 60
    sget p1, Ll/gdc0;->M:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lv/VText;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->f:Lv/VText;

    .line 69
    .line 70
    sget p1, Ll/gdc0;->L:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lv/VImage;

    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->g:Lv/VImage;

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->d:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->d:Lv/VText;

    .line 86
    .line 87
    const/4 p1, 0x3

    .line 88
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 93
    .line 94
    .line 95
    return-void
.end method


# virtual methods
.method public d0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->BIND_PHONE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0}, Ll/oyl;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getClickView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getItemType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/oyl;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->g:Lv/VImage;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget p1, Ll/kbc0;->u1:I

    .line 11
    .line 12
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->e:Lv/VImage;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->f:Lv/VText;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    xor-int/2addr p1, v2

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->j:Z

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    sget v0, Ll/kbc0;->A0:I

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->e:Lv/VImage;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->g:Lv/VImage;

    .line 59
    .line 60
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->h:Z

    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->f:Lv/VText;

    .line 66
    .line 67
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->f:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->j:Z

    .line 76
    .line 77
    return-void
.end method

.method public setContent(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 78
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->g:Lv/VImage;

    sget v0, Ll/kbc0;->u1:I

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->e:Lv/VImage;

    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->i:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    move-result v0

    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->f:Lv/VText;

    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->j:Z

    return-void

    .line 83
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->setContent(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 84
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/view/MarryEditProfileItemView;->j:Z

    return-void
.end method
