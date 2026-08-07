.class public Ll/joh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/foh;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public c:Lcom/google/android/material/appbar/AppBarLayout;

.field public d:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

.field public e:Landroidx/appcompat/widget/Toolbar;

.field public f:Lv/VImage;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VRelative;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VImage;

.field public k:Lv/VLinear;

.field public l:Landroid/widget/TextView;

.field public m:Lv/VLinear_FillerMeasure;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VLine;

.field public p:Landroid/widget/FrameLayout;

.field public q:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;

.field public r:Ll/foh;

.field public s:Ll/wh80;

.field public t:I

.field public u:I

.field public v:I

.field public w:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

.field public x:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x42300000    # 44.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/joh;->t:I

    .line 11
    .line 12
    new-instance v0, Ll/ioh;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/ioh;-><init>(Ll/joh;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/joh;->w:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    .line 18
    .line 19
    new-instance v0, Ll/joh$a;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/joh$a;-><init>(Ll/joh;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/joh;->x:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 25
    .line 26
    iput-object p1, p0, Ll/joh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Ll/joh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/joh;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/joh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/joh;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/joh;Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/joh;->n(Lcom/google/android/material/appbar/AppBarLayout;I)V

    return-void
.end method

.method public static bridge synthetic d(Ll/joh;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/joh;->v:I

    return p0
.end method

.method public static bridge synthetic e(Ll/joh;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/joh;->v:I

    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/joh;->act()Lcom/p1/mobile/android/app/Act;

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

.method private synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/joh;->r:Ll/foh;

    .line 4
    .line 5
    iget-object p0, p0, Ll/foh;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    new-instance p1, Ll/pf60;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "poiname"

    .line 32
    .line 33
    invoke-direct {p1, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    filled-new-array {p1}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "e_poi_nearby"

    .line 41
    .line 42
    const-string v0, "p_poi_detail"

    .line 43
    .line 44
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    new-instance v0, Ll/wh80;

    .line 2
    .line 3
    iget-object v1, p0, Ll/joh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/wh80;-><init>(Lcom/p1/mobile/android/app/Act;Ll/joh;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/joh;->s:Ll/wh80;

    .line 9
    .line 10
    iget-object v0, p0, Ll/joh;->f:Lv/VImage;

    .line 11
    .line 12
    new-instance v1, Ll/goh;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/goh;-><init>(Ll/joh;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/joh;->e:Landroidx/appcompat/widget/Toolbar;

    .line 21
    .line 22
    const-string v1, ""

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/joh;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/joh;->e:Landroidx/appcompat/widget/Toolbar;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 34
    .line 35
    .line 36
    const/high16 v0, 0x431b0000    # 155.0f

    .line 37
    .line 38
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget v1, p0, Ll/joh;->t:I

    .line 43
    .line 44
    add-int/2addr v0, v1

    .line 45
    iput v0, p0, Ll/joh;->u:I

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/joh;->s()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/joh;->h:Lv/VRelative;

    .line 51
    .line 52
    iget v1, p0, Ll/joh;->t:I

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/joh;->c:Lcom/google/android/material/appbar/AppBarLayout;

    .line 58
    .line 59
    iget-object v1, p0, Ll/joh;->w:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->addOnOffsetChangedListener(Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/joh;->h:Lv/VRelative;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Ll/joh;->x:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/joh;->q()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/joh;->m:Lv/VLinear_FillerMeasure;

    .line 79
    .line 80
    new-instance v1, Ll/hoh;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/hoh;-><init>(Ll/joh;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/joh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/joh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;

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
    invoke-static {p0, p1, p2}, Ll/koh;->b(Ll/joh;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/foh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/joh;->r:Ll/foh;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/foh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/joh;->i(Ll/foh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/joh;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/joh;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/joh;->r:Ll/foh;

    .line 2
    .line 3
    iget-object p0, p0, Ll/foh;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/joh;->s:Ll/wh80;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/wh80;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n(Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 2

    .line 1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-ltz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Ll/joh;->v:I

    .line 11
    .line 12
    if-lt v0, v1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    mul-float/2addr v0, p1

    .line 22
    iget v1, p0, Ll/joh;->v:I

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    div-float/2addr v0, v1

    .line 26
    sub-float/2addr p1, v0

    .line 27
    :goto_0
    iget-object v0, p0, Ll/joh;->h:Lv/VRelative;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Ll/joh;->h:Lv/VRelative;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/joh;->g:Landroid/widget/TextView;

    .line 41
    .line 42
    iget v0, p0, Ll/joh;->u:I

    .line 43
    .line 44
    add-int/2addr v0, p2

    .line 45
    iget p0, p0, Ll/joh;->t:I

    .line 46
    .line 47
    if-ne v0, p0, :cond_2

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const/4 p0, 0x0

    .line 52
    :goto_1
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_3
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/feed/data/PoiLocation;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/joh;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/PoiLocation;->count:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "\u9644\u8fd1%d\u4eba\u6765\u8fc7"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Ll/joh;->r:Ll/foh;

    .line 4
    .line 5
    iget-object v1, v1, Ll/foh;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v2, p0, Ll/joh;->g:Landroid/widget/TextView;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/joh;->l:Landroid/widget/TextView;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/joh;->c:Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    iget v1, p0, Ll/joh;->u:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/joh;->d:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    .line 9
    .line 10
    iget p0, p0, Ll/joh;->u:I

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
