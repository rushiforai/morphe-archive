.class public Ll/b3y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/w2y;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VPager;

.field public b:Lv/VCheckCircle;

.field public c:Ll/w2y;

.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/u2y;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

.field public i:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;)V
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
    iput-object v0, p0, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/b3y;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b3y;->q()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/b3y;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b3y;->p()V

    return-void
.end method

.method public static synthetic c(Ll/b3y;Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b3y;->n(Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/b3y;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b3y;->m(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/b3y;)Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/b3y;)Ll/w2y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b3y;->c:Ll/w2y;

    return-object p0
.end method

.method private s()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b3y;->g:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b3y;->f:Lv/VText;

    .line 4
    .line 5
    iget-object v2, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 6
    .line 7
    iget-object p0, p0, Ll/b3y;->c:Ll/w2y;

    .line 8
    .line 9
    iget-object p0, p0, Ll/w2y;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-static {v0, v1, v2, p0, v3}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->q2(Landroid/view/View;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;Ljava/util/List;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c3y;->b(Ll/b3y;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w2y;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b3y;->j(Ll/w2y;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b3y;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/b3y;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->statusBarColor()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/b3y;->i:I

    .line 10
    .line 11
    iget-object v0, p0, Ll/b3y;->a:Lv/VPager;

    .line 12
    .line 13
    const/high16 v1, 0x41000000    # 8.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/b3y;->c:Ll/w2y;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/w2y;->g0()Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 31
    .line 32
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Li:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/b3y;->b:Lv/VCheckCircle;

    .line 38
    .line 39
    const/4 v1, 0x4

    .line 40
    invoke-virtual {v0, v1}, Lv/VCheckCircle;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v0, p0, Ll/b3y;->b:Lv/VCheckCircle;

    .line 45
    .line 46
    const/16 v1, 0x28

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lv/VCheckCircle;->setSize(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/b3y;->b:Lv/VCheckCircle;

    .line 52
    .line 53
    new-instance v1, Ll/a3y;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/a3y;-><init>(Ll/b3y;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    new-instance v0, Ll/b3y$a;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/b3y$a;-><init>(Ll/b3y;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/b3y;->a:Lv/VPager;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/u2y;

    .line 72
    .line 73
    iget-object v2, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 74
    .line 75
    iget-object v3, p0, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {v1, v2, v3}, Ll/u2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;Ljava/util/ArrayList;)V

    .line 78
    .line 79
    .line 80
    iput-object v1, p0, Ll/b3y;->e:Ll/u2y;

    .line 81
    .line 82
    iget-object v2, p0, Ll/b3y;->a:Lv/VPager;

    .line 83
    .line 84
    invoke-virtual {v2, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 88
    .line 89
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;->c:I

    .line 90
    .line 91
    if-lez v1, :cond_1

    .line 92
    .line 93
    iget-object p0, p0, Ll/b3y;->a:Lv/VPager;

    .line 94
    .line 95
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    const/4 p0, 0x0

    .line 100
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager$m;->onPageSelected(I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public j(Ll/w2y;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b3y;->c:Ll/w2y;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method public l(Landroid/view/Menu;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget v0, Ll/adc0;->f3:I

    .line 2
    .line 3
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/b3y;->g:Landroid/view/View;

    .line 12
    .line 13
    sget v0, Ll/adc0;->p8:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lv/VText;

    .line 20
    .line 21
    iput-object p1, p0, Ll/b3y;->f:Lv/VText;

    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Tn:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->k:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object p1, p0, Ll/b3y;->h:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getAppTheme()Ll/ux0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v0, p0, Ll/b3y;->f:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/ux0;->j(Landroid/widget/TextView;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/b3y;->g:Landroid/view/View;

    .line 48
    .line 49
    new-instance v0, Ll/x2y;

    .line 50
    .line 51
    invoke-direct {v0, p0, p2}, Ll/x2y;-><init>(Ll/b3y;Ljava/util/ArrayList;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/b3y;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance p2, Ll/y2y;

    .line 62
    .line 63
    invoke-direct {p2, p0}, Ll/y2y;-><init>(Ll/b3y;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/b3y;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const p2, 0x1020002

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance p2, Ll/z2y;

    .line 81
    .line 82
    invoke-direct {p2, p0}, Ll/z2y;-><init>(Ll/b3y;)V

    .line 83
    .line 84
    .line 85
    invoke-static {p1, p2}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/b3y;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pendChangeActionButtonTypeface()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v0, p0, Ll/b3y;->a:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    iget-object v0, p0, Ll/b3y;->b:Lv/VCheckCircle;

    .line 16
    .line 17
    invoke-virtual {v0}, Lv/VCheckCircle;->d()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, p1, v0}, Ll/b3y;->u(Lcom/p1/mobile/putong/data/Media;Z)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/b3y;->b:Lv/VCheckCircle;

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Lv/VCheckCircle;->e(ZZ)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0, p1, v1}, Ll/b3y;->u(Lcom/p1/mobile/putong/data/Media;Z)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Ll/b3y;->b:Lv/VCheckCircle;

    .line 44
    .line 45
    invoke-virtual {p1, v1, v1}, Lv/VCheckCircle;->e(ZZ)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll/b3y;->s()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic n(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p2, "vivo"

    .line 2
    .line 3
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const-string p2, "vivo X7"

    .line 13
    .line 14
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Ll/b3y;->a:Lv/VPager;

    .line 23
    .line 24
    iget-object v1, p0, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    instance-of v1, p2, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 43
    .line 44
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->x(Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    new-instance p2, Landroid/content/Intent;

    .line 48
    .line 49
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v1, "selectedImages"

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/b3y;->d:Ljava/util/ArrayList;

    .line 68
    .line 69
    iget-object v2, p0, Ll/b3y;->a:Lv/VPager;

    .line 70
    .line 71
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 80
    .line 81
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    :goto_1
    const-string p1, "isDone"

    .line 93
    .line 94
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/b3y;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    const/4 v0, -0x1

    .line 102
    invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/b3y;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final synthetic p()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b3y;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b3y;->s()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 5
    .line 6
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/data/Media;Z)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b3y;->c:Ll/w2y;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w2y;->g0()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/b3y;->c:Ll/w2y;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/w2y;->f0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->r2(Lcom/p1/mobile/putong/data/Media;ZLjava/util/ArrayList;I)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Ll/b3y;->s()V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
