.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public final h:I

.field public final i:I

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Lcom/p1/mobile/putong/core/data/MyTabTask;

.field public l:Z

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "#EDEDED"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->h:I

    .line 11
    .line 12
    const-string p1, "#f7f7f7"

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i:I

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l:Z

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    const-string p1, "#EDEDED"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->h:I

    .line 26
    const-string p1, "#f7f7f7"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i:I

    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    const-string p1, "#EDEDED"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->h:I

    .line 30
    const-string p1, "#f7f7f7"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i:I

    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i(Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Ljava/util/List;ZLandroid/view/View;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j(Ljava/util/List;ZLandroid/view/View;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->A7()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jn5;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(Lv/VLinear;Ljava/util/List;Ljava/lang/CharSequence;I)Lv/VLinear;
    .locals 9
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VLinear;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/CharSequence;",
            "I)",
            "Lv/VLinear;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->m:I

    .line 5
    .line 6
    sget v1, Ll/qa00;->i:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 9
    .line 10
    .line 11
    sget v5, Ll/qa00;->o:I

    .line 12
    .line 13
    sget v6, Ll/qa00;->g:I

    .line 14
    .line 15
    sget v7, Ll/qa00;->a:I

    .line 16
    .line 17
    move-object v2, p0

    .line 18
    move-object v4, p1

    .line 19
    move-object v3, p2

    .line 20
    move v8, p4

    .line 21
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->h(Ljava/util/List;Landroid/view/ViewGroup;IIII)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 25
    .line 26
    iget-object p1, v2, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    const/high16 p1, 0x41600000    # 14.0f

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 34
    .line 35
    .line 36
    iget-object p1, v2, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {}, Ll/gra;->z()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_0

    .line 47
    .line 48
    sget p2, Ll/c9c0;->x:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    sget p2, Ll/c9c0;->p:I

    .line 52
    .line 53
    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 64
    .line 65
    const/4 p2, -0x2

    .line 66
    invoke-direct {p1, p2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 67
    .line 68
    .line 69
    iput v6, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 70
    .line 71
    sget p2, Ll/qa00;->c:I

    .line 72
    .line 73
    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 74
    .line 75
    invoke-virtual {v4, p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    return-object v4
.end method

.method public g(Ljava/util/List;Landroid/view/ViewGroup;I)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/view/ViewGroup;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "res"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    move v8, v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v8, p3

    .line 26
    :goto_0
    sget v5, Ll/qa00;->A:I

    .line 27
    .line 28
    sget v6, Ll/qa00;->m:I

    .line 29
    .line 30
    sget v7, Ll/qa00;->c:I

    .line 31
    .line 32
    move-object v2, p0

    .line 33
    move-object v3, p1

    .line 34
    move-object v4, p2

    .line 35
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->h(Ljava/util/List;Landroid/view/ViewGroup;IIII)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final h(Ljava/util/List;Landroid/view/ViewGroup;IIII)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/view/ViewGroup;",
            "IIII)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 25
    .line 26
    invoke-direct {v2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ll/wlj;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 40
    .line 41
    .line 42
    if-eqz p6, :cond_0

    .line 43
    .line 44
    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    .line 45
    .line 46
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 47
    .line 48
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-direct {v2, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p5, p5, p5, p5}, Landroid/view/View;->setPadding(IIII)V

    .line 65
    .line 66
    .line 67
    :cond_0
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 68
    .line 69
    invoke-direct {v2, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-lez v3, :cond_1

    .line 77
    .line 78
    neg-int v3, p4

    .line 79
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 80
    .line 81
    :cond_1
    invoke-virtual {p2, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    .line 83
    .line 84
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 85
    .line 86
    invoke-virtual {v2, v1, v0, p3, p3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;ZLandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p4, v0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    const/4 p4, 0x1

    .line 15
    invoke-virtual {p0, p2, p1, p3, p4}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->m(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;Lcom/p1/mobile/putong/core/data/MyTabTask;ZZ)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->q()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic j(Ljava/util/List;ZLandroid/view/View;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    instance-of v0, p3, Lv/VLinear;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    rem-int/2addr p4, v0

    .line 14
    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 19
    .line 20
    check-cast p3, Lv/VLinear;

    .line 21
    .line 22
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->text:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->h:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i:I

    .line 32
    .line 33
    :goto_0
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->f(Lv/VLinear;Ljava/util/List;Ljava/lang/CharSequence;I)Lv/VLinear;

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;Lcom/p1/mobile/putong/core/data/MyTabTask;Z)V
    .locals 10
    .param p1    # Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->k:Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    sget v1, Ll/dbc0;->Rf:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v1, Ll/dbc0;->Sf:I

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "verification"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v9, 0x0

    .line 28
    const-string v2, "/"

    .line 29
    .line 30
    const-string v3, "res://"

    .line 31
    .line 32
    if-eqz v0, :cond_7

    .line 33
    .line 34
    invoke-static {}, Ll/gra;->z()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    sget v2, Ll/dbc0;->Yf:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    sget v2, Ll/dbc0;->Xf:I

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    :goto_1
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 94
    .line 95
    filled-new-array {v0}, [Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 104
    .line 105
    iget-object v7, v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->text:Ljava/lang/String;

    .line 106
    .line 107
    const-string v0, "#3CB9F0"

    .line 108
    .line 109
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    move-object v2, p0

    .line 114
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 118
    .line 119
    const-string v2, "sendLike"

    .line 120
    .line 121
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_2

    .line 126
    .line 127
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 128
    .line 129
    const-string v2, "receiveLike"

    .line 130
    .line 131
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 138
    .line 139
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_3

    .line 144
    .line 145
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 154
    .line 155
    invoke-virtual {p0, v0, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 156
    .line 157
    .line 158
    goto/16 :goto_2

    .line 159
    .line 160
    :cond_3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 161
    .line 162
    const-string v2, "default"

    .line 163
    .line 164
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_5

    .line 169
    .line 170
    invoke-static {}, Ll/gra;->z()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    const-string v2, "\u70b9\u4eae\u52cb\u7ae0"

    .line 175
    .line 176
    const-string v3, "\u53ea\u770b\u8ba4\u8bc1"

    .line 177
    .line 178
    const-string v4, "\u4f18\u5148\u66dd\u5149"

    .line 179
    .line 180
    const-string v5, "\u66f4\u591a\u53f3\u6ed1"

    .line 181
    .line 182
    if-eqz v0, :cond_4

    .line 183
    .line 184
    sget v0, Ll/dbc0;->eg:I

    .line 185
    .line 186
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    sget v5, Ll/dbc0;->ag:I

    .line 195
    .line 196
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    sget v5, Ll/dbc0;->gg:I

    .line 205
    .line 206
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    sget v5, Ll/dbc0;->cg:I

    .line 215
    .line 216
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    invoke-static {v5, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    filled-new-array {v0, v4, v3, v2}, [Ll/pf60;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->setSubAvatarWithIllustrate(Ljava/util/List;)V

    .line 233
    .line 234
    .line 235
    goto :goto_2

    .line 236
    :cond_4
    sget v0, Ll/dbc0;->dg:I

    .line 237
    .line 238
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    sget v5, Ll/dbc0;->Zf:I

    .line 247
    .line 248
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    sget v5, Ll/dbc0;->fg:I

    .line 257
    .line 258
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 259
    .line 260
    .line 261
    move-result-object v5

    .line 262
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    sget v5, Ll/dbc0;->bg:I

    .line 267
    .line 268
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-static {v5, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    filled-new-array {v0, v4, v3, v2}, [Ll/pf60;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->setSubAvatarWithIllustrate(Ljava/util/List;)V

    .line 285
    .line 286
    .line 287
    goto :goto_2

    .line 288
    :cond_5
    invoke-virtual {p0, v9, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 289
    .line 290
    .line 291
    :cond_6
    :goto_2
    move-object v2, p0

    .line 292
    goto/16 :goto_9

    .line 293
    .line 294
    :cond_7
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 295
    .line 296
    const-string v4, "boost"

    .line 297
    .line 298
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    if-eqz v0, :cond_a

    .line 303
    .line 304
    invoke-static {}, Ll/gra;->z()Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 309
    .line 310
    if-eqz v0, :cond_8

    .line 311
    .line 312
    new-instance v0, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v3

    .line 321
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    sget v2, Ll/dbc0;->If:I

    .line 328
    .line 329
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    goto :goto_3

    .line 337
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 338
    .line 339
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v3

    .line 346
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    sget v2, Ll/dbc0;->Hf:I

    .line 353
    .line 354
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    :goto_3
    new-instance v5, Ljava/util/ArrayList;

    .line 362
    .line 363
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .line 365
    .line 366
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 367
    .line 368
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 369
    .line 370
    .line 371
    move-result v2

    .line 372
    if-nez v2, :cond_9

    .line 373
    .line 374
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 375
    .line 376
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    check-cast v2, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 381
    .line 382
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 383
    .line 384
    invoke-interface {v5, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 385
    .line 386
    .line 387
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    :cond_9
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 391
    .line 392
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 393
    .line 394
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 395
    .line 396
    iget-object v7, v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->text:Ljava/lang/String;

    .line 397
    .line 398
    const-string v0, "#FF6298"

    .line 399
    .line 400
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 401
    .line 402
    .line 403
    move-result v8

    .line 404
    move-object v2, p0

    .line 405
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {p0, v9, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 409
    .line 410
    .line 411
    goto/16 :goto_9

    .line 412
    .line 413
    :cond_a
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 414
    .line 415
    const-string v4, "selection"

    .line 416
    .line 417
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    if-eqz v0, :cond_d

    .line 422
    .line 423
    invoke-static {}, Ll/gra;->z()Z

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 428
    .line 429
    if-eqz v0, :cond_b

    .line 430
    .line 431
    new-instance v0, Ljava/lang/StringBuilder;

    .line 432
    .line 433
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v3

    .line 440
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    sget v2, Ll/dbc0;->Mf:I

    .line 447
    .line 448
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    goto :goto_4

    .line 456
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    .line 457
    .line 458
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 459
    .line 460
    .line 461
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object v3

    .line 465
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    sget v2, Ll/dbc0;->Lf:I

    .line 472
    .line 473
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    :goto_4
    new-instance v5, Ljava/util/ArrayList;

    .line 481
    .line 482
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .line 484
    .line 485
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 486
    .line 487
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 488
    .line 489
    .line 490
    move-result v2

    .line 491
    if-nez v2, :cond_c

    .line 492
    .line 493
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 494
    .line 495
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    check-cast v2, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 500
    .line 501
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 502
    .line 503
    invoke-interface {v5, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 504
    .line 505
    .line 506
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    :cond_c
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 510
    .line 511
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 512
    .line 513
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 514
    .line 515
    iget-object v7, v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->text:Ljava/lang/String;

    .line 516
    .line 517
    const-string v0, "#808CA8"

    .line 518
    .line 519
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 520
    .line 521
    .line 522
    move-result v8

    .line 523
    move-object v2, p0

    .line 524
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 525
    .line 526
    .line 527
    invoke-virtual {p0, v9, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 528
    .line 529
    .line 530
    goto/16 :goto_9

    .line 531
    .line 532
    :cond_d
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 533
    .line 534
    const-string v4, "mbti"

    .line 535
    .line 536
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 537
    .line 538
    .line 539
    move-result v0

    .line 540
    if-eqz v0, :cond_11

    .line 541
    .line 542
    invoke-static {}, Ll/gra;->z()Z

    .line 543
    .line 544
    .line 545
    move-result v0

    .line 546
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 547
    .line 548
    if-eqz v0, :cond_e

    .line 549
    .line 550
    new-instance v0, Ljava/lang/StringBuilder;

    .line 551
    .line 552
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v3

    .line 559
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 560
    .line 561
    .line 562
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    sget v2, Ll/dbc0;->Kf:I

    .line 566
    .line 567
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v0

    .line 574
    goto :goto_5

    .line 575
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 576
    .line 577
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 578
    .line 579
    .line 580
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 581
    .line 582
    .line 583
    move-result-object v3

    .line 584
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    .line 589
    .line 590
    sget v2, Ll/dbc0;->Jf:I

    .line 591
    .line 592
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 596
    .line 597
    .line 598
    move-result-object v0

    .line 599
    :goto_5
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 600
    .line 601
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 602
    .line 603
    filled-new-array {v0}, [Ljava/lang/String;

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 608
    .line 609
    .line 610
    move-result-object v5

    .line 611
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 612
    .line 613
    iget-object v7, v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->text:Ljava/lang/String;

    .line 614
    .line 615
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 616
    .line 617
    .line 618
    move-result-object v0

    .line 619
    invoke-static {}, Ll/gra;->z()Z

    .line 620
    .line 621
    .line 622
    move-result v2

    .line 623
    if-eqz v2, :cond_f

    .line 624
    .line 625
    sget v2, Ll/c9c0;->A:I

    .line 626
    .line 627
    goto :goto_6

    .line 628
    :cond_f
    sget v2, Ll/c9c0;->I:I

    .line 629
    .line 630
    :goto_6
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 631
    .line 632
    .line 633
    move-result v8

    .line 634
    move-object v2, p0

    .line 635
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 636
    .line 637
    .line 638
    invoke-virtual {p0, v9, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 639
    .line 640
    .line 641
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 642
    .line 643
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 644
    .line 645
    .line 646
    move-result v0

    .line 647
    if-nez v0, :cond_10

    .line 648
    .line 649
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 650
    .line 651
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 652
    .line 653
    .line 654
    move-result-object v0

    .line 655
    check-cast v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 656
    .line 657
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 658
    .line 659
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 660
    .line 661
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 662
    .line 663
    .line 664
    move-result-object v2

    .line 665
    check-cast v2, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 666
    .line 667
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->text:Ljava/lang/String;

    .line 668
    .line 669
    invoke-virtual {p0, v0, v2, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->p(Ljava/util/List;Ljava/lang/CharSequence;Z)V

    .line 670
    .line 671
    .line 672
    goto/16 :goto_2

    .line 673
    .line 674
    :cond_10
    invoke-virtual {p0, v9, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 675
    .line 676
    .line 677
    goto/16 :goto_2

    .line 678
    .line 679
    :cond_11
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 680
    .line 681
    const-string v4, "game"

    .line 682
    .line 683
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 684
    .line 685
    .line 686
    move-result v0

    .line 687
    if-eqz v0, :cond_6

    .line 688
    .line 689
    invoke-static {}, Ll/gra;->z()Z

    .line 690
    .line 691
    .line 692
    move-result v0

    .line 693
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 694
    .line 695
    if-eqz v0, :cond_12

    .line 696
    .line 697
    new-instance v0, Ljava/lang/StringBuilder;

    .line 698
    .line 699
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 700
    .line 701
    .line 702
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 703
    .line 704
    .line 705
    move-result-object v3

    .line 706
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 707
    .line 708
    .line 709
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 710
    .line 711
    .line 712
    sget v2, Ll/dbc0;->og:I

    .line 713
    .line 714
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 715
    .line 716
    .line 717
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 718
    .line 719
    .line 720
    move-result-object v0

    .line 721
    goto :goto_7

    .line 722
    :cond_12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 723
    .line 724
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 725
    .line 726
    .line 727
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 728
    .line 729
    .line 730
    move-result-object v3

    .line 731
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    .line 733
    .line 734
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 735
    .line 736
    .line 737
    sget v2, Ll/dbc0;->ng:I

    .line 738
    .line 739
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 740
    .line 741
    .line 742
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 743
    .line 744
    .line 745
    move-result-object v0

    .line 746
    :goto_7
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 747
    .line 748
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->subTitle:Ljava/lang/String;

    .line 749
    .line 750
    filled-new-array {v0}, [Ljava/lang/String;

    .line 751
    .line 752
    .line 753
    move-result-object v0

    .line 754
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 755
    .line 756
    .line 757
    move-result-object v5

    .line 758
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 759
    .line 760
    iget-object v7, v0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->text:Ljava/lang/String;

    .line 761
    .line 762
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 763
    .line 764
    .line 765
    move-result-object v0

    .line 766
    invoke-static {}, Ll/gra;->z()Z

    .line 767
    .line 768
    .line 769
    move-result v2

    .line 770
    if-eqz v2, :cond_13

    .line 771
    .line 772
    sget v2, Ll/c9c0;->A:I

    .line 773
    .line 774
    goto :goto_8

    .line 775
    :cond_13
    sget v2, Ll/c9c0;->I:I

    .line 776
    .line 777
    :goto_8
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 778
    .line 779
    .line 780
    move-result v8

    .line 781
    move-object v2, p0

    .line 782
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 783
    .line 784
    .line 785
    invoke-virtual {v2, v9, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 786
    .line 787
    .line 788
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 789
    .line 790
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 791
    .line 792
    .line 793
    move-result p0

    .line 794
    if-nez p0, :cond_14

    .line 795
    .line 796
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 797
    .line 798
    invoke-virtual {v2, p0, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->n(Ljava/util/List;Z)V

    .line 799
    .line 800
    .line 801
    goto :goto_9

    .line 802
    :cond_14
    invoke-virtual {v2, v9, p3}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 803
    .line 804
    .line 805
    :goto_9
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->f:Landroid/widget/FrameLayout;

    .line 806
    .line 807
    new-instance v0, Ll/fn5;

    .line 808
    .line 809
    invoke-direct {v0, v2, p2, p1, p3}, Ll/fn5;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Lcom/p1/mobile/putong/core/data/MyTabTask;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;Z)V

    .line 810
    .line 811
    .line 812
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 813
    .line 814
    .line 815
    invoke-virtual {v2, p1, p2, p3, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->m(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;Lcom/p1/mobile/putong/core/data/MyTabTask;ZZ)V

    .line 816
    .line 817
    .line 818
    return-void
.end method

.method public l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/CharSequence;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/graphics/drawable/Drawable;",
            "Ljava/lang/CharSequence;",
            "I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->b:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v1, -0x1

    .line 22
    :goto_0
    invoke-virtual {p0, p3, v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->g(Ljava/util/List;Landroid/view/ViewGroup;I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 26
    .line 27
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->d:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 36
    .line 37
    invoke-virtual {p1, p4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 41
    .line 42
    invoke-virtual {p1, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    sget p1, Ll/qa00;->h:I

    .line 46
    .line 47
    int-to-float p1, p1

    .line 48
    const/16 p2, 0x8

    .line 49
    .line 50
    new-array p2, p2, [F

    .line 51
    .line 52
    const/4 p3, 0x0

    .line 53
    aput p1, p2, p3

    .line 54
    .line 55
    const/4 p4, 0x1

    .line 56
    aput p1, p2, p4

    .line 57
    .line 58
    const/4 p4, 0x2

    .line 59
    aput p1, p2, p4

    .line 60
    .line 61
    const/4 p4, 0x3

    .line 62
    aput p1, p2, p4

    .line 63
    .line 64
    const/4 p4, 0x4

    .line 65
    aput p1, p2, p4

    .line 66
    .line 67
    const/4 p4, 0x5

    .line 68
    aput p1, p2, p4

    .line 69
    .line 70
    const/4 p4, 0x6

    .line 71
    aput p1, p2, p4

    .line 72
    .line 73
    const/4 p4, 0x7

    .line 74
    aput p1, p2, p4

    .line 75
    .line 76
    new-instance p1, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 77
    .line 78
    const/4 p4, 0x0

    .line 79
    invoke-direct {p1, p2, p4, p4}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 80
    .line 81
    .line 82
    new-instance p2, Landroid/graphics/drawable/ShapeDrawable;

    .line 83
    .line 84
    invoke-direct {p2, p1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->k:Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 88
    .line 89
    if-eqz p1, :cond_4

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->type:Ljava/lang/String;

    .line 94
    .line 95
    const-string p4, "pending"

    .line 96
    .line 97
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 104
    .line 105
    sget p4, Ll/dbc0;->Qf:I

    .line 106
    .line 107
    invoke-virtual {p1, p4, p3, p3, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-static {p6}, Landroid/graphics/Color;->red(I)I

    .line 115
    .line 116
    .line 117
    move-result p3

    .line 118
    invoke-static {p6}, Landroid/graphics/Color;->green(I)I

    .line 119
    .line 120
    .line 121
    move-result p4

    .line 122
    invoke-static {p6}, Landroid/graphics/Color;->blue(I)I

    .line 123
    .line 124
    .line 125
    move-result p5

    .line 126
    const/16 p6, 0x4d

    .line 127
    .line 128
    invoke-static {p6, p3, p4, p5}, Landroid/graphics/Color;->argb(IIII)I

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->k:Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->type:Ljava/lang/String;

    .line 141
    .line 142
    const-string p4, "rejected"

    .line 143
    .line 144
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 149
    .line 150
    if-eqz p1, :cond_3

    .line 151
    .line 152
    sget p1, Ll/dbc0;->Pf:I

    .line 153
    .line 154
    invoke-virtual {p4, p1, p3, p3, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_3
    invoke-virtual {p4, p3, p3, p3, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p1, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 177
    .line 178
    invoke-virtual {p1, p3, p3, p3, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p1, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 186
    .line 187
    .line 188
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->f:Landroid/widget/FrameLayout;

    .line 189
    .line 190
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;Lcom/p1/mobile/putong/core/data/MyTabTask;ZZ)V
    .locals 8

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    const-string p0, "p_navigation_view"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "p_task_list"

    .line 7
    .line 8
    :goto_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    if-nez p4, :cond_1

    .line 11
    .line 12
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;->G(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MyTabTask;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    goto/16 :goto_3

    .line 21
    .line 22
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "verification"

    .line 25
    .line 26
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const-string v0, "selection"

    .line 31
    .line 32
    const-string v1, "using"

    .line 33
    .line 34
    const-string v2, "default"

    .line 35
    .line 36
    if-eqz p1, :cond_5

    .line 37
    .line 38
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 39
    .line 40
    const-string v3, "sendLike"

    .line 41
    .line 42
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    const-string v2, "trial_like"

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->mode:Ljava/lang/String;

    .line 52
    .line 53
    const-string v3, "addLike"

    .line 54
    .line 55
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    const-string v2, "like_limit"

    .line 62
    .line 63
    :cond_3
    :goto_1
    const-string p1, "avatar_verify_task_type"

    .line 64
    .line 65
    const-string v3, "e_task_avatar_verify"

    .line 66
    .line 67
    if-eqz p4, :cond_4

    .line 68
    .line 69
    invoke-static {p1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    filled-new-array {p1}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {v3, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    goto/16 :goto_2

    .line 81
    .line 82
    :cond_4
    invoke-static {p1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    filled-new-array {p1}, [Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {v3, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 91
    .line 92
    .line 93
    goto/16 :goto_2

    .line 94
    .line 95
    :cond_5
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 96
    .line 97
    const-string v3, "boost"

    .line 98
    .line 99
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    const-string v3, "failed"

    .line 104
    .line 105
    const-string v4, "rejected"

    .line 106
    .line 107
    const-string v5, "review"

    .line 108
    .line 109
    const-string v6, "pending"

    .line 110
    .line 111
    if-eqz p1, :cond_7

    .line 112
    .line 113
    new-instance p1, Ljava/util/HashMap;

    .line 114
    .line 115
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v7, "upload"

    .line 119
    .line 120
    invoke-interface {p1, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    invoke-interface {p1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    invoke-interface {p1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    const-string v2, "passed"

    .line 130
    .line 131
    const-string v3, "start_boost"

    .line 132
    .line 133
    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    const-string v2, "boosting"

    .line 137
    .line 138
    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 142
    .line 143
    const-string v3, "upload_photo_award_status"

    .line 144
    .line 145
    const-string v4, "e_upload_photo_award"

    .line 146
    .line 147
    if-eqz p4, :cond_6

    .line 148
    .line 149
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->type:Ljava/lang/String;

    .line 150
    .line 151
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    filled-new-array {p1}, [Ll/pf60;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {v4, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_2

    .line 169
    .line 170
    :cond_6
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->type:Ljava/lang/String;

    .line 171
    .line 172
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    check-cast p1, Ljava/lang/String;

    .line 177
    .line 178
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    filled-new-array {p1}, [Ll/pf60;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-static {v4, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 187
    .line 188
    .line 189
    goto/16 :goto_2

    .line 190
    .line 191
    :cond_7
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 192
    .line 193
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-eqz p1, :cond_9

    .line 198
    .line 199
    new-instance p1, Ljava/util/HashMap;

    .line 200
    .line 201
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 202
    .line 203
    .line 204
    const-string v7, "complete_profile"

    .line 205
    .line 206
    invoke-interface {p1, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    invoke-interface {p1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    invoke-interface {p1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    const-string v2, "working"

    .line 216
    .line 217
    const-string v3, "success"

    .line 218
    .line 219
    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 223
    .line 224
    const-string v3, "selected_task_status"

    .line 225
    .line 226
    const-string v4, "e_task_selected"

    .line 227
    .line 228
    if-eqz p4, :cond_8

    .line 229
    .line 230
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->type:Ljava/lang/String;

    .line 231
    .line 232
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    check-cast p1, Ljava/lang/String;

    .line 237
    .line 238
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    filled-new-array {p1}, [Ll/pf60;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    invoke-static {v4, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 247
    .line 248
    .line 249
    goto :goto_2

    .line 250
    :cond_8
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->type:Ljava/lang/String;

    .line 251
    .line 252
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    check-cast p1, Ljava/lang/String;

    .line 257
    .line 258
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    filled-new-array {p1}, [Ll/pf60;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-static {v4, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 267
    .line 268
    .line 269
    goto :goto_2

    .line 270
    :cond_9
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 271
    .line 272
    const-string v2, "game"

    .line 273
    .line 274
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    if-eqz p1, :cond_b

    .line 279
    .line 280
    const-string p1, "e_task_game"

    .line 281
    .line 282
    if-eqz p4, :cond_a

    .line 283
    .line 284
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    goto :goto_2

    .line 288
    :cond_a
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    goto :goto_2

    .line 292
    :cond_b
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 293
    .line 294
    const-string v2, "mbti"

    .line 295
    .line 296
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-eqz p1, :cond_d

    .line 301
    .line 302
    const-string p1, "e_task_mbti"

    .line 303
    .line 304
    if-eqz p4, :cond_c

    .line 305
    .line 306
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    goto :goto_2

    .line 310
    :cond_c
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    :cond_d
    :goto_2
    if-eqz p3, :cond_f

    .line 314
    .line 315
    if-eqz p4, :cond_e

    .line 316
    .line 317
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 318
    .line 319
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    if-eqz p0, :cond_e

    .line 324
    .line 325
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->button:Lcom/p1/mobile/putong/core/data/TaskButtonDesc;

    .line 326
    .line 327
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TaskButtonDesc;->type:Ljava/lang/String;

    .line 328
    .line 329
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    if-eqz p0, :cond_e

    .line 334
    .line 335
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 336
    .line 337
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 338
    .line 339
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 340
    .line 341
    const/4 p2, 0x1

    .line 342
    invoke-virtual {p0, p1, p4, p2}, Ll/dkb;->ka(Ljava/lang/String;ZZ)V

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    :cond_e
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 347
    .line 348
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 349
    .line 350
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 351
    .line 352
    const/4 p2, 0x0

    .line 353
    invoke-virtual {p0, p1, p4, p2}, Ll/dkb;->ka(Ljava/lang/String;ZZ)V

    .line 354
    .line 355
    .line 356
    :cond_f
    :goto_3
    return-void
.end method

.method public n(Ljava/util/List;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/high16 v1, 0x41400000    # 12.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    const/4 v2, -0x2

    .line 33
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    const/16 v3, 0x11

    .line 37
    .line 38
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 39
    .line 40
    new-instance v3, Lv/VLinear;

    .line 41
    .line 42
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    invoke-direct {v3, v4}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    new-instance v3, Lv/VLinear;

    .line 51
    .line 52
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    invoke-direct {v3, v4}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    if-eqz p2, :cond_0

    .line 63
    .line 64
    sget v3, Ll/dbc0;->Wf:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    sget v3, Ll/dbc0;->Vf:I

    .line 68
    .line 69
    :goto_0
    invoke-virtual {v1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 79
    .line 80
    invoke-direct {v3, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    new-instance v1, Ll/gn5;

    .line 87
    .line 88
    invoke-direct {v1, p0, p1, p2}, Ll/gn5;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;Ljava/util/List;Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->m(Ll/z20;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public o(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const/high16 v1, 0x41a00000    # 20.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p2, -0x1

    .line 37
    :goto_0
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->g(Ljava/util/List;Landroid/view/ViewGroup;I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method

.method public p(Ljava/util/List;Ljava/lang/CharSequence;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/CharSequence;",
            "Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/high16 v1, 0x41400000    # 12.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lv/VLinear;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    if-eqz p3, :cond_0

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->h:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->i:I

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->f(Lv/VLinear;Ljava/util/List;Ljava/lang/CharSequence;I)Lv/VLinear;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    sget p3, Ll/dbc0;->Wf:I

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    sget p3, Ll/dbc0;->Vf:I

    .line 49
    .line 50
    :goto_1
    invoke-virtual {p2, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 60
    .line 61
    const/4 p3, -0x2

    .line 62
    invoke-direct {p2, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->m:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Ll/hn5;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/hn5;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/in5;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/in5;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->m:Ll/kcg0;

    .line 44
    .line 45
    return-void
.end method

.method public setSubAvatarWithIllustrate(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    const/high16 v2, 0x41a00000    # 20.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {v0, v3, v2, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 33
    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/pf60;

    .line 50
    .line 51
    new-instance v2, Lv/VText;

    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    invoke-direct {v2, v3}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    const/high16 v3, 0x41600000    # 14.0f

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 61
    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    invoke-static {}, Ll/gra;->z()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_0

    .line 70
    .line 71
    sget v4, Ll/c9c0;->y:I

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_0
    sget v4, Ll/c9c0;->K0:I

    .line 75
    .line 76
    :goto_1
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    iget-object v3, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v3, Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 91
    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->j:Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v0, Ljava/lang/Integer;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {v3, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const/4 v3, 0x0

    .line 108
    invoke-virtual {v2, v3, v0, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 109
    .line 110
    .line 111
    const/high16 v0, 0x40e00000    # 7.0f

    .line 112
    .line 113
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 118
    .line 119
    .line 120
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 121
    .line 122
    const/4 v3, -0x2

    .line 123
    invoke-direct {v0, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 124
    .line 125
    .line 126
    const/16 v3, 0x10

    .line 127
    .line 128
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 129
    .line 130
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 131
    .line 132
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-lez v3, :cond_1

    .line 137
    .line 138
    sget v3, Ll/qa00;->o:I

    .line 139
    .line 140
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 141
    .line 142
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->e:Landroid/widget/LinearLayout;

    .line 143
    .line 144
    invoke-virtual {v3, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_2
    return-void
.end method
