.class public Ll/c6h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u5h;
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/u5h<",
        "Ll/jhk;",
        ">;",
        "Landroidx/viewpager/widget/ViewPager$j;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ll/jhk;

.field public d:Ll/g7h;

.field public e:Ll/e6h;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/o7h;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/okh;

.field public h:Ljava/lang/String;

.field public i:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;Lcom/p1/mobile/android/app/Act;)V
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
    iput-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 12
    .line 13
    iput-object p2, p0, Ll/c6h;->b:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    new-instance p1, Ll/n7h;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ll/n7h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/c6h;->d:Ll/g7h;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/c6h;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c6h;->t()V

    return-void
.end method

.method public static synthetic b(Ll/c6h;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c6h;->v()V

    return-void
.end method

.method public static synthetic c(Ll/c6h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c6h;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/c6h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c6h;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/c6h;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c6h;->w()V

    return-void
.end method

.method public static synthetic f(Ll/c6h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c6h;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/c6h;Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c6h;->u(Lcom/google/android/material/appbar/AppBarLayout;I)V

    return-void
.end method

.method public static bridge synthetic p(Ll/c6h;)Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/c6h;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c6h;->F(I)V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->v:Lcom/google/android/material/tabs/TabLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabMode(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->v:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    sget v2, Ll/k9c0;->n0:I

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->v:Lcom/google/android/material/tabs/TabLayout;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabGravity(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/c6h;->F(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->v:Lcom/google/android/material/tabs/TabLayout;

    .line 31
    .line 32
    new-instance v1, Ll/c6h$b;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/c6h$b;-><init>(Ll/c6h;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-boolean p1, v0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->e:Landroid/widget/TextView;

    .line 14
    .line 15
    const-string v0, "\u5df2\u52a0\u5165"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    const-string v0, "#80000000"

    .line 25
    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->e:Landroid/widget/TextView;

    .line 36
    .line 37
    sget p1, Ll/lbc0;->r1:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->e:Landroid/widget/TextView;

    .line 44
    .line 45
    const-string v0, "\u52a0\u5165"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->e:Landroid/widget/TextView;

    .line 53
    .line 54
    iget-object v0, p0, Ll/c6h;->b:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget v1, Ll/k9c0;->p0:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->e:Landroid/widget/TextView;

    .line 72
    .line 73
    sget p1, Ll/lbc0;->d1:I

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public B()V
    .locals 8

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jhk;->c()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x2

    .line 18
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    new-array v2, v1, [I

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    move v4, v3

    .line 26
    :goto_0
    if-ge v4, v1, :cond_1

    .line 27
    .line 28
    if-nez v4, :cond_0

    .line 29
    .line 30
    new-instance v5, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v6, ""

    .line 33
    .line 34
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v6, "#33"

    .line 38
    .line 39
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    check-cast v6, Ljava/lang/String;

    .line 47
    .line 48
    const/4 v7, 0x1

    .line 49
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    aput v5, v2, v4

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_0
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    check-cast v5, Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    aput v5, v2, v4

    .line 78
    .line 79
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 83
    .line 84
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 94
    .line 95
    .line 96
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->b:Landroid/view/View;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void

    .line 109
    :catch_0
    move-exception p0

    .line 110
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public C(Ll/jhk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c6h;->c:Ll/jhk;

    .line 2
    .line 3
    return-void
.end method

.method public D(Ll/okh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c6h;->g:Ll/okh;

    .line 2
    .line 3
    return-void
.end method

.method public E(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c6h;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final F(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->v:Lcom/google/android/material/tabs/TabLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-static {p1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public i()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->i:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-object v1, p0, Ll/c6h;->c:Ll/jhk;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/jhk;->i()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->d:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/c6h;->c:Ll/jhk;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/jhk;->i()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/jhk;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 38
    .line 39
    const/16 v2, 0x8

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->j:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->j:Landroid/widget/TextView;

    .line 50
    .line 51
    iget-object v1, p0, Ll/c6h;->c:Ll/jhk;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/jhk;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_7

    .line 71
    .line 72
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/jhk;->k()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/jhk;->l()Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Ll/c6h;->c:Ll/jhk;

    .line 87
    .line 88
    invoke-virtual {v1}, Ll/jhk;->c()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const/4 v3, 0x2

    .line 93
    if-eqz v1, :cond_1

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    const/4 v5, 0x3

    .line 100
    if-lt v4, v5, :cond_1

    .line 101
    .line 102
    :try_start_0
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    goto :goto_1

    .line 113
    :catch_0
    move-exception v1

    .line 114
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 118
    .line 119
    .line 120
    :cond_1
    const/4 v1, -0x1

    .line 121
    :goto_1
    const/4 v4, 0x0

    .line 122
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-ge v4, v5, :cond_5

    .line 127
    .line 128
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    check-cast v5, Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    if-eqz v4, :cond_4

    .line 135
    .line 136
    const/4 v6, 0x1

    .line 137
    if-eq v4, v6, :cond_3

    .line 138
    .line 139
    if-eq v4, v3, :cond_2

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_2
    iget-object v6, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 143
    .line 144
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->l:Landroid/widget/FrameLayout;

    .line 145
    .line 146
    invoke-virtual {p0, v1, v6}, Ll/c6h;->z(ILandroid/view/View;)V

    .line 147
    .line 148
    .line 149
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    .line 150
    .line 151
    iget-object v7, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 152
    .line 153
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->m:Lv/VDraweeView;

    .line 154
    .line 155
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    invoke-virtual {v6, v7, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 164
    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_3
    iget-object v6, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 168
    .line 169
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->n:Landroid/widget/FrameLayout;

    .line 170
    .line 171
    invoke-virtual {p0, v1, v6}, Ll/c6h;->z(ILandroid/view/View;)V

    .line 172
    .line 173
    .line 174
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    .line 175
    .line 176
    iget-object v7, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 177
    .line 178
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->o:Lv/VDraweeView;

    .line 179
    .line 180
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-virtual {v6, v7, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 189
    .line 190
    .line 191
    goto :goto_3

    .line 192
    :cond_4
    iget-object v6, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 193
    .line 194
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->p:Landroid/widget/FrameLayout;

    .line 195
    .line 196
    invoke-virtual {p0, v1, v6}, Ll/c6h;->z(ILandroid/view/View;)V

    .line 197
    .line 198
    .line 199
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    .line 200
    .line 201
    iget-object v7, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 202
    .line 203
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->q:Lv/VDraweeView;

    .line 204
    .line 205
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    invoke-virtual {v6, v7, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 214
    .line 215
    .line 216
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_5
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 220
    .line 221
    invoke-virtual {v0}, Ll/jhk;->j()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    iget-object v3, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 230
    .line 231
    if-eqz v1, :cond_6

    .line 232
    .line 233
    iget-object v0, v3, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->r:Landroid/widget/TextView;

    .line 234
    .line 235
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 236
    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_6
    iget-object v1, v3, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->r:Landroid/widget/TextView;

    .line 240
    .line 241
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_7
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 246
    .line 247
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->k:Landroid/widget/LinearLayout;

    .line 248
    .line 249
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 250
    .line 251
    .line 252
    :goto_4
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 253
    .line 254
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->g:Lcom/google/android/material/appbar/AppBarLayout;

    .line 255
    .line 256
    new-instance v1, Ll/v5h;

    .line 257
    .line 258
    invoke-direct {v1, p0}, Ll/v5h;-><init>(Ll/c6h;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->addOnOffsetChangedListener(Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;)V

    .line 262
    .line 263
    .line 264
    return-void
.end method

.method public j()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Ll/c8h;

    .line 9
    .line 10
    iget-object v2, p0, Ll/c6h;->c:Ll/jhk;

    .line 11
    .line 12
    invoke-virtual {v2}, Ll/jhk;->e()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, Ll/c6h;->c:Ll/jhk;

    .line 17
    .line 18
    invoke-virtual {v3}, Ll/jhk;->f()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget-object v4, p0, Ll/c6h;->h:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {v1, v2, v3, v4}, Ll/c8h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 31
    .line 32
    new-instance v1, Ll/p7h;

    .line 33
    .line 34
    iget-object v2, p0, Ll/c6h;->c:Ll/jhk;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/jhk;->e()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Ll/c6h;->c:Ll/jhk;

    .line 41
    .line 42
    invoke-virtual {v3}, Ll/jhk;->f()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-direct {v1, v2, v3}, Ll/p7h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/cmg;->O()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    :cond_0
    iget-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 71
    .line 72
    new-instance v1, Ll/f7h;

    .line 73
    .line 74
    iget-object v2, p0, Ll/c6h;->c:Ll/jhk;

    .line 75
    .line 76
    invoke-virtual {v2}, Ll/jhk;->e()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-direct {v1, v2}, Ll/f7h;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_1
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/jhk;->h()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_2

    .line 97
    .line 98
    iget-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 99
    .line 100
    new-instance v1, Ll/l8h;

    .line 101
    .line 102
    iget-object v2, p0, Ll/c6h;->c:Ll/jhk;

    .line 103
    .line 104
    invoke-virtual {v2}, Ll/jhk;->h()Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-direct {v1, v2}, Ll/l8h;-><init>(Ljava/util/List;)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    :cond_2
    invoke-static {}, Ll/cmg;->O()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 121
    .line 122
    invoke-virtual {v0}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_3

    .line 131
    .line 132
    iget-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 133
    .line 134
    new-instance v1, Ll/kvg;

    .line 135
    .line 136
    iget-object v2, p0, Ll/c6h;->c:Ll/jhk;

    .line 137
    .line 138
    invoke-virtual {v2}, Ll/jhk;->e()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iget-object v3, p0, Ll/c6h;->c:Ll/jhk;

    .line 143
    .line 144
    invoke-virtual {v3}, Ll/jhk;->b()Lcom/p1/mobile/putong/feed/data/Group;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v4, p0, Ll/c6h;->c:Ll/jhk;

    .line 151
    .line 152
    invoke-virtual {v4}, Ll/jhk;->f()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-direct {v1, v2, v3, v4}, Ll/kvg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    :cond_3
    new-instance v0, Ll/e6h;

    .line 163
    .line 164
    iget-object v1, p0, Ll/c6h;->b:Lcom/p1/mobile/android/app/Act;

    .line 165
    .line 166
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iget-object v2, p0, Ll/c6h;->b:Lcom/p1/mobile/android/app/Act;

    .line 171
    .line 172
    iget-object v3, p0, Ll/c6h;->f:Ljava/util/List;

    .line 173
    .line 174
    invoke-direct {v0, v1, v2, v3}, Ll/e6h;-><init>(Landroidx/fragment/app/FragmentManager;Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 175
    .line 176
    .line 177
    iput-object v0, p0, Ll/c6h;->e:Ll/e6h;

    .line 178
    .line 179
    iget-object v1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 180
    .line 181
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->w:Landroidx/viewpager/widget/ViewPager;

    .line 182
    .line 183
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 187
    .line 188
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->w:Landroidx/viewpager/widget/ViewPager;

    .line 189
    .line 190
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 194
    .line 195
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->v:Lcom/google/android/material/tabs/TabLayout;

    .line 196
    .line 197
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->w:Landroidx/viewpager/widget/ViewPager;

    .line 198
    .line 199
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 200
    .line 201
    .line 202
    invoke-direct {p0}, Ll/c6h;->r()V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Ll/c6h;->g:Ll/okh;

    .line 206
    .line 207
    if-eqz v0, :cond_4

    .line 208
    .line 209
    new-instance v1, Ljava/util/ArrayList;

    .line 210
    .line 211
    iget-object v2, p0, Ll/c6h;->f:Ljava/util/List;

    .line 212
    .line 213
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 214
    .line 215
    .line 216
    iget-object v2, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 217
    .line 218
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->w:Landroidx/viewpager/widget/ViewPager;

    .line 219
    .line 220
    invoke-interface {v0, v1, v2}, Ll/okh;->a(Ljava/util/List;Landroidx/viewpager/widget/ViewPager;)V

    .line 221
    .line 222
    .line 223
    :cond_4
    const/4 v0, 0x0

    .line 224
    invoke-virtual {p0, v0}, Ll/c6h;->onPageSelected(I)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->e:Landroid/widget/TextView;

    .line 4
    .line 5
    new-instance v1, Ll/w5h;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/w5h;-><init>(Ll/c6h;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/jhk;->m()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Ll/c6h;->A(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->x:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    new-instance v1, Ll/x5h;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/x5h;-><init>(Ll/c6h;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c6h;->c:Ll/jhk;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jhk;->g()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->u:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->t:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->t:Landroid/widget/TextView;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->u:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;

    .line 44
    .line 45
    iget-object v1, p0, Ll/c6h;->b:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->u:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/c6h;->c:Ll/jhk;

    .line 58
    .line 59
    invoke-virtual {v1}, Ll/jhk;->g()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->f(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->getmAdapter()Ll/l9j0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/c6h$a;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/c6h$a;-><init>(Ll/c6h;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/kic0;->E(Ll/h80;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public o()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->c:Landroid/widget/TextView;

    .line 4
    .line 5
    new-instance v1, Ll/y5h;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/y5h;-><init>(Ll/c6h;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->h:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    new-instance v1, Ll/z5h;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/z5h;-><init>(Ll/c6h;)V

    .line 20
    .line 21
    .line 22
    const-wide/16 v2, 0x12c

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 28
    .line 29
    iget-object v1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->a:Lv/VDraweeView;

    .line 32
    .line 33
    iget-object v2, p0, Ll/c6h;->c:Ll/jhk;

    .line 34
    .line 35
    invoke-virtual {v2}, Ll/jhk;->d()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->w:Landroidx/viewpager/widget/ViewPager;

    .line 45
    .line 46
    invoke-static {}, Ll/bnl0;->w0()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/c6h;->B()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/c6h;->i:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-le v0, p1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/o7h;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/o7h;->d()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->x:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ll/o7h;

    .line 40
    .line 41
    invoke-interface {p0}, Ll/o7h;->e()Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->getValue()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "circle_detail_tab"

    .line 50
    .line 51
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    filled-new-array {p0}, [Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "e_moment_post"

    .line 60
    .line 61
    const-string v0, "p_circle_detail"

    .line 62
    .line 63
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->x:Landroid/widget/LinearLayout;

    .line 68
    .line 69
    const/16 p1, 0x8

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c6h;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic t()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->f:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 10
    .line 11
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->a:Lv/VDraweeView;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->h:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/2addr v1, v0

    .line 20
    invoke-static {v2, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->b:Landroid/view/View;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->h:Landroid/widget/RelativeLayout;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/2addr p0, v0

    .line 34
    invoke-static {v1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic u(Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    neg-int p1, p2

    .line 2
    const/high16 p2, 0x42300000    # 44.0f

    .line 3
    .line 4
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget-object p0, p0, Ll/c6h;->a:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;

    .line 9
    .line 10
    if-lt p1, p2, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->d:Landroid/widget/TextView;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/actRender/FeedGroupDetailViewHolder;->d:Landroid/widget/TextView;

    .line 20
    .line 21
    const/16 p1, 0x8

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic v()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/c6h;->A(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic w()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/c6h;->A(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_circle_join"

    .line 2
    .line 3
    const-string v0, "p_circle_detail"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/c6h;->c:Ll/jhk;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/jhk;->m()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object v0, p0, Ll/c6h;->d:Ll/g7h;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/c6h;->c:Ll/jhk;

    .line 19
    .line 20
    new-instance v1, Ll/a6h;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/a6h;-><init>(Ll/c6h;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, p1, v1}, Ll/g7h;->b(Ll/jhk;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Ll/c6h;->c:Ll/jhk;

    .line 30
    .line 31
    new-instance v1, Ll/b6h;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/b6h;-><init>(Ll/c6h;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, p1, v1}, Ll/g7h;->a(Ll/jhk;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "album_post_source"

    .line 2
    .line 3
    const-string v0, "circle_detail"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/c6h;->f:Ljava/util/List;

    .line 10
    .line 11
    iget v1, p0, Ll/c6h;->i:I

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/o7h;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/o7h;->e()Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/FeedGroupTab;->getValue()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "circle_detail_tab"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "e_moment_post"

    .line 38
    .line 39
    const-string v1, "p_circle_detail"

    .line 40
    .line 41
    invoke-static {v0, v1, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/c6h;->b:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/cmg;->O()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, 0x0

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    new-instance v1, Ljava/util/ArrayList;

    .line 59
    .line 60
    iget-object v3, p0, Ll/c6h;->c:Ll/jhk;

    .line 61
    .line 62
    invoke-virtual {v3}, Ll/jhk;->g()Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    new-array v1, v2, [Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 71
    .line 72
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->e(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "nearby"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object p0, p0, Ll/c6h;->c:Ll/jhk;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/jhk;->e()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    new-array v0, v2, [Lcom/p1/mobile/putong/data/Media;

    .line 97
    .line 98
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->f(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p1, p0}, Ll/cn40;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final z(ILandroid/view/View;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/drawable/ShapeDrawable;

    .line 2
    .line 3
    new-instance v0, Landroid/graphics/drawable/shapes/OvalShape;

    .line 4
    .line 5
    invoke-direct {v0}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-virtual {p2, p0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
