.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:I

.field public f:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public g:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public h:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public i:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "#33ffffff"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->f:I

    .line 11
    .line 12
    const/4 p1, -0x1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->g:I

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->h:I

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->i:I

    .line 19
    .line 20
    const-string p1, "default"

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->d()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const-string p1, "#33ffffff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->f:I

    const/4 p1, -0x1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->g:I

    const/4 p1, 0x0

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->h:I

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->i:I

    .line 33
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m:Ljava/lang/String;

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    const-string p1, "#33ffffff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->f:I

    const/4 p1, -0x1

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->g:I

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->h:I

    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->i:I

    .line 40
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m:Ljava/lang/String;

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->d()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private getAct()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method private getPageId()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    const-string v1, "p_suggest_user_profile_info_view"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const-string p0, "p_suggest_users_home_view"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method


# virtual methods
.method public c(Ll/aoh0;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/aoh0;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m:Ljava/lang/String;

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
    invoke-virtual {p1}, Ll/aoh0;->a()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v0, "dynamics_image_witch_type"

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/aoh0;->b()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    new-instance p0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method

.method public final d()V
    .locals 5

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->b:Landroid/view/View;

    .line 39
    .line 40
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 41
    .line 42
    const/4 v2, -0x1

    .line 43
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    const/high16 v3, 0x3f800000    # 1.0f

    .line 47
    .line 48
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 49
    .line 50
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->b:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {v0, v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-direct {v1, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c:Landroid/view/View;

    .line 65
    .line 66
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 67
    .line 68
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 69
    .line 70
    .line 71
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c:Landroid/view/View;

    .line 74
    .line 75
    invoke-virtual {v0, p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public final e()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 40
    .line 41
    .line 42
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 43
    .line 44
    const/high16 v5, 0x3f800000    # 1.0f

    .line 45
    .line 46
    invoke-direct {v4, v2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    new-instance v4, Landroid/view/View;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-direct {v4, v6}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->b:Landroid/view/View;

    .line 62
    .line 63
    new-instance v4, Landroid/view/View;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-direct {v4, v6}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c:Landroid/view/View;

    .line 73
    .line 74
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 75
    .line 76
    invoke-direct {v4, v3, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->b:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    .line 83
    .line 84
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c:Landroid/view/View;

    .line 85
    .line 86
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->b:Landroid/view/View;

    .line 90
    .line 91
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c:Landroid/view/View;

    .line 95
    .line 96
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    new-instance v3, Landroid/view/View;

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-direct {v3, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 106
    .line 107
    .line 108
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->d:Landroid/view/View;

    .line 109
    .line 110
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 111
    .line 112
    const/high16 v4, 0x43160000    # 150.0f

    .line 113
    .line 114
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    invoke-direct {v3, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 119
    .line 120
    .line 121
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->d:Landroid/view/View;

    .line 122
    .line 123
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->d:Landroid/view/View;

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    :cond_0
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 2
    .line 3
    invoke-interface {p1, p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->a(I)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 p4, 0x0

    .line 11
    invoke-virtual {p0, p4, p2, p3, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m(ZLl/aoh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getPageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string p3, "change_photo_method"

    .line 20
    .line 21
    const-string p4, "click_card"

    .line 22
    .line 23
    invoke-static {p3, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const-string p4, "can_switch"

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 38
    .line 39
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p4, "photo_numbers"

    .line 44
    .line 45
    invoke-static {p4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    filled-new-array {p3, p1, p0}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "e_change_photo"

    .line 54
    .line 55
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 2
    .line 3
    invoke-interface {p1, p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->a(I)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 p4, 0x1

    .line 11
    invoke-virtual {p0, p4, p2, p3, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m(ZLl/aoh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getPageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string p3, "change_photo_method"

    .line 20
    .line 21
    const-string p4, "click_card"

    .line 22
    .line 23
    invoke-static {p3, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const-string p4, "can_switch"

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 38
    .line 39
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p4, "photo_numbers"

    .line 44
    .line 45
    invoke-static {p4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    filled-new-array {p3, p1, p0}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "e_change_photo"

    .line 54
    .line 55
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public getIndicator()Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShowPictureIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final h(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->l:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->e(Lcom/p1/mobile/putong/data/Media;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->i(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 2
    .line 3
    const-string v0, "raw"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {p1, p2}, Ll/nwb;->o(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public j(Ll/aoh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c(Ll/aoh0;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->j:Ljava/util/List;

    .line 6
    .line 7
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->l:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->j:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->j:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    if-le v1, v2, :cond_1

    .line 37
    .line 38
    move v1, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 v1, 0x0

    .line 41
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->b:Landroid/view/View;

    .line 45
    .line 46
    new-instance v1, Ll/bof;

    .line 47
    .line 48
    invoke-direct {v1, p0, p3, p1, p2}, Ll/bof;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c:Landroid/view/View;

    .line 55
    .line 56
    new-instance v1, Ll/cof;

    .line 57
    .line 58
    invoke-direct {v1, p0, p3, p1, p2}, Ll/cof;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;Ll/aoh0;Lcom/p1/mobile/putong/data/User;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/gra;->N3()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->d:Landroid/view/View;

    .line 71
    .line 72
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$a;

    .line 73
    .line 74
    invoke-direct {p2, p0, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 12
    .line 13
    sget v2, Ll/qa00;->m:I

    .line 14
    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 18
    .line 19
    if-eq v1, v2, :cond_1

    .line 20
    .line 21
    :cond_0
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 22
    .line 23
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 3
    .line 4
    return-void
.end method

.method public final m(ZLl/aoh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)Z
    .locals 5

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->c(Ll/aoh0;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    add-int/2addr v1, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    sub-int/2addr v1, v2

    .line 17
    :goto_0
    if-gez v1, :cond_2

    .line 18
    .line 19
    move v1, v0

    .line 20
    goto :goto_1

    .line 21
    :cond_2
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-lt v1, v3, :cond_3

    .line 26
    .line 27
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v1, v2

    .line 32
    :cond_3
    :goto_1
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 33
    .line 34
    if-ne v3, v1, :cond_4

    .line 35
    .line 36
    invoke-interface {p4, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->c(Z)V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :cond_4
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 41
    .line 42
    invoke-static {}, Ll/gra;->N3()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_5

    .line 47
    .line 48
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    const-string v0, "dynamics_image_witch_type"

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-interface {p4, v1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->d(ILcom/p1/mobile/putong/data/Media;Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_5
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 71
    .line 72
    invoke-virtual {p2}, Ll/aoh0;->c()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-eq v4, v2, :cond_6

    .line 77
    .line 78
    invoke-virtual {p2}, Ll/aoh0;->c()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    const/4 v4, 0x2

    .line 83
    if-ne p2, v4, :cond_7

    .line 84
    .line 85
    :cond_6
    move v0, v2

    .line 86
    :cond_7
    invoke-interface {p4, v1, v3, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;->d(ILcom/p1/mobile/putong/data/Media;Z)V

    .line 87
    .line 88
    .line 89
    :goto_2
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->k:Z

    .line 90
    .line 91
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 92
    .line 93
    if-eqz p2, :cond_8

    .line 94
    .line 95
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 96
    .line 97
    invoke-virtual {p4, p2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_8
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->e:I

    .line 102
    .line 103
    invoke-virtual {p4, p2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 104
    .line 105
    .line 106
    :goto_3
    if-eqz p1, :cond_9

    .line 107
    .line 108
    add-int/lit8 p2, v1, 0x1

    .line 109
    .line 110
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result p4

    .line 114
    if-ge p2, p4, :cond_9

    .line 115
    .line 116
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->h(Lcom/p1/mobile/putong/data/Media;)V

    .line 123
    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_9
    if-nez p1, :cond_a

    .line 127
    .line 128
    sub-int/2addr v1, v2

    .line 129
    if-ltz v1, :cond_a

    .line 130
    .line 131
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->h(Lcom/p1/mobile/putong/data/Media;)V

    .line 138
    .line 139
    .line 140
    :cond_a
    :goto_4
    return v2
.end method

.method public setCurrentSwitchType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorColorBorder(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorSelectedColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorSelectedColorBorder(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setIndicatorStyle(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 8
    .line 9
    sget p1, Ll/qa00;->A:I

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->k()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setIndicatorVisible(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getIndicator()Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->j:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->j:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/4 v0, 0x1

    .line 29
    if-le p1, v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getIndicator()Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->getIndicator()Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public setVisibilit(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->setIndicatorVisible(Ljava/lang/Boolean;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setupIndicator(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->f:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorColor(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 18
    .line 19
    sget v1, Ll/qa00;->d:I

    .line 20
    .line 21
    int-to-float v2, v1

    .line 22
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorMargin(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 26
    .line 27
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->g:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorSelectedColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->h:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorBorderColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 40
    .line 41
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->i:I

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorBorderSelectedColor(I)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    const/4 v2, -0x1

    .line 49
    invoke-direct {v0, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 50
    .line 51
    .line 52
    sget v1, Ll/qa00;->m:I

    .line 53
    .line 54
    sget v2, Ll/qa00;->j:I

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->a:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 61
    .line 62
    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
