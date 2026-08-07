.class public Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    iget p4, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;->a:I

    .line 2
    .line 3
    div-int/lit8 p4, p4, 0x2

    .line 4
    .line 5
    iput p4, p1, Landroid/graphics/Rect;->right:I

    .line 6
    .line 7
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;->a:I

    .line 12
    .line 13
    const/4 p4, 0x1

    .line 14
    if-le p2, p4, :cond_0

    .line 15
    .line 16
    div-int/lit8 p3, p3, 0x2

    .line 17
    .line 18
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    :goto_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;->a:I

    .line 24
    .line 25
    div-int/lit8 p2, p0, 0x2

    .line 26
    .line 27
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    div-int/lit8 p0, p0, 0x2

    .line 30
    .line 31
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 32
    .line 33
    return-void
.end method
