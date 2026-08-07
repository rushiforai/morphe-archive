.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;->T4()Landroidx/recyclerview/widget/RecyclerView$n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag$a;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatFrag;

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
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$n;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_3

    .line 9
    .line 10
    instance-of p0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 11
    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->h()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->g()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    rem-int/lit8 p2, p2, 0x2

    .line 39
    .line 40
    const/high16 p3, 0x40900000    # 4.5f

    .line 41
    .line 42
    const/4 p4, 0x0

    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    move p2, p4

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move p2, p3

    .line 48
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->g()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    rem-int/lit8 p0, p0, 0x2

    .line 53
    .line 54
    if-nez p0, :cond_2

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    move p3, p4

    .line 58
    :goto_1
    const/high16 p0, 0x41100000    # 9.0f

    .line 59
    .line 60
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 71
    .line 72
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 77
    .line 78
    :cond_3
    return-void
.end method
