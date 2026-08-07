.class public Ll/tkw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tkw$b;
    }
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private d:Landroid/widget/PopupWindow;

.field private e:Landroid/widget/ListView;

.field private f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/rkw;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ll/skw;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/bec0;->f:I

    .line 5
    .line 6
    iput v0, p0, Ll/tkw;->a:I

    .line 7
    .line 8
    sget v0, Ll/xac0;->e:I

    .line 9
    .line 10
    iput v0, p0, Ll/tkw;->b:I

    .line 11
    .line 12
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/tkw;->c:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Ll/tkw;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkw;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/tkw;)Ll/skw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkw;->g:Ll/skw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/tkw;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tkw;->a:I

    .line 2
    .line 3
    return p0
.end method

.method private f()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tkw;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    new-instance v1, Landroid/widget/ListView;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/tkw;->e:Landroid/widget/ListView;

    .line 15
    .line 16
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    sget v4, Ll/w9c0;->b:I

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/tkw;->e:Landroid/widget/ListView;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/tkw;->e:Landroid/widget/ListView;

    .line 41
    .line 42
    sget v3, Ll/w9c0;->g:I

    .line 43
    .line 44
    invoke-virtual {v1, v3}, Landroid/widget/AbsListView;->setSelector(I)V

    .line 45
    .line 46
    .line 47
    const/high16 v1, 0x43200000    # 160.0f

    .line 48
    .line 49
    invoke-static {v1}, Ll/lpj0;->c(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    new-instance v3, Landroid/widget/PopupWindow;

    .line 54
    .line 55
    iget-object v4, p0, Ll/tkw;->e:Landroid/widget/ListView;

    .line 56
    .line 57
    const/4 v5, -0x2

    .line 58
    invoke-direct {v3, v4, v1, v5}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 59
    .line 60
    .line 61
    iput-object v3, p0, Ll/tkw;->d:Landroid/widget/PopupWindow;

    .line 62
    .line 63
    invoke-virtual {v3, v2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Ll/tkw;->d:Landroid/widget/PopupWindow;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/tkw;->d:Landroid/widget/PopupWindow;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget p0, p0, Ll/tkw;->b:I

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v1, p0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public d()Ll/tkw;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tkw;->f()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tkw;->d:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tkw;->d:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public g(Ll/skw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tkw;->g:Ll/skw;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/rkw;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tkw;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method

.method public i(I)Ll/tkw;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/tkw;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tkw;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/tkw;->d:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/tkw;->f:Ljava/util/ArrayList;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v0, Ll/tkw$b;

    .line 29
    .line 30
    iget-object v1, p0, Ll/tkw;->c:Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Landroid/content/Context;

    .line 37
    .line 38
    iget-object v2, p0, Ll/tkw;->f:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v0, p0, v1, v2}, Ll/tkw$b;-><init>(Ll/tkw;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/tkw;->e:Landroid/widget/ListView;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/tkw;->e:Landroid/widget/ListView;

    .line 49
    .line 50
    new-instance v1, Ll/tkw$a;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/tkw$a;-><init>(Ll/tkw;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/tkw;->d:Landroid/widget/PopupWindow;

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    const/16 v1, -0x28

    .line 62
    .line 63
    invoke-virtual {p0, p1, v0, v1}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    return-void
.end method
