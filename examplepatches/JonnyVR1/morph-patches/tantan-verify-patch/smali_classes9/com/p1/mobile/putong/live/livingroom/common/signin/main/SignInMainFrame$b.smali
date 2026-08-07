.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$b;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/vbf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame$b;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 p3, 0x1

    .line 14
    const/4 p4, 0x0

    .line 15
    if-ne p2, p3, :cond_1

    .line 16
    .line 17
    const/high16 p2, 0x41980000    # 19.0f

    .line 18
    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/high16 p0, 0x41200000    # 10.0f

    .line 22
    .line 23
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    :goto_0
    neg-int p0, p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    goto :goto_0

    .line 34
    :goto_1
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    neg-int p2, p2

    .line 39
    invoke-virtual {p1, p4, p0, p4, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const/4 p3, 0x3

    .line 44
    if-ne p2, p3, :cond_3

    .line 45
    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    move p0, p4

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    sget p0, Ll/qa00;->n:I

    .line 51
    .line 52
    neg-int p0, p0

    .line 53
    :goto_2
    invoke-virtual {p1, p4, p0, p4, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    const/4 p0, 0x4

    .line 58
    if-ne p2, p0, :cond_4

    .line 59
    .line 60
    sget p0, Ll/qa00;->l:I

    .line 61
    .line 62
    neg-int p0, p0

    .line 63
    sget p2, Ll/qa00;->m:I

    .line 64
    .line 65
    invoke-virtual {p1, p4, p0, p4, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 66
    .line 67
    .line 68
    :cond_4
    return-void
.end method
