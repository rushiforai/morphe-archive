.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$c;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VImage;

.field public c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

.field public d:Lv/VImage;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$c;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/x20;

.field public m:Ll/x20;

.field public n:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public o:I

.field public p:Lcom/momo/mcamera/filtermanager/MMPresetFilter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    iput v0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mPercent:F

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->m(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->n:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->o:I

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->i:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ll/z20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->k:Ll/z20;

    return-object p0
.end method


# virtual methods
.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/no;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/ho;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ho;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 12
    .line 13
    const/16 v1, 0x64

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setMax(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 19
    .line 20
    const/16 v1, 0x32

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 26
    .line 27
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 35
    .line 36
    new-instance v1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setOnSeekBarChangeListener(Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar$a;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/io;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/io;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V

    .line 77
    .line 78
    .line 79
    const/16 v1, 0x12c

    .line 80
    .line 81
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->n:Ll/y20;

    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->b:Lv/VImage;

    .line 88
    .line 89
    new-instance v1, Ll/jo;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/jo;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->d:Lv/VImage;

    .line 98
    .line 99
    new-instance v1, Ll/ko;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/ko;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->l:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->l:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic m(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->o(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->m:Ll/x20;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/lo;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/lo;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->r(IZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final o(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-eq p1, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->j:Ll/y20;

    .line 15
    .line 16
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->j:Ll/y20;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->j:Ll/y20;

    .line 31
    .line 32
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    :goto_0
    return v0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->k()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->o:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public q(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->r(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final r(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->b:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    if-ltz p1, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ge p1, v0, :cond_3

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getIconUrl()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    :cond_0
    const/4 v1, 0x1

    .line 43
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->b:Lv/VImage;

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->o:I

    .line 54
    .line 55
    if-ne v0, p1, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->o:I

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->p:Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 76
    .line 77
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->o:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->h:Ll/y20;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    if-eqz p2, :cond_3

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->h:Ll/y20;

    .line 93
    .line 94
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    return-void
.end method

.method public s(IF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 8
    .line 9
    iput p2, v0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mPercent:F

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setCompareClickCallback(Ll/y20;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->j:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setFilterData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->g:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setIntensityChangedCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->i:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setIntensityChooseCallback(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->k:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public setMenuDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->l:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnItemClickCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->h:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnResetCallback(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->m:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
