.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$b;,
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;,
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$d;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->init()V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->init()V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;

    return-object p0
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->G()V

    return-void
.end method

.method private init()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/wnh0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/wnh0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final G()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public setRealAdapter(Ll/vnh0;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$a;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    throw p0
.end method

.method public setSelect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedAnimSwitchLayout$c;->A(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
