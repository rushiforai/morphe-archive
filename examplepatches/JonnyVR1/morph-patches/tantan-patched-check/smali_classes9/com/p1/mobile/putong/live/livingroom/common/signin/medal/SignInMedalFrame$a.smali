.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 2
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
    move-result p2

    .line 5
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 6
    .line 7
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->e(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    const/4 p4, 0x1

    .line 12
    sub-int/2addr p3, p4

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eq p2, p3, :cond_0

    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 17
    .line 18
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->e(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eq p2, p4, :cond_0

    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    .line 28
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 33
    .line 34
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    .line 36
    invoke-virtual {p3}, Landroid/view/View;->getPaddingStart()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    sub-int/2addr p2, p3

    .line 41
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 42
    .line 43
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-virtual {p3}, Landroid/view/View;->getPaddingEnd()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    sub-int/2addr p2, p3

    .line 50
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 51
    .line 52
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->e(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    const/high16 v1, 0x42580000    # 54.0f

    .line 57
    .line 58
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    mul-int/2addr p3, v1

    .line 63
    sub-int/2addr p2, p3

    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->e(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    sub-int/2addr p0, p4

    .line 71
    div-int/2addr p2, p0

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    move p2, v0

    .line 74
    :goto_0
    invoke-virtual {p1, v0, v0, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
