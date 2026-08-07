.class public Lv/VList_Horizontal$d;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VList_Horizontal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Lv/VList_Horizontal;


# direct methods
.method public constructor <init>(Lv/VList_Horizontal;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lv/VList_Horizontal;Ll/ryk0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lv/VList_Horizontal$d;-><init>(Lv/VList_Horizontal;)V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->I(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lv/VList_Horizontal;->J(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    invoke-static {v0}, Lv/VList_Horizontal;->k(Lv/VList_Horizontal;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    float-to-int v1, v1

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    float-to-int p1, p1

    .line 18
    invoke-static {v0, v1, p1}, Lv/VList_Horizontal;->g(Lv/VList_Horizontal;II)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-ltz p1, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 25
    .line 26
    invoke-static {v0}, Lv/VList_Horizontal;->a(Lv/VList_Horizontal;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getOnItemLongClickListener()Landroid/widget/AdapterView$OnItemLongClickListener;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 47
    .line 48
    invoke-static {v0}, Lv/VList_Horizontal;->c(Lv/VList_Horizontal;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int v4, v0, p1

    .line 53
    .line 54
    iget-object v2, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 55
    .line 56
    iget-object p1, v2, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 57
    .line 58
    invoke-interface {p1, v4}, Landroid/widget/Adapter;->getItemId(I)J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    invoke-interface/range {v1 .. v6}, Landroid/widget/AdapterView$OnItemLongClickListener;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_0

    .line 67
    .line 68
    iget-object p0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 69
    .line 70
    const/4 p1, 0x0

    .line 71
    invoke-virtual {p0, p1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-static {p1, p2}, Lv/VList_Horizontal;->h(Lv/VList_Horizontal;Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 9
    .line 10
    sget-object p2, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_TOUCH_SCROLL:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 11
    .line 12
    invoke-static {p1, p2}, Lv/VList_Horizontal;->j(Lv/VList_Horizontal;Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 16
    .line 17
    invoke-static {p1}, Lv/VList_Horizontal;->k(Lv/VList_Horizontal;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 21
    .line 22
    iget p2, p1, Lv/VList_Horizontal;->m:I

    .line 23
    .line 24
    float-to-int p4, p3

    .line 25
    add-int/2addr p2, p4

    .line 26
    iput p2, p1, Lv/VList_Horizontal;->m:I

    .line 27
    .line 28
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-static {p1, p2}, Lv/VList_Horizontal;->l(Lv/VList_Horizontal;I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    invoke-static {v0}, Lv/VList_Horizontal;->k(Lv/VList_Horizontal;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    float-to-int v2, v2

    .line 19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    float-to-int p1, p1

    .line 24
    invoke-static {v0, v2, p1}, Lv/VList_Horizontal;->g(Lv/VList_Horizontal;II)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-ltz p1, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 31
    .line 32
    invoke-static {v0}, Lv/VList_Horizontal;->a(Lv/VList_Horizontal;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 45
    .line 46
    invoke-static {v0}, Lv/VList_Horizontal;->c(Lv/VList_Horizontal;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int v4, v0, p1

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    iget-object v2, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 55
    .line 56
    iget-object p0, v2, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 57
    .line 58
    invoke-interface {p0, v4}, Landroid/widget/Adapter;->getItemId(I)J

    .line 59
    .line 60
    .line 61
    move-result-wide v5

    .line 62
    invoke-interface/range {v1 .. v6}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_0
    iget-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 68
    .line 69
    invoke-static {p1}, Lv/VList_Horizontal;->d(Lv/VList_Horizontal;)Landroid/view/View$OnClickListener;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 76
    .line 77
    invoke-static {p1}, Lv/VList_Horizontal;->a(Lv/VList_Horizontal;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_1

    .line 82
    .line 83
    iget-object p1, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 84
    .line 85
    invoke-static {p1}, Lv/VList_Horizontal;->d(Lv/VList_Horizontal;)Landroid/view/View$OnClickListener;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p0, p0, Lv/VList_Horizontal$d;->a:Lv/VList_Horizontal;

    .line 90
    .line 91
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    const/4 p0, 0x0

    .line 95
    return p0
.end method
