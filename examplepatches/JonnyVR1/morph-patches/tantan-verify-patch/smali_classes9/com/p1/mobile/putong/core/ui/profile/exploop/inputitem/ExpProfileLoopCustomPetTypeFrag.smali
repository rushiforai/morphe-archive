.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag$b;
    }
.end annotation


# instance fields
.field public F:Landroidx/recyclerview/widget/RecyclerView;

.field public G:Landroid/view/ViewGroup;

.field public H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;",
            ">;"
        }
    .end annotation
.end field

.field public I:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public J:Lv/VText;

.field public K:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->I:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->Z4(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;)V

    return-void
.end method

.method public static bridge synthetic W4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->I:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic X4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->a5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;)V

    return-void
.end method

.method public static bridge synthetic Y4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->c5(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    new-instance p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->F:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    new-instance p1, Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-direct {p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->F:Landroidx/recyclerview/widget/RecyclerView;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Lv/VText;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->J:Lv/VText;

    .line 40
    .line 41
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 42
    .line 43
    sget v1, Ll/bnl0;->f:I

    .line 44
    .line 45
    const/high16 v2, 0x41a80000    # 21.0f

    .line 46
    .line 47
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 52
    .line 53
    .line 54
    sget v1, Ll/qa00;->p:I

    .line 55
    .line 56
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 57
    .line 58
    sget v1, Ll/qa00;->i:I

    .line 59
    .line 60
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->J:Lv/VText;

    .line 63
    .line 64
    const-string v2, "\u4e0a\u4f20\u5ba0\u7269\u7167\u7247"

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->J:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    sget v3, Ll/c9c0;->z:I

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->J:Lv/VText;

    .line 85
    .line 86
    const/high16 v2, 0x41700000    # 15.0f

    .line 87
    .line 88
    invoke-virtual {v1, p2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->J:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    sget v0, Ll/kec0;->C9:I

    .line 105
    .line 106
    const/4 v1, 0x0

    .line 107
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    check-cast p2, Landroid/view/ViewGroup;

    .line 112
    .line 113
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->G:Landroid/view/ViewGroup;

    .line 114
    .line 115
    sget p0, Ll/bnl0;->e:I

    .line 116
    .line 117
    sget v0, Ll/bnl0;->f:I

    .line 118
    .line 119
    invoke-virtual {p1, p2, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 120
    .line 121
    .line 122
    return-object p1
.end method

.method public Q4(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->Q4(Ljava/util/List;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->getImageUrl()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->Q(Lcom/p1/mobile/putong/data/Picture;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public T4(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->T4(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 20
    .line 21
    filled-new-array {v2}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, v0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 37
    .line 38
    new-array v2, v1, [Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-object v2, v0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 45
    .line 46
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 55
    .line 56
    const-string v2, "\u6682\u4e0d\u900f\u9732"

    .line 57
    .line 58
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->I:Ljava/util/List;

    .line 72
    .line 73
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 81
    .line 82
    new-array p1, v1, [Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 89
    .line 90
    return-void
.end method

.method public final synthetic Z4(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Ll/qa00;->y:I

    .line 6
    .line 7
    mul-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    sget v1, Ll/qa00;->h:I

    .line 11
    .line 12
    mul-int/lit8 v1, v1, 0x2

    .line 13
    .line 14
    sub-int/2addr v0, v1

    .line 15
    div-int/lit8 v0, v0, 0x3

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 22
    .line 23
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->M4()Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag$a;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;)V

    .line 35
    .line 36
    .line 37
    const/16 p0, 0x11

    .line 38
    .line 39
    invoke-virtual {p1, v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->L(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView$b;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final a5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;->boolValue:Z

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;->text:Ljava/lang/String;

    .line 12
    .line 13
    :cond_1
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 14
    .line 15
    :goto_0
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->b5(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final b5(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string v0, "\u6682\u65e0"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "\u6682\u4e0d\u900f\u9732"

    .line 12
    .line 13
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->G:Landroid/view/ViewGroup;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->J:Lv/VText;

    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->I:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->c5(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->G:Landroid/view/ViewGroup;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->J:Lv/VText;

    .line 44
    .line 45
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final c5(Ljava/util/List;)V
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
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_2

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->getImageUrl()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_1

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;->R(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return-void
.end method

.method public d4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->G:Landroid/view/ViewGroup;

    .line 16
    .line 17
    sget v2, Ll/adc0;->O5:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->G:Landroid/view/ViewGroup;

    .line 31
    .line 32
    sget v2, Ll/adc0;->P5:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->G:Landroid/view/ViewGroup;

    .line 46
    .line 47
    sget v2, Ll/adc0;->Q5:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileUploadImageView;

    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->H:Ljava/util/List;

    .line 59
    .line 60
    new-instance v1, Ll/qhf;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/qhf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->N4()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 79
    .line 80
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_1

    .line 85
    .line 86
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 89
    .line 90
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 99
    .line 100
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 101
    .line 102
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_1

    .line 107
    .line 108
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 113
    .line 114
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 115
    .line 116
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-nez v1, :cond_0

    .line 121
    .line 122
    new-instance v1, Ljava/util/ArrayList;

    .line 123
    .line 124
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 127
    .line 128
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 129
    .line 130
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealth;->petImg:Ljava/util/List;

    .line 131
    .line 132
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 133
    .line 134
    .line 135
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->I:Ljava/util/List;

    .line 136
    .line 137
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 142
    .line 143
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 144
    .line 145
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_1

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserWealth;->pet:Ljava/util/List;

    .line 158
    .line 159
    const/4 v1, 0x0

    .line 160
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Ljava/lang/String;

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_1
    const/4 v0, 0x0

    .line 168
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->K:Ljava/lang/String;

    .line 169
    .line 170
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;

    .line 171
    .line 172
    const-string v2, "\u5df2\u6709\u5ba0\u7269"

    .line 173
    .line 174
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    new-instance v3, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;

    .line 178
    .line 179
    const-string v4, "\u6682\u65e0"

    .line 180
    .line 181
    invoke-direct {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    const/4 v5, 0x1

    .line 189
    if-eqz v2, :cond_2

    .line 190
    .line 191
    iput-boolean v5, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;->boolValue:Z

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_2
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    if-eqz v2, :cond_3

    .line 199
    .line 200
    iput-boolean v5, v3, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;->boolValue:Z

    .line 201
    .line 202
    :cond_3
    :goto_1
    new-instance v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag$b;

    .line 203
    .line 204
    filled-new-array {v1, v3}, [Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-direct {v2, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;Ljava/util/ArrayList;)V

    .line 213
    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->F:Landroidx/recyclerview/widget/RecyclerView;

    .line 216
    .line 217
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 218
    .line 219
    .line 220
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->F:Landroidx/recyclerview/widget/RecyclerView;

    .line 221
    .line 222
    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomPetTypeFrag;->b5(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method
