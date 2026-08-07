.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;
.super Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;
.source "SourceFile"

# interfaces
.implements Ll/v7m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;
    }
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;

.field public f:Z

.field public g:Z

.field public h:I

.field public i:I

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/hll0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->f:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->g:Z

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->e()V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->setData(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Ll/tzk$c;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Ll/tzk$c;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ll/xxw$a;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/xxw$a;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 27
    .line 28
    new-instance v0, Ll/njm$c;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/njm$c;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 37
    .line 38
    new-instance v0, Ll/sdm$a;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/sdm$a;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 47
    .line 48
    new-instance v0, Ll/y2$a;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/y2$a;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 57
    .line 58
    new-instance v0, Ll/tim$c;

    .line 59
    .line 60
    invoke-direct {v0}, Ll/tim$c;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 67
    .line 68
    new-instance v0, Ll/m5g$a;

    .line 69
    .line 70
    invoke-direct {v0}, Ll/m5g$a;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 77
    .line 78
    new-instance v0, Ll/wvp0$a;

    .line 79
    .line 80
    invoke-direct {v0}, Ll/wvp0$a;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 87
    .line 88
    new-instance v0, Ll/j220$a;

    .line 89
    .line 90
    invoke-direct {v0}, Ll/j220$a;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 97
    .line 98
    new-instance p1, Ll/z0j$a;

    .line 99
    .line 100
    invoke-direct {p1}, Ll/z0j$a;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->e:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    float-to-int v0, v0

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x1

    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    if-eq v1, v3, :cond_1

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    if-eq v1, v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->f:Z

    .line 25
    .line 26
    if-eqz v1, :cond_3

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->h:I

    .line 29
    .line 30
    sub-int/2addr v0, v1

    .line 31
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->i:I

    .line 36
    .line 37
    if-lt v0, v1, :cond_3

    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->g:Z

    .line 40
    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->g:Z

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->e:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;

    .line 46
    .line 47
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;->a()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->g:Z

    .line 52
    .line 53
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->f:Z

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->e:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;

    .line 57
    .line 58
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;->b()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->f:Z

    .line 63
    .line 64
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->g:Z

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    float-to-int v0, v0

    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->h:I

    .line 72
    .line 73
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->f:Z

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    return v3

    .line 78
    :cond_4
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->i:I

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->d(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->j:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->setViewHolderData(Ljava/util/ArrayList;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->e:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;

    .line 2
    .line 3
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public setData(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->setItemData(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
