.class public Lcom/idv/identity/platform/CardGuideActivity;
.super Lcom/idv/identity/platform/IntlFaceBaseActivity;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/platform/CardGuideActivity$k;
    }
.end annotation


# instance fields
.field c:Landroidx/viewpager/widget/ViewPager;

.field d:Lcom/idv/identity/platform/widget/IndicatorView;

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ll/cf60;

.field private g:Landroid/widget/ImageView;

.field private h:Landroid/widget/Button;

.field private i:Landroid/widget/LinearLayout;

.field private j:Landroid/widget/TextView;

.field private k:Landroid/widget/CheckBox;

.field public l:J

.field m:Ll/afm;

.field private n:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 9
    .line 10
    new-instance v0, Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v1, Lcom/idv/identity/platform/CardGuideActivity$b;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/idv/identity/platform/CardGuideActivity$b;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->n:Landroid/os/Handler;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic L0(Lcom/idv/identity/platform/CardGuideActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/CardGuideActivity;->d1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N0(Lcom/idv/identity/platform/CardGuideActivity;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O0(Lcom/idv/identity/platform/CardGuideActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/CardGuideActivity;->h1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P0(Lcom/idv/identity/platform/CardGuideActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/CardGuideActivity;->m1(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Q0(Ljava/lang/String;Landroid/view/LayoutInflater;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "scan"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 18
    .line 19
    invoke-direct {p0, p2}, Lcom/idv/identity/platform/CardGuideActivity;->T0(Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const-string v0, "shoot"

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 44
    .line 45
    invoke-direct {p0, p2}, Lcom/idv/identity/platform/CardGuideActivity;->U0(Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    const-string v0, "auto"

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 70
    .line 71
    invoke-direct {p0, p2}, Lcom/idv/identity/platform/CardGuideActivity;->T0(Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 79
    .line 80
    invoke-direct {p0, p2}, Lcom/idv/identity/platform/CardGuideActivity;->U0(Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    :cond_2
    return-void
.end method

.method private S0(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 4

    .line 1
    sget v0, Ll/eec0;->g:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget v0, Ll/scc0;->z:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/TextView;

    .line 15
    .line 16
    sget v1, Ll/scc0;->t:I

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/ImageView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/zac0;->b:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    sget v1, Lcom/idv/identity/base/R$string;->M:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 40
    .line 41
    .line 42
    sget v1, Ll/scc0;->y:I

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Landroid/widget/TextView;

    .line 49
    .line 50
    sget v2, Lcom/idv/identity/base/R$string;->d:I

    .line 51
    .line 52
    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 60
    .line 61
    sget v2, Ll/y8c0;->k:I

    .line 62
    .line 63
    invoke-virtual {p0, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideTitleColor(I)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 71
    .line 72
    sget v0, Ll/y8c0;->j:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideContentColor(I)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    .line 80
    .line 81
    return-object p1
.end method

.method private T0(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 4

    .line 1
    sget v0, Ll/eec0;->g:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget v0, Ll/scc0;->z:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/TextView;

    .line 15
    .line 16
    sget v1, Ll/scc0;->t:I

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/ImageView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/zac0;->a:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    sget v1, Ll/scc0;->y:I

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/widget/TextView;

    .line 44
    .line 45
    sget v2, Lcom/idv/identity/base/R$string;->g:I

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    sget v2, Lcom/idv/identity/base/R$string;->h:I

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0, v0, v1}, Lcom/idv/identity/platform/CardGuideActivity;->j1(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 64
    .line 65
    .line 66
    return-object p1
.end method

.method private U0(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 5

    .line 1
    sget v0, Ll/eec0;->g:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget v0, Ll/scc0;->z:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/TextView;

    .line 15
    .line 16
    sget v1, Ll/scc0;->t:I

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/ImageView;

    .line 23
    .line 24
    sget v2, Ll/scc0;->y:I

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Landroid/widget/TextView;

    .line 31
    .line 32
    sget v3, Lcom/idv/identity/base/R$string;->e:I

    .line 33
    .line 34
    invoke-virtual {p0, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    sget v4, Ll/zac0;->a:I

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    sget v1, Lcom/idv/identity/base/R$string;->f:I

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0, v0, v2}, Lcom/idv/identity/platform/CardGuideActivity;->j1(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 64
    .line 65
    .line 66
    return-object p1
.end method

.method private V0(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Landroid/text/SpannableString;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Lcom/idv/identity/platform/CardGuideActivity$i;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/idv/identity/platform/CardGuideActivity$i;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    add-int/2addr p1, p0

    .line 35
    const/16 p2, 0x21

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0, p1, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method private a1(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, "GUIDE_START_INIT"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 10
    .line 11
    const-string v8, "errMsg"

    .line 12
    .line 13
    sget-object v9, Ll/dfm;->u:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "action"

    .line 16
    .line 17
    const-string v3, "initSDK"

    .line 18
    .line 19
    const-string v4, "status"

    .line 20
    .line 21
    const-string v5, "error"

    .line 22
    .line 23
    const-string v6, "productCode"

    .line 24
    .line 25
    move-object v7, p2

    .line 26
    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, v1, v0, p2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, p3}, Lcom/idv/identity/platform/CardGuideActivity;->f1(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    move-object v7, p2

    .line 38
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    sget-object p2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 43
    .line 44
    const-string v5, "success"

    .line 45
    .line 46
    const-string v6, "productCode"

    .line 47
    .line 48
    const-string v2, "action"

    .line 49
    .line 50
    const-string v3, "initSDK"

    .line 51
    .line 52
    const-string v4, "status"

    .line 53
    .line 54
    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p1, p2, v0, p3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string p1, "success"

    .line 62
    .line 63
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/CardGuideActivity;->d1(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private d1(Ljava/lang/String;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/platform/CardGuideActivity;->l:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "ms"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 30
    .line 31
    const-string v4, "GUIDE_PAGE_LEAVE"

    .line 32
    .line 33
    const-string v5, "GUIDE"

    .line 34
    .line 35
    move-object v7, p1

    .line 36
    invoke-virtual/range {v2 .. v7}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p1, "success"

    .line 40
    .line 41
    if-eq p1, v7, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, v7}, Ll/afm;->e(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private f1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x3e9

    .line 6
    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity;->n:Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private h1(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/afm;->e(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-wide v3, p0, Lcom/idv/identity/platform/CardGuideActivity;->l:J

    .line 18
    .line 19
    sub-long/2addr v1, v3

    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "ms"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 37
    .line 38
    const-string v4, "GUIDE_PAGE_LEAVE"

    .line 39
    .line 40
    const-string v5, "GUIDE"

    .line 41
    .line 42
    move-object v7, p1

    .line 43
    invoke-virtual/range {v2 .. v7}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private j1(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 1

    .line 1
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    sget v0, Ll/y8c0;->k:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideTitleColor(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 13
    .line 14
    sget p1, Ll/y8c0;->j:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideContentColor(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private l1(Lcom/idv/identity/platform/model/NfcConfigRes;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    const-string v1, "0"

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-static {p0}, Ll/lf20;->c(Landroid/content/Context;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    const-string v1, "1"

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_1
    const-string v1, "2"

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDocumentNumber()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDateOfBirth()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDateOfExpiry()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p0, v0, v1, p1}, Ll/lf20;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_2
    return v0
.end method

.method private m1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->h:Landroid/widget/Button;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity;->g:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public R0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->h:Landroid/widget/Button;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->h:Landroid/widget/Button;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 13
    .line 14
    sget v1, Ll/y8c0;->f:I

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideStartBtnBGColor(I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity;->h:Landroid/widget/Button;

    .line 24
    .line 25
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 26
    .line 27
    sget v0, Ll/y8c0;->l:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideStartBtnTextColor(I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 38
    .line 39
    sget v1, Ll/y8c0;->i:I

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideStartBtnDisableBGColor(I)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity;->h:Landroid/widget/Button;

    .line 49
    .line 50
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 51
    .line 52
    sget v0, Ll/y8c0;->l:I

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideStartBtnDisableTextColor(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public W0()Z
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "in"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "id"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public X0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/platform/CardGuideActivity;->W0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/afm;->i()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/afm;->h()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-static {p0, v0}, Ll/lf20;->a(Lcom/idv/identity/platform/CardGuideActivity;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public Y0()V
    .locals 8

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/ffm;->g:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    const-string v3, ""

    .line 17
    .line 18
    if-eqz v1, :cond_4

    .line 19
    .line 20
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v4, "navigatePage"

    .line 29
    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    sget-object v5, Ll/dfm;->v:Ljava/lang/String;

    .line 37
    .line 38
    const-string v6, "0"

    .line 39
    .line 40
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    if-eqz v6, :cond_0

    .line 45
    .line 46
    invoke-static {p0}, Ll/lf20;->c(Landroid/content/Context;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const-string v6, "1"

    .line 52
    .line 53
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-eqz v6, :cond_1

    .line 58
    .line 59
    invoke-static {v2, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const-string v6, "2"

    .line 65
    .line 66
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    if-eqz v6, :cond_2

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDocumentNumber()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDateOfBirth()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v1}, Lcom/idv/identity/platform/model/NfcConfigRes;->getDateOfExpiry()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {p0, v2, v3, v1}, Ll/lf20;->d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    sget-object v6, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 94
    .line 95
    const-string v7, "nfcMode"

    .line 96
    .line 97
    filled-new-array {v7, v3}, [Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v1, v6, v4, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :goto_0
    move-object v3, v5

    .line 105
    goto/16 :goto_2

    .line 106
    .line 107
    :cond_3
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    sget-object v5, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 112
    .line 113
    const-string v6, "nfcConfigRes"

    .line 114
    .line 115
    const-string v7, "is null"

    .line 116
    .line 117
    filled-new-array {v6, v7}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-virtual {v1, v5, v4, v6}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    goto/16 :goto_2

    .line 125
    .line 126
    :cond_4
    sget-object v1, Ll/ffm;->d:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_5

    .line 133
    .line 134
    invoke-static {v2, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    sget-object v3, Ll/dfm;->w:Ljava/lang/String;

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_5
    sget-object v1, Ll/ffm;->e:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_8

    .line 148
    .line 149
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v1}, Ll/afm;->v()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v3}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    sget-object v4, Ll/cfm;->a:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_7

    .line 172
    .line 173
    if-eqz v3, :cond_7

    .line 174
    .line 175
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const-string v4, "android.hardware.nfc"

    .line 180
    .line 181
    invoke-virtual {v1, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-nez v1, :cond_6

    .line 186
    .line 187
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 192
    .line 193
    sget-object v4, Ll/cfm;->a:Ljava/lang/String;

    .line 194
    .line 195
    const-string v5, "warning"

    .line 196
    .line 197
    sget-object v6, Ll/dfm;->y:Ljava/lang/String;

    .line 198
    .line 199
    const-string v7, "docType"

    .line 200
    .line 201
    filled-new-array {v7, v4, v5, v6}, [Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    const-string v5, "START_CKYC"

    .line 206
    .line 207
    invoke-virtual {v1, v3, v5, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-static {v2, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    sget-object v2, Ll/dfm;->w:Ljava/lang/String;

    .line 215
    .line 216
    :goto_1
    move-object v3, v2

    .line 217
    move v2, v1

    .line 218
    goto :goto_2

    .line 219
    :cond_6
    invoke-direct {p0, v3}, Lcom/idv/identity/platform/CardGuideActivity;->l1(Lcom/idv/identity/platform/model/NfcConfigRes;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    sget-object v2, Ll/dfm;->v:Ljava/lang/String;

    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_7
    invoke-static {v2, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    sget-object v2, Ll/dfm;->w:Ljava/lang/String;

    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_8
    sget-object v1, Ll/ffm;->f:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_9

    .line 240
    .line 241
    invoke-static {v2, p0}, Ll/lf20;->e(ZLandroid/content/Context;)Z

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    sget-object v3, Ll/dfm;->w:Ljava/lang/String;

    .line 246
    .line 247
    :cond_9
    :goto_2
    invoke-direct {p0, v2, v0, v3}, Lcom/idv/identity/platform/CardGuideActivity;->a1(ZLjava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method public k1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/platform/CardGuideActivity$k;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "exitAlertAppear"

    .line 8
    .line 9
    const-string v3, "GUIDE"

    .line 10
    .line 11
    const-string v4, "PAGER_BEHAVIOR"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/idv/identity/platform/IdentityAlertOverlay;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    const/4 v2, -0x1

    .line 24
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0, v1}, Lcom/idv/identity/platform/CardGuideActivity;->m1(Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {p5}, Ll/azb;->s(Ljava/lang/String;)Ll/azb$a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v0, v2}, Ll/azb;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;Ll/azb$a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setTitleText(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setMessageText(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    if-eqz p4, :cond_0

    .line 51
    .line 52
    invoke-virtual {v0, p4}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCancelText(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 61
    .line 62
    .line 63
    :goto_0
    invoke-virtual {v0, p3}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setConfirmText(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    invoke-static {p5}, Ll/azb;->t(Ljava/lang/String;)Ll/azb$a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {v0, p1}, Ll/azb;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;Ll/azb$a;)V

    .line 74
    .line 75
    .line 76
    new-instance p1, Lcom/idv/identity/platform/CardGuideActivity$a;

    .line 77
    .line 78
    invoke-direct {p1, p0, p6}, Lcom/idv/identity/platform/CardGuideActivity$a;-><init>(Lcom/idv/identity/platform/CardGuideActivity;Lcom/idv/identity/platform/CardGuideActivity$k;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCommAlertOverlayListener(Lcom/idv/identity/platform/IdentityAlertOverlay$d;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public onBackPressed()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->T:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->N:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    new-instance v8, Lcom/idv/identity/platform/CardGuideActivity$j;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Lcom/idv/identity/platform/CardGuideActivity$j;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 34
    .line 35
    .line 36
    const-string v4, ""

    .line 37
    .line 38
    const-string v7, "ocr_exit_code"

    .line 39
    .line 40
    move-object v2, p0

    .line 41
    invoke-virtual/range {v2 .. v8}, Lcom/idv/identity/platform/CardGuideActivity;->k1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/platform/CardGuideActivity$k;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->l:J

    .line 9
    .line 10
    sget p1, Ll/eec0;->a:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/afm;->h()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/afm;->i()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Ll/y8c0;->d:I

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    const/4 v3, 0x1

    .line 35
    invoke-virtual {p0, v2, v3, v1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->K0(ZZI)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v1}, Ll/kkl0;->H(Landroid/view/View;)Ll/bhq0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    invoke-virtual {v1, v3}, Ll/bhq0;->b(Z)V

    .line 53
    .line 54
    .line 55
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 60
    .line 61
    const-string v5, "GUIDE_PAGE_SHOW"

    .line 62
    .line 63
    const-string v6, "GUIDE"

    .line 64
    .line 65
    invoke-virtual {v1, v4, v5, v6}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget v1, Ll/scc0;->n:I

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Landroidx/viewpager/widget/ViewPager;

    .line 75
    .line 76
    iput-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->c:Landroidx/viewpager/widget/ViewPager;

    .line 77
    .line 78
    sget v1, Ll/scc0;->r:I

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Lcom/idv/identity/platform/widget/IndicatorView;

    .line 85
    .line 86
    iput-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->d:Lcom/idv/identity/platform/widget/IndicatorView;

    .line 87
    .line 88
    sget-object v4, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 89
    .line 90
    sget v5, Ll/y8c0;->g:I

    .line 91
    .line 92
    invoke-virtual {v4, v5}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideIndicatorSelectedColor(I)I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    invoke-virtual {v1, v4}, Lcom/idv/identity/platform/widget/IndicatorView;->setColorSelector(I)V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->d:Lcom/idv/identity/platform/widget/IndicatorView;

    .line 100
    .line 101
    sget-object v4, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 102
    .line 103
    sget v5, Ll/y8c0;->h:I

    .line 104
    .line 105
    invoke-virtual {v4, v5}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideIndicatorUnSelectedColor(I)I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    invoke-virtual {v1, v4}, Lcom/idv/identity/platform/widget/IndicatorView;->setColorUnSelector(I)V

    .line 110
    .line 111
    .line 112
    sget v1, Ll/scc0;->s:I

    .line 113
    .line 114
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Landroid/widget/ImageView;

    .line 119
    .line 120
    iput-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->g:Landroid/widget/ImageView;

    .line 121
    .line 122
    invoke-static {}, Ll/azb;->l()Landroid/graphics/Bitmap;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    if-eqz v1, :cond_1

    .line 127
    .line 128
    iget-object v4, p0, Lcom/idv/identity/platform/CardGuideActivity;->g:Landroid/widget/ImageView;

    .line 129
    .line 130
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    const/high16 v5, 0x42700000    # 60.0f

    .line 140
    .line 141
    invoke-static {v4, v5}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 146
    .line 147
    .line 148
    move-result-object v6

    .line 149
    invoke-static {v6, v5}, Ll/je00;->a(Landroid/content/Context;F)I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    invoke-direct {v1, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 154
    .line 155
    .line 156
    sget-object v4, Ll/hfm;->i:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz v4, :cond_2

    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    if-nez v4, :cond_2

    .line 165
    .line 166
    sget-object v4, Ll/hfm;->i:Ljava/lang/String;

    .line 167
    .line 168
    const-string v5, "Left"

    .line 169
    .line 170
    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    if-eqz v4, :cond_2

    .line 175
    .line 176
    const/16 v4, 0x14

    .line 177
    .line 178
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 179
    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_2
    sget-object v4, Ll/hfm;->i:Ljava/lang/String;

    .line 183
    .line 184
    if-eqz v4, :cond_3

    .line 185
    .line 186
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    if-nez v4, :cond_3

    .line 191
    .line 192
    sget-object v4, Ll/hfm;->i:Ljava/lang/String;

    .line 193
    .line 194
    const-string v5, "Right"

    .line 195
    .line 196
    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    if-eqz v4, :cond_3

    .line 201
    .line 202
    const/16 v4, 0x15

    .line 203
    .line 204
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 205
    .line 206
    .line 207
    :cond_3
    :goto_0
    iget-object v4, p0, Lcom/idv/identity/platform/CardGuideActivity;->g:Landroid/widget/ImageView;

    .line 208
    .line 209
    invoke-virtual {v4, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    .line 211
    .line 212
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->g:Landroid/widget/ImageView;

    .line 213
    .line 214
    new-instance v4, Lcom/idv/identity/platform/CardGuideActivity$c;

    .line 215
    .line 216
    invoke-direct {v4, p0}, Lcom/idv/identity/platform/CardGuideActivity$c;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    .line 221
    .line 222
    sget v1, Ll/scc0;->a:I

    .line 223
    .line 224
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    check-cast v1, Landroid/widget/Button;

    .line 229
    .line 230
    iput-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->h:Landroid/widget/Button;

    .line 231
    .line 232
    sget v1, Ll/scc0;->v:I

    .line 233
    .line 234
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    check-cast v1, Landroid/widget/LinearLayout;

    .line 239
    .line 240
    iput-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->i:Landroid/widget/LinearLayout;

    .line 241
    .line 242
    sget v1, Ll/scc0;->c:I

    .line 243
    .line 244
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    check-cast v1, Landroid/widget/CheckBox;

    .line 249
    .line 250
    iput-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->k:Landroid/widget/CheckBox;

    .line 251
    .line 252
    sget v1, Ll/scc0;->x:I

    .line 253
    .line 254
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    check-cast v1, Landroid/widget/TextView;

    .line 259
    .line 260
    iput-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->j:Landroid/widget/TextView;

    .line 261
    .line 262
    sget v1, Lcom/idv/identity/platform/R$string;->a:I

    .line 263
    .line 264
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    sget v4, Lcom/idv/identity/platform/R$string;->b:I

    .line 269
    .line 270
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    invoke-direct {p0, v1, v4}, Lcom/idv/identity/platform/CardGuideActivity;->V0(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    iget-object v4, p0, Lcom/idv/identity/platform/CardGuideActivity;->j:Landroid/widget/TextView;

    .line 279
    .line 280
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    .line 282
    .line 283
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->j:Landroid/widget/TextView;

    .line 284
    .line 285
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 290
    .line 291
    .line 292
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->k:Landroid/widget/CheckBox;

    .line 293
    .line 294
    new-instance v4, Lcom/idv/identity/platform/CardGuideActivity$d;

    .line 295
    .line 296
    invoke-direct {v4, p0}, Lcom/idv/identity/platform/CardGuideActivity$d;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1, v4}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 300
    .line 301
    .line 302
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->h:Landroid/widget/Button;

    .line 303
    .line 304
    new-instance v4, Lcom/idv/identity/platform/CardGuideActivity$e;

    .line 305
    .line 306
    invoke-direct {v4, p0}, Lcom/idv/identity/platform/CardGuideActivity$e;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    .line 311
    .line 312
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->j:Landroid/widget/TextView;

    .line 313
    .line 314
    new-instance v4, Lcom/idv/identity/platform/CardGuideActivity$f;

    .line 315
    .line 316
    invoke-direct {v4, p0}, Lcom/idv/identity/platform/CardGuideActivity$f;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 317
    .line 318
    .line 319
    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 320
    .line 321
    .line 322
    if-eqz p1, :cond_4

    .line 323
    .line 324
    if-eqz v0, :cond_4

    .line 325
    .line 326
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    if-nez p1, :cond_4

    .line 331
    .line 332
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    if-nez p1, :cond_4

    .line 337
    .line 338
    invoke-virtual {p0, v2}, Lcom/idv/identity/platform/CardGuideActivity;->R0(Z)V

    .line 339
    .line 340
    .line 341
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->i:Landroid/widget/LinearLayout;

    .line 342
    .line 343
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 344
    .line 345
    .line 346
    goto :goto_1

    .line 347
    :cond_4
    invoke-virtual {p0, v3}, Lcom/idv/identity/platform/CardGuideActivity;->R0(Z)V

    .line 348
    .line 349
    .line 350
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->i:Landroid/widget/LinearLayout;

    .line 351
    .line 352
    const/16 v0, 0x8

    .line 353
    .line 354
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 355
    .line 356
    .line 357
    :goto_1
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    new-instance v0, Ljava/util/ArrayList;

    .line 362
    .line 363
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .line 365
    .line 366
    iput-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 367
    .line 368
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    invoke-virtual {v1}, Ll/afm;->i0()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    new-instance v1, Ljava/lang/StringBuilder;

    .line 384
    .line 385
    const-string v2, "getOcrModels:"

    .line 386
    .line 387
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    iget-object v2, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 391
    .line 392
    invoke-virtual {v2}, Ll/afm;->b0()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    const-string v2, "CardGuideActivity"

    .line 404
    .line 405
    invoke-static {v2, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    .line 407
    .line 408
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    invoke-virtual {v1}, Ll/afm;->i0()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    invoke-virtual {v2}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 421
    .line 422
    .line 423
    move-result-object v2

    .line 424
    sget-object v3, Ll/ffm;->g:Ljava/lang/String;

    .line 425
    .line 426
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    const/4 v3, 0x0

    .line 431
    const-string v4, "OCR_ID_BACK_3D"

    .line 432
    .line 433
    const-string v5, "OCR_ID_FACE_3D"

    .line 434
    .line 435
    if-eqz v1, :cond_5

    .line 436
    .line 437
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 438
    .line 439
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/CardGuideActivity;->S0(Landroid/view/LayoutInflater;)Landroid/view/View;

    .line 440
    .line 441
    .line 442
    move-result-object v6

    .line 443
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 444
    .line 445
    .line 446
    if-eqz v2, :cond_7

    .line 447
    .line 448
    invoke-virtual {v2}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    if-eqz v1, :cond_7

    .line 453
    .line 454
    const-string v1, "1"

    .line 455
    .line 456
    invoke-virtual {v2}, Lcom/idv/identity/platform/model/NfcConfigRes;->getNfcMode()Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v2

    .line 460
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    if-eqz v1, :cond_7

    .line 465
    .line 466
    invoke-direct {p0, v0, p1}, Lcom/idv/identity/platform/CardGuideActivity;->Q0(Ljava/lang/String;Landroid/view/LayoutInflater;)V

    .line 467
    .line 468
    .line 469
    goto :goto_2

    .line 470
    :cond_5
    invoke-direct {p0, v0, p1}, Lcom/idv/identity/platform/CardGuideActivity;->Q0(Ljava/lang/String;Landroid/view/LayoutInflater;)V

    .line 471
    .line 472
    .line 473
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 474
    .line 475
    if-eqz v0, :cond_7

    .line 476
    .line 477
    invoke-virtual {v0}, Ll/afm;->t()Ljava/util/List;

    .line 478
    .line 479
    .line 480
    move-result-object v0

    .line 481
    if-eqz v0, :cond_7

    .line 482
    .line 483
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 484
    .line 485
    invoke-virtual {v0, v5}, Ll/afm;->d(Ljava/lang/String;)Z

    .line 486
    .line 487
    .line 488
    move-result v0

    .line 489
    if-nez v0, :cond_6

    .line 490
    .line 491
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 492
    .line 493
    invoke-virtual {v0, v4}, Ll/afm;->d(Ljava/lang/String;)Z

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    if-eqz v0, :cond_7

    .line 498
    .line 499
    :cond_6
    sget v0, Ll/eec0;->g:I

    .line 500
    .line 501
    invoke-virtual {p1, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    sget v1, Ll/scc0;->z:I

    .line 506
    .line 507
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    check-cast v1, Landroid/widget/TextView;

    .line 512
    .line 513
    sget v2, Ll/scc0;->y:I

    .line 514
    .line 515
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 516
    .line 517
    .line 518
    move-result-object v2

    .line 519
    check-cast v2, Landroid/widget/TextView;

    .line 520
    .line 521
    sget v6, Ll/scc0;->t:I

    .line 522
    .line 523
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 524
    .line 525
    .line 526
    move-result-object v6

    .line 527
    check-cast v6, Landroid/widget/ImageView;

    .line 528
    .line 529
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 530
    .line 531
    .line 532
    move-result-object v7

    .line 533
    sget v8, Ll/zac0;->c:I

    .line 534
    .line 535
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 536
    .line 537
    .line 538
    move-result-object v7

    .line 539
    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 540
    .line 541
    .line 542
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 543
    .line 544
    .line 545
    move-result-object v6

    .line 546
    sget v7, Lcom/idv/identity/base/R$string;->c:I

    .line 547
    .line 548
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v6

    .line 552
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 556
    .line 557
    .line 558
    move-result-object v6

    .line 559
    sget v7, Lcom/idv/identity/base/R$string;->c:I

    .line 560
    .line 561
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 562
    .line 563
    .line 564
    move-result-object v6

    .line 565
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 566
    .line 567
    .line 568
    invoke-direct {p0, v1, v2}, Lcom/idv/identity/platform/CardGuideActivity;->j1(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 569
    .line 570
    .line 571
    iget-object v1, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 572
    .line 573
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 574
    .line 575
    .line 576
    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 577
    .line 578
    if-eqz v0, :cond_9

    .line 579
    .line 580
    invoke-virtual {v0}, Ll/afm;->t()Ljava/util/List;

    .line 581
    .line 582
    .line 583
    move-result-object v0

    .line 584
    if-eqz v0, :cond_9

    .line 585
    .line 586
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 587
    .line 588
    invoke-virtual {v0, v5}, Ll/afm;->d(Ljava/lang/String;)Z

    .line 589
    .line 590
    .line 591
    move-result v0

    .line 592
    if-nez v0, :cond_8

    .line 593
    .line 594
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->m:Ll/afm;

    .line 595
    .line 596
    invoke-virtual {v0, v4}, Ll/afm;->d(Ljava/lang/String;)Z

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    if-eqz v0, :cond_9

    .line 601
    .line 602
    :cond_8
    sget v0, Ll/eec0;->g:I

    .line 603
    .line 604
    invoke-virtual {p1, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    sget v0, Ll/scc0;->z:I

    .line 609
    .line 610
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 611
    .line 612
    .line 613
    move-result-object v0

    .line 614
    check-cast v0, Landroid/widget/TextView;

    .line 615
    .line 616
    sget v1, Ll/scc0;->y:I

    .line 617
    .line 618
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 619
    .line 620
    .line 621
    move-result-object v1

    .line 622
    check-cast v1, Landroid/widget/TextView;

    .line 623
    .line 624
    sget v2, Ll/scc0;->t:I

    .line 625
    .line 626
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 627
    .line 628
    .line 629
    move-result-object v2

    .line 630
    check-cast v2, Landroid/widget/ImageView;

    .line 631
    .line 632
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 633
    .line 634
    .line 635
    move-result-object v3

    .line 636
    sget v4, Ll/zac0;->c:I

    .line 637
    .line 638
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 639
    .line 640
    .line 641
    move-result-object v3

    .line 642
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 643
    .line 644
    .line 645
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 646
    .line 647
    .line 648
    move-result-object v2

    .line 649
    sget v3, Lcom/idv/identity/base/R$string;->c:I

    .line 650
    .line 651
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 652
    .line 653
    .line 654
    move-result-object v2

    .line 655
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 656
    .line 657
    .line 658
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 659
    .line 660
    .line 661
    move-result-object v2

    .line 662
    sget v3, Lcom/idv/identity/base/R$string;->b:I

    .line 663
    .line 664
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object v2

    .line 668
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 669
    .line 670
    .line 671
    invoke-direct {p0, v0, v1}, Lcom/idv/identity/platform/CardGuideActivity;->j1(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 672
    .line 673
    .line 674
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 675
    .line 676
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 677
    .line 678
    .line 679
    :cond_9
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->e:Ljava/util/List;

    .line 680
    .line 681
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 682
    .line 683
    .line 684
    new-instance p1, Lcom/idv/identity/platform/CardGuideActivity$g;

    .line 685
    .line 686
    invoke-direct {p1, p0}, Lcom/idv/identity/platform/CardGuideActivity$g;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 687
    .line 688
    .line 689
    iput-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->f:Ll/cf60;

    .line 690
    .line 691
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->c:Landroidx/viewpager/widget/ViewPager;

    .line 692
    .line 693
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 694
    .line 695
    .line 696
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->d:Lcom/idv/identity/platform/widget/IndicatorView;

    .line 697
    .line 698
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity;->f:Ll/cf60;

    .line 699
    .line 700
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 701
    .line 702
    .line 703
    move-result v0

    .line 704
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/widget/IndicatorView;->setIndicatorItemCount(I)V

    .line 705
    .line 706
    .line 707
    iget-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity;->c:Landroidx/viewpager/widget/ViewPager;

    .line 708
    .line 709
    new-instance v0, Lcom/idv/identity/platform/CardGuideActivity$h;

    .line 710
    .line 711
    invoke-direct {v0, p0}, Lcom/idv/identity/platform/CardGuideActivity$h;-><init>(Lcom/idv/identity/platform/CardGuideActivity;)V

    .line 712
    .line 713
    .line 714
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 715
    .line 716
    .line 717
    return-void
.end method

.method public onDestroy()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iget-wide v2, p0, Lcom/idv/identity/platform/CardGuideActivity;->l:J

    .line 9
    .line 10
    sub-long/2addr v0, v2

    .line 11
    long-to-double v0, v0

    .line 12
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    div-double/2addr v0, v2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    return-void
.end method
