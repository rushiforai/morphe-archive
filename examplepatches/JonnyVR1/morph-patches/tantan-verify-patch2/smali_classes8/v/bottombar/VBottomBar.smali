.class public Lv/bottombar/VBottomBar;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/bottombar/VBottomBar$b;,
        Lv/bottombar/VBottomBar$a;
    }
.end annotation


# instance fields
.field public a:Lv/bottombar/VBottomBar$a;

.field public b:Lv/bottombar/VBottomBar$b;

.field public c:I

.field public d:I

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lv/bottombar/VBottomBar$b;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Ljava/lang/Runnable;

.field public h:Ljava/lang/Runnable;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lv/bottombar/VBottomBar;->e:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 13
    .line 14
    new-instance p1, Ll/gok0;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/gok0;-><init>(Lv/bottombar/VBottomBar;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lv/bottombar/VBottomBar;->g:Ljava/lang/Runnable;

    .line 20
    .line 21
    new-instance p1, Ll/hok0;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/hok0;-><init>(Lv/bottombar/VBottomBar;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lv/bottombar/VBottomBar;->h:Ljava/lang/Runnable;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lv/bottombar/VBottomBar;->i:Ll/y20;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBar;->g(Landroid/util/AttributeSet;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lv/bottombar/VBottomBar;->e:Ljava/util/List;

    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 38
    new-instance p1, Ll/gok0;

    invoke-direct {p1, p0}, Ll/gok0;-><init>(Lv/bottombar/VBottomBar;)V

    iput-object p1, p0, Lv/bottombar/VBottomBar;->g:Ljava/lang/Runnable;

    .line 39
    new-instance p1, Ll/hok0;

    invoke-direct {p1, p0}, Ll/hok0;-><init>(Lv/bottombar/VBottomBar;)V

    iput-object p1, p0, Lv/bottombar/VBottomBar;->h:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Lv/bottombar/VBottomBar;->i:Ll/y20;

    .line 41
    invoke-virtual {p0, p2}, Lv/bottombar/VBottomBar;->g(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lv/bottombar/VBottomBar;->e:Ljava/util/List;

    const/4 p1, 0x0

    .line 44
    iput-boolean p1, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 45
    new-instance p1, Ll/gok0;

    invoke-direct {p1, p0}, Ll/gok0;-><init>(Lv/bottombar/VBottomBar;)V

    iput-object p1, p0, Lv/bottombar/VBottomBar;->g:Ljava/lang/Runnable;

    .line 46
    new-instance p1, Ll/hok0;

    invoke-direct {p1, p0}, Ll/hok0;-><init>(Lv/bottombar/VBottomBar;)V

    iput-object p1, p0, Lv/bottombar/VBottomBar;->h:Ljava/lang/Runnable;

    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lv/bottombar/VBottomBar;->i:Ll/y20;

    .line 48
    invoke-virtual {p0, p2}, Lv/bottombar/VBottomBar;->g(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lv/bottombar/VBottomBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/bottombar/VBottomBar;->k()V

    return-void
.end method

.method public static synthetic b(Lv/bottombar/VBottomBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/bottombar/VBottomBar;->l()V

    return-void
.end method

.method public static synthetic c(Lv/bottombar/VBottomBar;Lv/bottombar/VBottomBar$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBar;->j(Lv/bottombar/VBottomBar$b;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public d(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lv/bottombar/VBottomBar$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/bottombar/VBottomBar;->e:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lv/bottombar/VBottomBar;->b:Lv/bottombar/VBottomBar$b;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/bottombar/VBottomBar$b;

    .line 31
    .line 32
    invoke-interface {v0}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    new-instance v2, Ll/iok0;

    .line 44
    .line 45
    invoke-direct {v2, p0, v0}, Ll/iok0;-><init>(Lv/bottombar/VBottomBar;Lv/bottombar/VBottomBar$b;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    return-void
.end method

.method public e(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lv/bottombar/VBottomBar$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lv/bottombar/VBottomBar$b;

    .line 16
    .line 17
    invoke-interface {v1}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 28
    .line 29
    const/4 v3, -0x2

    .line 30
    const/4 v4, -0x1

    .line 31
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-interface {v1}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    instance-of v2, v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 44
    .line 45
    if-nez v2, :cond_1

    .line 46
    .line 47
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 48
    .line 49
    invoke-interface {v1}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-direct {v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    const/4 v2, 0x0

    .line 62
    :goto_1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 63
    .line 64
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 65
    .line 66
    invoke-interface {v1}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBar;->d(Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBar;->i:Ll/y20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p0, p0, Lv/bottombar/VBottomBar;->i:Ll/y20;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final g(Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBar;->h(Landroid/util/AttributeSet;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final h(Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/hhc0;->i3:[I

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget v0, Ll/hhc0;->k3:I

    .line 14
    .line 15
    const/4 v1, -0x3

    .line 16
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lv/bottombar/VBottomBar;->c:I

    .line 21
    .line 22
    sget v0, Ll/hhc0;->j3:I

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lv/bottombar/VBottomBar;->d:I

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final i(Lv/bottombar/VBottomBar$b;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBar;->a:Lv/bottombar/VBottomBar$a;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lv/bottombar/VBottomBar$a;->e(Lv/bottombar/VBottomBar$b;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lv/bottombar/VBottomBar;->b:Lv/bottombar/VBottomBar$b;

    .line 13
    .line 14
    iget-object v1, p0, Lv/bottombar/VBottomBar;->a:Lv/bottombar/VBottomBar$a;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-ne p1, v0, :cond_3

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lv/bottombar/VBottomBar$a;->b(Lv/bottombar/VBottomBar$b;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lv/bottombar/VBottomBar;->a:Lv/bottombar/VBottomBar$a;

    .line 26
    .line 27
    invoke-interface {v0, p1}, Lv/bottombar/VBottomBar$a;->c(Lv/bottombar/VBottomBar$b;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-boolean v0, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 32
    .line 33
    iget-object v1, p0, Lv/bottombar/VBottomBar;->g:Ljava/lang/Runnable;

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-long v3, v0

    .line 42
    invoke-virtual {p0, v1, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 43
    .line 44
    .line 45
    iput-boolean v2, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    invoke-virtual {p0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lv/bottombar/VBottomBar;->h:Ljava/lang/Runnable;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lv/bottombar/VBottomBar;->a:Lv/bottombar/VBottomBar$a;

    .line 57
    .line 58
    invoke-interface {v0, p1}, Lv/bottombar/VBottomBar$a;->d(Lv/bottombar/VBottomBar$b;)V

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    iput-boolean v0, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-interface {v1, p1}, Lv/bottombar/VBottomBar$a;->c(Lv/bottombar/VBottomBar$b;)V

    .line 66
    .line 67
    .line 68
    iput-boolean v2, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 69
    .line 70
    iget-object v0, p0, Lv/bottombar/VBottomBar;->h:Ljava/lang/Runnable;

    .line 71
    .line 72
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    int-to-long v1, v1

    .line 77
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object v0, p0, Lv/bottombar/VBottomBar;->a:Lv/bottombar/VBottomBar$a;

    .line 81
    .line 82
    invoke-interface {v0, p1}, Lv/bottombar/VBottomBar$a;->f(Lv/bottombar/VBottomBar$b;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    :goto_1
    return-void

    .line 89
    :cond_4
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBar;->m(Lv/bottombar/VBottomBar$b;Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final synthetic j(Lv/bottombar/VBottomBar$b;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBar;->i(Lv/bottombar/VBottomBar$b;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBar;->a:Lv/bottombar/VBottomBar$a;

    .line 2
    .line 3
    iget-object v1, p0, Lv/bottombar/VBottomBar;->b:Lv/bottombar/VBottomBar$b;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lv/bottombar/VBottomBar$a;->a(Lv/bottombar/VBottomBar$b;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic l()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lv/bottombar/VBottomBar;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public final m(Lv/bottombar/VBottomBar$b;Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    const-string v1, "select change:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lv/bottombar/VBottomBar;->b:Lv/bottombar/VBottomBar$b;

    .line 9
    .line 10
    if-eq p1, v1, :cond_0

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-interface {v1, v2, p2}, Lv/bottombar/VBottomBar$b;->a(ZZ)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "from : "

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lv/bottombar/VBottomBar;->b:Lv/bottombar/VBottomBar$b;

    .line 26
    .line 27
    invoke-interface {v2}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-string v1, "same item"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 52
    invoke-interface {p1, v1, p2}, Lv/bottombar/VBottomBar$b;->a(ZZ)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lv/bottombar/VBottomBar;->b:Lv/bottombar/VBottomBar$b;

    .line 56
    .line 57
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, " to : "

    .line 60
    .line 61
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {p1}, Lv/bottombar/VBottomBar$b;->getRoot()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 80
    .line 81
    .line 82
    const-string p0, " anim: "

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public n(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBar;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lv/bottombar/VBottomBar;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lv/bottombar/VBottomBar$b;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBar;->m(Lv/bottombar/VBottomBar$b;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBar;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/bottombar/VBottomBar;->h:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setTabClickListener(Lv/bottombar/VBottomBar$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/bottombar/VBottomBar;->a:Lv/bottombar/VBottomBar$a;

    .line 2
    .line 3
    return-void
.end method

.method public setVisibleCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/bottombar/VBottomBar;->i:Ll/y20;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/bottombar/VBottomBar;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
