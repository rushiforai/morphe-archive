.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 3
    .line 4
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTitleTagsView$a;->a:I

    .line 5
    .line 6
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 7
    .line 8
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 11
    .line 12
    return-void
.end method
