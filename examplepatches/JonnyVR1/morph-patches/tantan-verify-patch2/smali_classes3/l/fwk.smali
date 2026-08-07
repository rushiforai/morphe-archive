.class public Ll/fwk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fwk$a;
    }
.end annotation


# static fields
.field public static d:Ll/fwk;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/fwk$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/fwk;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fwk;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fwk;->d:Ll/fwk;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/fwk;->b:I

    .line 6
    .line 7
    const-string v0, "fail_tips"

    .line 8
    .line 9
    iput-object v0, p0, Ll/fwk;->c:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/fwk;->a:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/fwk;Landroid/view/View;Ll/zvk;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fwk;->n(Landroid/view/View;Ll/zvk;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/fwk;Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fwk;->l(Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/fwk;Landroid/view/View;Ll/zvk;Ljava/lang/String;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fwk;->o(Landroid/view/View;Ll/zvk;Ljava/lang/String;[I)V

    return-void
.end method

.method public static synthetic d(Landroid/widget/FrameLayout;Landroid/graphics/Rect;Landroid/graphics/Rect;Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;Ll/zvk;Landroid/view/View;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v2, p1, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 14
    .line 15
    iget v4, p2, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    sub-int/2addr v3, v4

    .line 18
    iget v5, p1, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 21
    .line 22
    sub-int/2addr p1, v4

    .line 23
    invoke-direct {v1, v2, v3, v5, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p5}, Landroid/view/View;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p5}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p5

    .line 34
    invoke-virtual {p3, p4, v1, p1, p5}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->o(Ll/zvk;Landroid/graphics/Rect;II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->getShowPoint()[I

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance p5, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    const/4 v1, -0x2

    .line 44
    invoke-direct {p5, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    sub-int/2addr p2, v0

    .line 52
    const/4 v0, 0x0

    .line 53
    aget v0, p1, v0

    .line 54
    .line 55
    iget v1, p4, Ll/zvk;->e:I

    .line 56
    .line 57
    add-int/2addr v0, v1

    .line 58
    iput v0, p5, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    aget p1, p1, v0

    .line 62
    .line 63
    iget p4, p4, Ll/zvk;->f:I

    .line 64
    .line 65
    add-int/2addr p1, p4

    .line 66
    add-int/2addr p1, p2

    .line 67
    iput p1, p5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 68
    .line 69
    invoke-virtual {p0, p3, p5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p3, p6}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->p(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_0

    .line 81
    .line 82
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_0
    throw p0
.end method

.method public static synthetic e(Ll/fwk;Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;[I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/fwk;->m(Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;[I)V

    return-void
.end method

.method public static h()Ll/fwk;
    .locals 1

    .line 1
    sget-object v0, Ll/fwk;->d:Ll/fwk;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/fwk;->a:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/fwk$a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget-object v0, v0, Ll/fwk$a;->d:Ll/zvk;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v1, v0, Ll/zvk;->p:Ll/zvk$a;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v0, v0, Ll/zvk;->p:Ll/zvk$a;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Ll/zvk$a;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    if-eqz p2, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object p0, p0, Ll/fwk;->a:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/fwk$a;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_4

    .line 21
    .line 22
    iget-object v0, p0, Ll/fwk$a;->c:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/fwk$a;->c:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->g()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Ll/fwk$a;->b:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/view/View;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v0, 0x0

    .line 47
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    instance-of v1, v1, Landroid/view/ViewGroup;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Landroid/view/ViewGroup;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    :cond_3
    iget-object p0, p0, Ll/fwk$a;->d:Ll/zvk;

    .line 71
    .line 72
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    iget-object v0, p0, Ll/zvk;->q:Ll/zvk$b;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    iget-object p0, p0, Ll/zvk;->q:Ll/zvk$b;

    .line 87
    .line 88
    invoke-interface {p0, p1}, Ll/zvk$b;->a(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_4
    :goto_1
    return-void
.end method

.method public final i(Landroid/widget/LinearLayout;)I
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    if-ge v0, p0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/16 v4, 0x8

    .line 18
    .line 19
    if-ne v3, v4, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    instance-of v3, v3, Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ljava/lang/String;

    .line 35
    .line 36
    const-string v4, "inner_tips_tag"

    .line 37
    .line 38
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int/2addr v1, v2

    .line 56
    iget v2, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 57
    .line 58
    add-int/2addr v1, v2

    .line 59
    iget v2, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 60
    .line 61
    add-int/2addr v1, v2

    .line 62
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    return v1
.end method

.method public final j(Landroid/widget/LinearLayout;)I
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    if-ge v0, p0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/16 v4, 0x8

    .line 18
    .line 19
    if-ne v3, v4, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    instance-of v3, v3, Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ljava/lang/String;

    .line 35
    .line 36
    const-string v4, "inner_tips_tag"

    .line 37
    .line 38
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int/2addr v1, v2

    .line 56
    iget v2, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 57
    .line 58
    add-int/2addr v1, v2

    .line 59
    iget v2, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 60
    .line 61
    add-int/2addr v1, v2

    .line 62
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    return v1
.end method

.method public final declared-synchronized k()Ljava/lang/String;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Ll/fwk;->b:I

    .line 3
    .line 4
    add-int/lit8 v1, v0, 0x1

    .line 5
    .line 6
    iput v1, p0, Ll/fwk;->b:I

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    monitor-exit p0

    .line 13
    return-object v0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method

.method public final synthetic l(Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 10

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 5
    .line 6
    .line 7
    new-array v0, v0, [I

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    new-instance v6, Landroid/graphics/Rect;

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    aget v5, v1, v4

    .line 24
    .line 25
    aget v4, v0, v4

    .line 26
    .line 27
    sub-int v7, v5, v4

    .line 28
    .line 29
    const/4 v8, 0x1

    .line 30
    aget v1, v1, v8

    .line 31
    .line 32
    aget v0, v0, v8

    .line 33
    .line 34
    sub-int v8, v1, v0

    .line 35
    .line 36
    sub-int/2addr v5, v4

    .line 37
    add-int/2addr v5, v2

    .line 38
    sub-int/2addr v1, v0

    .line 39
    add-int/2addr v1, v3

    .line 40
    invoke-direct {v6, v7, v8, v5, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 41
    .line 42
    .line 43
    move-object v4, p0

    .line 44
    move-object v7, p1

    .line 45
    move-object v8, p2

    .line 46
    move-object v5, p3

    .line 47
    move-object v9, p4

    .line 48
    invoke-virtual/range {v4 .. v9}, Ll/fwk;->w(Ll/zvk;Landroid/graphics/Rect;Landroid/view/View;Landroid/view/ViewGroup;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    return-object p0
.end method

.method public final synthetic m(Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;[I)V
    .locals 0

    .line 1
    move-object p5, p4

    .line 2
    move-object p4, p3

    .line 3
    move-object p3, p2

    .line 4
    move-object p2, p1

    .line 5
    move-object p1, p0

    .line 6
    new-instance p0, Ll/cwk;

    .line 7
    .line 8
    invoke-direct/range {p0 .. p5}, Ll/cwk;-><init>(Ll/fwk;Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, p0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic n(Landroid/view/View;Ll/zvk;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6

    .line 1
    new-instance v3, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 15
    .line 16
    .line 17
    new-instance v2, Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 23
    .line 24
    .line 25
    move-object v0, p0

    .line 26
    move-object v4, p1

    .line 27
    move-object v1, p2

    .line 28
    move-object v5, p3

    .line 29
    invoke-virtual/range {v0 .. v5}, Ll/fwk;->v(Ll/zvk;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/view/View;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    return-object p0
.end method

.method public final synthetic o(Landroid/view/View;Ll/zvk;Ljava/lang/String;[I)V
    .locals 0

    .line 1
    new-instance p4, Ll/dwk;

    .line 2
    .line 3
    invoke-direct {p4, p0, p1, p2, p3}, Ll/dwk;-><init>(Ll/fwk;Landroid/view/View;Ll/zvk;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p4}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final p(Ljava/lang/String;Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;Landroid/view/View;Ll/zvk;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwk;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fwk$a;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iput-object p2, p0, Ll/fwk$a;->c:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 16
    .line 17
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/fwk$a;->b:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    iput-object p4, p0, Ll/fwk$a;->d:Ll/zvk;

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public q(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fwk;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object p0, p0, Ll/fwk;->a:Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/fwk$a;

    .line 17
    .line 18
    if-eqz p0, :cond_3

    .line 19
    .line 20
    iget-object p0, p0, Ll/fwk$a;->c:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    if-eqz p2, :cond_2

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    const/16 p1, 0x8

    .line 30
    .line 31
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    :cond_3
    :goto_1
    return-void
.end method

.method public r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/fwk;->k()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/fwk;->s(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/fwk;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public s(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 8

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    if-eqz p3, :cond_1

    .line 4
    .line 5
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ll/fwk$a;

    .line 13
    .line 14
    invoke-direct {v0, p0, p4}, Ll/fwk$a;-><init>(Ll/fwk;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/fwk;->a:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v1, p4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/awk;

    .line 23
    .line 24
    move-object v3, p0

    .line 25
    move-object v6, p1

    .line 26
    move-object v4, p2

    .line 27
    move-object v5, p3

    .line 28
    move-object v7, p4

    .line 29
    invoke-direct/range {v2 .. v7}, Ll/awk;-><init>(Ll/fwk;Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v4, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public t(Ll/zvk;Landroid/view/View;)Ljava/lang/String;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/fwk;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/fwk;->k()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, p2, v0}, Ll/fwk;->u(Ll/zvk;Landroid/view/View;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public u(Ll/zvk;Landroid/view/View;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/fwk$a;

    .line 11
    .line 12
    invoke-direct {v0, p0, p3}, Ll/fwk$a;-><init>(Ll/fwk;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/fwk;->a:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-virtual {v1, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/bwk;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2, p1, p3}, Ll/bwk;-><init>(Ll/fwk;Landroid/view/View;Ll/zvk;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p2, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public final v(Ll/zvk;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/view/View;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p4}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const v1, 0x1020002

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v8

    .line 18
    instance-of v0, v8, Landroid/view/ViewGroup;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    new-instance v3, Landroid/widget/FrameLayout;

    .line 23
    .line 24
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {v3, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {v3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 33
    .line 34
    .line 35
    move-object v0, v8

    .line 36
    check-cast v0, Landroid/view/ViewGroup;

    .line 37
    .line 38
    const/4 v1, -0x1

    .line 39
    invoke-virtual {v0, v3, v1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 40
    .line 41
    .line 42
    new-instance v6, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 43
    .line 44
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    invoke-direct {v6, p4}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p5, v6, v3, p1}, Ll/fwk;->p(Ljava/lang/String;Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;Landroid/view/View;Ll/zvk;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    new-instance v2, Ll/ewk;

    .line 59
    .line 60
    move-object v7, p1

    .line 61
    move-object v4, p2

    .line 62
    move-object v5, p3

    .line 63
    move-object v9, p5

    .line 64
    invoke-direct/range {v2 .. v9}, Ll/ewk;-><init>(Landroid/widget/FrameLayout;Landroid/graphics/Rect;Landroid/graphics/Rect;Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;Ll/zvk;Landroid/view/View;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v3, v2}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public final w(Ll/zvk;Landroid/graphics/Rect;Landroid/view/View;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p4}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p4}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    new-instance v3, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

    .line 19
    .line 20
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-direct {v3, p3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p5, v3, v2, p1}, Ll/fwk;->p(Ljava/lang/String;Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;Landroid/view/View;Ll/zvk;)Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-nez p3, :cond_0

    .line 32
    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_0
    invoke-virtual {v3, p1, p2, v1, v0}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->o(Ll/zvk;Landroid/graphics/Rect;II)V

    .line 36
    .line 37
    .line 38
    instance-of p2, p4, Landroid/widget/LinearLayout;

    .line 39
    .line 40
    const/4 p3, 0x0

    .line 41
    const/4 v4, 0x1

    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 45
    .line 46
    invoke-direct {p2, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 47
    .line 48
    .line 49
    move-object v0, p4

    .line 50
    check-cast v0, Landroid/widget/LinearLayout;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-ne v1, v4, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/fwk;->i(Landroid/widget/LinearLayout;)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    neg-int p0, p0

    .line 63
    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-virtual {p0, v0}, Ll/fwk;->j(Landroid/widget/LinearLayout;)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    neg-int p0, p0

    .line 71
    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 72
    .line 73
    :goto_0
    const-string p0, "inner_tips_tag"

    .line 74
    .line 75
    invoke-virtual {v2, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p4, v2, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->getViewWidth()I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    invoke-virtual {v3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->getViewHeight()I

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    invoke-direct {p0, p2, p4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->getShowPoint()[I

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    aget p3, p2, p3

    .line 99
    .line 100
    iget p4, p1, Ll/zvk;->e:I

    .line 101
    .line 102
    add-int/2addr p3, p4

    .line 103
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 104
    .line 105
    aget p2, p2, v4

    .line 106
    .line 107
    iget p3, p1, Ll/zvk;->f:I

    .line 108
    .line 109
    add-int/2addr p2, p3

    .line 110
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 111
    .line 112
    invoke-virtual {v2, v3, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3, p5}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->p(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_2
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 120
    .line 121
    invoke-direct {p0, v1, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p4, v2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    .line 126
    .line 127
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 128
    .line 129
    invoke-virtual {v3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->getViewWidth()I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    invoke-virtual {v3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->getViewHeight()I

    .line 134
    .line 135
    .line 136
    move-result p4

    .line 137
    invoke-direct {p0, p2, p4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->getShowPoint()[I

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    aget p3, p2, p3

    .line 145
    .line 146
    iget p4, p1, Ll/zvk;->e:I

    .line 147
    .line 148
    add-int/2addr p3, p4

    .line 149
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 150
    .line 151
    aget p2, p2, v4

    .line 152
    .line 153
    iget p3, p1, Ll/zvk;->f:I

    .line 154
    .line 155
    add-int/2addr p2, p3

    .line 156
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 157
    .line 158
    invoke-virtual {v2, v3, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3, p5}, Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;->p(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    const/4 p0, 0x0

    .line 168
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-nez p1, :cond_3

    .line 173
    .line 174
    :goto_2
    return-void

    .line 175
    :cond_3
    throw p0
.end method
